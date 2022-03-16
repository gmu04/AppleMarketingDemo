// Feed.swift by Gokhan Mutlu on 16.03.2022

import Foundation

struct JsonResponse:Decodable{
	let feed:FeedReponse
}

struct FeedReponse:Decodable{
	let results:[Feed]
}

struct Feed:Decodable{
	
}
