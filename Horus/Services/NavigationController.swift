//
//  NavigationController.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 11/11/24.
//

import SwiftUI

struct NavigationControllerView: View {
    
    @StateObject var navigationController = NavigationController()
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    let rootView: AnyView
    
    init(rootView: some View) {
        self.rootView = AnyView(rootView)
    }
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            rootView
                .environmentObject(navigationController)
                .environmentObject(appEnvironment)
                .navigationDestination(for: NavigationContainer.self) { destination in
                    destination.view
                        .environmentObject(navigationController)
                        .environmentObject(appEnvironment)
                }
        }
    }
}

final class NavigationController: ObservableObject {
    
    @Published var path = [NavigationContainer]()
    
    func push(view: NavigationContainer) {
        path.append(view)
    }
    
    func pushViews(views: [NavigationContainer]) {
        path.append(contentsOf: views)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}

struct NavigationContainer: Hashable {
    
    private let id = UUID()
    let view: AnyView
    
    init(view: some View) {
        self.view = AnyView(view)
    }
    
    // MARK: - Hashable
    
    static func == (lhs: NavigationContainer, rhs: NavigationContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@propertyWrapper struct Navigable {
    
    var wrappedValue: NavigationContainer
    
    init(wrappedValue: some View) {
        self.wrappedValue = NavigationContainer(view: AnyView(wrappedValue))
    }
}
