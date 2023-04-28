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
    
    @IBOutlet weak var sum: UITextField!
    @IBOutlet weak var years: UITextField!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressButton(_ sender: UIButton) {
        calcMoney(sum: sum.text, years: years.text)
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
}


