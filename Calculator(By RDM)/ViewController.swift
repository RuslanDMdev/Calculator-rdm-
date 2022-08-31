//
//  ViewController.swift
//  Calculator(By RDM)
//
//  Created by Ruslan Dalgatov on 17.08.2022.
//

import UIKit


class ViewController: UIViewController {

    let labelBR = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 150))
    let buttonClear = UIButton(frame: CGRect(x: 250, y: 300, width: 50, height: 50))
    var viewButtons = UIView()
    
    var firstNumber = 0
    var resultNumber = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        

        let buttonDistant: CGFloat = view.frame.size.width / 4
        let buttonSize = buttonDistant - 15
        
        view.addSubview(viewButtons)
        viewButtons.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewButtons.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)

        }
        
        view.addSubview(labelBR)
        labelBR.text = "0"
        labelBR.font = UIFont.systemFont(ofSize: 100)
        labelBR.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        labelBR.layer.borderWidth = 1
        labelBR.textAlignment = .right
        labelBR.backgroundColor = .black

        
        view.addSubview(buttonClear)
        buttonClear.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonClear.setTitle("AC", for: .normal)
        buttonClear.setTitleColor(.black, for: .normal)
        buttonClear.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        buttonClear.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonClear.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        
    }
    
    @objc func clearResult() {
        labelBR.text = "0345"
    }
    

}

