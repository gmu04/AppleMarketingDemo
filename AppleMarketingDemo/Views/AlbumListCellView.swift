// AlbumListCellView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI

struct AlbumListCellView: View {
	
	let feed:Feed
	
    var body: some View {
		
		HStack {
			AsyncImageView(url: feed.albumImage, width: 50, height: 50)
			Text(feed.artistName)
		}
    }
	
}

struct AlbumListCellView_Previews: PreviewProvider {
    static var previews: some View {
		AlbumListCellView(feed: Feed.placeholder)
    }
}


