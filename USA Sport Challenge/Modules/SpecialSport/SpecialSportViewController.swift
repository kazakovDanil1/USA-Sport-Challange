//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class SpecialSportViewController:
    UIViewController
{
    private let viewModel = SpecialSportViewModel()
    private let sportTableView = SpecialSportTableView()
    weak var delegate: ReturnBackFromViewControllerDelegate?
    private let backButton = CircleButton(action: #selector(returnBack))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubs()
        setTableViewControllerDelegates()
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
        
        delegate.returnBack(self)
    }
}


extension SpecialSportViewController:
    UITableViewDelegate,
    UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present sport screen
        
        print("you choose sprt ")
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
        
        
        setupCustomizationFor(cell)
        
        
        cell.taskLabel.text = "hello"
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        return headerView
    }
    
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        1
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        10
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        70
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 5
    }
}

extension SpecialSportViewController {
    
    private func setupCustomizationFor(_ cell: SpecialSportCell) {
        cell.backgroundColor = .none
        cell.selectionStyle  = .none
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 9
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 5, height: 8)
        cell.layer.masksToBounds = true
        cell.clipsToBounds = false
        
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
            make.top.equalToSuperview() .offset(50)
            make.leading.equalToSuperview() .offset(10)
            make.trailing.equalToSuperview() .offset(-10)
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
