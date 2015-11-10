import QtQuick 2.0
import QtGraphicalEffects 1.0


Item {
    id: imageArrow
    width: 50
    height: 50
    property string imagePath
    property string arrowDirection
    z: 1

    Rectangle {
        id: rectangle
        anchors.fill: imageArrow
        color: "transparent"
        opacity: .7

        Image {
            id: arrowImage
            anchors.fill: rectangle
            opacity: mouseArea.pressed  ? .3 : 1
            source: imagePath

            MouseArea {
                id: mouseArea
                anchors.fill:parent
                onClicked: {
                    if ( arrowDirection == "left") listView.decrementCurrentIndex()
                    else listView.incrementCurrentIndex()
                    imageState.setColor()
                }
            }
        }

    } // Rectangle

    DropShadow {
        anchors.fill: rectangle
        horizontalOffset: 1
        verticalOffset: 1
        radius: 2
        samples: 16
        color: "#80000000"
        source: rectangle
    }

} // Item


