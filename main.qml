import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 411
    height: 823
    title: qsTr("Scroll")

    Pane {
        id: topPanel
        width: parent.width
        height: parent.height * 0.1
        anchors.top: parent.top

        background: Rectangle {
            color: "#000000"
        }

        Text {
            id: title
            text: qsTr("Jack's Work")
            color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Open Sans Regular"
            font.bold: Font.Bold
            font.pixelSize: parent.height * 0.5
        }
    }

    Pane {
        id: body
        width: parent.width
        height: parent.height * 0.9
        anchors.top: topPanel.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        background: Rectangle {
            color: "#FFFFFF"
        }

        CardOne {
            id: gridCard
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#02A4FF"
            panelTitleText: "Source"
            panelValueText: "Grid"
            type: "gr"
            onClickedSW: {
                if (switchSW.checked)
                    control(gridCard, 1)
                else
                    control(gridCard, 0)
            }
        }

        CardOne {
            id: renewCard
            anchors.top: gridCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#02A4FF"
            panelTitleText: "Source"
            panelValueText: "Reneweable"
            type: "rn"
            onClickedSW: {
                if (switchSW.checked)
                    control(renewCard, 1)
                else
                    control(renewCard, 0)
            }
        }

        CardOne {
            id: generCard
            anchors.top: renewCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#02A4FF"
            panelTitleText: "Source"
            panelValueText: "Generator"
            type: "gn"
            onClickedSW: {
                if (switchSW.checked)
                    control(generCard, 1)
                else
                    control(generCard, 0)
            }
        }

        CardTwo {
            id: voltageCard
            anchors.top: generCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#FAFF00"
            panelTitleText: "Voltage (V)"
            panelValueText: "0.0"
        }

        CardTwo {
            id:currentCard
            anchors.top: voltageCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#FAFF00"
            panelTitleText: "Current (A)"
            panelValueText: "0.0"
        }

        CardOne {
            id: afCard
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.left: gridCard.right
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#DB00FF"
            panelTitleText: "City"
            panelValueText: "Afikpo"
            textColor: "#000000"
            type: "af"
            onClickedSW: {
                if (switchSW.checked)
                    control(afCard, 1)
                else
                    control(afCard, 0)
            }
        }

        CardOne {
            id: amCard
            anchors.top: afCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: gridCard.right
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#DB00FF"
            panelTitleText: "City"
            panelValueText: "Amaziri"
            textColor: "#000000"
            type: "am"
            onClickedSW: {
                if (switchSW.checked)
                    control(amCard, 1)
                else
                    control(amCard, 0)
            }
        }

        CardOne {
            id: ozCard
            anchors.top: amCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: gridCard.right
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#DB00FF"
            panelTitleText: "City"
            panelValueText: "Oziza"
            textColor: "#000000"
            type: "oz"
            onClickedSW: {
                if (switchSW.checked)
                    control(ozCard, 1)
                else
                    control(ozCard, 0)
            }
        }

        CardOne {
            id: enCard
            anchors.top: ozCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: gridCard.right
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#DB00FF"
            panelTitleText: "City"
            panelValueText: "Enohia"
            textColor: "#000000"
            type: "en"
            onClickedSW: {
                if (switchSW.checked)
                    control(enCard, 1)
                else
                    control(enCard, 0)
            }
        }

        CardOne {
            id: unCard
            anchors.top: enCard.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: gridCard.right
            anchors.leftMargin: parent.width * 0.2 * 0.33
            panelColor: "#DB00FF"
            panelTitleText: "City"
            panelValueText: "Unwana"
            textColor: "#000000"
            type: "un"
            onClickedSW: {
                if (switchSW.checked)
                    control(unCard, 1)
                else
                    control(unCard, 0)
            }
        }
    }

    Timer {
        interval: 500; running: true; repeat: true
        triggeredOnStart: true
        onTriggered: {
            request('http://kufrejack.pythonanywhere.com/data', function (o) {

                // log the json response
                var myJsonObject = JSON.parse(o.responseText)
//                console.log(myJsonObject.voltage)
                voltageCard.panelValueText = myJsonObject.voltage
                currentCard.panelValueText = myJsonObject.current
            });
        }
    }

    function control(par, val) {
        request('http://kufrejack.pythonanywhere.com/control?type='+par.type+'&value='+val, function (o) {

            // log the json response
            var myJsonObject = JSON.parse(o.responseText)
//                console.log(myJsonObject.voltage)
        });
    }

    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                if (myxhr.readyState === 4)
                    callback(myxhr);
            }
        })(xhr);
        xhr.open('GET', url, true);
        xhr.send('');
    }

    Component.onCompleted: {
        request('http://kufrejack.pythonanywhere.com/data', function (o) {

            // log the json response
            var myJsonObject = JSON.parse(o.responseText)
            // console.log(myJsonObject.voltage)
            voltageCard.panelValueText = myJsonObject.voltage
            currentCard.panelValueText = myJsonObject.current
            gridCard.switchSW.checked = myJsonObject.gr
            renewCard.switchSW.checked = myJsonObject.rn
            generCard.switchSW.checked = myJsonObject.gn
            afCard.switchSW.checked = myJsonObject.af
            amCard.switchSW.checked = myJsonObject.am
            ozCard.switchSW.checked = myJsonObject.oz
            enCard.switchSW.checked = myJsonObject.en
            unCard.switchSW.checked = myJsonObject.un
        });
    }
}
