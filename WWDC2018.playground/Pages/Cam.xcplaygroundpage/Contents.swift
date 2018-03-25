
import AVFoundation
import AVKit
import PlaygroundSupport

let view = NSView(frame: NSRect(x: 0.0, y: 0.0, width: 640.0, height: 480.0))

let session = AVCaptureSession()

session.sessionPreset = AVCaptureSession.Preset.vga640x480
session.beginConfiguration()
session.commitConfiguration()

var input : AVCaptureDeviceInput
if let devices : [AVCaptureDevice] = AVCaptureDevice.devices() as? [AVCaptureDevice] {
    for device in devices {
        if device.hasMediaType(AVMediaType.video) && device.supportsSessionPreset(AVCaptureSession.Preset.vga640x480) {
            do {
                input = try AVCaptureDeviceInput(device: device as AVCaptureDevice) as AVCaptureDeviceInput
                
                if session.canAddInput(input) {
                    session.addInput(input)
                    break
                }
            }
            catch {
                error
            }
        }
    }
    
    let output = AVCaptureVideoDataOutput()
    output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as AnyHashable as! String: Int(kCVPixelFormatType_32BGRA)]
    output.alwaysDiscardsLateVideoFrames = true
    
    if session.canAddOutput(output) {
        session.addOutput(output)
    }
    
    let captureLayer = AVCaptureVideoPreviewLayer(session: session)
    view.wantsLayer = true
    view.layer = captureLayer
    
    session.startRunning()
    
    //View -> Assistant Editor -> Show Assistant Editor
    PlaygroundPage.current.liveView = view
    
}

