//
//  DzikirCounterView.swift
//  DzikirSiramanMu
//
//  Created by Taufiq Ichwanusofa on 12/01/24.
//

import UIKit

class DzikirCounterView: UIViewController {
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var resetCounterButton: UIButton!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAction()
        configureCounterLabel()
        configureButton()
        if let savedCounter = UserDefaults.standard.value(forKey: "counter") as? Int {
            counter = savedCounter }
        updateCounterLabel()
    }
    
    override func viewDidLayoutSubviews() {
        configureCounterView()
    }
}

extension DzikirCounterView {
    func configureCounterView() {
        counterView.layer.cornerRadius = counterView.layer.bounds.width / 2
        counterView.clipsToBounds = true
    }
    
    func configureCounterLabel() {
        counterLabel.textColor = counter == 0 ? UIColor.label : UIColor.white
        counterLabel.text = counter == 0 ? "Tekan di sini untuk menghitung" : "\(counter)"
        counterLabel.font = counter == 0 ? UIFont.systemFont(ofSize: 25, weight: .bold) : UIFont.systemFont(ofSize: 100, weight: .bold)
        counterView.layer.backgroundColor = counter == 0 ? UIColor.secondarySystemBackground.cgColor : UIColor.systemGreen.cgColor
    }
    
    func configureButton() {
        resetCounterButton.backgroundColor = UIColor.systemTeal
        resetCounterButton.setTitleColor(UIColor.white, for: .normal)
        resetCounterButton.layer.borderColor = UIColor.systemTeal.cgColor
        resetCounterButton.layer.borderWidth = 1.5
        resetCounterButton.layer.cornerRadius = 10.0
        resetCounterButton.layer.masksToBounds = true
        resetCounterButton.setTitle("Reset", for: .normal)
        resetCounterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func configureAction() {
        let tapCounterAction = UITapGestureRecognizer(target: self, action: #selector(counterAction(_:)))
        counterView.isUserInteractionEnabled = true
        counterView.addGestureRecognizer(tapCounterAction)
        resetCounterButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
       
    }
    @objc func counterAction(_ sender: UITapGestureRecognizer) {
        counter += 1
        configureCounterLabel()
        UserDefaults.standard.set(counter, forKey: "counter")
        updateCounterLabel()
    }
    
    @objc func resetCounter() {
        counter = 0
        configureCounterLabel()
    }
    func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
}
