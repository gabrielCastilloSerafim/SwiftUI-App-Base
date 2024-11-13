//
//  MainTabView.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        TabView(selection: $appEnvironment.selectedTab) {
            NavigationControllerView(rootView: HomeTab())
                .environmentObject(appEnvironment)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            NavigationControllerView(rootView: EventsTab())
                .environmentObject(appEnvironment)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Eventos")
                }
                .tag(1)
            
            NavigationControllerView(rootView: ProfileTab())
                .environmentObject(appEnvironment)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
