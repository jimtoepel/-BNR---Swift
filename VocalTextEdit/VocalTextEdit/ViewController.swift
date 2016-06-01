//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Jim Toepel on 5/28/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
   
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var playButton: NSButton!
    @IBOutlet weak var speechProgress: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.enabled = false
        playButton.enabled = true
        speechSynthesizer.delegate = self
        speechProgress.hidden = true
    }
    
    let speechSynthesizer = NSSpeechSynthesizer()



    var isSpeaking: Bool = false {
        didSet {
            if isSpeaking {
                playButton.enabled = false
                stopButton.enabled = true
                speechProgress.hidden = false
            } else {
                playButton.enabled = true
                stopButton.enabled = false
                speechProgress.hidden = true
            }
        }
    }
    
    var textLength : Double = 0
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
            speechProgress.maxValue = Double(contents.characters.count)
            isSpeaking = true
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        speechProgress.incrementBy(-textLength)
        isSpeaking = false
    }

    func speechSynthesizer(sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, ofString string: String) {
        textLength = Double(string.characters.count)
        speechProgress.incrementBy(Double(characterRange.length + 1))
    }
}

