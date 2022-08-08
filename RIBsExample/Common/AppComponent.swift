//
//  AppComponent.swift
//  RIBs-Example
//
//  Created by 장효원 on 2022/06/22.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
