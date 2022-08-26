//
//  ViewController.swift
//  Project6b.2
//
//  Created by Maks Vogtman on 02/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
 
        
        
// OPTION 1 ------------------------------------------------------------------------------------------------------------------------------------------
        let viewsDictionairy = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionairy.keys {
            
            // H: means horizontal, | means "edge of view controller", [] around label are saying "put label here".
            // Dictionary is used to match the string to the label.
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionairy))
    }
        // - is a space (10 points by default, can be customized).
        // No pipe at the end, doesn't force last label to strech and will allow white space to be present below last label and bottom of screen.
        // -(>=10)- sets size of a space, note: you need the - before and after the size inside of ().
        
        let metrics = ["labelHeight": 88]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionairy))
        
        
        
        
        
// OPTION 2 ------------------------------------------------------------------------------------------------------------------------------------------

        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true
            
            // Allows top anchor to be set to bottom anchor of previous label.
            if let previous = previous {
                // We have a previous label – create a height constraint.
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                
            // This else statement brings the top label down into the safe area.
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            // Set the previous label to be the current one, for the next loop iteration.
            previous = label
        }
    }
}

