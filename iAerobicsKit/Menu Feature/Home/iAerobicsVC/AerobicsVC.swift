//
//  AerobicsVC.swift
//  iFitnessMan
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

@objc class AerobicsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var sec0Label: UILabel!
    @IBOutlet weak var sec1Label: UILabel!
    @IBOutlet weak var btnImg: UIImageView!
    @IBOutlet weak var aerobicsTabel: UITableView!
    
    var listData = [AerobicsMode]()
    var aerobicsTime = 480
    var recordTime = 0
    var timer: Timer?
    var isPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aerobicsTime = AerobicsData.aerobicsTime
        
        let nib = UINib(nibName: "AerobicsCell", bundle: nil)
        aerobicsTabel.register(nib, forCellReuseIdentifier: "Cell")
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        btnImg.isUserInteractionEnabled = true
        btnImg.addGestureRecognizer(tapGestureRecognizer)
        
        self.getData()
        aerobicsTabel.reloadData()
        // Do any additional setup after loading the view.
    }
    
    // MARK - get aerobics data
    func getData() {
        listData = [AerobicsMode]()
        let actions = AerobicsData.actions
        let actionName = AerobicsData.actionName
        let actionList: [String] = AerobicsData.actionList["Aerobics"]!
        let actionTime: [Int] = AerobicsData.actionTime["Aerobics"]!
        for i in 0...actionList.count - 1 {
            let imgsCount = actions[actionList[i]]!
            let imgs = getImgsName(actionList[i], imgsCount)
            listData.append(AerobicsMode.init(title: actionName[actionList[i]]!, time: actionTime[i], imgs: imgs))
            
        }
    }
    func getImgsName(_ action: String, _ count: Int) -> [String] {
        var imgs = [String]()
        for i in 1...count {
            imgs.append("\(action)0\(i).png")
        }
        return imgs
    }
    
    // MARK: - tapGestureRecognizer
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if !isPlay {
            aerobicsTabel.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            btnImg.image = UIImage(named: "button_1.png")
            isPlay = true
            registerTimer()
        }
    }
    
    // MARK: - timer
    func registerTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runAerobics(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func runAerobics(_ timer: Timer) -> Void {
        let row = Int(recordTime / 40)
        let indexPath = IndexPath(row: row, section: 0)
        if (recordTime - (Int(recordTime / 40) * 40)) == 0 {
            if row != 0 {
                let subCell = aerobicsTabel.cellForRow(at: IndexPath(row: row - 1, section: 0)) as! AerobicsCell
                subCell.stopImg()
            }
            if aerobicsTime == 0 {
                resetView()
                return
            }
            let cell = aerobicsTabel.cellForRow(at: indexPath) as! AerobicsCell
            aerobicsTabel.scrollToRow(at: indexPath, at: .top, animated: true)
            cell.heightAnchor.constraint(equalToConstant: 120)
            cell.playRest()
        }
        if (recordTime - (Int(recordTime / 40) * 40)) == 20 {
            let cell = aerobicsTabel.cellForRow(at: indexPath) as! AerobicsCell
            cell.playAction()
        }
        
        recordTime += 1
        aerobicsTime -= 1
        self.changeTimeLabel()
    }
    
    // MARK: - set time label
    func changeTimeLabel() {
        minLabel.text = "\(Int(aerobicsTime / 60))"
        var s = aerobicsTime - (Int(aerobicsTime / 60) * 60)
        sec0Label.text = "\(Int(s / 10))"
        s -= (Int(s / 10) * 10)
        sec1Label.text = "\(s)"
    }
    
    // MARK: - reset View
    func resetView() {
        timer?.invalidate()
        timer = nil
        minLabel.text = "8"
        sec0Label.text = "0"
        sec1Label.text = "0"
        aerobicsTime = 480
        recordTime = 0
        btnImg.image = UIImage(named: "button_0.png")
        isPlay = false
    }

    // MARK: - table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = listData[indexPath.row]
        let cell = aerobicsTabel.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AerobicsCell
        cell.titleLabel.text = cellData.title
        cell.timeLabel.text = cellData.time.toTimeString()
        cell.time = cellData.time
        cell.imgArray = cellData.imgs
        cell.setImg()
        
        return cell
    }
}
