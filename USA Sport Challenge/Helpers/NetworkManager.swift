//Made by Kazakov Danil
//USA Sport Challenge in 2023

import Foundation
import Alamofire
import SDWebImage


enum Constants {
    static let baseURL = "https://spoyer.com/api/en/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O"
    
    enum Links {
        static let liveMatch = "&task=livedata"
        static let MatchDetails = "&task=eventdata&game_id="
        static let preData = "&task=predata"
    }
    
    enum Date {
        static let today = "&day=today"
    }
    
    enum Sports {
        static let soccer = "&sport=soccer"
        static let basketball = "&sport=basketball"
        static let hockey = "&sport=icehockey"
        static let americanfootball = "&sport=football"
        static let baseball = "&sport=baseball"
    }
    
    static func createURL(
        link: String,
        sport: String
    ) -> String {
        return "\(Constants.baseURL)" + "\(link)" + "\(sport)"
    }
    
    static func createDetailsURL(
        link: String,
        teamID: String
    ) -> String {
        return "\(Constants.baseURL)" + "\(link)" + "\(teamID)"
    }
    
    static func teamPic(
        team: String,
        sport: String
    ) -> URL? {
        
        let URL = URL(
            string: "https://spoyer.com/api/team_img/\(sport)/\(team).png"
        )
        return URL
    }
    
}


protocol NetworkService {
    func downloadMatches(
         link: String,
         completion:
         @escaping(Result<Live, Error>) -> Void
    )
}

class NetworkManager: NetworkService {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func downloadMatchDetails(
         link: String,
         completion:
         @escaping(Result<MatchDetailsModel, Error>) -> Void
    ) {

        print(link)
        AF.download(link).responseDecodable(
            of: MatchDetailsModel.self
        ) { response in
            do {
                let match = try response.result.get()
                completion(.success(match))
            } catch (let error){
                completion(.failure(error))
            }
        }
    }
    
    
    func downloadMatches(
         link: String,
         completion:
         @escaping(Result<Live, Error>) -> Void
    ) {
        print(link)

        AF.download(link).responseDecodable(
            of: Live.self
        ) { response in
            do {
                let liveMatch = try response.result.get()
                completion(.success(liveMatch))
            } catch (let error){
                completion(.failure(error))
            }
        }
    }
}
