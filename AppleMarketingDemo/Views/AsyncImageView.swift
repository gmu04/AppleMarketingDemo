// AsyncImageView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI

struct AsyncImageView:View{
	let url:String
	let width:CGFloat
	let height:CGFloat
	
	let emptyImageName = "music.note.list"
	var body: some View {
		
		if let url = URL(string: url){
			
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
									.frame(maxWidth: width, maxHeight: height)
							}
						}
						
						
					@unknown default:
						EmptyView()
				}
			}
			.frame(maxWidth: width, maxHeight: height)
			.cornerRadius(5)
			.shadow(color: .gray, radius:5)

			
		}else{
			EmptyImage()
				.frame(maxWidth: width, maxHeight: height)
				.padding(2)
		}
	}
}


struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
		AsyncImageView(url: Feed.placeholder.albumImage, width: 50, height: 50)
    }
}


struct EmptyImage: View {
	let emptyImageName = "music.note.list"
	var body: some View {
		Image(systemName: emptyImageName)
			.resizable()
	}
}
