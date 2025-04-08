import SwiftUI



struct MainView: View{
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View{
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty
        {
            // Signed in
            TabView {
                ToDoListView(userId: "")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
    }
    
    
    struct ContentView_Previews:PreviewProvider{
        static var previews: some View{
            MainView()
        }
    }
}
