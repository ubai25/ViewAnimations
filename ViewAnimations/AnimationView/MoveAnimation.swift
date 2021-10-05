//
//  MoveAnimation.swift
//  ViewAnimations
//
//  Created by Ahmad Ubaidillah on 05/10/21.
//

import UIKit
import ViewAnimator

class MoveAnimation: UIViewController {

    private let rectangle = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rectangle.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        rectangle.center = view.center
        rectangle.backgroundColor = .systemRed
        
        let animation = AnimationType.from(direction: .bottom, offset: 200)
        rectangle.animate(animations: [animation])
        
        view.addSubview(rectangle)
    }

}
