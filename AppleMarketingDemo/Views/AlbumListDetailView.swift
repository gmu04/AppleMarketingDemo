// AlbumListDetailView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI

struct AlbumListDetailView: View {
	let feed:Feed
	var vm = AlbumListDetailViewModel()
	@State private var isPlayGenre = false
	
	var body: some View {
		//album genres - ReleaseDate -Artist Name - Album Image
		
		VStack {
			AsyncImageView(url: feed.albumImage, width: 200, height: 200)
				.padding()
			
			Text(feed.artistName)
				.bold()
				.padding(.horizontal, 40)
			HStack {
				Text("Release date: ")
				Text(formatedDate(feed.releaseDate))
					.padding()
			}
			
			
			ForEach(feed.genres, id:\.self){ genre in
				HStack{
					Text(genre.name)
					Spacer()
					Button {
						//vm.playGenre()
						isPlayGenre.toggle()
					} label: {
						Image(systemName: "play")
					}
				}
				.frame(width: 200)
				.padding()
			}
			Spacer()
		}
		.alert("Genre plays", isPresented: $isPlayGenre) {
			Button("OK") { }
		}
		
	}
	
	//https://music.apple.com/us/album/the-cracks-emerge/1594677532?i=1594677917
	//https://music.apple.com/us/album/the-cracks-emerge/1594677532?i=1594677917
	private func formatedDate(_ dateStr:String) -> String{
		/*
		let date = dateFormatter.date(from: dateStr) ?? Date()
		let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
		return "\(calendarDate.day!).\(calendarDate.month!).\(calendarDate.year!)"
		 */
		return dateStr
	}
	
	private var dateFormatter:DateFormatter{
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter
	}
}

struct AlbumListDetailView_Previews: PreviewProvider {
	static var previews: some View {
		AlbumListDetailView(feed: Feed.placeholder)
	}
}
