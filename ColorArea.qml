import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2

Window {
    id: colorDialog
    title: qsTr("Wybierz kolor")
    property int colorIndex

    Rectangle {
        id: rectangle
        width: colorDialog.width
        height: colorDialog.height

        ListModel {
            id: colorModel
            ListElement { ralColor: "green" }
            ListElement { ralColor: "red" }
            ListElement { ralColor: "oragne" }
            ListElement { ralColor: "yellow" }
            ListElement { ralColor: "blue" }
            ListElement { ralColor: "white" }
            ListElement { ralColor: "lightgreen" }
            ListElement { ralColor: "gray" }
            ListElement { ralColor: "black" }
            ListElement { ralColor: "purple" }
            ListElement { ralColor: "green" }
            ListElement { ralColor: "red" }
            ListElement { ralColor: "oragne" }
            ListElement { ralColor: "yellow" }
            ListElement { ralColor: "blue" }
            ListElement { ralColor: "white" }
            ListElement { ralColor: "lightgreen" }
            ListElement { ralColor: "gray" }
            ListElement { ralColor: "black" }
            ListElement { ralColor: "purple" }
            ListElement { ralColor: "green" }
            ListElement { ralColor: "red" }
            ListElement { ralColor: "oragne" }
            ListElement { ralColor: "yellow" }
            ListElement { ralColor: "blue" }
            ListElement { ralColor: "white" }
            ListElement { ralColor: "lightgreen" }
            ListElement { ralColor: "gray" }
            ListElement { ralColor: "black" }
            ListElement { ralColor: "purple" }
        }

        GridView {
            id: gridColor
            anchors.fill: rectangle
            cellWidth: gridColor.width/4
            cellHeight: gridColor.height/4
            model: colorModel
            anchors.margins: 10
            delegate: Component {
                Item {
                    id: delegateColor
                    width: gridColor.cellWidth - 5
                    height: gridColor.cellHeight - 5
                    Rectangle {
                        id: colorRectangle
                        radius: 20
                        anchors.fill: delegateColor
                        color: ralColor
                        scale: mouseArea.pressed ? 0.6 : 1

                        MouseArea {
                            id: mouseArea
                            anchors.fill: colorRectangle
                            onClicked: optList.setColor( ralColor , colorIndex )
                    }
                }
            }

          }

        } // GridView

    } // Rectangle

} // Window
