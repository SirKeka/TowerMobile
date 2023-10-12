import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Shapes

Window {
    id: root
    width: 400
    height: 640
    visible: true
    title: qsTr("Login Page")

    readonly property int fontSize: root.height * 0.018

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage
    }

    Page {
        id: loginPage
        background:     Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0.6, 0.7, 1, 1) }
                GradientStop { position: 1.0; color: Qt.rgba(0.796, 0.875, 1, 1) }
            }
            //color: "White"//"#CBDFFF" //перекрасить
        }

        TabBar {
            id: lrBar
            anchors.left: parent.left
            anchors.leftMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.top: parent.top
            anchors.topMargin: 100

            TabButton {
                text: qsTr("Авторизация")
            }
            TabButton {
                text: qsTr("Регистрация")
            }
        }

        StackLayout {
            width: lrBar.width
            height: (lrBar.currentIndex === 0) ? (loginPage.height * 0.4) : (loginPage.height * 0.7)
            anchors.top: lrBar.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 25
            currentIndex: lrBar.currentIndex

            Item {
                id: homeTab

                MyLoginArea {
                    id: loginArea
                    anchors.fill: parent
                    color: Qt.rgba(0, 0, 0, 0.1)
                    border.width: 1
                    border.color: Qt.rgba(0, 0, 0, 0.25)
                    radius: 20
                    onButtonClicked: { stackView.push(mainPage); loginArea.clearTextLoginArea(); regisrationArea.clearTextRegisrationArea() }
                }
            }

            Item {
                id: registrationTab

                MyRegisrationArea {
                    id: regisrationArea
                    anchors.fill: parent
                    color: "#CBDFFF"
                    border.width: 1
                    border.color: "#CBDFFF"
                    radius: 20
                    onButtonClicked: { stackView.push(mainPage); loginArea.clearTextLoginArea(); regisrationArea.clearTextRegisrationArea() }
                }
            }
        }
    }

    Page {
        id: mainPage
        background:     Rectangle {
            width: parent.width
            height: parent.height
            color: "orange" //перекрасить
        }
        visible: false
        Keys.onBackPressed: stackView.pop()

        header: Rectangle {
            id: mainHead
            height: root.height * 0.2
            anchors.top: parent.top
            color: "white"

            MyImg {
                id: imgName
                anchors.horizontalCenter: parent.horizontalCenter
                height: root.height * 0.08
                width: root.height * 0.08
                radius: root.height * 0.08 / 2
                source: "../image/Avatar.png"
                bgColor: "white"
                imgText: loginArea.userNameText

                MouseArea {
                    id: nxProfile
                    anchors.fill: parent
                    onClicked: stackView.push(profilePage)
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                height: 35
                anchors.right: parent.right
                //anchors.rightMargin: 5
                anchors.left: parent.left
                //anchors.leftMargin: 5
                border.width: 1
                radius: 15
                color: Qt.rgba(0.5, 0.5, 0.5, 0.5)

                Text {
                    id: ncard
                    text: qsTr("Номер карты:")
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    id: cardNumber
                    text: qsTr("0000 0000 0000 0000")
                    anchors.left: ncard.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    id: nuopo
                    text: qsTr("500")
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    id: points
                    text: qsTr("Баллы:")
                    anchors.right: nuopo.left
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Button {
                id: quitBtn
                height: 50
                width: 50
                anchors.left: parent.left
                anchors.top: parent.top
                display: AbstractButton.IconOnly
                icon.source: "../image/quit.png"
                background: Rectangle {
                    anchors.fill: parent
                    color: quitBtn.down ? mainHead.color : mainHead.color
                }

                onClicked: stackView.pop()
            }
        }

        StackLayout {
            anchors.fill: parent
            currentIndex: ch_eBar.currentIndex

            Item {
                id: eventPage

                MyEventView {
                    id: eventView
                    anchors.fill: parent
                }
            }

            Item {
                id: chatPage

                ColumnLayout {
                    anchors.fill: parent

                    ListView {
                        id: listView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.margins: pane.leftPadding + messageField.leftPadding
                        displayMarginBeginning: 40
                        displayMarginEnd: 40
                        verticalLayoutDirection: ListView.BottomToTop
                        spacing: 12
                        model: 10
                        delegate: Row {
                            readonly property bool sentByMe: index % 2 == 0

                            anchors.right: sentByMe ? listView.contentItem.right : undefined
                            spacing: 6

                            Rectangle {
                                id: avatar
                                width: height
                                height: parent.height
                                color: "grey"
                                visible: !sentByMe
                            }

                            Rectangle {
                                width: 80
                                height: 40
                                color: sentByMe ? "lightgrey" : "steelblue"

                                Label {
                                    anchors.centerIn: parent
                                    text: index
                                    color: sentByMe ? "black" : "white"
                                }
                            }
                        }

                        ScrollBar.vertical: ScrollBar {}
                    }
                    Pane {
                        id: pane
                        Layout.fillWidth: true

                        RowLayout {
                            width: parent.width

                            TextArea {
                                id: messageField
                                Layout.fillWidth: true
                                placeholderText: qsTr("Compose message")
                                wrapMode: TextArea.Wrap
                            }

                            Button {
                                id: sendButton
                                text: qsTr("Send")
                                enabled: messageField.length > 0
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: tabBattuonArea
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: 60
            width: 110
            color: Qt.rgba(0, 0, 0, 0.5)
            border.width: 1
            border.color: Qt.rgba(0, 0, 0, 0.5)
            radius: 10
        }

        TabBar {
            id: ch_eBar
            anchors.horizontalCenter: tabBattuonArea.horizontalCenter
            anchors.verticalCenter: tabBattuonArea.verticalCenter
            //anchors.bottom: parent.bottom

            TabButton {
                //text: qsTr("Мероприятия")
                id: ch_eBar_button0
                height: 50
                width: 50
                icon.source: "../image/Event.png"
                icon.color: ch_eBar.currentIndex ? Qt.rgba(0.75, 0.75, 0.75, 1) : "white"
                icon.height: 40
                icon.width: 40
                display: AbstractButton.IconOnly
                background: Rectangle {
                    color: ch_eBar_button0.down ? Qt.rgba(1, 1, 1, 0.25) : "transparent"
                    border.width: 1
                    border.color: "transparent"
                    radius: 10
                }
            }
            TabButton {
                //text: qsTr("Чат")
                id: ch_eBar_button1
                height: 50
                width: 50
                icon.source: "../image/Chat.png"
                icon.color: ch_eBar.currentIndex ? "white" : Qt.rgba(0.75, 0.75, 0.75, 1)
                icon.height: 40
                icon.width: 40
                display: AbstractButton.IconOnly
                background: Rectangle {
                    color: ch_eBar_button1.down ? Qt.rgba(1, 1, 1, 0.25) : "transparent"
                    border.width: 1
                    border.color: "transparent"
                    radius: 10
                }
            }
        }


        //debug
        Keys.onEscapePressed: stackView.pop()
    }

    Page {
        id: profilePage
        background: Rectangle {
            anchors.fill: parent
            color: "purple" //перекрасить
        }
        visible: false

        header: Rectangle {
            id: profileHead
            height: root.height * 0.2
            anchors.top: parent.top
            color: "white"

                Button {
                    height: parent.height / 5
                    text: "<"
                    background: Rectangle {
                        anchors.fill: parent
                        color: profileHead.color
                    }

                    onClicked: stackView.pop()
                }

                MyImg {
                    id: pImgName
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: root.height * 0.08
                    width: root.height * 0.08
                    radius: root.height * 0.08 / 2
                    source: "../image/Avatar.png"
                    bgColor: "white"
                    imgText: loginArea.userNameText

                    MouseArea {
                        id: lImg
                        anchors.fill: parent
                        //onClicked:
                    }
                }
        }

        MyUserProfile {
            id: userProfile
            anchors.fill: parent
        }

        Keys.onBackPressed: stackView.pop()

        //debug
        Keys.onEscapePressed: stackView.pop()
    }

    //Rectangle
    //{
    //    id:mainArea
    //    width: parent.width
    //    height: parent.height
    //    color: "blue" //перекрасить
    //}



    //Rectangle
    //{
    //    id:inputArea
    //    height: 350
    //    anchors.left: parent.left
    //    anchors.leftMargin: 25
    //    anchors.right: parent.right
    //    anchors.rightMargin: 25
    //    anchors.top: parent.top
    //    anchors.topMargin: 228
    //    color: "red"


    //}
}
