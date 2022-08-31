//
//  ViewController.swift
//  Calculator(By RDM)
//
//  Created by Ruslan Dalgatov on 17.08.2022.
//


import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let resultLabel = UILabel()
    let viewButtons = UIView()
    
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var resultNumber: Int = 0
    var signPressed: Bool = false
    var operation: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonDistant: CGFloat = view.frame.size.width / 4
        let buttonSize = buttonDistant
        let numpadSize = buttonSize * 5
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        view.addSubview(viewButtons)
        view.addSubview(resultLabel)
        
        
        
        resultLabel.text = ""
        resultLabel.font = UIFont.systemFont(ofSize: 80)
        resultLabel.textColor = .white
        resultLabel.layer.borderWidth = 1
        resultLabel.textAlignment = .right
        resultLabel.backgroundColor = .black
        resultLabel.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalToSuperview()
            make.bottom.equalTo(viewButtons).inset(numpadSize+10)
            
        }
        

        viewButtons.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        viewButtons.snp.makeConstraints { make in
            make.width.equalTo(buttonSize*4)
            make.height.equalTo(numpadSize)
//            make.top.equalToSuperview().inset(300)
//            make.left.equalToSuperview().inset(0)
//            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        
        let buttonClear = UIButton(type: .system)
        buttonClear.tag = 17
        viewButtons.addSubview(buttonClear)
        buttonClear.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonClear.setTitle("AC", for: .normal)
        buttonClear.setTitleColor(.black, for: .normal)
        buttonClear.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        buttonClear.snp.makeConstraints { make in
            make.width.equalTo(buttonSize*2)
            make.height.equalTo(buttonSize)
        }
        buttonClear.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        let buttonInvers = UIButton(type: .system)
        buttonInvers.tag = 10
        viewButtons.addSubview(buttonInvers)
        buttonInvers.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonInvers.setTitleColor(.black, for: .normal)
        buttonInvers.setTitle("+/-", for: .normal)
        buttonInvers.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        buttonInvers.snp.makeConstraints { make in
            make.left.equalTo(buttonClear).inset(buttonDistant*2)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonInvers.addTarget(self, action: #selector(operations), for: .touchUpInside)
        

        let buttonDelenie = UIButton(type: .system)
        buttonDelenie.tag = 12
        viewButtons.addSubview(buttonDelenie)
        buttonDelenie.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonDelenie.setTitle("/", for: .normal)
        buttonDelenie.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonDelenie.setTitleColor(.white, for: .normal)
        buttonDelenie.snp.makeConstraints { make in
            make.left.equalTo(buttonInvers).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonDelenie.addTarget(self, action: #selector(operations), for: .touchUpInside)
        
        let button7 = UIButton(type: .system)
        viewButtons.addSubview(button7)
        button7.tag = 7
        button7.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button7.setTitle("7", for: .normal)
        button7.setTitleColor(.white, for: .normal)
        button7.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button7.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button7.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        
        let button8 = UIButton(type: .system)
        viewButtons.addSubview(button8)
        button8.tag = 8
        button8.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button8.setTitle("8", for: .normal)
        button8.setTitleColor(.white, for: .normal)
        button8.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button8.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button7).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button8.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)

        let button9 = UIButton(type: .system)
        viewButtons.addSubview(button9)
        button9.tag = 9
        button9.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button9.setTitle("9", for: .normal)
        button9.setTitleColor(.white, for: .normal)
        button9.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button9.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button8).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button9.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let buttonYmnoj = UIButton(type: .system)
        buttonYmnoj.tag = 13
        viewButtons.addSubview(buttonYmnoj)
        buttonYmnoj.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonYmnoj.setTitle("x", for: .normal)
        buttonYmnoj.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonYmnoj.setTitleColor(.white, for: .normal)
        buttonYmnoj.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant)
            make.left.equalTo(button9).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonYmnoj.addTarget(self, action: #selector(operations), for: .touchUpInside)
        
        let button4 = UIButton(type: .system)
        viewButtons.addSubview(button4)
        button4.tag = 4
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button4.setTitle("4", for: .normal)
        button4.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button4.setTitleColor(.white, for: .normal)
        button4.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button4.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let button5 = UIButton(type: .system)
        viewButtons.addSubview(button5)
        button5.tag = 5
        button5.setTitleColor(.white, for: .normal)
        button5.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button5.setTitle("5", for: .normal)
        button5.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button5.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button4).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button5.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let button6 = UIButton(type: .system)
        viewButtons.addSubview(button6)
        button6.tag = 6
        button6.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button6.setTitle("6", for: .normal)
        button6.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button6.setTitleColor(.white, for: .normal)
        button6.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button5).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button6.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let buttonMinus = UIButton(type: .system)
        buttonMinus.tag = 14
        viewButtons.addSubview(buttonMinus)
        buttonMinus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonMinus.setTitleColor(.white, for: .normal)
        buttonMinus.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*2)
            make.left.equalTo(button6).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonMinus.addTarget(self, action: #selector(operations), for: .touchUpInside)
        
        
        let button1 = UIButton(type: .system)
        viewButtons.addSubview(button1)
        button1.tag = 1
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button1.setTitle("1", for: .normal)
        button1.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button1.setTitleColor(.white, for: .normal)
        button1.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button1.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let button2 = UIButton(type: .system)
        viewButtons.addSubview(button2)
        button2.tag = 2
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button2.setTitle("2", for: .normal)
        button2.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button2.setTitleColor(.white, for: .normal)
        button2.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button1).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button2.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let button3 = UIButton(type: .system)
        viewButtons.addSubview(button3)
        button3.tag = 3
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button3.setTitle("3", for: .normal)
        button3.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button3.setTitleColor(.white, for: .normal)
        button3.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button2).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        button3.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let buttonPlus = UIButton(type: .system)
        buttonPlus.tag = 15
        viewButtons.addSubview(buttonPlus)
        buttonPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonPlus.setTitleColor(.white, for: .normal)
        buttonPlus.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*3)
            make.left.equalTo(button3).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonPlus.addTarget(self, action: #selector(operations), for: .touchUpInside)


        let button0 = UIButton(type: .system)
        viewButtons.addSubview(button0)
        button0.tag = 0
        button0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button0.setTitle("0", for: .normal)
        button0.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        button0.setTitleColor(.white, for: .normal)
        button0.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.width.equalTo(buttonSize*2 + 15)
            make.height.equalTo(buttonSize)
        }
        button0.addTarget(self, action: #selector(pressNumber), for: .touchUpInside)
        
        let buttonTochka = UIButton(type: .system)
        buttonTochka.tag = 17
        viewButtons.addSubview(buttonTochka)
        buttonTochka.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonTochka.setTitle(".", for: .normal)
        buttonTochka.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3647058824, alpha: 1)
        buttonTochka.setTitleColor(.white, for: .normal)
        buttonTochka.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.left.equalTo(button0).inset(buttonDistant*2)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonTochka.addTarget(self, action: #selector(separatedPoint), for: .touchUpInside)
        
        let buttonRovno = UIButton(type: .system)
        viewButtons.addSubview(buttonRovno)
        buttonRovno.tag = 16
        buttonRovno.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        buttonRovno.setTitle("=", for: .normal)
        buttonRovno.backgroundColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        buttonRovno.setTitleColor(.white, for: .normal)
        buttonRovno.snp.makeConstraints { make in
            make.top.equalTo(buttonDistant*4)
            make.left.equalTo(buttonTochka).inset(buttonDistant)
            make.width.equalTo(buttonSize)
            make.height.equalTo(buttonSize)
        }
        buttonRovno.addTarget(self, action: #selector(operations), for: .touchUpInside)
        

         
    }
    
    
    @objc func clearResult() {
        resultLabel.text = ""
        firstNumber = 0
        secondNumber = 0
        operation = 0
        
    }
    
    @objc func separatedPoint( sender: UIButton){
        resultLabel.text = resultLabel.text! + "."
    }
    
    @objc func pressNumber( sender: UIButton){
        if signPressed == true {
            resultLabel.text = String(sender.tag)
            signPressed = false
        } else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        
        firstNumber = Double (resultLabel.text!)!
    }
    
    @objc func operations( sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 16 && sender.tag != 17{
            
            secondNumber = Double (resultLabel.text!)!
            if sender.tag == 10 { // Замена знака
                resultLabel.text = String(-secondNumber)
            }else if sender.tag == 11 { // Процент
    
            }else if sender.tag == 12{ // Деление
        
            }else if sender.tag == 13{ // умножение
                
            }else if sender.tag == 14{ // Вычитание
            
            }else if sender.tag == 15 { // Сложение
        }
            operation = sender.tag
            signPressed = true
    }
        else if sender.tag == 16 {
            if operation == 10 { // Замена знака
                
            }else if operation == 11 { // Процент
      
                
            }else if operation == 12{ // Деление
                
                let res = secondNumber / firstNumber
                let resArray = res.description.components(separatedBy: ".")
                if resArray[1] == "0" {
                    resultNumber = Int(res)
                    resultLabel.text = String(resultNumber)
                } else {
                    resultLabel.text = String(secondNumber / firstNumber)
                }
                
            }else if operation == 13{ // умножение
                
                let res = secondNumber * firstNumber
                let resArray = res.description.components(separatedBy: ".")
                if resArray[1] == "0" {
                    resultNumber = Int(res)
                    resultLabel.text = String(resultNumber)
                } else {
                    resultLabel.text = String(secondNumber * firstNumber)
                }
                
            }else if operation == 14{ // Вычитание
                
                let res = secondNumber - firstNumber
                let resArray = res.description.components(separatedBy: ".")
                if resArray[1] == "0" {
                    resultNumber = Int(res)
                    resultLabel.text = String(resultNumber)
                } else {
                    resultLabel.text = String(secondNumber - firstNumber)
                }
                
            }else if operation == 15 { // Сложение
                let res = secondNumber + firstNumber
                let resArray = res.description.components(separatedBy: ".")
                if resArray[1] == "0" {
                    resultNumber = Int(res)
                    resultLabel.text = String(resultNumber)
                } else {
                    resultLabel.text = String(secondNumber + firstNumber)
                }
         
            }
        }
}
}
