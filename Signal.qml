import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    property int signalPercent : 80

    Button {
        anchors.fill: parent;
        anchors.centerIn: parent;

        background: Rectangle {
            id: bg_signal
            clip: true;
            Image {
                id: img_signal
                anchors.fill: parent;
                anchors.centerIn: parent;
                fillMode: Image.PreserveAspectFit
            }
            states: [
                State {
                    name: "signal0"
                    when: (signalPercent <20)
                    PropertyChanges {
                        target: img_signal
                        source: "file://Users/jeikong/Desktop/test2/Image/signal_0.svg"
                    }
                },
                State {
                    name: "signal1"
                    when: (signalPercent >20 && signalPercent <40) || (signalPercent == 20)
                    PropertyChanges {
                        target: img_signal
                        source: "file://Users/jeikong/Desktop/test2/Image/signal_1.svg"
                    }
                },
                State {
                    name: "signal2"
                    when: (signalPercent >40 && signalPercent <60) || (signalPercent == 40)
                    PropertyChanges {
                        target: img_signal
                        source: "file://Users/jeikong/Desktop/test2/Image/signal_2.svg"
                    }
                },
                State {
                    name: "signal3"
                    when: (signalPercent >60 && signalPercent <80) || (signalPercent == 60)
                    PropertyChanges {
                        target: img_signal
                        source: "file://Users/jeikong/Desktop/test2/Image/signal_3.svg"
                    }
                },
                State {
                    name: "signal4"
                    when: (signalPercent >80) || (signalPercent == 80)
                    PropertyChanges {
                        target: img_signal
                        source: "file://Users/jeikong/Desktop/test2/Image/signal_4.svg"
                    }
                }
            ]
        }
    }
}
