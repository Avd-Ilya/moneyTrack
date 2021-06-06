//
//  ViewController.swift
//  MoneyTrack
//
//  Created by Avdeev Ilya Aleksandrovich on 01.06.2021.
//  Copyright © 2021 Avdeev Ilya Aleksandrovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelSum: UILabel!
    @IBOutlet var addButton: [UIButton]!

    
    @IBOutlet weak var labelBus: UILabel!
    @IBOutlet weak var labelTram: UILabel!
    @IBOutlet weak var labelTroll: UILabel!
    @IBOutlet weak var labelST: UILabel!
    @IBOutlet weak var labelMinibus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(addButton.count)
        for i in 0..<5 {
            let button = addButton[i]
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
        }
        labelSum.text = "0 RUB"
//        let date = Date()
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year, .month, .day], from: date)
//
//        let year =  components.year
//        let month = components.month
//        let day = components.day
        
        
    }
    var calculate = Calculate(curYear: 2000, curMonth: 01)
    
    
    @IBAction func addButton(_ sender: Any) {
        guard let buttonSender = sender as? UIButton else { return }
    
        buttonSender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    buttonSender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )

        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        let year =  components.year
        let month = components.month
        let day = components.day
        
        calculate.curYear = year!
        calculate.curMonth = month!
        var sum = 0

        //--------
        
        //let new = Calculate(note: note(y: year!, m: month!, d: day!, t: definingTheType(tag: buttonSender.tag)))
        let new = Note(y: year!, m: month!, d: day!, t: definingTheType(tag: buttonSender.tag))
        notes.append(new)
        
        sum += calculate.getSum()
        labelSum.text = "\(sum) RUB"
        labelDate.text = calculate.getDate()
        labelBus.text = "Bus: \(calculate.getCountBus()) items"
        labelTram.text = "Bus: \(calculate.getCountTram()) items"
        labelTroll.text = "Bus: \(calculate.getCountTroll()) items"
        labelST.text = "Bus: \(calculate.getCountST()) items"
        labelMinibus.text = "Bus: \(calculate.getCountMinibus()) items"
        
        
        
        
    }
    
    func definingTheType(tag: Int) -> typeOfTransport {
        switch tag {
        case 1:
            return .bus
        case 2:
            return .tram
        case 3:
            return .troll
        case 4:
            return .st
        case 5:
            return .minibus
        default:
            return .bus
        }
    }
    
}

