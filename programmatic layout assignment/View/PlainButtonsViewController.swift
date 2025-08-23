//
//  ViewController.swift
//  programmatic layout assignment
//
//  Created by User on 13/08/25.
//

import UIKit
import AVFoundation

class PlainButtonsViewController: UIViewController {
    
    let buttonText = ["C","D","E","F","G","A","B"]
    let colors: [UIColor] = [.systemRed,.systemOrange,.systemYellow,.systemGreen,.systemIndigo,.systemBlue,.systemPurple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plain Buttons View"
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        
    }
    
    func setupUI(){
        for (index, text) in buttonText.enumerated() {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.setTitle(text, for: .normal)
            button.backgroundColor = colors[index]
            button.addTarget(self, action: #selector(handelPress), for: .touchUpInside)

            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(index)*9+(100 * CGFloat(index))),
                
                button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10-(10 * CGFloat(index))),
                button.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            
        }
    }
    var player: AVAudioPlayer!
    @objc func handelPress(_ sender: UIButton){
        let url = Bundle.main.url(forResource: sender.currentTitle!, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    


}

