import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Item {

    Item {
        id: settingMenuButtons;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        width: parent.width /3.5;

        Rectangle{
            anchors.fill: parent;
            color: "gray"
            radius: 5;
        }

        Button {
            id: bt_settingGamepad;
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right;
            height: 50;
            anchors.leftMargin: 5;
            anchors.rightMargin: 5;
            anchors.topMargin: 5;
            anchors.bottomMargin: 2.5;

            background: Rectangle {
                id: bg_gameController
                clip: true;
                color: parent.down? "white" : parent.hovered ? "white":"gray";
                radius: 5;
            }

            Image {
                id: img_gameController
                anchors.left: parent.left;
                anchors.leftMargin: 40
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                width: 28;
                fillMode: Image.PreserveAspectFit;
                source: "qrc:/Image/game_controller.svg"
            }
            contentItem: Text {
                text: "Gamepad"
                horizontalAlignment: Text.AlignLeft;
                verticalAlignment: Text.AlignVCenter;
                leftPadding: 75;
                font {
                    weight: Font.Medium
                    pixelSize: 18
                    family: "Roboto"
                }
            }

            onClicked: {
                bt_settingGamepad.highlighted = true;
                bt_settingVision.highlighted = false;
            }
        }

        Button {
            id: bt_settingVision;
            anchors.top: bt_settingGamepad.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            height: 50;
            anchors.leftMargin: 5;
            anchors.rightMargin: 5;
            anchors.topMargin: 5;
            anchors.bottomMargin: 2.5;

            background: Rectangle {
                id: bg_vision
                clip: true;
                color: parent.down? "white" : parent.hovered ? "white":"gray";
                radius: 5;
            }

            Image {
                id: img_vision
                anchors.left: parent.left;
                anchors.leftMargin: 38
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                width: 32;
                fillMode: Image.PreserveAspectFit;
                source: "qrc:/Image/vision.png"
            }
            contentItem: Text {
                text: "Vision"
                horizontalAlignment: Text.AlignLeft;
                verticalAlignment: Text.AlignVCenter;
                leftPadding: 75;
                font {
                    weight: Font.Medium
                    pixelSize: 18
                    family: "Roboto"
                }
            }

            onClicked: {
                bt_settingGamepad.highlighted = false;
                bt_settingVision.highlighted = true;
            }
        }
    }

    Item {
        id: settingMenuWindow
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: settingMenuButtons.right;
        anchors.right: parent.right;

        Rectangle {
            anchors.fill: parent;
            color: "lightgray"
        }

        Item {
            id: w_settingGamepad;
            visible: bt_settingGamepad.highlighted;
            anchors.fill: parent;

            Label {
                id: label_gamepadControl
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
                text: qsTr("Joystick")
                font {
                    weight: Font.Bold
                    pixelSize: 16
                    family: "Roboto"
                }
            }

            Button {
                id: bt_gamepadHandler
                anchors.top: label_gamepadControl.bottom;
                anchors.left: label_gamepadControl.left;
                anchors.topMargin: 20
                height: 80
                width: 120

                contentItem: Text {
                    id: text_gj
                    text: "Gamepad Joystick"
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.Bottom;
                    anchors.top: parent.top;
                    anchors.topMargin: 50;
                    height: 10

                    font {
                        weight: Font.Medium
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                background: Rectangle {
                    id:  bg_gph
                    clip: true;
                    color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                    radius: 16
                    border.color: "gray"

                    Image {
                        anchors.top: parent.top;
                        anchors.topMargin: 10;
                        height: 40;
                        anchors.right: parent.right;
                        anchors.left: parent.left;
                        fillMode: Image.PreserveAspectFit;
                        source: "qrc:/Image/game-controller.svg"
                    }

                }
                onClicked: {
                    bt_gamepadHandler.highlighted = true;
                    bt_virtualJoystick.highlighted = false;
                    bg_gph.color = "gray"
                    bg_vj.color = "lightgray"
                }
            }

            Button {
                id: bt_virtualJoystick
                anchors.top: bt_gamepadHandler.top;
                anchors.left: bt_gamepadHandler.right;
                anchors.leftMargin: 20
                height: 80
                width: 120

                contentItem: Text {
                    id: text_vj
                    text: "Virtual Joystick"
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.Bottom;
                    anchors.top: parent.top;
                    anchors.topMargin: 50;
                    height: 10

                    font {
                        weight: Font.Medium
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                background: Rectangle {
                    id: bg_vj
                    clip: true;
                    color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                    radius: 16
                    border.color: "gray"

                    Image {
                        anchors.top: parent.top;
                        anchors.topMargin: 12;
                        height: 28;
                        anchors.right: parent.right;
                        anchors.left: parent.left;
                        fillMode: Image.PreserveAspectFit;
                        source: "qrc:/Image/move-button.png"
                    }

                }
                onClicked: {
                    bt_gamepadHandler.highlighted = false;
                    bt_virtualJoystick.highlighted = true;
                    bg_vj.color = "gray"
                    bg_gph.color = "lightgray"
                }

            }

            Label {
                id: label_gamepadFreq
                anchors.left: label_gamepadControl.left;
                anchors.top: bt_gamepadHandler.bottom;
                anchors.topMargin: 40;
                text: qsTr("Gamepad Frequency")
                font {
                    weight: Font.Bold
                    pixelSize: 16
                    family: "Roboto"
                }
            }

            Slider {
                id: sd_gamepadFreq
                anchors.top: label_gamepadFreq.bottom
                anchors.left: label_gamepadFreq.left;
                anchors.topMargin: 10;
                wheelEnabled: true;
                snapMode: RangeSlider.NoSnap;
                from:0; to:100; value: 40;
                handle.implicitHeight: 25
                handle.implicitWidth: 25;
//                style : SliderStyle {
//                    groove: Rectangle {
//                        implicitWidth: 200
//                        implicitHeight: 8
//                        color: "gray"
//                        radius: 8
//                    }
//                    handle: Rectangle {
//                        anchors.centerIn: parent
//                        color: control.pressed ? "white" : "lightgray"
//                        border.color: "gray"
//                        border.width: 2
//                        implicitWidth: 34
//                        implicitHeight: 34
//                        radius: 12
//                    }
//                }

                Component.onCompleted: {
                    value = 20;
                }

            }
        }

        Item {
            id: w_settingVision
            visible: bt_settingVision.highlighted;
            anchors.fill: parent;

            Switch {
                id: visionPcPowerSwitch
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
                Label {
                    text: "Vision PC Power"
                    anchors.top: parent.top
                    anchors.topMargin: 11
                    anchors.left: parent.left
                    anchors.leftMargin: 80
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font {
                        weight: Font.Medium
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                Component.onCompleted: {
                    checked = true;
                }
            }

            Switch {
                id: cameraPowerSwitch
                anchors.top: visionPcPowerSwitch.bottom
                anchors.topMargin: 20
                anchors.left: visionPcPowerSwitch.left
                Label {
                    text: "Camera Power"
                    anchors.top: parent.top
                    anchors.topMargin: 11
                    anchors.left: parent.left
                    anchors.leftMargin: 80
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font {
                        weight: Font.Medium
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                Component.onCompleted: {
                    checked = true;
                }
            }
        }

    }
}
