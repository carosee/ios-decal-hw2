//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet weak var returnButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var anotherButton: UIButton!
    
    @IBOutlet weak var yetAnotherButton: UIButton!
    
    @IBOutlet weak var andAnotherButton: UIButton!
    
    @IBOutlet weak var dumbButton: UIButton!
    
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        loadButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        
    }
    
    func loadButtons() {
        returnButton.addTarget(self, action: "pressReturn", forControlEvents: .TouchUpInside)
        deleteButton.addTarget(self, action: "deleteStuff", forControlEvents: .TouchUpInside)
        anotherButton.addTarget(self, action: "typeStuff", forControlEvents: .TouchUpInside)
        yetAnotherButton.addTarget(self, action: "typeMoreStuff", forControlEvents: .TouchUpInside)
        andAnotherButton.addTarget(self, action: "typeEvenMoreStuff", forControlEvents: .TouchUpInside)
        dumbButton.addTarget(self, action: "lastStuff", forControlEvents: .TouchUpInside)
    }
    
    func pressReturn() {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    func deleteStuff() {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    func typeStuff() {
        (textDocumentProxy as UIKeyInput).insertText("╭∩╮（︶︿︶）╭∩╮")
    }
    
    func typeMoreStuff() {
        (textDocumentProxy as UIKeyInput).insertText("(づ｡◕‿‿◕｡)づ")
    }
    
    func typeEvenMoreStuff() {
        (textDocumentProxy as UIKeyInput).insertText("Sorry this keyboard is ugly AF. Pls don't fail me")
    }
    
    func lastStuff() {
        (textDocumentProxy as UIKeyInput).insertText("Yᵒᵘ Oᶰˡʸ Lᶤᵛᵉ Oᶰᶜᵉ")
    }


}
