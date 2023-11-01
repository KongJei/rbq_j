import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    property int wifiPercent : 80
    property bool wifiConnected: false

    Button {
        anchors.fill: parent;
        anchors.centerIn: parent;

        background: Rectangle {
            id: bg_wifi
            clip: true;
            Image {
                id: img_wifi
                anchors.fill: parent;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit
            }
            states: [
                State {
                    name: "wifiX"
                    when: !wifiConnected
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi off.png"
                    }
                },
                State {
                    name: "wifi0"
                    when: (wifiConnected) && (wifiPercent <20)
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi.png"
                    }
                },
                State {
                    name: "wifi1"
                    when: (wifiConnected) && ((wifiPercent >20 && wifiPercent <40) || (wifiPercent == 20))
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi.png"
                    }
                },
                State {
                    name: "wifi2"
                    when: (wifiConnected) && ((wifiPercent >40 && wifiPercent <60) || (wifiPercent == 40))
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi.png"
                    }
                },
                State {
                    name: "wifi3"
                    when: (wifiConnected) && ((wifiPercent >60 && wifiPercent <80) || (wifiPercent == 60))
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi.png"
                    }
                },
                State {
                    name: "wifi4"
                    when: (wifiConnected) && ((wifiPercent >80) || (wifiPercent == 80))
                    PropertyChanges {
                        target: img_wifi
                        source: "qrc:/Image/Wi-Fi.png"
                    }
                }
            ]
        }
    }
}
