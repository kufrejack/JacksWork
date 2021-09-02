import QtQuick 2.12
import QtQuick.Controls 2.12

Pane {
    id: panel
    width: parent.width * 0.4
    height: parent.height / 6

    property string panelColor: "grey"
    property string panelTitleText: "Title"
    property string panelValueText: "Dummy Dummy"
    property color textColor: "#FFFFFF"
    property string type: "value"
    property alias switchSW: switchBtn

    signal clickedSW()

    background: Rectangle {
        color: panelColor
        radius: panel.height * 0.105
    }

    Text {
        id: title
        text: qsTr(panelTitleText)
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Open Sans Regular"
        font.pixelSize: parent.height > parent.width ? parent.width * 0.125 : parent.height * 0.125
        color: textColor
    }

    Text {
        id: titleValue
        text: qsTr(panelValueText)
        anchors.top: title.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Open Sans Regular"
        font.pixelSize: parent.height > parent.width ? parent.width * 0.25 : parent.height * 0.25
        font.bold: Font.Bold
        color: textColor
    }

    CustomSwitch {
        id: switchBtn
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.025
        myColor: textColor
        onClicked: clickedSW()
    }
}
