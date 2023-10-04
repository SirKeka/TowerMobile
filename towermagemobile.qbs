import qbs
CppApplication {
    Depends { name: "Qt.quick" }
    install: true
    // Additional import path used to resolve QML modules in Qt Creator's code model
    property pathList qmlImportPaths: []

    files: [
        "Res.qrc",
        "RounImg.fsh",
        "main.cpp",
    ]

    Group {
        Qt.core.resourcePrefix: "TowerMageMobile/"
        fileTags: ["qt.qml.qml", "qt.core.resource_data"]
        files: [
            "Main.qml",
            "MyImg.qml",
            "MyLoginArea.qml",
            "MyRegisrationArea.qml",
            "MyUserProfile.qml",
        ]
    }
}
