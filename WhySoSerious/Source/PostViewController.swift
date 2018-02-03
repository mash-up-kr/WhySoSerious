//
//  Opinion.swift
//  WhySoSerious
//
//  Created by 윤민섭 on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import Model

class PostViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
}

extension PostViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PostViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostCell {
            cell.post = posts[indexPath.item]
            cell.reaction = { react, isReactionCancel in

            }
            return cell
        }
        return UITableViewCell()
    }
}

class PostCell: UITableViewCell {

    @IBOutlet fileprivate weak var faceImageView: UIImageView!
    @IBOutlet fileprivate weak var nickNameLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var reactionImageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var contentLabel: UILabel!
    @IBOutlet fileprivate weak var responseStackView: UIStackView!
    @IBOutlet fileprivate weak var agreeLabel: UILabel!
    @IBOutlet fileprivate weak var disagreeLabel: UILabel!
    @IBOutlet fileprivate weak var neutralLabel: UILabel!
    @IBOutlet fileprivate weak var agreeImageView: UIImageView!
    @IBOutlet fileprivate weak var disagreeImageView: UIImageView!
    @IBOutlet fileprivate weak var neutralImageView: UIImageView!
    @IBOutlet fileprivate weak var agreeButton: UIControl!
    @IBOutlet fileprivate weak var disagreeButton: UIControl!
    @IBOutlet fileprivate weak var neutralButton: UIControl!
    @IBOutlet fileprivate weak var reportButton: UIButton!

    var reaction: ((Reaction?, Bool) -> Void)?

    var post: Post? {
        didSet {
            faceImageView.image = post?.author.bias.smallFace
            nickNameLabel.text = post?.author.nickname
            //dateLabel.text
            reactionImageView.image = post?.subjectReaction.reactionBoxImage
            titleLabel.text = post?.title
            contentLabel.text = post?.contents
            contentLabel.sizeToFit()
            updateReactionLabel()
            arrangeResponseStackView(count: post?.agreeCount, post?.disagreeCount, post?.neutralCount)
            updateReactionButton()
        }
    }

    func updateReactionButton() {
        agreeImageView.image = post?.myReaction.rawValue == "AGREE" ? #imageLiteral(resourceName: "02ReactAct1") : #imageLiteral(resourceName: "02ReactDefault1")
        disagreeImageView.image = post?.myReaction.rawValue == "DISAGREE" ? #imageLiteral(resourceName: "02ReactAct2") : #imageLiteral(resourceName: "02ReactDefault2")
        neutralImageView.image = post?.myReaction.rawValue == "NEUTRAL" ? #imageLiteral(resourceName: "02ReactAct3") : #imageLiteral(resourceName: "02ReactDefault3")
    }

    func updateReactionCount(react: Reaction?, isIncrese: Bool) {
        if let reaction = react {
            switch reaction {
            case .agree:
                post?.agreeCount -= isIncrese ? -1 : 1
            case .disagree:
                post?.disagreeCount -= isIncrese ? -1 : 1
            case .neutral:
                post?.neutralCount -= isIncrese ? -1 : 1
            case .none:
                break
            }
        }
        updateReactionLabel()
    }

    func updateReactionLabel() {
        agreeLabel.text = "찬성 \(post?.agreeCount ?? 0)개"
        disagreeLabel.text = "반대 \(post?.disagreeCount ?? 0)개"
        neutralLabel.text = "중립 \(post?.neutralCount ?? 0)개"
    }

    func arrangeResponseStackView(count: Int?...) {

        for i in 0..<count.count where count[i] == 0 {
            responseStackView.removeArrangedSubview(responseStackView.arrangedSubviews[i])
        }
    }

    @IBAction func reactBtnClicked(sender: UIControl) {
        var react: Reaction?
        if sender == agreeButton {
            react = .agree
        } else if sender == disagreeButton {
            react = .disagree
        } else {
            react = .neutral
        }
        let isReactionCancel = post?.myReaction == react

        if isReactionCancel {
            updateReactionCount(react: react, isIncrese: false)
            react = .none
        } else {
            switch post?.myReaction ?? .none {
            case .none: break
            case .agree: post?.agreeCount -= 1
            case .disagree: post?.disagreeCount -= 1
            case .neutral: post?.neutralCount -= 1
            }
            updateReactionCount(react: react, isIncrese: true)
        }
        post?.myReaction = react ?? .none
        updateReactionButton()
        arrangeResponseStackView(count: post?.agreeCount, post?.disagreeCount, post?.neutralCount)
        reaction?(react, isReactionCancel)
    }

    @IBAction func optionButtonClick(_ sender: UIButton) {
        reportButton.isHidden = !reportButton.isHidden
    }

    @IBAction func reportButtonClick(_ sender: UIButton) {

    }
}
