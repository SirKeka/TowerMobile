import QtQuick
import QtQuick.Effects

Item {
    property alias source: ava.source
    property alias imgText: userName.text
    property int radius: 0
    property color bgColor: "#000000"
    property int drawRadius: radius > 0 ? radius : width/2

    Image {
        id: ava
        sourceSize: Qt.size(width, height)
        anchors.fill: parent
        asynchronous: true

        Text {
            id: userName
            //text: qsTr("text")
            font.pointSize: mainPage.height * 0.03
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
        }
    }

    Canvas {
            anchors.fill: parent
            antialiasing: true
            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = bgColor
                ctx.beginPath()
                ctx.rect(0, 0, width, height)
                ctx.fill()

                ctx.beginPath()
                ctx.globalCompositeOperation = 'source-out'
                ctx.roundedRect(0, 0, width, height, drawRadius, drawRadius)
                ctx.fill()
            }
    }
}
