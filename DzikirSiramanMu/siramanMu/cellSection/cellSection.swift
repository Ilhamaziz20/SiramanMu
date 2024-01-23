//
//  cellSection.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 18/01/24.
//

import UIKit

class cellSection: UITableViewCell {
    @IBOutlet weak var labelSection: UILabel!
    static let identifier = "cellSection"
    static var nib: UINib {
        return UINib(nibName:(String(describing: self)), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelSection.textAlignment = .justified
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
