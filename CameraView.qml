import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2

Item {
    Rectangle {
        id: frontCameraView
        visible: bt_frontCamera.highlighted && !bt_rearCamera.highlighted && !bt_bottomCamera.highlighted
        anchors.fill: parent;
        radius:5;
        color: "lightblue"
        Text {
            text: qsTr("Front Camera View")
            anchors.centerIn: parent;
        }
    }


    Rectangle {
        id: frontCameraView_half
        visible: (bt_frontCamera.highlighted && bt_rearCamera.highlighted && !bt_bottomCamera.highlighted) || (bt_frontCamera.highlighted && !bt_rearCamera.highlighted && bt_bottomCamera.highlighted)
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        width: parent.width/2;
        radius:5;
        color: "lightblue"
        Text {
            text: qsTr("Front Camera View")
            anchors.centerIn: parent;
        }
    }


    Rectangle {
        id: frontCameraView_quarter
        visible: bt_frontCamera.highlighted && bt_rearCamera.highlighted && bt_bottomCamera.highlighted
        anchors.top: parent.top;
        height: parent.height/2;
        anchors.left: parent.left;
        width: parent.width/2;
        radius:5;
        color: "lightblue"
        Text {
            text: qsTr("Front Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: rearCameraView
        visible: !bt_frontCamera.highlighted && bt_rearCamera.highlighted && !bt_bottomCamera.highlighted
        anchors.fill: parent;
        radius:5;
        color: "lightgreen"
        Text {
            text: qsTr("Rear Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: rearCameraView_half_right
        visible: bt_frontCamera.highlighted && bt_rearCamera.highlighted && !bt_bottomCamera.highlighted
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width: parent.width/2;
        radius:5;
        color: "lightgreen"
        Text {
            text: qsTr("Rear Camera View")
            anchors.centerIn: parent;
        }
    }


    Rectangle {
        id: rearCameraView_half_left
        visible: !bt_frontCamera.highlighted && bt_rearCamera.highlighted && bt_bottomCamera.highlighted
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        width: parent.width/2;
        radius:5;
        color: "lightgreen"
        Text {
            text: qsTr("Rear Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: rearCameraView_quarter
        visible: bt_frontCamera.highlighted && bt_rearCamera.highlighted && bt_bottomCamera.highlighted
        anchors.top: parent.top;
        height: parent.height/2;
        anchors.right: parent.right;
        width: parent.width/2;
        radius:5;
        color: "lightgreen"
        Text {
            text: qsTr("Rear Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: bottomCameraView
        visible: !bt_frontCamera.highlighted && !bt_rearCamera.highlighted && bt_bottomCamera.highlighted
        anchors.fill: parent;
        radius:5;
        color: "lightyellow"
        Text {
            text: qsTr("Bottom Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: bottomCameraView_half
        visible: (bt_frontCamera.highlighted && !bt_rearCamera.highlighted && bt_bottomCamera.highlighted) || (!bt_frontCamera.highlighted && bt_rearCamera.highlighted && bt_bottomCamera.highlighted)
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width: parent.width/2;
        radius:5;
        color: "lightyellow"
        Text {
            text: qsTr("Bottom Camera View")
            anchors.centerIn: parent;
        }
    }

    Rectangle {
        id: bottomCameraView_quarter
        visible: bt_frontCamera.highlighted && bt_rearCamera.highlighted && bt_bottomCamera.highlighted
        anchors.bottom: parent.bottom;
        height: parent.height/2;
        anchors.left: parent.left;
        width: parent.width;
        radius:5;
        color: "lightyellow"
        Text {
            text: qsTr("Bottom Camera View")
            anchors.centerIn: parent;
        }
    }

    Item {
        id: cameraViewSelection;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.margins: 30;
        width: 100;
        height:100;

        ColumnLayout {
            anchors.fill: parent;
            Button {
                id: bt_frontCamera
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillHeight: true;
                Layout.fillWidth: true;
//                highlighted: true;

                contentItem: Text {
                    text: "Front Camera"
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.AlignVCenter;
                    font {
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                background: Rectangle {
                    id: bg_fc
                    clip: true;
                    color: parent.down ? "gray" : parent.hovered ? "gray" : "lightgray"
                    radius:2
                    border.color: "gray"
                }

                onClicked: {
                    bt_frontCamera.highlighted = !bt_frontCamera.highlighted;
                    if (bt_frontCamera.highlighted) {
                        bg_fc.color = "gray"
                    } else {
                        bg_fc.color = "lightgray"
                    }
                }
            }

            Button {
                id: bt_rearCamera
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                highlighted: false

                contentItem: Text {
                    text: "Rear Camera"
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.AlignVCenter;
                    font {
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                background: Rectangle {
                    id: bg_rc
                    clip: true;
                    color: parent.down ? "gray" : parent.hovered ? "gray" : "lightgray"
                    radius:2
                    border.color: "gray"
                }
                onClicked: {
                    bt_rearCamera.highlighted = !bt_rearCamera.highlighted;
                    if (bt_rearCamera.highlighted) {
                        bg_rc.color = "gray"
                    } else {
                        bg_rc.color = "lightgray"
                    }
                }
            }

            Button {
                id: bt_bottomCamera
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                highlighted: false

                contentItem: Text {
                    text: "Bottom Camera"
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.AlignVCenter;
                    font {
                        pixelSize: 12
                        family: "Roboto"
                    }
                }

                background: Rectangle {
                    id: bg_bc
                    clip: true;
                    color: parent.down ? "gray" : parent.hovered ? "gray" : "lightgray"
                    radius:2
                    border.color: "gray"
                }
                onClicked: {
                    bt_bottomCamera.highlighted = !bt_bottomCamera.highlighted
                    if (bt_bottomCamera.highlighted) {
                        bg_bc.color = "gray"
                    } else {
                        bg_bc.color = "lightgray"
                    }
                }
            }
        }
    }
}
