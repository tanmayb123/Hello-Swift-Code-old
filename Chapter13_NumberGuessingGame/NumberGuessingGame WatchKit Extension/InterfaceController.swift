import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var tryingToGuess: Int = 0
    var currentGuess: Int = 0
    
    @IBOutlet var guessLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        tryingToGuess = Int(arc4random_uniform(UInt32(120)) + 1)
        guessLabel.setText("\(currentGuess)")
        // Configure interface objects here.
    }
    
    @IBAction func increment() {
        currentGuess = currentGuess + 1
        guessLabel.setText("\(currentGuess)")
    }
    
    @IBAction func decrement() {
        currentGuess = currentGuess - 1
        guessLabel.setText("\(currentGuess)")
    }
    
    @IBAction func makeGuess() {
        if currentGuess == tryingToGuess {
            statusLabel.setText("Correct!")
        } else if currentGuess < tryingToGuess {
            statusLabel.setText("Too Little!")
        } else if currentGuess > tryingToGuess {
            statusLabel.setText("Too Much!")
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
