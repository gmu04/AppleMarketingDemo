// AlbumListView.swift by Gokhan Mutlu on 16.03.2022

import SwiftUI
import Combine

struct AlbumListView: View {
	
	@ObservedObject var albumListVM = AlbumListViewModel(session: URLSession.shared)
	@State private var showModal = false
	
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
				.refreshable {
					albumListVM.getLaunchList()
				}
			}
			.sheet(isPresented: $showModal) {
				
			} content: {
				SearchModuleView()
			}
			.navigationBarTitle("Albums", displayMode: .inline)
			.navigationBarItems(
				trailing:
					Button(action: {
						self.showModal.toggle()
					}, label: {
						Image(systemName:"magnifyingglass")
							.resizable()
							.frame(width: 24, height: 24)
					})
			)
		}
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
