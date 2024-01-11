//
//  comingSoonView.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 28/12/23.
//

import UIKit

class comingSoonView: UIViewController {

    @IBOutlet weak var textComing: UILabel!
    @IBOutlet weak var imageComing: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageComing.image = UIImage(named: "comingsoon")
        self.textComing.text = "habis ini! أَسْتَغْفِرُ اللّٰهَ"
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
