import QtQuick 2.12
import QtQuick.Controls 2.12

Switch {
    id: control
    anchors.horizontalCenter: parent.horizontalCenter
    text: control.checked ? qsTr("ON") : qsTr("OFF")

    property double myWidth: parent.width * 0.25
    property double myHeight: parent.height * 0.3
    property color myColor: "#FFFFFF"

    indicator: Rectangle {
        implicitWidth: myWidth
        implicitHeight: myHeight
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: myHeight * 0.5
        color: control.checked ? "#17a81a" : "#ffffff"
        border.color: control.checked ? "#17a81a" : "#cccccc"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: height
            height: myWidth < myHeight ? myWidth : myHeight
            radius: height * 0.5
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
        }
    }

    contentItem: Text {
        text: control.text
        font.family: "Open Sans Regular"
        opacity: enabled ? 1.0 : 0.3
        color: myColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
