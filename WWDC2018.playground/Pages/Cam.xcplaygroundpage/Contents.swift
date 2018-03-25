import UIKit
import AVFoundation
import PlaygroundSupport
import Foundation
import Vision

// get the file path for the file "test.json" in the playground bundle

public class Camera{
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 512, height: 369))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 512, height: 369))
    let faceView = UIImageView(frame: CGRect(x: 195, y: 75, width: (350 * 0.35), height: (325 * 0.35)))
    var names: [String] = []
    var images: [UIImage] = []
    let faceDetection = VNDetectFaceRectanglesRequest()
    let faceLandmarksDetectionRequest = VNSequenceRequestHandler()
    let faceDetectionRequest = VNSequenceRequestHandler()
    let frame = UIView()
    public init(){
        getImageNames()
        imageView.contentMode = .scaleAspectFit
        let face = UIImage(named: names[1])
        imageView.image = UIImage(named: "Images/astronaut")
        faceView.contentMode = .scaleAspectFill
        view.addSubview(faceView)
        view.addSubview(imageView)
        view.addSubview(frame)

        
        PlaygroundPage.current.liveView = view
    }
    func getImageNames(){
        var path = Bundle.main.paths(forResourcesOfType: "png", inDirectory: nil)
          path.append(contentsOf: Bundle.main.paths(forResourcesOfType: "jpg", inDirectory: nil))

        
        for image in path {
            var i = image.count - 5
            var c = image.index(image.startIndex, offsetBy: i)
            var name = ""
           
            while (image[c] != "/") {
                name = "\(image[c])" + name
                i -= 1
                c = image.index(image.startIndex, offsetBy: i)
            }
            detectFace(on: UIImage(named: name)!)
            names.append(name)
            print(name)
        }
    }
    func detectFace(on image: UIImage) {
   
        try? faceDetectionRequest.perform([faceDetection], on: image.cgImage!)
        if let results = faceDetection.results as? [VNFaceObservation] {
            if !results.isEmpty {
                     print(results)
                DispatchQueue.main.async {
                    let observation = results.last!.boundingBox
                    var length1 = max(observation.width, observation.height)
                    if (length1 == observation.width){
                        length1 *= image.size.width
                    }
                    else{
                        length1 *= image.size.height
                    }
               let rect =  CGRect(x: (observation.midX * image.size.width) - (length1 * 0.75), y:  (observation.minY * image.size.height) - (length1 * 0.1), width: length1 * 1.5, height: length1 * 1.5)
               // let cropped =  CIImage(cgImage: image.cgImage!).cropped(to: self.frame.frame)
                    self.images.append(self.cropToBounds(image: image, rect: rect))
                    self.faceView.image = self.images[0]
                 //   self.imageView.image = self.cropToBounds(image: image, rect: rect)
                    self.imageView.contentMode = .scaleAspectFit
                }
            }
        }
    }
    func cropToBounds(image: UIImage, rect: CGRect) -> UIImage {
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        
//        let contextSize: CGSize = contextImage.size
//        var posX: CGFloat = contextSize.width
//        var posY: CGFloat = contextSize.width
//        var cgwidth: CGFloat = CGFloat(width)
//        var cgheight: CGFloat = CGFloat(height)
        // See what size is longer and create the center off of that
        
        
       // let rect: CGRect = CGRect(x: posX-cgwidth/2, y: posY-cgheight/2, width: cgwidth, height: cgheight)
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
   
    
    
}

let camera = Camera()

