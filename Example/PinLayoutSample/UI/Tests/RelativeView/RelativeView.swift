// Copyright (c) 2017, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit
import PinLayout

class RelativeView: BaseView {
    fileprivate let belowNavBarView = BasicView(text: "Below navbar", color: UIColor.lightGray)
    
    var rootView: BasicView!
    
    fileprivate let centerView = UIView()
    
    fileprivate let topLeftView = UIView()
    fileprivate let topCenterView = UIView()
    fileprivate let topRightView = UIView()
    
    fileprivate let leftTopView = UIView()
    fileprivate let leftCenterView = UIView()
    fileprivate let leftBottomView = UIView()
    
    fileprivate let bottomLeftView = UIView()
    fileprivate let bottomCenterView = UIView()
    fileprivate let bottomRightView = UIView()
    
    fileprivate let rightTopView = UIView()
    fileprivate let rightCenterView = UIView()
    fileprivate let rightBottomView = UIView()
    
    fileprivate let relativeView = UIView()
    fileprivate let childRelativeView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(belowNavBarView)
        
        rootView = BasicView(text: "", color: .white)
        addSubview(rootView)
        
        centerView.backgroundColor = .blue
        rootView.addSubview(centerView)
        
        addSquare(topLeftView, color: .green)
        addSquare(topCenterView, color: .yellow)
        addSquare(topRightView, color: .purple)
        
        addSquare(leftTopView, color: .magenta)
        addSquare(leftCenterView, color: .cyan)
        addSquare(leftBottomView, color: .purple)
        
        addSquare(bottomLeftView, color: .black)
        addSquare(bottomCenterView, color: .red)
        addSquare(bottomRightView, color: .gray)
        
        addSquare(rightTopView, color: .black)
        addSquare(rightCenterView, color: .red)
        addSquare(rightBottomView, color: .gray)
    }
    
    fileprivate func addSquare(_ view: UIView, color: UIColor) {
        view.backgroundColor = color
        view.pin.width(50).height(50)
        addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        belowNavBarView.pin.topLeft().bottomRight().marginTop(topLayoutGuide)
        
        rootView.frame = CGRect(x: 0, y: topLayoutGuide, width: 400, height: 400)
        centerView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        topLeftView.pin.above(of: centerView, aligned: .left)
        topCenterView.pin.above(of: centerView, aligned: .center)
        topRightView.pin.above(of: centerView, aligned: .right)
        
        leftTopView.pin.left(of: centerView, aligned: .top)
        leftCenterView.pin.left(of: centerView, aligned: .center)
        leftBottomView.pin.left(of: centerView, aligned: .bottom)
        
        bottomLeftView.pin.below(of: centerView, aligned: .left)
        bottomCenterView.pin.below(of: centerView, aligned: .center)
        bottomRightView.pin.below(of: centerView, aligned: .right)

        rightTopView.pin.right(of: centerView, aligned: .top)
        rightCenterView.pin.right(of: centerView, aligned: .center)
        rightBottomView.pin.right(of: centerView, aligned: .bottom)
    }
}
