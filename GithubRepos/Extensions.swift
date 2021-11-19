//
//  Extensions.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation
import UIKit

extension UIView {
    
    func startProgressAnim() {
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        
        self.addSubview(activityIndicator)
        self.bringSubviewToFront(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        activityIndicator.startAnimating()
        
    }
    
    func stopProgressAnim() {
        for view in self.subviews {
            if let activityView = view as? UIActivityIndicatorView {
                activityView.stopAnimating()
                activityView.removeFromSuperview()
                break
            }
        }
    }
    
    
    func pinEdgesToSuperviewBounds(margin: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `pinEdgesToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: margin).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin).isActive = true

    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UIImageView {
    func downloadImage(url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }).resume()
    }
}
