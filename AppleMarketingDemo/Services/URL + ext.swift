// URL + ext.swift by Gokhan Mutlu on 16.03.2022

import Foundation

extension URL{
	
	//EXPLANATION: Define possiple paths here...
	/*enum xxUrl{
		case xxx(term:String)
	}
	 https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json
 	*/
	
	static func getAppleMarkettingToolUrl() -> URL?{
		var c = URLComponents()
		c.scheme = "https"
		c.host = "rss.applemarketingtools.com"
		c.path = "/api/v2/us/music/most-played/50/albums.json"
		
		return c.url
	}
	
}
