import QtQuick 2.12
import QtQuick.Controls 2.12

Pane {
    id: panel
    width: parent.width * 0.4
    height: parent.height / 6

    property string panelColor: "grey"
    property string panelTitleText: "Title"
    property string panelValueText: "Dummy Dummy"
    property color textColor: "#000000"
    property string type: "value"

    background: Rectangle {
        color: panelColor
        radius: panel.height * 0.105
    }

    Text {
        id: title
        text: qsTr(panelTitleText)
        width: parent.width * 0.25
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Open Sans Regular"
//        fontSizeMode: Text.HorizontalFit
        font.pixelSize: parent.width * 0.075
        color: textColor
    }

    Text {
        id: titleValue
        text: qsTr(panelValueText)
        width: parent.width * 0.75
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Open Sans Regular"
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: parent.width * 0.2
        font.bold: Font.Bold
        color: textColor
        clip: true
    }
}
