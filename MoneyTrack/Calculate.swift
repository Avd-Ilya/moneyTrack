//
//  Calculate.swift
//  MoneyTrack
//
//  Created by Avdeev Ilya Aleksandrovich on 05.06.2021.
//  Copyright © 2021 Avdeev Ilya Aleksandrovich. All rights reserved.
//

import Foundation


extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd.MM.yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}


enum typeOfTransport {
    case bus
    case tram
    case troll
    case st
    case minibus
}

struct Note {
    var year: Int
    var month: Int
    var day: Int
    var type: typeOfTransport
    
    init(y: Int, m: Int, d: Int, t: typeOfTransport) {
        self.year = y
        self.month = m
        self.day = d
        self.type = t
    }
}

var notes: [Note] = []

class Calculate {
    var priceBus = 25
    var priceTram = 25
    var priceTroll = 25
    var priceST = 40
    var priceMinibus = 20
    var curYear: Int
    var curMonth: Int
    //var curDay: Int
    
    init(curYear: Int, curMonth: Int) {
        self.curYear = curYear
        self.curMonth = curMonth
    }
    
    func getSum() -> Int{
        var sum = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth {
                sum += price(type: i.type)
            }
        }
        return sum
    }
    
    func getDate() -> String{
        switch curMonth {
        case 1:
            return "January \(curYear)"
        case 2:
            return "February \(curYear)"
        case 3:
            return "March \(curYear)"
        case 4:
            return "April \(curYear)"
        case 5:
            return "May \(curYear)"
        case 6:
            return "June \(curYear)"
        case 7:
            return "July \(curYear)"
        case 8:
            return "August \(curYear)"
        case 9:
            return "September \(curYear)"
        case 10:
            return "October \(curYear)"
        case 11:
            return "November \(curYear)"
        case 12:
            return "December \(curYear)"
        default:
            return "error"
        }
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
    
    func price(type: typeOfTransport) -> Int {
        switch type {
        case .bus:
            return priceBus
        case .tram:
            return priceTram
        case .troll:
            return priceTroll
        case .st:
            return priceST
        case .minibus:
            return priceMinibus
        }
    }
    
    func getCountBus() -> Int{
        var count = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth && i.type == .bus {
                count += 1
            }
        }
        return count
    }
    
    func getCountTram() -> Int{
        var count = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth && i.type == .tram {
                count += 1
            }
        }
        return count
    }
    
    func getCountTroll() -> Int{
        var count = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth && i.type == .troll {
                count += 1
            }
        }
        return count
    }
    
    func getCountST() -> Int{
        var count = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth && i.type == .st {
                count += 1
            }
        }
        return count
    }
    
    func getCountMinibus() -> Int{
        var count = 0
        for i in notes {
            if i.year == curYear && i.month == curMonth && i.type == .minibus {
                count += 1
            }
        }
        return count
    }
}



