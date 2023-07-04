//
//  ViewController.swift
//  ExPlaceholder
//
//  Created by 김종권 on 2023/07/04.
//

import UIKit

class ViewController: UIViewController {
    private let placeholderTextView = PlaceholderTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeholderTextView.placeholderText = "값을 입력해주세요"
        
        view.addSubview(placeholderTextView)
        
        placeholderTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeholderTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeholderTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            placeholderTextView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
