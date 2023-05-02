//
//  ViewController.swift
//  firstAppSwiftBase
//
//  Created by I N on 27.04.2023.
//
//1. Представим банк, в котором алгоритм начисления процента по вкладу зависит от суммы вклада. В функцию в качестве параметра будет подаваться число (сумма вклада), а также количество лет. При значении меньше 10000, будет начислено 5% ежегодно, если значение находится в диапазоне от 10000 до 50000 — 7% ежегодно, если больше 50000, то 10% ежегодно. Отработав, функция должна вернуть общую сумму с начисленными процентами.



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var summaLbl: UILabel!
    @IBOutlet weak var npercent: UITextField!
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var sum: UITextField!
    @IBOutlet weak var years: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testClosureSP()
    }

    @IBAction func pressButton(_ sender: UIButton) {
        calcMoney(sum: sum.text, years: years.text)
    }
    
    @IBAction func pressCalcPercent(_ sender: Any) {
        calcPercent(n: npercent.text, val: value.text)
    }
    // MARK: CALC PERCENT
    
    func calcPercent(n: String?, val: String?) {
        guard let nT = n, let valT = val, let nI = Int(nT), let valD = Double(valT) else {
            return
        }
        summaLbl.text = "\(Double(nI) * valD / 100)"
    }

    
    
    
    // MARK: CALC MONEY
    func calcMoney(sum: String?, years: String?) {
        guard let sumT = sum, let yearsT = years, let sumI = Int(sumT), let yearsI = Int(yearsT) else {
            return
        }
        var result: Double = Double(sumI)
        for _ in 1...yearsI {
            
            switch true {
            case result < 10000:
                result += result * 0.05
                break
            case result >= 10000 && result < 50000:
                result += result * 0.07
                break
            case result >= 50000:
                result += result * 0.1
            default:
                {}()
            }
        }
        resultLbl.text = "\(result)"
    }
    func testClosure3V() {
        let closure1: (String) -> Void = { name in
            print("Hello, new user \(name)!")
        }
        let closure2: (String) -> Void = { name in
            print("Hello, guest \(name)!")
        }
        let closure3: (String) -> Void = { name in
            print("Hello, dear old \(name)!")
        }
        testClosure1(name: "Saimon", closure: closure1)
        testClosure1(name: "Tom", closure: closure2)
        testClosure1(name: "Louis", closure: closure3)
    }
        
    func testClosure1(name: String, closure: (String) -> Void) {
        //1. Создать функцию, которая принимает в себя имя пользователя и замыкание, которое распечатывает в консоль строку - приветствие пользователя. Создать три замыкания: Первое - распечатывает строку приветствия для нового пользователя, второе - для гостя, третье - для старого пользователя. Проверить работу всего кода вызовом функции.
        closure(name)
    }
    
    func testClosureSP() {
        let square: (CGSize) -> Double = { size in
            size.width * size.height
        }
        let perimetr: (CGSize) -> Double = { size in
            (size.width + size.height) * 2.0
        }
        let size = CGSize(width: 1.5, height: 2.7)
        testClosure2(size: size, closure: square )
        testClosure2(size: size, closure: perimetr )
    
    }
    func testClosure2(size: CGSize, closure: (CGSize) -> Double) {
        //2. Создать функцию, которая принимает в себя длину и ширину прямоугольника и замыкание-действие типа (Double, Double) -> Double и возвращает дробное число. Создать два замыкания-действия, которые вычисляют площадь и периметр. вызвать функцию и проверить работу кода
        print(size, closure(size))
    }
    func testClosureNumbers() {
        let checkMod: (Int, Int) -> Bool = { num1, num2 in
            num1.isMultiple(of: num2)
        }
        let checkDiv: (Int, Int) -> Bool = { num1, num2 in
            for i in 2...min(num1,num2) - 1 {
            if num1
            }
        }
        
        testClosure3(size: size, closure: checkMod )
        testClosure3(size: size, closure: checkDiv )
    
    }
    func testClosure3(numbers: (Double, Double), closure: (Double, Double) -> Bool) {
        //3. Реализовать три замыкания, которые принимают два числа и возвращают Bool. Первое вычисляет, может ли первое число быть нацело поделено на второе. Второе вычисляет, имеют ли они хотя бы один общий делитель, отличный от 1 и самих этих чисел. Третье вычисляет, чётная ли сумма этих двух чисел. Реализуйте функцию, которая принимает два числа и такого типа замыкание, внутри себя реализует его и возвращает результат в виде будимого значения

        print(numbers, closure(numbers.0, numbers.1))
    }
}




