// AlbumListView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI
import Combine

struct AlbumListView: View {
	
	@ObservedObject var albumListVM = AlbumListViewModel(session: URLSession.shared)
	
    var body: some View {
		NavigationView {
			VStack {
				List{
					ForEach(albumListVM.feeds, id:\.id) { feed in
						NavigationLink {
							AlbumListDetailView(feed: feed)
						} label: {
							AlbumListCellView(feed: feed)
						}
						
					}
				}
				.listStyle(.plain)
			}
			.navigationBarTitle("Albums", displayMode: .inline)
		}
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
