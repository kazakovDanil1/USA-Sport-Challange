//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SDWebImage

protocol ReturnBackDelegate:
    AnyObject
{
    func back(_ from: UIViewController)
}

extension SpecialSportViewController:
    ReturnBackDelegate
{
    func back(_ from: UIViewController) {
        removeChildViewController(from)
    }
}

class SpecialSportViewController:
    UIViewController
{
    private let sportTableView = SpecialSportTableView()
    private let viewModel: SpecialSportViewModel
    private let backButton = CircleButton(action: #selector(returnBack))
    weak var delegate: ReturnBackFromViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewControllerDelegates()
        viewModel.loadView(viewModel.sport)
        addSubs()
        bind()
    }
    
    init(viewModel: SpecialSportViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func bind() {
        viewModel.preMatches.bind { pre in
            if !(pre.isEmpty) {
                self.reloadTable()
            }
        }
        viewModel.liveMatches.bind { live in
            if !(live.isEmpty) {
                self.reloadTable()
            }
        }
        viewModel.passedMatches.bind { ended in
            if !(ended.isEmpty) {
                self.reloadTable()
            }
        }
        
        globalState.bind { state in
            self.reloadTable()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupTableViewFrames()
        setupConstraints()
        backButton.layer.cornerRadius = 20
        
    }
}

extension SpecialSportViewController
{
    @objc func returnBack() {
        guard let delegate = delegate
        else {
            return
        }
        
        delegate.returnBack(self, name: "special")
    }
}

extension SpecialSportViewController:
    UITableViewDelegate,
    UITableViewDataSource
{
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let matchVC = MatchDetailsViewController()
        matchVC.matchDetailsViewModel.sport.value = viewModel.sport
        
        guard let contentView = matchVC.contentView
        else {
            return
        }
        
        matchVC.delegate = self
        
        let game = viewModel.liveMatches.value[indexPath.section]
        
        DispatchQueue.main.async { [weak self] in
            
            contentView.dateLabel.text = game.timer
            contentView.score.text = game.score
            
            matchVC.matchDetailsViewModel.fetchStatisticFrom(game.gameID)
            
            //MARK: - HOME
            contentView.firstTeamPic.sd_setImage(
                with:Constants.teamPic(
                    team:  game.home.id,
                    sport: (self?.viewModel.sport.rawValue)!))
            contentView.firstTeamPicLabel.text = game.home.name
            //MARK: - AWAY
            contentView.secondTeamPic.sd_setImage(
                with: Constants.teamPic(
                    team:  game.away.id,
                    sport: (self?.viewModel.sport.rawValue)!))
            contentView.secondTeamPicLabel.text = game.away.name
        }
        addChildViewController(matchVC, on: self.view)
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SpecialSportCell.identifier,
            for: indexPath) as? SpecialSportCell
        else {
            return UITableViewCell()
        }
        
        self.setupCustomizationFor(cell)
      
        
        DispatchQueue.main.async { [weak self] in
            switch globalState.value {
            case "endedMatch":
                cell.stateLabel.text = self?.viewModel.passedMatches.value[
                    indexPath.section
                ].timeStatus
                cell.statusLabel.text = self?.viewModel.passedMatches.value[
                    indexPath.section
                ].time
                cell.firstTeam.text = self?.viewModel.passedMatches.value[
                    indexPath.section
                ].home.name
                cell.secondTeam.text = self?.viewModel.passedMatches.value[
                    indexPath.section
                ].away.name
                cell.firstTeamScore.text = self?.viewModel.passedMatches.value[
                    indexPath.section
                ].score
            case "liveMatch":
                cell.stateLabel.text = self?.viewModel.liveMatches.value[
                    indexPath.section
                ].timeStatus
                cell.statusLabel.text = self?.viewModel.liveMatches.value[
                    indexPath.section
                ].time
                cell.firstTeam.text = self?.viewModel.liveMatches.value[
                    indexPath.section
                ].home.name
                cell.secondTeam.text = self?.viewModel.liveMatches.value[
                    indexPath.section
                ].away.name
            case "preMatch":
                cell.stateLabel.text = self?.viewModel.preMatches.value[
                    indexPath.section
                ].timeStatus
                cell.statusLabel.text = self?.viewModel.preMatches.value[
                    indexPath.section
                ].time
                cell.firstTeam.text = self?.viewModel.preMatches.value[
                    indexPath.section
                ].home.name
                cell.secondTeam.text = self?.viewModel.preMatches.value[
                    indexPath.section
                ].away.name
            default:
                print("hello")
            }
        }
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        1
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        var section = viewModel.liveMatches.value.count
        if globalState.value == "endedMatch" {
            section = viewModel.passedMatches.value.count
        }
        if globalState.value == "liveMatch" {
            section = viewModel.liveMatches.value.count
        }
        if globalState.value == "preMatch" {
            section = viewModel.preMatches.value.count
        }
        
        return section
        
    }
}

extension SpecialSportViewController {
    
    private func setupCustomizationFor(_ cell: SpecialSportCell) {
        cell.backgroundColor = .white
        cell.selectionStyle  = .none
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 9
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 5, height: 8)
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        
        cell.cellView.layer.cornerRadius = 8
        cell.cellView.layer.masksToBounds = true
        
    }
    
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            self?.sportTableView.reloadData()
        }
    }
    
    private func setupTableViewFrames() {
        sportTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setTableViewControllerDelegates() {
        sportTableView.delegate = self
        sportTableView.dataSource = self
    }
    
    private func addSubs() {
        view.addSubview(sportTableView)
        view.addSubview(backButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            
            make.trailing.equalTo(self.view.snp.trailing)
                .offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                .offset(-20)
        }
    }
}
