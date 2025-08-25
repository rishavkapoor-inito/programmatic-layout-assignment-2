//
//  HomeViewController.swift
//  programmatic layout assignment
//
//  Created by User on 23/08/25.
//

import UIKit



class HomeViewController: UIViewController {
    
    let plainButton = makeButton(title: "Plain Buttons")
    let stackButton = makeButton(title: "Stack View")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    func setupUI(){
        let vstack = UIStackView(arrangedSubviews: [plainButton, stackButton])
        vstack.axis = .vertical
        vstack.alignment = .fill
        vstack.spacing = 16
        vstack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vstack)
        
        NSLayoutConstraint.activate([
            vstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vstack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vstack.leadingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor),
            vstack.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor),
            
            plainButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            stackButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            
            plainButton.heightAnchor.constraint(equalToConstant: 56),
            stackButton.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        plainButton.addTarget(self, action: #selector(openPlain), for: .touchUpInside)
        stackButton.addTarget(self, action: #selector(openStack), for: .touchUpInside)
    }
    
    @objc private func openPlain() {
        navigationController?.pushViewController(PlainButtonsViewController(), animated: true)
    }
    
    @objc private func openStack() {
        navigationController?.pushViewController(StackViewViewController(), animated: true)
    }
    
    
}

func makeButton(title: String) -> UIButton {
    let b = UIButton(type: .system)
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle(title, for: .normal)
    b.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
    b.setTitleColor(.white, for: .normal)
    b.backgroundColor = .systemBlue
    b.layer.cornerRadius = 12
    b.layer.masksToBounds = true
    return b
}
