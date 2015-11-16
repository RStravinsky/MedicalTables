import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Component {

    Item {
        id: gridDelegate
        width: gridView.cellWidth
        height: gridView.cellHeight
        z: -1

        Rectangle {
            id: rectangle
            anchors.centerIn: gridDelegate
            width: gridDelegate.width - 10
            height: gridDelegate.width - 10
            color: tableColor
            radius: 10

            Text {
                anchors.centerIn: rectangle
                text: tableText
                font { family: "Arial"; pixelSize: rectangle.height/10 }
            }

            Image {
                id: itemImage
                source: imagePath
                anchors.fill: rectangle
                smooth: true
                opacity: 0.2
                state: imageState

                MouseArea {
                    id: mouseArea;
                    anchors.fill: itemImage
                    hoverEnabled: true
                    onClicked: {
                        if(animationActive == true) {
                            checkedAnimation.start()
                            if ( index < 13 ) {
                                itemImage.state == "CHECKED" ? itemImage.state = "UNCHECKED" : itemImage.state = "CHECKED"
                                optList.onItemClicked( index, itemImage.state )
                            }
                            else if ( index != 13) {
                                colorArea.visible = true
                                colorArea.colorIndex = index
                            }
                        }
                    }

                    onEntered: if(animationActive == true) {
                                   gridDelegate.z = 1
                                   enteringAnimation.start()
                               }
                    onExited:  if(animationActive == true) {
                                   gridDelegate.z = -1
                                   exitingAnimation.start()
                               }
                }

                NumberAnimation {
                    id: checkedAnimation
                    target: rectangle
                    property: "scale"
                    from: 0.4
                    to: 1.3
                    duration: 50
                    easing.type: Easing.OutSine
                }

                NumberAnimation {
                    id: enteringAnimation
                    target: rectangle
                    property: "scale"
                    from: 1
                    to: 1.3
                    duration: 100
                    easing.type: Easing.Linear
                }

                NumberAnimation {
                    id: exitingAnimation
                    target: rectangle
                    property: "scale"
                    from: 1.3
                    to: 1
                    duration: 100
                    easing.type: Easing.Linear
                }

                states: [
                    State {
                        name: "CHECKED"
                        PropertyChanges {
                            target: itemImage
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "UNCHECKED"
                        PropertyChanges {
                            target: itemImage
                            opacity: 0.2
                        }
                    }
                ]

            } // Image

        } // Rectangle

    } // Item

} // Component
