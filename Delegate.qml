import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0


Component {
    id: optionsDelegate

    Item {
        property alias itemImage : itemImage
        id: wrapper
        width: grid.cellWidth
        height: grid.cellHeight
        z: -1

        Rectangle
        {
            id: itemRectangle
            anchors.centerIn: wrapper
            width: wrapper.width - 10
            height: wrapper.width - 10
            color: tableColor
            radius: 10

        Image {
            id: itemImage
            source: imagePath
            anchors.fill: parent
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
                            grid.currentIndex = index
                            optList.itemClicked(grid.currentIndex)
                        }
                    }
                }

                onEntered: if(animationActive == true)
                           {
                               wrapper.z = 1
                               enteringAnimation.start()
                           }
                onExited:  if(animationActive == true)
                           {
                               wrapper.z = -1
                               exitingAnimation.start()
                           }
            }

            NumberAnimation {
                id: checkedAnimation
                target: itemImage
                property: "scale"
                from: 0.4
                to: 1.3
                duration: 50
                easing.type: Easing.OutSine
            }

            NumberAnimation {
                id: enteringAnimation
                target: itemImage
                property: "scale"
                from: 1
                to: 1.3
                duration: 100
                easing.type: Easing.Linear
            }

            NumberAnimation {
                id: exitingAnimation
                target: itemImage
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

        } // image

        }

    } // item

} // component
