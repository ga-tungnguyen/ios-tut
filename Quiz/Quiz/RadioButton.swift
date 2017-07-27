//
//  RadioButton.swift
//  Quiz
//
//  Created by t_nguyen on 2017/07/25.
//  Copyright © 2017年 ga-technologies. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class CustomRadioButton: UIButton {
    fileprivate var circleLayer = CAShapeLayer() // là lớp hiển thị các đồ hoạ vector thay cho ảnh bitmap. (Cái này vẽ đường tròn bên ngoài)
    fileprivate var fillCircleLayer = CAShapeLayer() // cái này là dùng để vẽ hình tròn bên trong
    
    override var isSelected: Bool{
        didSet{
            toggleButton()
        }
    }
    
    // Màu của radio button , mặc định là xanh
    // Using User defined runtime attriutes
    @IBInspectable var circleColor: UIColor = UIColor.blue{
        didSet{
            circleLayer.strokeColor = strokeColor.cgColor
            self.toggleButton()
            print("adsfadf")
            print("feature 1")
        }
    }
    
    // Mau sac cho strokeColor radio button
    // khi chua dc chon thi la gray
    @IBInspectable var strokeColor: UIColor = UIColor.gray {
        didSet{
            circleLayer.strokeColor = strokeColor.cgColor
            self.toggleButton()
        }
    }
    
    // Radius of Radio Button
    @IBInspectable var circleRadius: CGFloat = 5.0 // cái này chính là thuộc tính bo góc, mặc định sẽ là 0.0
    @IBInspectable var conrnerRadius: CGFloat {
        // độ rộng của viền của radio button
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    // bắt đầu vẽ hình tròn của Radio Button
    //func này sẽ return về rectangle
    fileprivate func drawCircleFrame() -> CGRect{
        var circleFrame = CGRect(x: 0, y: 0, width: 2 * circleRadius, height: 2 * circleRadius)
        // vị trí đặt của radio button : gồm toạ độ x và y
        circleFrame.origin.x = 0 + circleLayer.lineWidth
        circleFrame.origin.y = bounds.height/2 - circleFrame.height/2
        // bounds chính là giới hạn chiều ngang và chiều dọc của radio button , hay nói cách khác nó chính là witdh và height
        return circleFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    fileprivate func initialize(){
        circleLayer.frame = bounds
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = 2
        circleLayer.strokeColor = strokeColor.cgColor
        layer.addSublayer(circleLayer)
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 2
        fillCircleLayer.fillColor = UIColor.clear.cgColor
        fillCircleLayer.strokeColor = UIColor.clear.cgColor
        layer.addSublayer(fillCircleLayer)
        //Creates an edge inset for a button or view.
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (4 * circleRadius + 4 * circleLayer.lineWidth), 0, 0) // add button radius into view
        
    }
    
    func toggleButton(){
        if self.isSelected{
            // change color and fill strocke
            fillCircleLayer.fillColor = circleColor.cgColor
            circleLayer.strokeColor = circleColor.cgColor
        }else {
            fillCircleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = strokeColor.cgColor
        }
    }
    
    fileprivate func circlePath() -> UIBezierPath{
        return UIBezierPath(ovalIn: drawCircleFrame())
    }
    
    fileprivate func fillCirclePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: drawCircleFrame().insetBy(dx: 2, dy: 2))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().cgPath
        fillCircleLayer.frame = bounds
        fillCircleLayer.path = fillCirclePath().cgPath
        self.titleEdgeInsets = UIEdgeInsetsMake(0, (2*circleRadius + 4*circleLayer.lineWidth), 0, 0)
    }
    
    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
