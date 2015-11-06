import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {    

    id: imageCircle
    property Gradient circleColor

    Rectangle {
         id: circle
         anchors.fill: imageCircle
         width: imageCircle.width
         height: imageCircle.height
         color: "#464646"
         radius: width*0.5
         antialiasing: true

         Rectangle {
             id: insideCircle
             height: circle.width - 4
             width: height
             anchors.verticalCenter: circle.verticalCenter
             anchors.horizontalCenter: circle.horizontalCenter
             gradient: circleColor
             radius: circle.radius
         }
    }

    DropShadow {
        anchors.fill: circle
        horizontalOffset: 0
        verticalOffset: 1
        radius: 1
        samples: 16
        color: "white"
        source: circle
    }

}

