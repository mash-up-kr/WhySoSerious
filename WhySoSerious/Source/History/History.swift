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

    let viewModel = HistoryViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.action.onNext(.fetchSubjectList(2_018, 1))

        viewModel.sections
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: HistoryViewController.dataSource()))
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

class HistoryCell: UITableViewCell {

    @IBOutlet weak fileprivate var subjectTitleLabel: UILabel!

    var subject: Subject? {
        didSet {
            subjectTitleLabel.text = subject?.title ?? ""
        }
    }
}
