//
//  MRTStationMapper.swift
//  MRTStationList
//
//  Created by blackzid on 2016/5/10.
//  Copyright © 2016年 nccu. All rights reserved.
//

import Foundation
import ObjectMapper

struct MRTLines {
    static let names = ["文湖線",
                        "板南線",
                        "淡水信義線",
                        "新北投支線",
                        "松山新店線",
                        "小碧潭支線",
                        "中和新蘆線",
                        "貓空纜車"]
    static let colorTable: [String: (CGFloat, CGFloat, CGFloat)] = [
                        "文湖線": (158, 101, 46),
                        "淡水信義線":(203, 44, 48),
                        "新北投支線":(248, 144, 165),
                        "松山新店線":(0, 119, 73),
                        "小碧潭支線": (206, 220, 0),
                        "中和新蘆線": (255, 163, 0),
                        "板南線": (0, 94, 184),
                        "貓空纜車": (119, 185, 51)]
    
}

struct MRTStationManager{
    var lines: [(String,[MRTStation])]
    init(contentsOfFile path: String) {
        do {
            let jsonString = try String(contentsOfFile: path)
            let stations = Mapper<MRTStation>().mapArray(jsonString)!
            var tempLines: [(String,[MRTStation])] = []
            for line in MRTLines.names {
                let temp = stations.filter({ station -> Bool in
                    return Array(station.lines!.keys).contains(line)
                })
                tempLines.append((line,temp))
            }
            self.lines = tempLines
        }
        catch let error as NSError {
            print("Error: \(error)")
            self.lines = []

        }
    }
    
}
struct MRTLine {
    var name: String
    var stations: [MRTStation]
    init (name: String, stations: [MRTStation]){
        self.name = name
        self.stations = stations
    }
    
}

struct MRTStation: Mappable {
    var name: String?
    var coordinate: [Double]?
    var lines: [String : String]?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        coordinate <- map["coordinate"]
        lines <- map["lines"]
    }
}