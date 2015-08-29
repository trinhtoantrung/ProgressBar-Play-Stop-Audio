//
//  ViewController.swift
//  ProgressBar-Play-Stop-Audio
//
//  Created by  Trung Trinh on 8/15/15.
//  Copyright (c) 2015 Trung Trinh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!

    @IBOutlet weak var progressAudioPlayer: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathURL = NSURL(string: filePath);
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil);
            audioPlayer.currentTime = 0;
        }
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "update", userInfo: nil, repeats: true);
    }
    
    func update() {
        if audioPlayer.playing {
            println("playing");
            progressAudioPlayer.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true);
        } else {
            println("stop");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playAudio(sender: UIButton) {
        audioPlayer.play();
        
    }
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop();
    }
}

