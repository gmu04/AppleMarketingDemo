// AlbumListCellView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI

struct AlbumListCellView: View {
	
	let feed:Feed
	
    var body: some View {
		
		HStack {
			if let url = URL(string: feed.albumImage){
				
				AsyncImage(url: url) { phase in
					switch phase {
						case .empty:
							ProgressView()
								.padding(.trailing, 20)
						case .success(let image):
							image
								.resizable()
								.scaledToFill()
								
						
						case .failure:
							AsyncImage(url: url) { phase in
								if let image = phase.image {
									image
										.resizable()
										.scaledToFill()
									
								} else {
									EmptyImage()
								}
							}
							
							
						@unknown default:
							EmptyView()
					}
				}
				.frame(maxWidth: 60, maxHeight: 60)
				.cornerRadius(5)
				.shadow(color: .gray, radius:5)

				
			}else{
				EmptyImage()
					.padding(2)
			}
			
			Text(feed.artistName)
		}
    }
	
}

struct AlbumListCellView_Previews: PreviewProvider {
    static var previews: some View {
		AlbumListCellView(feed: Feed.placeholder)
    }
}

struct EmptyImage: View {
	let emptyImageName = "music.note.list"
	var body: some View {
		Image(systemName: emptyImageName)
			.resizable()
			.frame(maxWidth: 50, maxHeight: 50)
	}
}
