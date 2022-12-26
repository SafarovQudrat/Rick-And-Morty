//
//  InfoVC.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class InfoVC: UIViewController {
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var firstSeenLbl: UILabel!
    @IBOutlet weak var colorV: UIView!
    var arr:DataDM!
    var url:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        colorV.layer.cornerRadius = colorV.frame.height/2
        getInfo()
    }

    func getInfo() {
        
        API.getCharacterInfo(url: url) { data in
            guard let data = data else {return}
            print("data=",data)
            self.arr = data
                self.imageV.sd_setImage(with: URL(string: data.image))
                self.textLbl.text = data.text
                self.locationLbl.text = data.location
                self.lbl.text = data.lbl
                self.firstSeenLbl.text = data.firstSeen
            if data.backcolor == "Dead" {
                self.colorV.backgroundColor = .red
            }else if data.backcolor == "Alive" {
                self.colorV.backgroundColor = .green
            }else {
                self.colorV.backgroundColor = .gray
            }
        }
    }

}
