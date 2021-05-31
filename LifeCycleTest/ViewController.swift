//
//  ViewController.swift
//  LifeCycleTest
//
//  Created by Maksim Romanov on 31.05.2021.
//

import UIKit
import SnapKit

class FirstView: UIView {
    let button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        
        button.setTitle("Test Controller", for: .normal)
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

class ViewController: UIViewController {
    let firstView = FirstView()

    override func loadView() {
        self.view = firstView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        let vc = TestViewController()
        present(vc, animated: true, completion: nil)
    }

}

