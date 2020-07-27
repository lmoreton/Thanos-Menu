//
//  LoadingView.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    private var parentView: UIView?
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
}

extension LoadingView {
    
    func showIn(view: UIView) {
        parentView = view
        view.addSubview(self)
        setupViewConfiguration()
    }
    
    func remove() {
        self.removeFromSuperview()
    }
}

extension LoadingView: ViewCoding {
    
    func configureViews() {
        self.backgroundColor = .systemBackground
        self.activityIndicator.startAnimating()
    }
    
    func buildViewHierarchy() {
        self.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        guard let superview = self.superview else {
            fatalError("View should have a superview")
        }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leftAnchor.constraint(equalTo: superview.leftAnchor),
            self.rightAnchor.constraint(equalTo: superview.rightAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
