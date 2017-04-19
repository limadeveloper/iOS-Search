//
//  Model.swift
//  Search
//
//  Created by John Lima on 19/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

import Foundation

class Model {
    
    var name: String?
    var photo: String?
    var id: Int?
    
    init() {}
    
    init(name: String, photo: String, id: Int) {
        self.name = name
        self.photo = photo
        self.id = id
    }
}

extension Model {

    func getData() -> [Model] {
        return [
            Model(name: "Yoda", photo: "", id: 1),
            Model(name: "Luki Skywalker", photo: "", id: 2),
            Model(name: "Obi-Wan Kenobi", photo: "", id: 3),
            Model(name: "Anakin Skywalker", photo: "", id: 4),
            Model(name: "Quinlan Vos", photo: "", id: 5),
            Model(name: "Mace Windu", photo: "", id: 6),
            Model(name: "Quin-Gon Jinn", photo: "", id: 7),
            Model(name: "Ki-Adi-Mundi", photo: "", id: 8),
            Model(name: "Plo Koon", photo: "", id: 9),
            Model(name: "Saesee Tiin", photo: "", id: 10),
            Model(name: "Even Piell", photo: "", id: 11),
            Model(name: "Oppo Rancisis", photo: "", id: 12),
            Model(name: "Adi Gallia", photo: "", id: 13),
            Model(name: "Yarael Poof", photo: "", id: 14),
            Model(name: "Eeth Koth", photo: "", id: 15),
            Model(name: "Depa Billaba", photo: "", id: 16),
            Model(name: "Kit Fisto", photo: "", id: 17),
            Model(name: "Luminara Unduli", photo: "", id: 18),
            Model(name: "Barriss Offee", photo: "", id: 19),
            Model(name: "Shaak Ti", photo: "", id: 20),
            Model(name: "Coleman Trebor", photo: "", id: 21),
            Model(name: "Jocasta Nu", photo: "", id: 22),
            Model(name: "Zett Jukassa", photo: "", id: 23),
            Model(name: "Aayla Secura", photo: "", id: 24),
            Model(name: "Sifo-Dyas", photo: "", id: 25),
            Model(name: "Count Dooku", photo: "", id: 26),
            Model(name: "Agen Kolar", photo: "", id: 27),
            Model(name: "Stass Allie", photo: "", id: 28),
            Model(name: "Ahsoka Tano", photo: "", id: 29),
            Model(name: "Asajj Ventress", photo: "", id: 30),
            Model(name: "Ima-Gun Di", photo: "", id: 31),
            Model(name: "Nahdar Vebb", photo: "", id: 32),
            Model(name: "Bolla Ropal", photo: "", id: 33),
            Model(name: "Tera Sinube", photo: "", id: 34)
        ]
    }
}
