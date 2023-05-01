//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김혜수 on 2022/11/06.
//

import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.framework(
    name: "DesignSystem",
    platform: .iOS,
    dependencies: [
        .external(name: "HorizonCalendar"),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "SnapKit"),
        .external(name: "RxGesture"),
        .project(target: "Global", path: "../Global"),
        .project(target: "Domain", path: "../Domain")
    ],
    additionalPackageDependencies: [],
    packages: [])

