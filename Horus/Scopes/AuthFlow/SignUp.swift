//
//  SignUp.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 11/11/24.
//

import SwiftUI

struct SignUp: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        Button("Pop To Root") {
            navigationController.popToRoot()
        }
    }
}

#Preview {
    SignUp()
}
