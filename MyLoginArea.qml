import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Shapes
import TowerBackend



Rectangle {
    id:rootloginArea

    GuiBackend
    {
        id:backend
    }

    function clearTextLoginArea() {
        userLogin.clear()
        userPassword.clear()
    }

    //property alias backgroundColor: backgroundT1.color
    property string userNameText: userLogin.displayText
    signal buttonClicked();

    Text {
        id: textLogin
        text: qsTr("Логин")
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id: userLogin
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textLogin.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        //horizontalAlignment: Text.AlignLeft
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите login")

        background: Rectangle {
            //id: backgroundT1
            anchors.fill: parent
            color: "white"
            //layer.enabled: true
            //layer.samples: 8

            //Shape {
            //    id: triBevel1
            //    width: 0
            //    height: 0
            //    anchors.left: parent.left
            //    anchors.top: parent.top

            //    ShapePath {
            //        strokeWidth: 4
            //        strokeColor: loginArea.color
            //        fillColor: loginArea.color

            //        startX: 0; startY: 0
            //        PathLine { x: 20; y: -1 }
            //        PathLine { x: -1; y: 15 }
            //        //PathLine { x: -1; y: -1 }


            //    }
            //}
        }

    }

    Text {
        id: textPassword
        text: qsTr("Пароль")
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.top: userLogin.bottom
        anchors.topMargin: 10
        font.pointSize: loginPage.height * 0.02
    }

    TextField
    {
        id:userPassword
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.top: textPassword.bottom
        height: loginPage.height * 0.05
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * 0.02
        placeholderText: qsTr("Введите пароль")
        echoMode: TextInput.Password

        background: Rectangle {
            id: backgroundT2
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.15)
            //layer.enabled: true
            //layer.samples: 8

            //Shape {
            //    id: triBevel2
            //    width: 0
            //    height: 0
            //    anchors.right: parent.right
            //    anchors.bottom: parent.bottom

            //    ShapePath {
            //        strokeWidth: 4
            //        strokeColor: loginArea.color
            //        fillColor: loginArea.color

            //        startX: 0; startY: 0
            //        PathLine { x: -20; y: 1 }
            //        PathLine { x: 0; y: -15 }
            //        //PathLine { x: -1; y: -1 }


            //    }
            //}
        }
    }

    Button
    {
        id: loginButton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: userPassword.bottom
        anchors.topMargin: 30
        height: loginPage.height * 0.05
        onClicked: backend.onLoginButtonClicked(userLogin.text, userPassword.text)

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
            id: loginButtonText
            text: qsTr("Войти")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: loginPage.height * 0.02
        }
    }
}
