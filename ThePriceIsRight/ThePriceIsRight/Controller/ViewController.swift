//
//  RootViewController.swift
//  ThePriceIsRight
//
//  Created by Dante Vega on 7/22/19.
//  Copyright © 2019 Dante Vega. All rights reserved.
//

import UIKit
let model = HousePricingMoldel()

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblResults: UILabel!
    @IBOutlet weak var lblData: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Configure the page view controller and add it as a child view controller.
        updatePredictions()
    }
    
    func updatePredictions(){
        var stringValue = ""
        
        do{
            let prediction = try model.prediction(bathrooms: Double(house.bathrooms),
                                                  cars: Double(house.garage),
                                                  condition: Double(house.condition),
                                                  rooms: Double(house.rooms),
                                                  size: Double(house.size),
                                                  yearBuilt: Double(house.year))
            let formater = NumberFormatter()
            formater.numberStyle = .currency
            formater.maximumFractionDigits = 0
            stringValue = formater.string(from: prediction.value as NSNumber) ?? "N/A"
            stringValue.remove(at: stringValue.startIndex)
        }catch{
            print(error.localizedDescription)
        }
        
        lblDescription.text = "\(house)\n $\(stringValue) USD"
        if let lblResults = self.lblResults{
            lblResults.text = "$\(stringValue) USD"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePredictions()
    }
    
    @IBAction func dataChanged(_ sender: Any) {
        if let sender = sender as? UIView{
            switch sender.tag {
            case 1:
                let sender = sender as! UISegmentedControl
                house.rooms = sender.selectedSegmentIndex+1
                break
                
            case 2:
                let sender = sender as! UISegmentedControl
                house.bathrooms = sender.selectedSegmentIndex+1
                break
            case 3:
                let sender = sender as! UISegmentedControl
                house.garage = sender.selectedSegmentIndex
                break
            case 4:
                let sender = sender as! UIStepper
                self.lblData.text = "\(Int(sender.value))"
                house.year = Int(sender.value)
                break
            case 5:
                let sender = sender as! UISlider
                self.lblData.text = "\(Int(sender.value)) m2"
                house.size = Int(sender.value)
                break
            case 6 :
                let sender = sender as! UISegmentedControl
                house.condition = sender.selectedSegmentIndex
                break
            default:
                break
            }
            self.updatePredictions()
        }
    }
    
}

