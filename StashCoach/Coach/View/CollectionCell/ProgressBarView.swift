// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class ProgressBarView: UIView {
    
    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    init(progress: CGFloat = 0.0) {
        super.init(frame: CGRect.zero)
        self.progress = progress
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setProgress(toValue val: CGFloat) {
        progress = val
    }
    
    override func draw(_ rect: CGRect) {
        
        let roundingMultiple: CGFloat = 0.4
        
        let barLayer = CAShapeLayer()
        let barPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * roundingMultiple)
        
        barLayer.path = barPath.cgPath
        barLayer.fillColor = UIColor.white.cgColor
        
        layer.addSublayer(barLayer)
        
        let progressLayer = CAShapeLayer()
        let progressRect = CGRect(origin: rect.origin, size: CGSize(width: rect.width * progress, height: rect.height))
        let progressPath = UIBezierPath(roundedRect: progressRect, cornerRadius: rect.height * roundingMultiple)
        
        progressLayer.path = progressPath.cgPath
        progressLayer.fillColor = Constants.Colors.progressGreen.color().cgColor
        layer.addSublayer(progressLayer)
        
    }
}
