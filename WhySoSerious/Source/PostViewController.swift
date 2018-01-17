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

class PostViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!

    let viewModel = PostViewModel()
    let disposeBag = DisposeBag()

    func fetchPostList() {

    }
}

extension PostViewController {

    static func dataSource() -> RxTableViewSectionedReloadDataSource<SectionOfPost> {
        return RxTableViewSectionedReloadDataSource<SectionOfPost>(
            configureCell: { _, tv, ip, post in
                let cell = tv.dequeueReusableCell(withIdentifier: "PostCell", for: ip) as? PostCell
                cell?.post = post
                return cell ?? UITableViewCell()
            }
        )
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

    var reaction: ((Reaction?) -> Void)?

    var post: Post? {
        didSet {
            faceImageView.image = post?.author.bias.smallFace
            nickNameLabel.text = post?.author.nickname
            //dateLabel.text
            reactionImageView.image = post?.subjectReaction.reactionBoxImage
            titleLabel.text = post?.title
            contentLabel.text = post?.contents
            contentLabel.sizeToFit()
            agreeLabel.text = "찬성 \(post?.agreeCount ?? 0)개"
            disagreeLabel.text = "반대 \(post?.disagreeCount ?? 0)개"
            neutralLabel.text = "중립 \(post?.neutralCount ?? 0)개"
            setResponseStackView(count: post?.agreeCount, post?.disagreeCount, post?.neutralCount)
            agreeImageView.image = post?.myReaction.rawValue == "AGREE" ? #imageLiteral(resourceName: "02ReactAct1") : #imageLiteral(resourceName: "02ReactDefault1")
            disagreeImageView.image = post?.myReaction.rawValue == "DISAGREE" ? #imageLiteral(resourceName: "02ReactAct2") : #imageLiteral(resourceName: "02ReactDefault2")
            neutralImageView.image = post?.myReaction.rawValue == "NEUTRAL" ? #imageLiteral(resourceName: "02ReactAct3") : #imageLiteral(resourceName: "02ReactDefault3")
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
        reaction?(react)
    }

    func setResponseStackView(count: Int?...) {

        for i in 0..<count.count where count[i] == 0 {
            responseStackView.removeArrangedSubview(responseStackView.arrangedSubviews[i])
        }
    }
}
