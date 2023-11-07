import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Shapes
import TowerBackend

Rectangle {
    id: regisrationArea

    GuiBackend
    {
        id:backend
    }

    function clearTextRegisrationArea() {
        userName.clear()
        userData.clear()
        rUserLogin.clear()
        rUserEmail.clear()
        rUserPassword1.clear()
        rUserPassword2.clear()
}

    signal buttonClicked();

    Text {
        id: textUserName
        text: qsTr("Имя пользователя")
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:userName
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserName.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите Имя")

        background: Rectangle {
            //id: backgroundName
            anchors.fill: parent
            color: "white"
            //layer.enabled: true
            //layer.samples: 8

            //Shape {
            //    width: 0
            //    height: 0
            //    anchors.left: parent.left
            //    anchors.top: parent.top

            //    ShapePath {
            //        strokeWidth: 4
            //        strokeColor: regisrationArea.color
            //        fillColor: regisrationArea.color

            //        startX: 0; startY: 0
            //        PathLine { x: 20; y: -1 }
            //        PathLine { x: -1; y: 15 }
            //        //PathLine { x: -1; y: -1 }
            //    }
            //}
        }
    }

    Text {
        id: textUserData
        text: qsTr("Дата рождения")
        anchors.top: userName.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:userData
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserData.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите дату рождения ДД.ММ")
        //inputMask: userData.focus ? "##.##" : null
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }

    }

    Text {
        id: textUserLogin
        text: qsTr("Логин")
        anchors.top: userData.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:rUserLogin
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserLogin.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите login")
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: textUserEmail
        text: qsTr("Электронная почта")
        anchors.top: rUserLogin.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:rUserEmail
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserEmail.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите электронную почту")
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: textUserPassword1
        text: qsTr("Пароль")
        anchors.top: rUserEmail.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:rUserPassword1
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserPassword1.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите пароль")
        echoMode: TextInput.Password
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: textUserPassword2
        text: qsTr("Подтвердите ароль")
        anchors.top: rUserPassword1.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:rUserPassword2
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textUserPassword2.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Подтвердите пароль")
        echoMode: TextInput.Password
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Button
    {
        id: registrationButton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rUserPassword2.bottom
        anchors.topMargin: 10
        height: loginPage.height * 0.05
        onClicked: backend.onRegisterButtonClicked(userName.text, userData.text, rUserLogin.text, rUserPassword1.text)
        //background: Rectangle {
        //    id:loginBtn
        //    width: parent.width
        //    height: parent.height

        //}
        //layer.enabled: true
        //layer.effect: MultiEffect {
        //    shadowEnabled: true
        //    shadowBlur: 0.6
        //    shadowHorizontalOffset: 5
        //    shadowVerticalOffset: 5
        //    colorizationColor: '#ff0000'
        //    colorization: 0.5
        //}

        contentItem: Text {
            id: registrationButtonText
            text: qsTr("Зарегистрироваться")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: loginPage.height * 0.02
        }
    }
}
