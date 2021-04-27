//
//  SpringAnimationSettings.swift
//  AnimationApp
//
//  Created by macbook on 27.04.21.
//

import Foundation

struct Animation {
    let preset: [String]
    let curve: [String]
    let force: ClosedRange<Double>
    let duration: ClosedRange<Double>
    let delay: ClosedRange<Double>
}

extension Animation {
    static func getAnimationSettings() -> Animation {
        
        let animation = Animation(
            preset: DataManager.shared.springPresets,
            curve: DataManager.shared.springCurve,
            force: DataManager.shared.force,
            duration: DataManager.shared.duration,
            delay: DataManager.shared.delay
        )
        
        return animation
    }
}
