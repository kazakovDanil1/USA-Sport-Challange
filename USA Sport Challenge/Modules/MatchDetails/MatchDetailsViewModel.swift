//Made by Kazakov Danil
//USA Sport Challenge in 2023

import Foundation
import UIKit


class MatchDetailsViewModel
{
    var sport: Dynamic<Sport?> = Dynamic<Sport?>(nil)
    
    var match: Dynamic<MatchDetailsModel?> = Dynamic<MatchDetailsModel?>(nil)
    
    func fetchStatisticFrom(_ matchID: String) {
        let url = Constants.createDetailsURL(
            link: Constants.Links.MatchDetails,
            teamID: matchID
        )
        NetworkManager.shared.downloadMatchDetails(
            link: url
        ) { [weak self] result in
            switch result {
            case .success(let details):
                self?.match.value = details
            case .failure(let error):
                print("Error: - \(error.localizedDescription)")
            }
        }
    }
    
    func fill(_ stackView: UIStackView) {
        guard let match = match.value
        else {
            return
        }
        
        match.results.forEach({ Details in
            Details.stats.forEach
            { (nameStat: String, StatForTeam: [String]) in
                
                let statistic = stackViewStatistic(
                    name: nameStat,
                    team: (first: StatForTeam[0], second: StatForTeam[1])
                )
                
                let label = UILabel()
                label.font = .systemFont(ofSize: 15, weight: .bold)
                label.textAlignment = .center
                label.textColor = .black
                label.text = "\(statistic.team.first) \(statistic.name) \(statistic.team.second)"
                
                stackView.addArrangedSubview(label)
            }
        })
    }
}
