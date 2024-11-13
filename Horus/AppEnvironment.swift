//
//  AppEnvironment.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

enum AppState {
    case lauching
    case userAuthenticated
    case userNotAuthenticated
}

final class AppEnvironment: ObservableObject {
    
    @Published var loggedInUser: User?
    @Published var appState: AppState = .lauching
    @Published var selectedTab = 0
    
    init() {
        loadAppInitialData()
    }
    
    // MARK: - Public API
    
    @MainActor
    func userDidLogIn(_ user: User, authToken: String) {
        UserDefautsManager.shared.userAuthToken = "fake token"
        loggedInUser = User(name: "Gabriel", email: "")
        appState = .userAuthenticated
    }
    
    @MainActor
    func userDidLogOut() {
        UserDefautsManager.shared.userAuthToken = nil
        loggedInUser = nil
        appState = .userNotAuthenticated
    }
    
    // MARK: - Private API
    
    private func loadAppInitialData() {
        Task {
            let userIsLoggedIn = UserDefautsManager.shared.userAuthToken != nil
            if userIsLoggedIn {
                // TODO: Fetch user data and then set the state as logged in... (Meanwhile the launch screen will be displaying)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.loggedInUser = User(name: "Gabriel", email: "")
                    self.appState = .userAuthenticated
                })
            } else {
                await MainActor.run {
                    appState = .userNotAuthenticated
                }
            }
        }
    }
}
