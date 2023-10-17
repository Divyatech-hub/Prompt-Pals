//
//  ContentView.swift
//  PromptPals
//
//  Created by Camilo Carmona on 10/17/23.
//

import SwiftUI
import UIKit 

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            }
        }
    }
}

#Preview {
    ContentView()
}

//from the main page, swipe up to go to another page called CharacterView (CharacterView needs to be defined initialized)
class ViewController: UIViewController {
    @IBOutlet var swipeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    @objc func swipedUp() {
        let vc = CharacterViewController()
        self.present(vc, animated: true, completion:nil)
    }
}
