//
//  HistoryViewController.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 9..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import Model

class HistoryViewController: BaseViewController {

    @IBOutlet weak fileprivate var tableView: UITableView!
    @IBOutlet weak fileprivate var historyDateButton: UIButton!

    let viewModel = HistoryViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)

        viewModel.action.onNext(.fetchSubjectList(2_018, 1))

        viewModel.sections
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: HistoryViewController.dataSource()))
            .disposed(by: disposeBag)

        historyDateButton.rx.tap
            .subscribe { [weak self] _ in
                self?.performSegue(withIdentifier: "SelectDate", sender: nil)
            }
            .disposed(by: disposeBag)
    }
}

extension HistoryViewController {

    static func dataSource() -> RxTableViewSectionedReloadDataSource<SectionOfHistory> {
        return RxTableViewSectionedReloadDataSource<SectionOfHistory>(
            configureCell: { _, tv, ip, subject in
                let cell = tv.dequeueReusableCell(withIdentifier: "HistoryCell", for: ip) as? HistoryCell
                cell?.subject = subject
                return cell ?? UITableViewCell()
            }
        )
    }
}

extension HistoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

class HistoryCell: UITableViewCell {

    @IBOutlet weak fileprivate var subjectTitleLabel: UILabel!
    @IBOutlet weak fileprivate var opinionCountLabel: UILabel!

    var subject: Subject? {
        didSet {
            guard let subject = subject else {
                return
            }
            subjectTitleLabel.text = subject.title
            opinionCountLabel.text = "찬성 \(subject.agreeCount)  반대 \(subject.disagreeCount)  중립 \(subject.neutralCount)"
        }
    }
}
