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
    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var contentTextView: UITextView!
    @IBOutlet fileprivate weak var tempSaveView: UIView!
    var isFirstContentEdit = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {

    }

    @IBAction func cancelAction(_ sender: UIButton) {
        back()
    }

    @IBAction func completeAction(_ sender: UIButton) {
        // todo: - API 연결
    }
    
    @IBAction func temporarySave(_ sender: UIButton) {
        tempSave()
    }
    
    func tempSave() {
        
    }

    func back() {
        dismiss(animated: false, completion: nil)
        NotificationCenter.default.post(Notification(name: NSNotification.Name("moveBeforeWrite")))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension WritePopupViewController: UITextViewDelegate {

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if isFirstContentEdit {
            contentTextView.text = ""
            contentTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        isFirstContentEdit = false
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            contentTextView.text = "내용을 입력해주세요."
            isFirstContentEdit = true
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
