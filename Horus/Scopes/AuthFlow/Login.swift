//
//  Login.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 11/11/24.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        Button {
            appEnvironment.userDidLogIn(User(name: "Gabriel", email: ""), authToken: "FAKE_TOKEN")
        } label: {
            Text("Login")
        }
    }
}

#Preview {
    Login()
}
