//
//  DataMovie.swift
//  NccCineplex
//
//  Created by User on 7/8/20.
//  Copyright © 2020 hung. All rights reserved.
//

import Foundation


struct DataMovie {
    let imageMovie: String
    let nameLabel: String
    let timeLabel: String
}

func createData() -> [DataMovie] {
    let data1 = DataMovie(imageMovie: "phim3", nameLabel: "BLOOT SHOT", timeLabel: "1h43p")
    let data2 = DataMovie(imageMovie: "phim2", nameLabel: "BABA YAGA", timeLabel: "1h43p")
    let data3 = DataMovie(imageMovie: "phim1", nameLabel: "KE DAO TAU", timeLabel: "1h43p")
    let data4 = DataMovie(imageMovie: "phim4", nameLabel: "TRAN QUYET TU", timeLabel: "1h43p")
    let data5 = DataMovie(imageMovie: "phim5", nameLabel: "CHU LUN TINH NGHICH", timeLabel: "1h43p")
    
    return [data1,data2,data3,data4,data5]
}


func createDataComingSun() -> [DataMovie] {
    
    let data1 = DataMovie(imageMovie: "phim10", nameLabel: "BANG CHUNG VO HINH", timeLabel: "1h43p")
    let data2 = DataMovie(imageMovie: "phim11", nameLabel: "NGOI DEN MA QUAI", timeLabel: "1h43p")
    let data3 = DataMovie(imageMovie: "phim12", nameLabel: "YEU NHAU MUA E", timeLabel: "1h43p")
    let data4 = DataMovie(imageMovie: "phim13", nameLabel: "SCOOBY DOO", timeLabel: "1h43p")
    let data5 = DataMovie(imageMovie: "phim14", nameLabel: "SOI 100%", timeLabel: "1h43p")
    
    return [data1,data2,data3,data4,data5]
}
