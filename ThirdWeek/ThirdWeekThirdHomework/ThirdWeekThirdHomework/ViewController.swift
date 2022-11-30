//
//  ViewController.swift
//  ThirdWeekThirdHomework
//
//  Created by Ali Rıza İLHAN on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var quotesLabel: UILabel!
    
    private var randomQuotes: GetRandomQueotesModel? {
           didSet {
               if let quotes = randomQuotes?.en {
                   quotesLabel.text = String(quotes)
               }
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        Client.getRandomQuotes {[weak self] randomQuotes, error in
            guard let self = self else {return}
            guard let randomQuotes = randomQuotes else { return }
            self.randomQuotes = randomQuotes
        }
    }
    @IBAction func getRandomQuotesPressed(_ sender: Any) {
        Client.getRandomQuotes {[weak self] randomQuotes, error in
            guard let self = self else {return}
            guard let randomQuotes = randomQuotes else { return }
            self.randomQuotes = randomQuotes
        }
    }
}
