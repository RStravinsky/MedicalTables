import QtQuick 2.0

Item {

    id: imageState
    z: 1

    property Gradient lightBlueGradient : lightBlueGradientItem
    Gradient {
        id: lightBlueGradientItem
        GradientStop { color: "#BEDC8F"; position: .0 }
        GradientStop { color: "#84BF4E"; position: .5 }
        GradientStop { color: "#BEDC8F"; position: 1 }
    }

    property Gradient transparentGradient : transparentGradient
    Gradient {
        id: transparentGradient
        GradientStop { color: "transparent"; position: 1.0 }

    }

    function clearColor() {
        circleOne.circleColor = transparentGradient
        circleTwo.circleColor = transparentGradient
        circleThree.circleColor = transparentGradient
        circleFour.circleColor = transparentGradient
    }

    function setColor(){
        clearColor()
        if(listView.currentIndex == 0) circleOne.circleColor = lightBlueGradientItem
        if(listView.currentIndex == 1) circleTwo.circleColor = lightBlueGradientItem
        if(listView.currentIndex == 2) circleThree.circleColor = lightBlueGradientItem
        if(listView.currentIndex == 3) circleFour.circleColor = lightBlueGradientItem
    }

    Rectangle {
        id: statusRectangle
        z: 1
        anchors.fill: imageState
        radius: 10
        color: "gray"

        Row {
            id: row
            anchors.centerIn: parent
            anchors.margins: 10
            spacing: 10
            ImageCircle { id: circleOne; circleColor: lightBlueGradientItem; width: imageState.width/10; height: width }
            ImageCircle { id: circleTwo; circleColor: transparentGradient; width: imageState.width/10; height: width }
            ImageCircle { id: circleThree; circleColor: transparentGradient; width: imageState.width/10; height: width }
            ImageCircle { id: circleFour ; circleColor: transparentGradient; width: imageState.width/10; height: width }
        }

    }

}

