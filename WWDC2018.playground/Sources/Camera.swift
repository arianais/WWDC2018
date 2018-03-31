import Foundation
import UIKit
import PlaygroundSupport
import Vision

public class Camera{
    private let faceDetection = VNDetectFaceRectanglesRequest()
    private let faceLandmarksDetectionRequest = VNSequenceRequestHandler()
    private let faceDetectionRequest = VNSequenceRequestHandler()
    public init(){
        
    }
    public func retrieveImages(_ completion: @escaping([UIImage]) -> Void){
        var images: [UIImage] = []
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
            self.detectFace(image: UIImage(named: name)!, { (pic) in
                images.append(pic)
                if(image == path.last){
                        completion(images)
                }
            })
            
        }
    
    }
    private func detectFace(image: UIImage,_ completion: @escaping (UIImage) -> Void){
        try? faceDetectionRequest.perform([faceDetection], on: image.cgImage!)
        if let results = faceDetection.results as? [VNFaceObservation] {
            if !results.isEmpty {
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
                    completion(self.crop(image: image, rect: rect))
                }
            }
        }
    }
    private func crop(image: UIImage, rect: CGRect) -> UIImage {
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        return image
    }
}

