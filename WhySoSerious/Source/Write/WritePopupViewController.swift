//
//  WritePopupViewController.swift
//  WhySoSerious
//
//  Created by Minseob Yoon on 2018. 2. 3..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit

class WritePopupViewController: UIViewController {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var contentTextView: UITextView!

    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        NotificationCenter.default.post(Notification(name: NSNotification.Name("moveBeforeWrite")))
    }

    @IBAction func completeAction(_ sender: UIButton) {
        // todo: - API 연결
    }
}
