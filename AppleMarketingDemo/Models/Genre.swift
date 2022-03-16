// Genre.swift by Gokhan Mutlu on 16.03.2022

import Foundation

struct Genre:Decodable, Hashable{
	let genreId:String
	let name:String
	let url:String
}
