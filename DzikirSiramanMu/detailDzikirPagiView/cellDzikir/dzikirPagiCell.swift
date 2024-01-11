//
//  dzikirPagiCell.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 10/01/24.
//

import UIKit

class dzikirPagiCell: UITableViewCell {
    @IBOutlet weak var textArab: UILabel!
    @IBOutlet weak var textIndo: UILabel!
    
    static let identifier = "dzikirPagiCell"
    static var nib: UINib {
        return UINib(nibName: String(describing:  self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
