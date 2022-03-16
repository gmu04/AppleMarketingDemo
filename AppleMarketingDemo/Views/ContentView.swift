// ContentView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI

struct ContentView: View {
	
	/*init() {
		//check if service works - TESTING
		let service = AMTService(session: URLSession.shared)
		service.getRssFeeds { result in
			switch result {
				case .success(let feeds):
					for feed in feeds {
						print(feed)
					}
				case .failure(let err):
					print(err)
			}
		}
		
	}*/
	
    var body: some View {
		Text("Hello, World!")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

