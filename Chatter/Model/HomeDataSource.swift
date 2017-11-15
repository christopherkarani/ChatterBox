//
//  DataSource.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//


import LBTAComponents

class HomeDataSource: Datasource {
    
    var users : [User] = {
        var elenDegeneres = User(userName: "@TheElenShow", displayName: "Ellen DeGeneres", displayText: "Comedian, talk show host and ice road trucker. My tweets are real, and they’re spectacular.", profileImage: #imageLiteral(resourceName: "EllenD"))
        var neymar = User(userName: "@neymarjr", displayName: "Neymar Jr", displayText: "Filho de Deus, Pai, Feliz e Ousado !", profileImage: #imageLiteral(resourceName: "Neymar"))
        return [elenDegeneres, neymar]
    }()
    
    var tweets: [Tweet] = {
        var chris = User(userName: "@chrisK🔥", displayName:"Christopher Karani", displayText: "Coming together is a beginning, staying together is progress, and working together is success. Semi-Pro Footballer by day. Apple Developer by night. ", profileImage: #imageLiteral(resourceName: "chris"))
        var elonMusk = User(userName: "@elonMusk", displayName: "Elon Musk", displayText: "Tesla, SpaceX, OpenAI & Neuralink. South African entrepreneur Elon Musk is known for founding Tesla Motors and SpaceX, which launched a landmark commercial spacecraft in 2012.", profileImage: #imageLiteral(resourceName: "elonmusk"))
        var bilGates = User(userName: "@BillGates", displayName: "Bill Gates", displayText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultrices placerat pharetra. Suspendisse ultrices diam quis hendrerit feugiat. Praesent ultrices leo non tortor condimentum dictum. Etiam vel est orci. Proin quis magna non metus volutpat lobortis. In vehicula volutpat interdum. Vestibulum sodales elementum eros, nec elementum elit luctus ut. Sed risus augue, dictum eget felis varius, rhoncus mattis diam. Aliquam suscipit neque lorem, nec consectetur ante semper vitae. Aenean erat enim, suscipit eget ex nec, venenatis egestas risus.", profileImage: #imageLiteral(resourceName: "BillGates"))
        
        let tweet = Tweet(user: chris, text: chris.displayText)
        let tweet2 = Tweet(user: elonMusk, text: elonMusk.displayText)
        let tweet3 = Tweet(user: bilGates, text: bilGates.displayText)
        return [tweet, tweet2, tweet3]
    }()
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    
}
