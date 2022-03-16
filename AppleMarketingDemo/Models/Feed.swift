// Feed.swift by Gokhan Mutlu on 16.03.2022

import Foundation

struct JsonResponse:Decodable{
	let feed:FeedReponse
}

struct FeedReponse:Decodable{
	let results:[Feed]
}

struct Feed:Decodable, Identifiable{
	let artistName:String
	let releaseDate:String
	let albumImage:String
	let genres:[Genre]?

	var id:UUID
	
	private enum CodingKeys: String, CodingKey {
		case artistName, releaseDate, albumImage = "artworkUrl100", genres
	}
}

extension Feed{
	init(from decoder: Decoder) throws {
		guard let decoder = try? decoder.container(keyedBy: CodingKeys.self) else{
			fatalError("Decoder not valid")
		}

		self.id = UUID()
		
		self.artistName = try! decoder.decode(String.self, forKey: .artistName)
		self.releaseDate = try! decoder.decode(String.self, forKey: .releaseDate)
		self.albumImage = try! decoder.decode(String.self, forKey: .albumImage)
		self.genres = try! decoder.decode([Genre].self, forKey: .genres)
		
	}
}


struct Genre:Decodable{
	let name:String
	let url:String
}
