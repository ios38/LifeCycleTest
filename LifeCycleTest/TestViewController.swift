//
//  TestController.swift
//  LifeCycleTest
//
//  Created by Maksim Romanov on 31.05.2021.
//

import UIKit
import SnapKit

class TestView: UIView {
    let button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        print("  View       init, frame.size \(self.frame.size)")
    }
    
    deinit {
        print("  View       deinit")
    }
    
    override func layoutSubviews() {
        print("  View       layoutSubviews, frame.size \(self.frame.size):")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground

        button.setTitle("Dismiss", for: .normal)
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}


class TestViewController: UIViewController {
    let testView = TestView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("1.Controller init")
    }
    
    override func loadView() {
        self.view = testView
        print("2.Controller loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.button
            .addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        print("3.Controller viewDidLoad, frame.size: \(self.view.frame.size)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("4.Controller viewWillAppear, frame.size: \(self.view.frame.size)")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("5.Controller viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("6.Controller viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("7.Controller viewDidDisappear")
    }
    
    deinit {
        print("8.Controller deinit")
    }
    
    override func viewWillLayoutSubviews() {
        print("  Controller viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("  Controller viewDidLayoutSubviews")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("  Controller viewWillTransition to size: \(size)")
    }
    
    @objc func buttonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
