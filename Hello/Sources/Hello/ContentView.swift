import SwiftUI
import SQLiteData

struct ContentView: View {

    @State private var isShowingAlert: Bool = false

    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: "house.fill"){
                HomeView()
            }
            Tab(Constants.editString,systemImage: "square.and.pencil"){
                DetailsView()
            }
            Tab(Constants.settingsString,systemImage: "dog.fill"){
                EditView()
            }
        }
    }

    
}

