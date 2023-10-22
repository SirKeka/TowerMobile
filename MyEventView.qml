import QtQuick
import QtQuick.Controls

Item {
    id: eventView

    readonly property int tMargin: 2
    property int count: 0

    ListModel {
        id: eventModel

        ListElement {
            type: "Понедельник"
            nameEvent: "Кориолис"
            time: "19:00"
            duration: "до 22:00"
            numberOfSeats: 5
            price: 200
            //presence: "Пойду"
            description: "Описание"
        }

        //ListElement {
        //    type: "Вторник"
        //    nameEvent: "Кориолис"
        //    time: "19:00"
        //    numberOfSeats: "5"
        //    price: "200"
        //    description: "Описание"
        //}

        //ListElement {
        //    type: "Вторник"
        //    nameEvent: "Кориолис"
        //    time: "19:00"
        //    numberOfSeats: "5"
        //    price: "200"
        //    description: "Описание"
        //}
    }

    Component {
        id: eventDelegate

        Rectangle {
            implicitWidth: tNameEvent.implicitWidth
            height: 130
            //anchors.horizontalCenter: eventView.horizontalCenter
            color: "lightblue"

            Text {
                id: tNameEvent
                anchors.top: parent.top
                anchors.topMargin: tMargin
                text: qsTr("Название мероприятия: ") + model.nameEvent
                font.pixelSize: fontSize
            }

            Text {
                id: tTime
                anchors.top: tNameEvent.bottom
                anchors.topMargin: tMargin
                text: qsTr("Время: ") + model.time
                font.pixelSize: fontSize
            }

            Text {
                id: tDuration
                anchors.top: tTime.bottom
                anchors.topMargin: tMargin
                text: qsTr("Продолжительность: ") + model.duration
            }

            Text {
                id: tNumberOfSeats
                anchors.top: tDuration.bottom
                anchors.topMargin: tMargin
                text: qsTr("Количество мест: ") + model.numberOfSeats
                font.pixelSize: fontSize
            }

            Text {
                id: tPrice
                anchors.top: tNumberOfSeats.bottom
                anchors.topMargin: tMargin
                text: qsTr("Цена: ") + model.price
                font.pixelSize: fontSize
            }

            Text {
                id: tDescription
                anchors.top: tPrice.bottom
                anchors.topMargin: tMargin
                text: qsTr("Описание: ") + model.description
                font.pixelSize: fontSize
            }

            Text {
                id: tPresence
                anchors.top: tDescription.bottom
                anchors.topMargin: tMargin
                text: qsTr("Пойду: ")
            }

            MySPresence {
                id: sPresence
                anchors.left: tPresence.right
                anchors.verticalCenter: tPresence.verticalCenter
                anchors.verticalCenterOffset: 2
            }
        }
    }

    ListView {
       anchors.fill: parent

        model: eventModel
        delegate: eventDelegate
        clip: true

        section.property: "type"
        section.delegate: Rectangle {
            width: parent.width
            height: 60
            color: "lightgreen"

            Rectangle {
                id: topBorder1
                width: parent.width * 0.75
                height: 2
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
            }

            Rectangle {
                id: topBorder2
                width: parent.width
                height: 2
                anchors.top: topBorder1.bottom
                anchors.topMargin: 5
                color: "black"
            }

            Rectangle {
                id: bottomBorder2
                width: parent.width
                height: 3
                anchors.bottom: bottomBorder1.top
                anchors.bottomMargin: 5
                color: "black"
            }

            Rectangle {
                id: bottomBorder1
                width: parent.width * 0.75
                height: 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
            }

            Text {
                anchors.centerIn: parent
                renderType: Text.NativeRendering
                font.bold: true
                font.pixelSize: fontSize * 1.25
                text: section
            }
        }
    }
}
