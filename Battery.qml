import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    property int batteryAmount : batterySlider.value
    property bool isCharging : batteryChargingSwitch.checked
    property int chargingTime : 100 - batteryAmount
    property bool showPopup: false;

    Button {
        anchors.fill: parent;
        anchors.centerIn: parent;
        Rectangle {
            id: batteryPercent
            anchors.top: parent.top
            anchors.topMargin: 11
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 13
            anchors.left: parent.left
            anchors.leftMargin: 20
            radius:2
            width:(batteryAmount)/100*26

            states: [
                State {
                    name: "over20"
                    when: (batteryAmount > 20)
                    PropertyChanges {
                        target: batteryPercent
                        color: "black"
                    }
                },
                State {
                    name: "below20"
                    when: (batteryAmount > 10 && batteryAmount < 20) || (batteryAmount == 20)
                    PropertyChanges {
                        target: batteryPercent
                        color: "yellow"
                    }
                },
                State {
                    name: "below10"
                    when: (batteryAmount < 10) || (batteryAmount == 10)
                    PropertyChanges {
                        target: batteryPercent
                        color: "red"
                    }
                }
            ]

        }
        background:  Rectangle {
            id: bg_battery
            clip: true;
            Image  {
                id: img_emptyBattery
                anchors.fill: parent;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit
                source: "file://Users/jeikong/Desktop/test2/Image/empty-battery.png"
            }

        }
        Image {
            id: img_charging
            anchors.centerIn: parent;
            width: 22
            height:25
            visible: isCharging
            fillMode: Image.PreserveAspectFit
            source: "file://Users/jeikong/Desktop/test2/Image/battery_charging.png"
            transform: Rotation { origin.x: 15; origin.y: 10; angle: 18}

        }




        MultiPointTouchArea {
            anchors.fill: parent;
            minimumTouchPoints: 1
            maximumTouchPoints: 1;
            onPressed: {
                showPopup = !showPopup
//                bg_battery.color = "lightgray"
                if (isCharging) {
                    batteryPopup_chargingO.open()
                } else {
                    batteryPopup_chargingX.open()
                }

            }
        }
        Popup {
            id: batteryPopup_chargingX
            x: parent.width - width
            y: parent.height
            height: 80
            width: 150
            visible: (!isCharging) && (showPopup)
            margins:5
            spacing: 10
            padding:5
            background: Rectangle {
                anchors.fill: parent
                radius: 5
                opacity: 0.4
                color: "lightgray"
            }
            Text {
                text: "Battery"
                anchors.top: parent.top
                anchors.topMargin: 12
                anchors.left: parent.left;
                anchors.leftMargin: 8
                font {
                    weight: Font.Bold
                    pixelSize: 12
                    family: "Roboto"
                }
                color: "black"
            }
            Text {
                text: batteryAmount + "%"
                anchors.top: parent.top
                anchors.topMargin: 12
                anchors.right: parent.right;
                anchors.rightMargin: 8
                color: "gray"
                font {
                    weight: Font.Medium
                    pixelSize: 12
                    family: "Roboto"
                }
            }
            Text {
                text: "Power Source: Battery"
                anchors.top: parent.top
                anchors.topMargin: 36
                anchors.left: parent.left;
                anchors.leftMargin: 8
                font {
                    weight: Font.Medium
                    pixelSize: 10
                    family: "Roboto"
                }
                color: "gray"
            }


        }
            Popup {
                id: batteryPopup_chargingO
                x: parent.width - width
                y: parent.height
                height: 100
                width: 200
                visible: (isCharging) && (showPopup)
                margins:5
                spacing: 10
                padding:5
                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    opacity: 0.4
                    color: "lightgray"
                }
                Text {
                    text: "Battery"
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    anchors.left: parent.left;
                    anchors.leftMargin: 8
                    font {
                        weight: Font.Bold
                        pixelSize: 12
                        family: "Roboto"
                    }
                    color: "black"
                }
                Text {
                    text: batteryAmount + "%"
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    anchors.right: parent.right;
                    anchors.rightMargin: 8
                    color: "gray"
                    font {
                        weight: Font.Medium
                        pixelSize: 12
                        family: "Roboto"
                    }
                }
                Text {
                    text: "Power Source: Power Adapter\n" + chargingTime + "m until fully charged"
                    anchors.top: parent.top
                    anchors.topMargin: 36
                    anchors.left: parent.left;
                    anchors.leftMargin: 8
                    font {
                        weight: Font.Medium
                        pixelSize: 10
                        family: "Roboto"
                    }
                    color: "gray"
                }


        }

    }




}
