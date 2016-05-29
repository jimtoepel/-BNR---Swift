//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Jim Toepel on 5/28/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        print("The speak button was clicked")
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        print("The stop button was clicked")
    }


}

