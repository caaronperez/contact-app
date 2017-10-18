//
//  RatingControl.swift
//  HW-DAY8E4
//
//  Created by MCS Devices on 10/16/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 20.0, height: 20.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    var counterRatings = 0 {
        didSet {
            updateLabel()
        }
    }
    
    func updateLabel() {
        label.text = "\(counterRatings) Ratings"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))

    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        removeArrangedSubview(label)
        label.removeFromSuperview()
        label.text = "\(counterRatings) Ratings"
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let fillStar = UIImage(named: "fillStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highStar = UIImage(named:"highStar", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            let button = UIButton()
            
            // Set images
            button.setImage(emptyStar, for: .normal)
            button.setImage(fillStar, for: .selected)
            button.setImage(highStar, for: .highlighted)
            button.setImage(highStar, for: [.highlighted, .selected])
            
            //Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.accessibilityLabel = "Set \(index + 1) star rating"
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
        addArrangedSubview(label)
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            counterRatings+=1
            rating = selectedRating
        }
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    
}
