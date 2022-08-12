//
//  SplashViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/12.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import Lottie

protocol SplashPresentableListener: AnyObject {
    func moveToMain()
}

final class SplashViewController: BaseViewController, SplashPresentable, SplashViewControllable {
    var animationView: AnimationView?

    weak var listener: SplashPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        createLottie()
        
        setupConstraints()
    }
    
    private func createLottie() {
        animationView = AnimationView()
        
        let animation = Animation.named("splash_note")
        animationView?.animation = animation
        animationView?.contentMode = .scaleAspectFit
        animationView?.play() { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("Move to the Main")
                self.listener?.moveToMain()
            }
        }
        
        self.view.addSubview(animationView!)
    }
    
    private func setupConstraints() {
        animationView?.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
            $0.width.height.equalTo(300)
        }
    }
}
