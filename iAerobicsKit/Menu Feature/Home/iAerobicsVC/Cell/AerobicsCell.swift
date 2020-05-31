//
//  AerobicsCell.swift
//  iFitnessMan
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

class AerobicsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var trackView: UIView!
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var playView: UIView!
    
    var imgArray = [String]()
    var time: Int = 0
//    var playAnimation: CABasicAnimation!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        self.backgroundColor = AerobicsData.cellBgColor
        self.trackView.bounds.size.height = 0
    }
    
    func setImg() {
        var imgs = [UIImage]()
        for i in 0...imgArray.count - 1 {
            if UIImage(named: imgArray[i]) != nil {
                imgs.append(UIImage(named: imgArray[i])!)
            }
        }
        imgView.animationImages = imgs
        imgView.animationDuration = 2
        imgView.image = imgs[0]
    }
    
    func playRest() {
        self.trackView.bounds.size.height = 10
        let restAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        restAnimation.toValue = self.trackView.frame.width
        restAnimation.duration = 20
        restAnimation.fillMode = .forwards
        restAnimation.isRemovedOnCompletion = true
        restView.layer.add(restAnimation, forKey: "runRestPlay")
        self.backgroundColor = UIColor.white
    }
    func playAction() {
        imgView.startAnimating()
        let playAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        playAnimation.toValue = self.trackView.frame.width
        playAnimation.duration = CFTimeInterval(time)
        playAnimation.fillMode = .forwards
        playAnimation.isRemovedOnCompletion = true
        playView.layer.add(playAnimation, forKey: "runActionPlay")
    }
    func stopImg() {
        imgView.stopAnimating()
        self.backgroundColor = AerobicsData.cellBgColor
        self.trackView.bounds.size.height = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
