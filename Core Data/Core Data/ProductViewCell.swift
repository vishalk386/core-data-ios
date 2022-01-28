//
//  ProductViewCell.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(item: ProductModel?){
        self.title.text = item?.title
        self.desc.text = item?.desc
        self.productImg.image = UIImage(data: (item?.image!)!)
//        self.date.text = item?.date.
    }
    
}
