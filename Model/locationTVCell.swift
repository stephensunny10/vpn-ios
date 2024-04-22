//
//  locationTVCell.swift
//  comera
//
//  Created by Mac on 18/03/24.
//

import UIKit

class locationTVCell: UITableViewCell {
    let myColor : UIColor = UIColor( red:0.0/255 , green:201.0/255, blue:222.0/255, alpha: 1.0 )

    @IBOutlet weak var countrylabel: UILabel!
    
    @IBOutlet weak var flageimageview: UIImageView!
    @IBOutlet weak var connectbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        connectbtn.layer.cornerRadius = 8
        connectbtn.layer.borderWidth = 1
        connectbtn.layer.borderColor = myColor.cgColor

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
