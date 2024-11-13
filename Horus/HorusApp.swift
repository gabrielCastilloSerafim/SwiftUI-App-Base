//
//  HorusApp.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

@main
struct HorusApp: App {
    
    @StateObject var appEnvironment = AppEnvironment()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        
        WindowGroup {
            
            switch appEnvironment.appState {
                
            case .lauching:
                LaunchScreen()
                
            case .userAuthenticated:
                MainTabView()
                    .environmentObject(appEnvironment)
                
            case .userNotAuthenticated:
                NavigationControllerView(rootView: Landing())
                    .environmentObject(appEnvironment)
            }
        }
        .onChange(of: scenePhase) { oldValue, newValue in
            
            switch newValue {
                
            case .background:
                break
                
            case .inactive:
                break
                
            case .active:
                break
                
            @unknown default:
                break
            }
        }
    }
}
