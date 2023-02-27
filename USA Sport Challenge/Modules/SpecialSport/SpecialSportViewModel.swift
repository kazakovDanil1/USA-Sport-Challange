//Made by Kazakov Danil
//USA Sport Challenge in 2023


enum Sport:
    String
{
    case baseball = "baseball"
    case americanfootball = "americanfootball"
    case soccer = "soccer"
    case icehockey = "icehockey"
    case basketball = "basketball"
}


class SpecialSportViewModel
{
    var sport: Sport
    
    var passedMatches: Dynamic<[EndedGames]> = Dynamic([EndedGames]())
    var liveMatches: Dynamic<[GamesLive]> = Dynamic([GamesLive]())
    var preMatches: Dynamic<[PreMatchGames]> = Dynamic([PreMatchGames]())
    
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
    
    func loadView(_ forSport: Sport) {
        var endedLink: String
        var liveLink: String
        var preLink: String
        
        switch forSport {
        case .baseball:
//ENDED MATCH
            endedLink = Constants.createURL(
                link: Constants.Links.endData,
                sport: Constants.Sports.baseball
            )
            endedLink += Constants.Date.today
            NetworkManager.shared.downloadEndedMatches(
                link: endedLink) { result in
                    switch result {
                    case .success(let endedMatch):
                        self.passedMatches.value = endedMatch.gamesEnd
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//LIVE MATCH
            liveLink = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.baseball
            )
            NetworkManager.shared.downloadLiveMatches(
                link: liveLink) { result in
                    switch result {
                    case .success(let liveMatch):
                        self.liveMatches.value = liveMatch.gamesLive
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//PREMATCH
            preLink = Constants.createURL(
                link: Constants.Links.preData,
                sport: Constants.Sports.baseball
            )
            preLink += Constants.Date.today
            NetworkManager.shared.downloadPreMatches(
                link: preLink) { result in
                    switch result {
                    case .success(let preMatch):
                        self.preMatches.value = preMatch.gamesPre
                    case .failure(let error):
                        print("Error: - \(error.localizedDescription)")
                }
            }
        case .americanfootball:
            endedLink = Constants.createURL(
                link: Constants.Links.endData,
                sport: Constants.Sports.americanfootball
            )
            endedLink += Constants.Date.today
//ENDED
            NetworkManager.shared.downloadEndedMatches(
                link: endedLink) { result in
                    switch result {
                    case .success(let endedMatch):
                        self.passedMatches.value = endedMatch.gamesEnd
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
            liveLink = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.americanfootball
            )
//LIVE MATCH
            NetworkManager.shared.downloadLiveMatches(
                link: liveLink) { result in
                    switch result {
                    case .success(let liveMatch):
                        self.liveMatches.value = liveMatch.gamesLive
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//PREMATCH
            preLink = Constants.createURL(
                link: Constants.Links.preData,
                sport: Constants.Sports.americanfootball
            )
            preLink += Constants.Date.today
            NetworkManager.shared.downloadPreMatches(
                link: preLink) { result in
                    switch result {
                    case .success(let preMatch):
                        self.preMatches.value = preMatch.gamesPre
                    case .failure(let error):
                        print("Error: - \(error.localizedDescription)")
                }
            }
        case .soccer:
//ENDED
            endedLink = Constants.createURL(
                link: Constants.Links.endData,
                sport: Constants.Sports.soccer
            )
            endedLink += Constants.Date.today
            NetworkManager.shared.downloadEndedMatches(
                link: endedLink) { result in
                    switch result {
                    case .success(let endedMatch):
                        self.passedMatches.value = endedMatch.gamesEnd
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//LIVE MATCH
            liveLink = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.soccer
            )
            NetworkManager.shared.downloadLiveMatches(
                link: liveLink) { result in
                    switch result {
                    case .success(let liveMatch):
                        self.liveMatches.value = liveMatch.gamesLive
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//PREMATCH
            preLink = Constants.createURL(
                link: Constants.Links.preData,
                sport: Constants.Sports.soccer
            )
            preLink += Constants.Date.today
            NetworkManager.shared.downloadPreMatches(
                link: preLink) { result in
                    switch result {
                    case .success(let preMatch):
                        self.preMatches.value = preMatch.gamesPre
                    case .failure(let error):
                        print("Error: - \(error.localizedDescription)")
                }
            }
        case .icehockey:
//ENDED MATCH
            endedLink = Constants.createURL(
                link: Constants.Links.endData,
                sport: Constants.Sports.hockey
            )
            endedLink += Constants.Date.today
            NetworkManager.shared.downloadEndedMatches(
                link: endedLink) { result in
                    switch result {
                    case .success(let endedMatch):
                        self.passedMatches.value = endedMatch.gamesEnd
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//LIVE MATCH
            liveLink = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.hockey
            )
            NetworkManager.shared.downloadLiveMatches(
                link: liveLink) { result in
                    switch result {
                    case .success(let liveMatch):
                        self.liveMatches.value = liveMatch.gamesLive
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//PREMATCH
            preLink = Constants.createURL(
                link: Constants.Links.preData,
                sport: Constants.Sports.hockey
            )
            preLink += Constants.Date.today
            NetworkManager.shared.downloadPreMatches(
                link: preLink) { result in
                    switch result {
                    case .success(let preMatch):
                        self.preMatches.value = preMatch.gamesPre
                    case .failure(let error):
                        print("Error: - \(error.localizedDescription)")
                }
            }
        case .basketball:
//ENDED MATCH
            endedLink = Constants.createURL(
                link: Constants.Links.endData,
                sport: Constants.Sports.basketball
            )
            endedLink += Constants.Date.today
            NetworkManager.shared.downloadEndedMatches(
                link: endedLink) { result in
                    switch result {
                    case .success(let endedMatch):
                        self.passedMatches.value = endedMatch.gamesEnd
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//LIVE MATCH
            liveLink = Constants.createURL(
                link: Constants.Links.liveMatch,
                sport: Constants.Sports.basketball
            )
            NetworkManager.shared.downloadLiveMatches(
                link: liveLink) { result in
                    switch result {
                    case .success(let liveMatch):
                        self.liveMatches.value = liveMatch.gamesLive
                    case .failure(let error):
                        print("Error - : \(error.localizedDescription)")
                    }
                }
//PREMATCH
            preLink = Constants.createURL(
                link: Constants.Links.preData,
                sport: Constants.Sports.basketball
            )
            preLink += Constants.Date.today
            NetworkManager.shared.downloadPreMatches(
                link: preLink) { result in
                    switch result {
                    case .success(let preMatch):
                        self.preMatches.value = preMatch.gamesPre
                    case .failure(let error):
                        print("Error: - \(error.localizedDescription)")
                }
            }
        }
    }
}
