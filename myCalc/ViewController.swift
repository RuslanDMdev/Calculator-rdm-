//
//  ViewController.swift
//  myCalc
//
//  Created by Ruslan Dalgatov on 17.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let labelBR = UILabel()
//    let viewButtons = UIView()
    
    
    var firstNumber = 0
    var resultNumber = 0

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonDistant: CGFloat = view.frame.size.width / 4
        let buttonSize = buttonDistant - 15
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
//        view.addSubview(viewButtons)
        view.addSubview(labelBR)
        
        
        
        labelBR.text = "0"
        labelBR.font = UIFont.systemFont(ofSize: 100)
        labelBR.textColor = .white
        labelBR.layer.borderWidth = 1
        labelBR.textAlignment = .right
        labelBR.backgroundColor = .black
        labelBR.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(150)
            maker.top.equalTo(50)
        }
        
//        let viewButtons = UIView()
//        view.addSubview(viewButtons)
//        viewButtons.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        viewButtons.snp.makeConstraints { make in
//            make.bottom.equalTo(view).inset(buttonSize*5+110)
//            make.width.equalToSuperview()
//            make.height.equalToSuperview()
//        }
        
        let buttonClear = UIButton(type: .system)
        view.addSubview(buttonClear)
        buttonClear.layer.cornerRadius = 40
        buttonClear.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonClear.setTitle("AC", for: .normal)
        buttonClear.setTitleColor(.black, for: .normal)
        buttonClear.setTitleColor(.gray, for: .selected)
        buttonClear.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        buttonClear.snp.makeConstraints { make in
//            make.top.equalTo(labelBR).inset(150)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonClear.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        let buttonInvers = UIButton()
        view.addSubview(buttonInvers)
        buttonInvers.layer.cornerRadius = 40
        buttonInvers.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonInvers.setTitleColor(.black, for: .normal)
        buttonInvers.setTitle("+/-", for: .normal)
        buttonInvers.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        buttonInvers.snp.makeConstraints { make in
            make.left.equalTo(buttonClear).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonPersent = UIButton()
        view.addSubview(buttonPersent)
        buttonPersent.layer.cornerRadius = 40
        buttonPersent.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonPersent.setTitleColor(.black, for: .normal)
        buttonPersent.setTitle("%", for: .normal)
        buttonPersent.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        buttonPersent.snp.makeConstraints { make in
            make.left.equalTo(buttonInvers).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonDelenie = UIButton()
        view.addSubview(buttonDelenie)
        buttonDelenie.layer.cornerRadius = 40
        buttonDelenie.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonDelenie.setTitle("/", for: .normal)
        buttonDelenie.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonDelenie.snp.makeConstraints { make in
            make.left.equalTo(buttonPersent).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let button7 = UIButton(type: .system)
        view.addSubview(button7)
        button7.layer.cornerRadius = 40
        button7.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button7.setTitle("7", for: .normal)
        button7.setTitleColor(.white, for: .normal)
        button7.setTitleColor(.gray, for: .selected)
        button7.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button7.snp.makeConstraints { make in
            make.top.equalTo(buttonClear).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        
        
        let button8 = UIButton()
        view.addSubview(button8)
        button8.layer.cornerRadius = 40
        button8.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button8.setTitle("8", for: .normal)
        button8.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button8.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button7).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }

        let button9 = UIButton()
        view.addSubview(button9)
        button9.layer.cornerRadius = 40
        button9.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button9.setTitle("9", for: .normal)
        button9.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button9.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button8).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonYmnoj = UIButton()
        view.addSubview(buttonYmnoj)
        buttonYmnoj.layer.cornerRadius = 40
        buttonYmnoj.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonYmnoj.setTitle("x", for: .normal)
        buttonYmnoj.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonYmnoj.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button9).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        
        let button4 = UIButton()
        view.addSubview(button4)
        button4.layer.cornerRadius = 40
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button4.setTitle("4", for: .normal)
        button4.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button4.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let button5 = UIButton()
        view.addSubview(button5)
        button5.layer.cornerRadius = 40
        button5.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button5.setTitle("5", for: .normal)
        button5.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button5.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button4).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let button6 = UIButton()
        view.addSubview(button6)
        button6.layer.cornerRadius = 40
        button6.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button6.setTitle("6", for: .normal)
        button6.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button6.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button5).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonMinus = UIButton()
        view.addSubview(buttonMinus)
        buttonMinus.layer.cornerRadius = 40
        buttonMinus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonMinus.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button6).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        
        let button1 = UIButton()
        view.addSubview(button1)
        button1.layer.cornerRadius = 40
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button1.setTitle("1", for: .normal)
        button1.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button1.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let button2 = UIButton()
        view.addSubview(button2)
        button2.layer.cornerRadius = 40
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button2.setTitle("2", for: .normal)
        button2.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button2.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button1).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let button3 = UIButton()
        view.addSubview(button3)
        button3.layer.cornerRadius = 40
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button3.setTitle("3", for: .normal)
        button3.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button3.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button2).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonPlus = UIButton()
        view.addSubview(buttonPlus)
        buttonPlus.layer.cornerRadius = 40
        buttonPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonPlus.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button3).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }


        let button0 = UIButton()
        view.addSubview(button0)
        button0.layer.cornerRadius = 40
        button0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button0.setTitle("0", for: .normal)
        button0.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button0.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.width.equalTo(buttonSize*2 + 15)
            make.height.equalTo(buttonSize)
        }
        
        let buttonTochka = UIButton()
        view.addSubview(buttonTochka)
        buttonTochka.layer.cornerRadius = 40
        buttonTochka.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonTochka.setTitle(",", for: .normal)
        buttonTochka.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        buttonTochka.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.left.equalTo(button0).inset(buttonDistant*2)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        
        let buttonRovno = UIButton()
        view.addSubview(buttonRovno)
        buttonRovno.layer.cornerRadius = 40
        buttonRovno.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonRovno.setTitle("=", for: .normal)
        buttonRovno.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonRovno.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.left.equalTo(buttonTochka).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonRovno.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        

         
    }
    
    
    @objc func clearResult() {
        labelBR.text = "123"
    }
    
 
    
}

