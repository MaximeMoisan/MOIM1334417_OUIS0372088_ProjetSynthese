//
//  Intro.swift
//  Projet Synthese
//
//  Created by Etudiant on 16-11-21.
//  Copyright © 2016 Etudiant. All rights reserved.
//

import UIKit

class Intro: UIViewController{

    @IBOutlet weak var progressView: UIProgressView!
    var time : Float = 0.0
    var timer: Timer?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(Intro.passerAuMenuPrincipal), userInfo: nil, repeats: false)
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector:#selector(Intro.setProgress), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    func setProgress() {
        time += 0.001
        progressView.setProgress(time / 5, animated: true)
        if time >= 5 {
            timer!.invalidate()
        }
    }
    func passerAuMenuPrincipal(){
        performSegue(withIdentifier: "versMenuPrincipal", sender: self)
    } // passerAuMenuPrincipal

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

