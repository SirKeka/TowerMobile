import QtQuick
import QtQuick.Controls

Switch {
    id: sPresence
    text: sPresence.checked ? "Да" : "Нет"


    contentItem: Text {
        text: sPresence.text
        font: sPresence.font
        opacity: enabled ? 1.0 : 0.3
        color: sPresence.checked ? "#21be2b" : "red"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1.5
        anchors.right: sPresence.checked ? parent.left : sPresence.indicator.right
        anchors.rightMargin: sPresence.checked ? -29 : 6
    }

    indicator: Rectangle {
        implicitWidth: 48
        implicitHeight: 20
        x: sPresence.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        color: "#ffffff" //sPresence.checked ? "#17a81a" :
        border.color: sPresence.checked ? "#17a81a" : "red"

        Rectangle {
            x: sPresence.checked ? parent.width - width : 0
            width: 20
            height: 20
            radius: 10
            color: sPresence.down ? "#cccccc" : "#ffffff"
            border.color: sPresence.checked ? (sPresence.down ? "#17a81a" : "#21be2b") : "red"
        }
    }
}

//SwitchDelegate {
//    id: sPresence
//    text: qsTr("SwitchDelegate")
//    checked: true
//
//    contentItem: Text {
//        rightPadding: control.indicator.width + control.spacing
//        text: control.text
//        font: control.font
//        opacity: enabled ? 1.0 : 0.3
//        color: control.down ? "#17a81a" : "#21be2b"
//        elide: Text.ElideRight
//        verticalAlignment: Text.AlignVCenter
//    }
//
//    indicator: Rectangle {
//        implicitWidth: 48
//        implicitHeight: 26
//        x: control.width - width - control.rightPadding
//        y: parent.height / 2 - height / 2
//        radius: 13
//        color: control.checked ? "#17a81a" : "transparent"
//        border.color: control.checked ? "#17a81a" : "#cccccc"
//
//        Rectangle {
//            x: control.checked ? parent.width - width : 0
//            width: 26
//            height: 26
//            radius: 13
//            color: control.down ? "#cccccc" : "#ffffff"
//            border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
//        }
//    }
//
//    background: Rectangle {
//        implicitWidth: 100
//        implicitHeight: 40
//        visible: control.down || control.highlighted
//        color: control.down ? "#bdbebf" : "#eeeeee"
//    }
//}
