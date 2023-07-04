//
//  PlaceholderTextView.swift
//  ExPlaceholder
//
//  Created by 김종권 on 2023/07/04.
//

import UIKit

final class PlaceholderTextView: UITextView {
    // MARK: Constant
    private enum Const {
        static let backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        static let cornerRadius = 14.0
        static let containerInset = UIEdgeInsets(top: 30, left: 24, bottom: 30, right: 24)
        static let placeholderColor = UIColor(red: 0, green: 0, blue: 0.098, alpha: 0.22)
    }
    
    // MARK: UI
    private let placeholderTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .clear
        view.textColor = Const.placeholderColor
        view.isUserInteractionEnabled = false
        view.isAccessibilityElement = false
        return view
    }()
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        setupUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    // MARK: Property
    var placeholderText: String? {
        didSet {
            placeholderTextView.text = placeholderText
            updatePlaceholderTextView()
        }
    }
    
    // MARK: Method
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePlaceholderTextView()
    }
}

// MARK: - Private Method
private extension PlaceholderTextView {
    func setupUI() {
        delegate = self
        
        backgroundColor = Const.backgroundColor
        
        layer.cornerRadius = Const.cornerRadius
        clipsToBounds = true
        
        textContainerInset = Const.containerInset
        contentInset = .zero
        
        addSubview(placeholderTextView)
        
        placeholderTextView.textContainerInset = Const.containerInset
        placeholderTextView.contentInset = contentInset
    }
    
    func updatePlaceholderTextView() {
        placeholderTextView.isHidden = !text.isEmpty
        accessibilityValue = text.isEmpty ? placeholderText ?? "" : text
        
        placeholderTextView.textContainer.exclusionPaths = textContainer.exclusionPaths
        placeholderTextView.textContainer.lineFragmentPadding = textContainer.lineFragmentPadding
        placeholderTextView.frame = bounds
    }
}

// MARK: - PlaceholderTextView + UITextViewDelegate
extension PlaceholderTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderTextView()
    }
}

