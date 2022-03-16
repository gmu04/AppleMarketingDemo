// Feed.swift by Gokhan Mutlu on 16.03.2022

import Foundation

struct JsonResponse:Decodable{
	let feed:FeedReponse
}

struct FeedReponse:Decodable{
	let results:[Feed]
}

struct Feed:Decodable{
	let genres:[Genre]			//genres
	let releaseDate:String		//ReleaseDate
	let artistName:String		//Artist Name
	let artworkUrl100:String	//Album Image
}

struct Genre:Decodable{
	let genreId:Int
	let name:String
	let url:String
}
