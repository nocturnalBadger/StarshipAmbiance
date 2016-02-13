//
//  ViewController.swift
//  Starship Ambiance
//
//  Created by Jeremy Schmidt on 11/6/14.
//  Copyright (c) 2014 Jeremy Schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet var soundPickerView: UIPickerView!
    
    var soundPickerOptions = ["Original","Generational","Journey"]
    var selection = ""
    let soundController = SoundController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selection = soundPickerOptions[0]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Stuff for being a uipickerview delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return soundPickerOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return soundPickerOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selection = soundPickerOptions[row]
    }
    
    
    
    
    // My IBOutlets n stuff
    
    @IBAction func playButtonWasPressed(sender: UIButton)
    {
        print(selection)
        soundController.startPlayingSound(selection)
    }
    
    @IBAction func stopButtonWasPressed(sender: UIButton)
    {
        soundController.stopPlaying()
    }
}

