// Feed.swift by Gokhan Mutlu on 16.03.2022

import Foundation



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

extension Feed{
	//use in Previews
	static var placeholder:Feed{
		return Feed(artistName: "Lin-Manuel Miranda, Germaine Franco, Stephanie Beatriz, Olga Merediz & Jessica Darrow",
					releaseDate: "2021-11-19",
					albumImage: "https://is2-ssl.mzstatic.com/image/thumb/Music126/v4/94/4d/9a/944d9a8d-0549-f537-5706-5b083bd84a7d/21UM1IM38949.rgb.jpg/100x100bb.jpg",
					genres: [
						Genre(name: "Music", url: "https://itunes.apple.com/us/genre/id34"),
						Genre(name: "Soundtrack", url: "https://itunes.apple.com/us/genre/id16")
					],
					id: UUID())
	}
}
