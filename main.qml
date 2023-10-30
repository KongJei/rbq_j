import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import QtGraphicalEffects 1.15


ApplicationWindow{
    id: appWindow;
    visible: true
    height: 834;
    width: 1194;
    property bool isOpenSetting : false;
    property bool windowIndicator: true;
    property bool isInitialSetup: false;
    property bool isConnected: false;

    Item {
        id: topBar;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.left: parent.left;
        height: parent.height / 20;

        Rectangle {
            anchors.fill: parent;
            radius: 2;
            color: "transparent";
        }
        Item {
            id: dateClock
            height: parent.height;
            width: 100;
            anchors.top: parent.top;
            anchors.left: parent.left ;
            anchors.leftMargin: parent.width * 35/80;
            Label {
                id : currentDate
                anchors.fill: parent;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
                font {
                    weight: Font.DemiBold
                    pixelSize: 18
                    family: "Roboto"
                }
                color: "black"
            }
            Timer {
                running: true;
                repeat: true;
                triggeredOnStart: true;
                interval: 1000;
                onTriggered: {
                    var date = new Date();
                    currentDate.text = Qt.formatDate(date, "M/d/yy");
                }
            }
        }
        Item {
            id: timeClock;
            height: parent.height;
            width: 100;
            anchors.top: parent.top;
            anchors.left: parent.left ;
            anchors.leftMargin: parent.width * 42/80;
            Label {
                id: currentTime
                anchors.fill: parent;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
                font {
                    weight: Font.DemiBold
                    pixelSize: 18
                    family: "Roboto"
                }
                color: "black"
            }
            Timer {
                running: true;
                repeat: true;
                triggeredOnStart: true;
                interval: 1000;
                onTriggered: {
                    var time = new Date();
                    currentTime.text = Qt.formatTime(time, "hh:mm AP");
                }
            }
        }
        Button {
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.bottom: parent.bottom
            width: 45

            background: Rectangle {
                clip: true;
                color: parent.down ? "lightgray": parent.hovered ? "lightgray" : "transparent";

                Image {
                    id: bt_setting
                    anchors.fill: parent;

                    anchors.centerIn: parent;
                    fillMode: Image.PreserveAspectFit;
                }
            }
            onPressed: {
                settingWindow.visible = !settingWindow.visible;
                mainWindow.visible = !mainWindow.visible;
            }
            states : [
                State {
                    name : "MainWindow";
                    when: !settingWindow.visible;
                    PropertyChanges {
                        target: bt_setting
                        anchors.margins: 5;
                        source: "file:///Users/jeikong/Desktop/test2/Image/bt_setting.svg";
                    }
                },
                State {
                    name : "SettingWindow";
                    when: settingWindow.visible;
                    PropertyChanges {
                        target: bt_setting
                        anchors.leftMargin: -2
                        anchors.topMargin: -2
                        source: "file:///Users/jeikong/Desktop/test2/Image/bt_settingClose.svg"
                    }
                }
            ]
        }

        Item {

            id: connected
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 300
            width: 45

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    isConnected = !isConnected
                }
            }

            Image {
                id: img_connected
                anchors.fill: parent;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit
            }

            states: [
                State {
                    when : isConnected
                    PropertyChanges {
                        target: img_connected
                        source:"file://Users/jeikong/Desktop/test2/Image/iconizer-connect-44.svg"
                        anchors.margins: 5
                    }
                },
                State {
                    when: (!isConnected)
                    PropertyChanges {
                        target: img_connected
                        source: "file://Users/jeikong/Desktop/test2/Image/iconizer-disconnect.svg"
                    }
                }

            ]
        }

        Battery {
            id: gamepadBattery
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 230
            width: 70
        }

        Signal {
            id: gamepadSignal
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 210
            width: 22
        }

        Wifi {
            id: gamepadWifi
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 165
            width: 30
        }

    }


    Item {
        id: mainWindow;
        visible: true;
        anchors.top: topBar.bottom;
        anchors.bottom: toolBar.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 1

        MouseArea {
            anchors.fill: parent;
            onDoubleClicked: {
                if (windowIndicator) {
                    firstWindow.visible = false;
                    secondWindow.visible = true;
                    windowIndicator = false;
                } else {
                    firstWindow.visible = true;
                    secondWindow.visible = false;
                    windowIndicator = true;
                }
            }
        }


        Item {
            id: firstWindow
            visible: true;
            anchors.fill: parent;
            CameraView {
                id: smallCameraView
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                anchors.right: parent.right;
                width: parent.width*0.65 - 0.5;
            }

            Item {
                id: rbq3DModel
                anchors.top: parent.top;
                anchors.left: parent.left;
                height: parent.height *0.7 ;
                width: parent.width *0.35 - 0.5;
//                Rectangle {
//                    anchors.fill: parent;
//                    radius:5
//                    border.color: "lightgray"
//                }


                Rectangle {
                    id: rbq
                    anchors.bottom: parent.bottom;
                    anchors.bottomMargin: 80;
                    anchors.left: parent.left;
                    anchors.right: parent.right;
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20;
                    height: 250;

                    Image {
                        id: img_rbq
                        anchors.fill: parent;
                        fillMode: Image.PreserveAspectFit;
                        source: "file://Users/jeikong/Desktop/test2/Image/rbq.png"
                        opacity: 0.2
                    }

                }

                Rectangle {
                    anchors.top: parent.top;
                    anchors.topMargin: 50;
                    height: parent.height/10;
                    anchors.right: parent.right;
                    anchors.left: parent.left;
                    Label {
                        id: label_rbq3dmodel
                        text: qsTr("RBQ");
                        font {
                            weight: Font.Bold
                            pixelSize: 25
                            family: "Roboto"
                        }
                        color: "black"
                        opacity: 0.3
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.AlignVCenter;
                        anchors.centerIn: parent;
                    }
                }




            }

            Item {
                id: actionBox


                anchors.top: rbq3DModel.bottom;
                anchors.bottom: parent.bottom;
                anchors.left: parent.left;
                width: rbq3DModel.width - 0.5;


                Rectangle {
                    anchors.fill: parent;
                    radius:5;
                    color: "lightgray";
                }

                Button {
                    id: bt_mc
                    anchors.top: parent.top;
                    anchors.bottom: parent.bottom;
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    width:100
                    states: [
                        State {
                            when: !isConnected
                            PropertyChanges {
                                target: bt_mc
                                opacity: 0.3
                            }
                        },
                        State {
                            when: isConnected
                            PropertyChanges {
                                target: bt_mc
                                opacity: 1
                            }
                        }

                    ]

                    contentItem: Text {
                        text: "Motor Check"
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.Bottom;
                        anchors.top: parent.top
                        anchors.topMargin: 95;
                        anchors.left: parent.left;
                        anchors.leftMargin: 8;
                        font {
                            weight: Font.DemiBold;
                            pixelSize: 10
                            family: "Roboto"
                        }
                    }
                    background: Rectangle {
                        id: bg_mc
                        clip: true;
                        color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                        radius: 4
                        border.color: "gray"
                        border.width: 1.25

                        Image {
                            anchors.top: parent.top;
                            anchors.topMargin: 39;
                            height: 54;
                            anchors.right: parent.right;
                            anchors.left: parent.left;
                            fillMode: Image.PreserveAspectFit;
                            source: "file://Users/jeikong/Desktop/test2/Image/dc-motor.svg"
                        }

                    }
                    onClicked: {
                        bt_mc.highlighted = true;
                        bg_mc.color = "gray";
                        bt_fh.opacity = 1;
                        bg_mc.border.color = "black"
                    }
                }

                Button {
                    id: bt_fh
                    opacity: 0.3
                    anchors.top: parent.top;
                    anchors.bottom: parent.bottom;
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.left: bt_mc.right;

                    width:100

                    contentItem: Text {
                        text: "Find Home"
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.Bottom;
                        anchors.top: parent.top
                        anchors.topMargin: 95;
                        anchors.left: parent.left;
                        anchors.leftMargin: 8;
                        font {
                            weight: Font.DemiBold;
                            pixelSize: 10
                            family: "Roboto"
                        }

                    }
                    background: Rectangle {
                        id: bg_fh
                        clip: true;
                        color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                        radius: 4
                        border.color: "gray"
                        border.width: 1.25

                        Image {
                            anchors.top: parent.top;
                            anchors.topMargin: 47;
                            height: 40;
                            anchors.right: parent.right;
                            anchors.left: parent.left;
                            fillMode: Image.PreserveAspectFit;
                            source: "file://Users/jeikong/Desktop/test2/Image/house-search.png"
                        }

                    }
                    onClicked: {
                        bt_fh.highlighted = true;
                        bt_dc.opacity = 1;
                        bg_fh.color = "gray"
                        bg_fh.border.color = "black"
                    }
                }

                Button {
                    id: bt_dc
                    opacity: 0.3
                    anchors.top: parent.top;
                    anchors.bottom: parent.bottom;
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.left: bt_fh.right;
                    width:100

                    contentItem: Text {
                        text: "DQ Check"
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.Bottom;
                        anchors.top: parent.top
                        anchors.topMargin: 95;
                        anchors.left: parent.left;
                        anchors.leftMargin: 8;
                        font {
                            weight: Font.DemiBold;
                            pixelSize: 10
                            family: "Roboto"
                        }
                    }
                    background: Rectangle {
                        id: bg_dc
                        clip: true;
                        color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                        radius: 4
                        border.color: "gray"
                        border.width: 1.25

                        Image {
                            anchors.top: parent.top;
                            anchors.topMargin: 39;
                            height: 54;
                            anchors.right: parent.right;
                            anchors.left: parent.left;
                            fillMode: Image.PreserveAspectFit;
                            source: "file://Users/jeikong/Desktop/test2/Image/dc-motor.svg"
                        }

                    }
                    onClicked: {
                        bt_dc.highlighted = true;
                        bt_s.opacity = 1;
                        bg_dc.color = "gray"
                        bg_dc.border.color = "black"
                    }

                }

                Button {
                    id: bt_s
                    anchors.top: parent.top;
                    anchors.bottom: parent.bottom;
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.left: bt_dc.right;
                    width:100
                    opacity: 0.3


                    contentItem: Text {
                        text: "Start"
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.Bottom;
                        anchors.top: parent.top
                        anchors.topMargin: 95;
                        anchors.left: parent.left;
                        anchors.leftMargin: 8;
                        font {
                            weight: Font.DemiBold;
                            pixelSize: 10
                            family: "Roboto"
                        }
                    }
                    background: Rectangle {
                        id: bg_s
                        clip: true;
                        color: parent.down? "gray" : parent.hovered ? "gray" : "lightgray";
                        radius: 4
                        border.color: "gray"
                        border.width: 1.25

                        Image {
                            anchors.top: parent.top;
                            anchors.topMargin: 47;
                            height: 40;
                            anchors.right: parent.right;
                            anchors.left: parent.left;
                            fillMode: Image.PreserveAspectFit;
                            source: "file://Users/jeikong/Desktop/test2/Image/noun-dog-robot-4314972 (1).png"
                        }

                    }
                    onClicked: {
                        bt_s.highlighted = true;
                        bg_s.color = "gray"
                        bg_s.border.color = "black"
                        isInitialSetup = true;
                        label_rbq3dmodel.opacity = 1;
                        img_rbq.opacity = 1;
                    }
                }
            }

        }

        Item {
            id: secondWindow
            visible: false;
            anchors.fill: parent;
            CameraView {
                id: largeCameraView
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                anchors.right: parent.right;
                anchors.left:actionLeftBar.right;
            }
            Item {
                id: actionLeftBar
                anchors.top: parent.top;
                anchors.bottom: parent.bottom;
                anchors.left: parent.left;
                width: parent.width/15;

                Rectangle {
                    anchors.fill: parent;
                    radius:5;
                    color: "black"
                }
            }
        }


    }

    Item {
        id: toolBar
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        height: parent.height /10;
        anchors.leftMargin: 1
        anchors.rightMargin: 1

        Rectangle {
            id: rect_tB
            anchors.fill: parent;
            radius:5;
            color:"#001a33";
        }
        Switch {
            id: batteryChargingSwitch
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left
            anchors.leftMargin: 500
            Component.onCompleted: {
                checked = false;
            }
        }

        Slider {
            id: batterySlider
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 800
            wheelEnabled: true;
            snapMode: RangeSlider.NoSnap;
            from:0; to:100; value:10;
            handle.implicitHeight: 25
            handle.implicitWidth: 25
            Component.onCompleted: {
                value = 50;
            }
        }

        Button {
            id: bt_arm
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            anchors.leftMargin: 5
            width: 80

            background: Rectangle {
                id: bg_arm
                clip: true;
                color: parent.down ? "#0598ce" : parent.hovered ? "#0598ce" : rect_tB.color
                radius:2;
                Image {
                    anchors.fill: parent;
                    anchors.margins: 10
                    anchors.centerIn: parent;
                    fillMode: Image.PreserveAspectFit;
                    source:"file://Users/jeikong/Desktop/test2/Image/robotic-arm.png"
                }
            }
            onClicked: {
                bg_arm.color = "#0598ce"
                label_rbq3dmodel.text = "RBQ Arm"
                img_rbq.source = "file://Users/jeikong/Desktop/test2/Image/rbqarm.png"
            }
        }
        Button {
            id: bt_grenade
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: bt_arm.right;
            anchors.leftMargin: 5
            width: 80

            background: Rectangle {
                clip: true;
                color: parent.down ? "#0598ce" : parent.hovered ? "#0598ce" : rect_tB.color
                radius:2;
                Image {
                    anchors.fill: parent;
                    anchors.margins: 10
                    anchors.centerIn: parent;
                    fillMode: Image.PreserveAspectFit;
                    source:"file://Users/jeikong/Desktop/test2/Image/pngwing.com.png"
                }
            }
        }
        Button {
            id: bt_gun
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: bt_grenade.right;
            anchors.leftMargin: 5
            width: 80

            background: Rectangle {
                clip: true;
                color: parent.down ? "#0598ce" : parent.hovered ? "#0598ce" : rect_tB.color
                radius:2;
                Image {
                    anchors.fill: parent;
                    anchors.margins: 10
                    anchors.centerIn: parent;
                    fillMode: Image.PreserveAspectFit;
                    source:"file://Users/jeikong/Desktop/test2/Image/Gun.png"
                }
            }
        }

    }

    Setting {
        id: settingWindow
        visible: false;
        anchors.top: topBar.bottom;
        anchors.bottom: toolBar.top;
        anchors.left: parent.left;
        width: parent.width;
    }
}
