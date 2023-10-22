import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Shapes



Item {
    id: userProfile
    signal buttonClicked();

    Text {
        id: pTextUserName
        text: qsTr("Имя")
        anchors.verticalCenter: pUserName.verticalCenter
        anchors.right: pUserName.left
        anchors.rightMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserName
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: profilePage.height * fontSize
        placeholderText: qsTr("Введите Имя")
    }

    Text {
        id: pTextUserData
        text: qsTr("Дата рождения")
        anchors.verticalCenter: pUserData.verticalCenter
        anchors.left: pUserData.right
        anchors.leftMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserData
        anchors.left: parent.left
        anchors.top: pUserName.bottom
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: loginPage.height * fontSize
        placeholderText: qsTr("Введите дату рождения ДД.ММ")
        inputMask: pUserData.focus ? "##.##" : null
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }

    }

    Text {
        id: pTextUserLogin
        text: qsTr("Логин")
        anchors.verticalCenter: pUserLogin.verticalCenter
        anchors.right: pUserLogin.left
        anchors.rightMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserLogin
        anchors.right: parent.right
        anchors.top: pUserData.bottom
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: profilePage.height * fontSize
        placeholderText: qsTr("Введите login")
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: pTextUserEmail
        text: qsTr("Электронная почта")
        anchors.verticalCenter: pUserEmail.verticalCenter
        anchors.left: pUserEmail.right
        anchors.leftMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserEmail
        anchors.left: parent.left
        anchors.top: pUserLogin.bottom
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: profilePage.height * fontSize
        placeholderText: qsTr("Введите электронную почту")
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: pTextUserPassword1
        text: qsTr("Пароль")
        anchors.verticalCenter: pUserPassword1.verticalCenter
        anchors.right: pUserPassword1.left
        anchors.rightMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserPassword1
        anchors.right: parent.right
        anchors.top: pUserEmail.bottom
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: profilePage.height * fontSize
        placeholderText: qsTr("Введите пароль")
        echoMode: TextInput.Password
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: pTextUserPassword2
        text: qsTr("Подтвердите ароль")
        anchors.verticalCenter: pUserPassword2.verticalCenter
        anchors.left: pUserPassword2.right
        anchors.leftMargin: 5
        font.pointSize: profilePage.height * fontSize
    }

    TextField
    {
        id:pUserPassword2
        anchors.left: parent.left
        anchors.top: pUserPassword1.bottom
        anchors.topMargin: 5
        height: profilePage.height * 0.05
        width: profilePage.width * 0.6
        verticalAlignment: Text.AlignVCenter
        font.pointSize: profilePage.height * fontSize
        placeholderText: qsTr("Подтвердите пароль")
        echoMode: TextInput.Password
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Button {
        id: updateButton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: pUserPassword2.bottom
        anchors.topMargin: 10
        height: profilePage.height * 0.05
        contentItem: Text {
            id: updateButtonText
            text: qsTr("Обновить")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: profilePage.height * fontSize
        }
        onClicked: userProfile.buttonClicked()
    }
}
