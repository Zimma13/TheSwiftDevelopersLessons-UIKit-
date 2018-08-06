//
//  PlayarVC.swift
//  UIKit-Lesson-6
//
//  Created by Zimma on 04.06.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class PlayarVC: UIViewController {
    
    var player = AVAudioPlayer()
    var soundOnOff = false
    
    let imgTrack = UIImageView()
    let trackTimeSlider = UISlider()
    let trackTimeSliderLbl = UILabel()
    let volumeSlider = UISlider()
    let volumeSliderLbl = UILabel()
    let playStopButton = UIButton()
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        //Image of track
        imgTrack.frame = CGRect(x: 20, y: 50, width: viewSize.width - 40, height: viewSize.width - 40)
        imgTrack.image = UIImage(named: "musicIMG")
        imgTrack.contentMode = .scaleAspectFit
        imgTrack.layer.masksToBounds = false
        imgTrack.layer.cornerRadius = 6
        imgTrack.layer.shadowColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        imgTrack.layer.shadowOpacity = 0.2
        imgTrack.layer.shadowOffset = CGSize(width: 4, height: 4)
        imgTrack.layer.shadowRadius = 20

        //imgTrack.image =
        
        do {
            let audioPath = Bundle.main.path(forResource: "The Space Between Us", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            trackTimeSlider.minimumValue = 0.0
            trackTimeSlider.maximumValue = Float(player.duration)
        } catch {
            print("eRRoR")
        }
        
        //Track Time Slider
        trackTimeSlider.frame = CGRect(x: 20, y: Int((viewSize.width - 40) + 70), width: Int(viewSize.width - 40), height: 30)
        
        //Track time Info
        trackTimeSliderLbl.frame = CGRect(x: Int(viewSize.width / 2 - 10), y: Int((viewSize.width - 40) + 50), width: 40, height: 30)
        trackTimeSliderLbl.text = "13:13"
        trackTimeSliderLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        trackTimeSliderLbl.font = trackTimeSliderLbl.font.withSize(10)
        
        //Play and Stop button
        playStopButton.frame = CGRect(x: Int(viewSize.width / 2 - 30), y: Int(viewSize.width - 40) + 120, width: 60, height: 60)
        playStopButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        playStopButton.layer.cornerRadius = playStopButton.frame.size.width / 2
        playStopButton.setTitle("Play", for: .normal)
        playStopButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        playStopButton.layer.borderWidth = 1
        playStopButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Volume Slider
        volumeSlider.frame = CGRect(x: 20, y: Int((viewSize.width - 40) + 200), width: Int(viewSize.width - 40), height: 30)
        //volumeSlider.value = AVAudioSession.sharedInstance().outputVolume
        volumeSlider.value = player.volume
        
        //Volume Info
        volumeSliderLbl.frame = CGRect(x: Int(viewSize.width / 2 - 10), y: Int((viewSize.width - 40) + 220), width: 40, height: 30)
        volumeSliderLbl.text = "\(Int(player.volume * 100)) %"
        volumeSliderLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        volumeSliderLbl.font = volumeSliderLbl.font.withSize(10)
        
        
        //Exit Button
        backButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 60), width: 140, height: 30)
        backButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        backButton.layer.cornerRadius = 6
        backButton.setTitle("Exit", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(imgTrack)
        view.addSubview(trackTimeSliderLbl)
        view.addSubview(trackTimeSlider)
        view.addSubview(playStopButton)
        view.addSubview(volumeSlider)
        view.addSubview(volumeSliderLbl)
        view.addSubview(backButton)
        
        playStopButton.addTarget(self, action: #selector(playStopSound(button:)), for: .touchUpInside)
        trackTimeSlider.addTarget(self, action: #selector(trackTimeMoveChenge(slider:)), for: .valueChanged)
        volumeSlider.addTarget(self, action: #selector(volumeChenge(slider:)), for: .valueChanged)
        backButton.addTarget(self, action: #selector(exitButton(button:)), for: .touchUpInside)
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sliderTimeMove), userInfo: nil, repeats: true)
        
    }
    
    @objc func trackTimeMoveChenge(slider: UISlider) {
        if slider == trackTimeSlider {
            player.currentTime = TimeInterval(slider.value)
        }
    }
    
    @objc func playStopSound(button: UIButton) {
        if button == playStopButton {

            if soundOnOff {
                player.pause()
                soundOnOff = false
                playStopButton.setTitle("Play", for: .normal)
            } else {
                player.play()
                soundOnOff = true
                playStopButton.setTitle("Pause", for: .normal)
                player.currentTime = TimeInterval(trackTimeSlider.value)
            }
        }
    }
    
    @objc func volumeChenge(slider: UISlider) {
        if slider == volumeSlider {
            player.volume = volumeSlider.value
            volumeSliderLbl.text = "\(Int(player.volume * 100)) %"
        }
    }
    
    @objc func sliderTimeMove() {
        //Add time to trackLbl
        trackTimeSlider.value = Float(player.currentTime)
        let currentTimePlaying = Int(player.currentTime)
        let minutesPlaying = currentTimePlaying / 60
        let secondPlaying = currentTimePlaying - minutesPlaying * 60
        trackTimeSliderLbl.text = NSString(format: "%02d:%02d", minutesPlaying, secondPlaying) as String
        
    }
    
    @objc func exitButton(button: UIButton) {
        if button == backButton {
            player.stop()
            dismiss(animated: true, completion: nil)
        }
    }
}
