//
//  Landing.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import SwiftUI

struct Landing: View {
    
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        VStack {
            Button("Login") {
                @Navigable var loginView = Login()
                navigationController.push(view: loginView)
            }
            Button("SignUp") {
                @Navigable var signUpView = SignUp()
                navigationController.push(view: signUpView)
            }
        }
    }
}

#Preview {
    Landing()
}
