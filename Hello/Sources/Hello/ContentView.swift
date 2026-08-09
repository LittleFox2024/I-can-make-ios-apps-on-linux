import SwiftUI
import SQLiteData

struct ContentView: View {

    @State private var isShowingAlert = false

    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: "house.fill"){
                HomeView()
            }
            Tab(Constants.editString,systemImage: "square.and.pencil"){
                EditView()
            }
            Tab(Constants.settingsString,systemImage: "dog.fill"){
                Text(Constants.settingsString)
            }
        }
    }

    
}

