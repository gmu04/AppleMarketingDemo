// AppMarkettingToolService.swift by Gokhan Mutlu on 16.03.2022

import Foundation

/**
 AMT = App Marketting Tool
 */
final class AMTService<S:Session>{
	
	//injecting session
	init(session:S){
		self.client = HttpClient(session: session)
	}
	
	
	internal func getRssFeeds(resultLimit:Int = 50, completion:@escaping (Result<[Feed], AMTError>)->()){
		
		//prepare search url
		guard let validUrl = URL.getAppleMarkettingToolUrl(resultLimit: resultLimit) else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.searchFor(url: validUrl){ result in
			
			switch result{
				case .failure(let apiError):
					completion(.failure(apiError))
				
				case .success(let data):
					
					let result = AMTParser().parse(data: data)

					//return launches
					if case let .success(jsonResponse) = result{
						//print(launches)
						
						completion(.success(jsonResponse.feed.results))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
			}
		}
		
	}
	
	
	
	//MARK: - Properties
	
	private var launches:[Feed]?
	private let client:HttpClient<S>
	
}
