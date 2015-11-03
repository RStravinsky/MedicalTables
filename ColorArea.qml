import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3

Item
{
    Rectangle
    {
        id: colorArea
        anchors.fill: parent
        color: "white"

        Rectangle {
            id: topColor
            height: width
            width: colorArea.width/9
            color: "transparent"
            border.width: 5
            border.color: "lightgray"
            anchors {
                left: colorArea.left
                top: colorArea.top
                bottom: colorArea.bottom
                margins: 20
            }

            Rectangle {
                anchors.centerIn: topColor
                width: topColor.width - 10
                height: topColor.height - 10
                radius: topColor.radius - topColor.border.width/2

                gradient: Gradient {
                    GradientStop { position: 0;    color: "#88FFFFFF" }
                    GradientStop { position: .1;   color: "#55FFFFFF" }
                    GradientStop { position: .5;   color: "#33FFFFFF" }
                    GradientStop { position: .501; color: "#11000000" }
                    GradientStop { position: .8;   color: "#11FFFFFF" }
                    GradientStop { position: 1;    color: "#55FFFFFF" }
                }
            }
        }

        Image {
            id: tableTop
            anchors.left: topColor.right
            anchors.leftMargin: 20
            height: colorArea.height
            width: colorArea.width/3
            source: "/images/images/tableColor.png"
            visible: true
        }

        Rectangle {
            id: bottomColor
            height: width
            width: colorArea.width/9
            color: "white"
            border.width: 5
            border.color: "lightgray"
            anchors {
                left: tableTop.right
                top: colorArea.top
                bottom: colorArea.bottom
                margins: 20
            }

            Rectangle {
                anchors.centerIn: bottomColor
                width: bottomColor.width - 10
                height: bottomColor.height - 10
                radius: bottomColor.radius - bottomColor.border.width/2

                gradient: Gradient {
                    GradientStop { position: 0;    color: "#88FFFFFF" }
                    GradientStop { position: .1;   color: "#55FFFFFF" }
                    GradientStop { position: .5;   color: "#33FFFFFF" }
                    GradientStop { position: .501; color: "#11000000" }
                    GradientStop { position: .8;   color: "#11FFFFFF" }
                    GradientStop { position: 1;    color: "#55FFFFFF" }
                }
            }
        }

        Image {
            id: tableBottom
            anchors.left: bottomColor.right
            anchors.leftMargin: 20
            height: colorArea.height
            width: colorArea.width/3
            source: "/images/images/frameColor.png"
            visible: true
        }
    }
}
