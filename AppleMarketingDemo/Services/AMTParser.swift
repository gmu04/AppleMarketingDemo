// AppMarkettingToolParser.swift by Gokhan Mutlu on 16.03.2022

import Foundation

/**
 AMT = App Marketting Tool
 */
struct AMTParser:JSonParser{
	
	func parse(data: Data) -> Result<T, TError> {
		let decoder = JSONDecoder()
		do{
			let apiResponse = try decoder.decode(T.self, from: data)
			return .success(apiResponse)
		}catch{
			print(error)
			print(error.localizedDescription)
			return .failure(.anyError(error))
		}
	}
	
	typealias T = JsonResponse
	typealias TError = AMTError
}



protocol JSonParser{
	associatedtype T
	associatedtype TError:Error
	func parse(data:Data) -> Result<T,TError>
}
