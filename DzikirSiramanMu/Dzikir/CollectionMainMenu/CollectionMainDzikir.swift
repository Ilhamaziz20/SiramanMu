//
//  CollectionMainDzikir.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 27/12/23.
//

import UIKit
struct isiMenu {
    var icon: String?
    var label: String?
}

class CollectionMainDzikir: UICollectionViewCell {
    
    @IBOutlet weak var imageIconColl: UIImageView!
    @IBOutlet weak var textLabelColl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data: isiMenu) {
        self.imageIconColl.image = UIImage(systemName: data.icon ?? "")
        self.textLabelColl.text = data.label
    }
}
