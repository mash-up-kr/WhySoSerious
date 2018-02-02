//
//  WritePopupViewController.swift
//  WhySoSerious
//
//  Created by Minseob Yoon on 2018. 2. 3..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import Model

class WritePopupViewController: UIViewController {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var contentTextView: UITextView!
    @IBOutlet fileprivate weak var tempSaveView: UIView!
    @IBOutlet fileprivate weak var agreeBtn: UIButton!
    @IBOutlet fileprivate weak var disagreeBtn: UIButton!
    @IBOutlet fileprivate weak var textCountLabel: UILabel!
    @IBOutlet fileprivate weak var neutralBtn: UIButton!

    var reaction: Reaction? = .none
    var isFirstContentEdit = true
    var textCount = 0 {
        didSet {
            textCountLabel.text = "\(textCount)/280"
        }
    }

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

    @IBAction func feedBackAction(_ sender: UIButton) {
        if sender == agreeBtn {
            reaction = .agree
            agreeBtn.setImage(#imageLiteral(resourceName: "04AgreeButtonAct"), for: .normal)
            disagreeBtn.setImage(#imageLiteral(resourceName: "04DisagreeButton"), for: .normal)
            neutralBtn.setImage(#imageLiteral(resourceName: "04NeutralityButton"), for: .normal)
        } else if sender == disagreeBtn {
            reaction = .disagree
            agreeBtn.setImage(#imageLiteral(resourceName: "04AgreeButton"), for: .normal)
            disagreeBtn.setImage(#imageLiteral(resourceName: "04DisagreeButtonAct"), for: .normal)
            neutralBtn.setImage(#imageLiteral(resourceName: "04NeutralityButton"), for: .normal)
        } else {
            reaction = .neutral
            agreeBtn.setImage(#imageLiteral(resourceName: "04AgreeButton"), for: .normal)
            disagreeBtn.setImage(#imageLiteral(resourceName: "04DisagreeButton"), for: .normal)
            neutralBtn.setImage(#imageLiteral(resourceName: "04NeutralityButtonAct"), for: .normal)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension WritePopupViewController: UITextViewDelegate {

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard textCount <= 279 else {
            return false
        }
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
        if textCount >= 280 {
            (280..<textCount).forEach { _ in
                textView.text.removeLast()
            }
            textCount = textView.text.count
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        guard textCount <= 279 else {
            return
        }
        textCount = textView.text.count
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}

extension WritePopupViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
        }
        return true
    }
}
