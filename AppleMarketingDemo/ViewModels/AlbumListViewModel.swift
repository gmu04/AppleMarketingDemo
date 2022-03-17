// AlbumListViewModel.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI
import Combine

class AlbumListViewModel<S:Session>:ObservableObject{
	@Published var feeds:[Feed] = []
	@Published var anyUserMessage:String?
	
	private var service:AMTService<S>!
	
	init(session:S){
		self.service = AMTService(session: session)
		
		//call service to cache launches...
		self.getLaunchList()
	}
	
	func getLaunchList(){
		self.service.getRssFeeds{ result in
			switch result {
					
				case .failure(let err):
					DispatchQueue.main.async {
						self.anyUserMessage = "There is a problem:\n\(err.localizedDescription)"
					}
					print(err)
					
				case .success(let feeds):
					//print("\n------\(term)------")
					DispatchQueue.main.async {
						self.feeds = feeds
					}
			}
		}
	}
	
	
}

