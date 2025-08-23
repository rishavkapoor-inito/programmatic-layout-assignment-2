//
//  StackViewViewController.swift
//  programmatic layout assignment
//
//  Created by User on 23/08/25.
//

import UIKit
import AVFoundation

class StackViewViewController: UIViewController {
    
    let buttonText = ["C","D","E","F","G","A","B"]
    let colors: [UIColor] = [.systemRed,.systemOrange,.systemYellow,.systemGreen,.systemIndigo,.systemBlue,.systemPurple]
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let vstack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fill
        s.spacing = 8
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stack View with scrolling"
        view.backgroundColor = .systemBackground
        
        view.addSubview(vstack)
        
        setupHierarchy()
        setupUI()
    }
    
    private func setupHierarchy() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vstack)
    }
    
    func setupUI(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            vstack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            vstack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            vstack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            vstack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        for (index, text) in buttonText.enumerated() {
            
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(text, for: .normal)
            button.backgroundColor = colors[index]
            button.addTarget(self, action: #selector(handelPress), for: .touchUpInside)
            
            container.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                button.topAnchor.constraint(equalTo: container.topAnchor),
                button.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                button.heightAnchor.constraint(equalToConstant: 100),
                
                button.widthAnchor.constraint(
                    equalTo: container.widthAnchor,
                    multiplier: max(0.02, 1.0 - (0.02 * CGFloat(index)))
                ),
                
                container.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            
            
            vstack.addArrangedSubview(container)
            
            
        }
    }
    
    var player: AVAudioPlayer!
    @objc func handelPress(_ sender: UIButton){
        let url = Bundle.main.url(forResource: sender.currentTitle!, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    
    
}
