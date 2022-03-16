// AppleMarketingDemoTests.swift by Gokhan Mutlu on 16.03.2022

import XCTest
import SwiftUI
@testable import AppleMarketingDemo

class AMTServiceTests: XCTestCase {
	//private var service:AMTService<S>?
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
//		let session = URLSession.shared
		//service = AMTService(session: session)
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
//		service = nil
	}

	func testFetchingSingleAlbum() throws {
		//Arrange
		let expectation = XCTestExpectation(description: "Fetching a single album")
		let session = URLSession.shared
		let service = AMTService(session: session)
		
		//Act
		service.getRssFeeds(resultLimit: 1) { result in
			if case let .success(feeds) = result{
				print("------\(feeds.count)------")
				//Assert
				XCTAssertTrue(feeds.count == 1, "Single album expected!")
			}else{
				assertionFailure("Something went wrong! - Single album expected!")
			}
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10)	//wait 10 seconds for a timeout
	}
	
	
	
	func testParsing10Albums() throws {
		//Arrange
		let mockDataSource = MockDataSource()
		let parser = AMTParser()

		//Act
		//https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json
		let data = mockDataSource.readJsonData(from: "most_played_10_albums")
		let result:Result<JsonResponse, AMTError> = parser.parse(data: data)
		
		//Assert
		var feeds = [Feed]()
		if case let .success(jsonResponse) = result{
			feeds = jsonResponse.feed.results
		}
		XCTAssert(feeds.count == 10, "Expecting to have 10 albums")
	}
	
	
	
}
