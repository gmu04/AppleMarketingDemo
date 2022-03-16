// MockDataSource.swift by Gokhan Mutlu on 16.03.2022

import Foundation

struct MockDataSource{
	private func contentsOf(jsonFileName:String) -> String{
		var retVal = ""
		let bundle = Bundle(for: AMTServiceTests.self)
		
		if let path = bundle.path(forResource: jsonFileName, ofType: "json"/*, inDirectory: "json"*/){
			let url = URL(fileURLWithPath: path)
			do{
				retVal = try String(contentsOf: url, encoding: .utf8)
				//print(retVal)
			}catch{
				print(error)
				fatalError(error.localizedDescription)
			}
		}else{
			retVal = "{\"err\":\"path not correct | file not found\"}"
			print(retVal)
		}
		return retVal
	}
	
	public func readJsonData(from jsonFileName:String) -> Data{
		let dataString = contentsOf(jsonFileName: jsonFileName)
		return dataString.data(using: .utf8)!
	}
	
}
