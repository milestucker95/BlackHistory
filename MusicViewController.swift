//
//  MusicViewController.swift
//  Black History
//
//  Created by Miles Tucker on 11/28/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var songPlayer = AVAudioPlayer()
    //15 -
    var hasBeenPaused = false
//    var generalPlaylist = [String]()
    var seventysMusic = [
                         "Cameo - Candy","Gregory Abbott - Shake You Down","New Birth - Dream Merchant","Freddie Jackson-You Are My Lady","Slave - Slide (1977)","Gap Band - Yearning For Your Love"]
    
    var newMusic = ["Waves","FML","Real Friends","Wolves", "Single Ladies","Diva", "Coffe Shop"]
    var oldMusic = ["I Need your loving", "Maple Leaf Rag","Irreplacable","Smooth Operator","Wait for love","Rock With You","Billie Jean","Beat It","Wanna Be Starting Somethin","Thriller","St. Louis Blues","02 St. Louis Blues","Treemonisha","Treemonisha2","Dirty Diana","Black or White","Heal the World","Proud Mary","Dance for You","I Would Die For You"]
    var generalPlaylist = ["Waves","FML","Real Friends","Wolves","I Need your loving", "Maple Leaf Rag","Irreplacable","Smooth Operator","Wait for love","Rock With You","Billie Jean","Beat It","Wanna Be Starting Somethin","Thriller","St. Louis Blues","02 St. Louis Blues","Single Ladies","Diva","Treemonisha","Treemonisha2","Dirty Diana","Black or White","Heal the World","Proud Mary","Dance for You","I Would Die For You", "Cameo - Candy","Gregory Abbott - Shake You Down","New Birth - Dream Merchant","Freddie Jackson-You Are My Lady","Slave - Slide (1977)","Gap Band - Yearning For Your Love"]
    var artistPortraitPlaylist = ["Rosa Parks","JayZ", "MLK", "Obama", "Obama2", "Will Smith","WillSmith2","WillSmith3", "Oprah Winfrey","Oprah2", "Denzel Washington","DenzelWashington2","Beyonce", "Tristan Walker","Frederick Douglas","Frances Harper","Michael Jordan"]
    //6 -
    var timer: Timer!

    @IBOutlet weak var musicImage: UIImageView!
   
    @IBOutlet weak var SongTitle: UILabel!
    
    
    @IBOutlet weak var musicPicker: UIPickerView!
    
    @IBOutlet weak var genreButton: UIBarButtonItem!
    
    var musicList = ["All","Oldies", "Newies", "Seventies"]
  
    func prepareSongAndSession() {
        
        do {
            let randomIndex = Int(arc4random_uniform(UInt32(generalPlaylist.count)))

            //7 - Insert the song from our Bundle into our AVAudioPlayer
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: generalPlaylist[randomIndex], ofType: "mp3")!))
            //8 - Prepare the song to be played
            songPlayer.prepareToPlay()
            
            //9 - Create an audio session
            let audioSession = AVAudioSession.sharedInstance()
            do {
                //10 - Set our session category to playback music
                self.SongTitle.text = generalPlaylist[randomIndex]
                self.SongTitle.isHidden = false
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                //11 -
                //print ("do")

            } catch let sessionError {
//                print("session error")
                print(sessionError)
            }
            //12 -
        } catch let songPlayerError {
//            print("song Player Error")
            print(songPlayerError)
        }
    }
    
    func randomBackgroundGenerator(){
        NSLog("asdasd");
        let randomPhotoIndex = Int(arc4random_uniform(UInt32(artistPortraitPlaylist.count)))

        musicImage.image = UIImage(named: artistPortraitPlaylist[randomPhotoIndex]);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SongTitle.isHidden = true
        self.musicPicker.isHidden = false
//        prepareSongAndSession()
        randomBackgroundGenerator()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: Selector("randomBackgroundGenerator"), userInfo: nil, repeats: true)
//        self.randomBackgroundGenerator()
    }
    
   
    
    
    @IBAction func pause(_ sender: AnyObject) {
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
            songPlayer.play()

        }
    }
    @IBAction func restart(_ sender: AnyObject) {
                if songPlayer.isPlaying || hasBeenPaused {
                    songPlayer.stop()
                    songPlayer.currentTime = 0
        
                    songPlayer.play()
                } else  {
                    songPlayer.play()
                }
    }
    
    
    @IBAction func fastForward(_ sender: AnyObject) {
        songPlayer.stop()
        prepareSongAndSession()
        songPlayer.play()
    }
  

    @IBAction func genreButtonPressed(_ sender: UIBarButtonItem) {
        print("genre button pressed")
        self.musicPicker.isHidden = false

        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return musicList.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return musicList[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        self.textBox.text = self.musicList[row]
        
        if row == 0{
            print("choice nothing")

        }
        
        else if row == 1{
            print("choice 1")
            generalPlaylist = oldMusic

        }
        else if row == 2{
            print("choice 2")

            generalPlaylist = newMusic

        }
        else{
            generalPlaylist = seventysMusic
        }
//        SongTitle.isHidden = false
        prepareSongAndSession()
        self.musicPicker.isHidden = true
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
