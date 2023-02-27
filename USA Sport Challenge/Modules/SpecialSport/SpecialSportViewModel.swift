//Made by Kazakov Danil
//USA Sport Challenge in 2023



enum Sport: String {
    case baseball = "baseball"
    case americanfootball = "americanfootball"
    case soccer = "soccer"
    case icehockey = "icehockey"
    case basketball = "basketball"
}

protocol SpecialSportViewModelType
{
    func fetchMatches(_ forSport: Sport)
}

class SpecialSportViewModel:
    SpecialSportViewModelType
{
    var sport: Sport
    
    var liveMatches: Dynamic<[GamesLive]> = Dynamic([GamesLive]())
    
    init(sport: Sport) {
        self.sport = sport
    }
    
    func fetchDetails(teamID: String) {
        let link = Constants.createDetailsURL(
            link: Constants.Links.MatchDetails,
            teamID: teamID
        )
        NetworkManager.shared.downloadMatchDetails(
            link: link) { result in
                switch result {
                case .success(let matchDetails):
                    print(matchDetails)
                case .failure(let error):
                    print("Error: - \(error.localizedDescription)")
                }
            }
    }
    
    func fetchMatches(_ forSport: Sport) {
        let link: String
        switch forSport {
        case .baseball:
            link = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.baseball
            )
        case .americanfootball:
            link = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.americanfootball
            )
        case .soccer:
            link = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.soccer
            )
        case .icehockey:
            link = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.hockey
            )
        case .basketball:
            link = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.basketball
            )
        }

        NetworkManager.shared.downloadMatches(
            link: link
        ) { [weak self] result in
                switch result {
                case .success(let match):
                    self?.liveMatches.value.append(contentsOf: match.gamesLive)
                case .failure(let error):
                    print("Error: - \(error.localizedDescription)")
                }
            }
    }
}
