//
//  ViewController.swift
//  AnimationApp
//
//  Created by macbook on 27.04.21.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var runAnimationButton: SpringButton!
    
    @IBOutlet weak var springAnimationView: SpringView!
    
    
    private let animationSet = Animation.getAnimationSettings()
    private var randAnimation = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randAnimation = animationSet.preset.randomElement() ?? ""
    }
    
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        
        springAnimationView.animation = randAnimation
        springAnimationView.curve = animationSet.curve.randomElement() ?? ""
        springAnimationView.force = CGFloat(Double.random(in: animationSet.force))
        springAnimationView.duration = CGFloat(Double.random(in: animationSet.duration))
        springAnimationView.delay = CGFloat(Double.random(in: animationSet.delay))
        
        springAnimationView.animate()
        
        randAnimation = animationSet.preset.randomElement() ?? ""
        
        runAnimationButton.setTitle("Run \(randAnimation)", for: .normal)
        setLabels()
    }
    
    
    private func setLabels() {
        presetLabel.text =  springAnimationView.animation
        curveLabel.text = springAnimationView.curve
        forceLabel.text = String(Float(springAnimationView.force * 100).rounded() / 100)
        durationLabel.text = String(Float(springAnimationView.duration * 100).rounded() / 100)
        delayLabel.text = String(Float(springAnimationView.delay * 100).rounded() / 100)
    }
    
}

