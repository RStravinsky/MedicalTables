import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    id: container
    property string bName
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height

    Rectangle {
                id: mainRectangle
                anchors.fill: parent
                color: "lightblue"
                border.color: "transparent"
                border.width: 4
                radius: 30
                smooth: true

          Rectangle {

                  id:rectangle
                  anchors.centerIn: parent
                  width: parent.width - parent.border.width
                  height: parent.height - parent.border.width
                  radius:parent.radius - parent.border.width/2
                  smooth: true

                  border.width: parent.border.width/2
                  border.color: "#22FFFFFF"

                  gradient: Gradient {
                      GradientStop { position: 0;    color: "#88FFFFFF" }
                      GradientStop { position: .1;   color: "#55FFFFFF" }
                      GradientStop { position: .5;   color: "#33FFFFFF" }
                      GradientStop { position: .501; color: "#11000000" }
                      GradientStop { position: .8;   color: "#11FFFFFF" }
                      GradientStop { position: 1;    color: "#55FFFFFF" }
                  }

                Row {
                    spacing: 2
                    anchors.fill: rectangle
                    anchors.margins: 5

                    Image {
                        id: title;
                        width: (rectangle.width/2 - 10);
                        height: (rectangle.height - 10);
                        opacity: 0.5
                    }
                    Image {
                        id: table;
                        width: (rectangle.width/2 - 10);
                        height: (rectangle.height - 10);
                        opacity: 1
                        antialiasing: true
                    }
                }

                MouseArea {
                    id: mouseArea;
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: rectangle.state = "ENTERED"
                    onExited: rectangle.state = "EXITED"
                    onClicked: {

                        clickedAnimation.start()
                        optList.mainButtonClicked(container.bName)
                        optList.setItemsList(bName)
                        mainImageRectangle.visible = true
                        logoNoxi.visible = false
                        logoMove.visible = false
                        glowMove.visible = false
                        glowNoxi.visible = false
                        if ( bName == "T2")
                        {
                            imageT2.visible = true
                            imageT3.visible = false
                            imageT7.visible = false
                        }

                        if ( bName == "T3")
                        {
                            imageT2.visible = false
                            imageT3.visible = true
                            imageT7.visible = false
                        }

                        if ( bName == "T7")
                        {
                            imageT2.visible = false
                            imageT3.visible = false
                            imageT7.visible = true
                        }
                        grid.visible = true
                    }
                }

                ParallelAnimation {

                    id: clickedAnimation
                    NumberAnimation{
                        id:scaleAnimation
                        target: mainRectangle
                        property: "scale"
                        from: 0
                        to: 1
                        duration: 300
                        easing.type: Easing.InCirc
                    }

                    NumberAnimation {
                        id:numberAnim
                        target: mainRectangle
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 300
                        easing.type: Easing.OutSine
                    }
                }

                states: [
                    State {
                        name: "ENTERED"
                        PropertyChanges {
                            target: mainRectangle
                            border.color: "gray"
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "EXITED"
                        PropertyChanges {
                            target: mainRectangle
                            border.color: "transparent"
                            opacity: 1.0
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: "EXITED"
                        to: "ENTERED"
                        ColorAnimation {
                            target: mainRectangle.border
                            duration: 1000
                        }
                    },
                    Transition {
                        from: "ENTERED"
                        to: "EXITED"
                        ColorAnimation {
                            target: mainRectangle.border
                            duration: 1000
                        }
                    }
                ]
    }
}

}
