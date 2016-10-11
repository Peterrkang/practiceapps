
//
//  Created by Peter Kang on 10/10/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import AVFoundation

class retroVC: UIViewController {

    var btnSound: AVAudioPlayer!
    
    @IBOutlet weak var outPutLabel: UILabel!
    
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
        case Clear = ""
    }
    
 
    @IBAction func onAddPressed(sender: AnyObject){
        processOperations(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject){
        processOperations(operation: .Subtract)
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        processOperations(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject){
        processOperations(operation: .Multiply)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject){
        processOperations(operation: currentOperation)
    }
    
    @IBAction func onClearPressed(sender: AnyObject){
        outPutLabel.text = "0"
        runningNumber = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType:"wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
        runningNumber += "\(sender.tag)"
        outPutLabel.text = runningNumber
    }
    
    func playSound(){
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func processOperations(operation: Operation){
        if currentOperation != Operation.Empty{
            if runningNumber != ""{
                rightValStr = runningNumber
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Add{
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                leftValStr = result
                outPutLabel.text = result
                currentOperation = operation
            }else{
                leftValStr = runningNumber
                runningNumber = ""
                currentOperation = operation
            }
            
            
        }
    
    }
}

