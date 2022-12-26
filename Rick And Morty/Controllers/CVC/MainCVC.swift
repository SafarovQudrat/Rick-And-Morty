//
//  MainCVC.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import UIKit
import SDWebImage

class MainCVC: UICollectionViewCell {

    
    @IBOutlet weak var backV: UIView!
    
    @IBOutlet weak var colorV: UIView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var firstSeenLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateCell(data:DataDM) {
        imageV.sd_setImage(with: URL(string: data.image))
        textLbl.text = data.text
        locationLbl.text = data.location
        lbl.text = data.lbl
        firstSeenLbl.text = data.firstSeen
        if data.backcolor == "Dead" {
            colorV.backgroundColor = .red
        }else if data.backcolor == "Alive" {
            colorV.backgroundColor = .green
        }else {
            colorV.backgroundColor = .gray
        }
    }
}
