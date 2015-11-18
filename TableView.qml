import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Window {
    id: colorDialog
    onClosing: {
        gridColor.positionViewAtBeginning()
        lineEdit.clearTextField()
    }
    title: qsTr("Wybierz kolor")
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width

    property int colorIndex

    Rectangle {
        id: rectangle
        width: colorDialog.width
        height: colorDialog.height
        color: "transparent"

        Image{
            anchors.fill: parent;
            source: "/images/images/background.jpg"
        }

        TextField {
            function clearTextField() { height = 0; text = ""; visible = false }
            id: lineEdit
            width: rectangle.width - 20
            visible: false
            height: 0
            anchors { top: rectangle.top; margins: 10; horizontalCenter: parent.horizontalCenter }
            placeholderText: "Wpisz numer koloru"
            font { family: "Arial"; pointSize: 10 }
            z: 1
            focus: true
            style: TextFieldStyle {
                   background: Rectangle {
                       radius: 10
                       border.color: "gray"
                       border.width: 2
                   }
               }

            Image {
                id: clearText
                anchors { right: lineEdit.right; margins: 1; verticalCenter: parent.verticalCenter }
                source: "/images/images/clear.png"
                smooth: true
                visible: lineEdit.text
                height: lineEdit.height
                width: height

                MouseArea {
                    id: clear
                    anchors.fill: clearText
                    height: clearText.height; width: clearText.height
                    onClicked: {
                        lineEdit.text = ""
                        lineEdit.forceActiveFocus()
                    }
                }
            }

            Image {
                id: acceptText
                anchors { right: clearText.left; margins: 1; verticalCenter: parent.verticalCenter }
                source: "/images/images/check.png"
                smooth: true
                visible: lineEdit.text
                height: lineEdit.height
                width: height

                MouseArea {
                    id: accept
                    anchors.fill: acceptText
                    height: acceptText.height; width: acceptText.height
                    onClicked: {
                        optList.setColor( "white" , colorIndex )
                        optList.setText( lineEdit.text , colorIndex )
                    }
                }
            }

            Keys.onReturnPressed: {
                optList.setColor( "white" , colorIndex )
                optList.setText( lineEdit.text  , colorIndex )
                clearTextField()
            }

            Keys.onEscapePressed: clearTextField()
        }

        Rectangle {
            id: gridRectangle
            anchors.fill: rectangle
            color: "transparent"

            ListModel {
                id: topModel
                ListElement {ralColor: "transparent"; number: ""  }
                ListElement { ralColor: "#F0B480"; number: "1004" }
                ListElement { ralColor: "#FD8C24"; number: "1017" }
                ListElement { ralColor: "#F7A60E"; number: "1089" }
                ListElement { ralColor: "#F3E9D1"; number: "1044" }
                ListElement { ralColor: "#EEF1D3"; number: "1118" }
                ListElement { ralColor: "#F8E100"; number: "1123" }
                ListElement { ralColor: "#FBEE9E"; number: "1210" }
                ListElement { ralColor: "#C91617"; number: "3022" }
                ListElement { ralColor: "#CF3887"; number: "3036" }
                ListElement { ralColor: "#852720"; number: "3096" }
                ListElement { ralColor: "#E01A14"; number: "3104" }
                ListElement { ralColor: "#81C2DB"; number: "5040" }
                ListElement { ralColor: "#402770"; number: "5061" }
                ListElement { ralColor: "#325B94"; number: "5118" }
                ListElement { ralColor: "#1B7CC0"; number: "5141" }
                ListElement { ralColor: "#A5B5DE"; number: "5154" }
                ListElement { ralColor: "#44458B"; number: "5153" }
                ListElement { ralColor: "#8D529A"; number: "5161" }
                ListElement { ralColor: "#6C7EBD"; number: "5182" }
                ListElement { ralColor: "#36B6A5"; number: "6001" }
                ListElement { ralColor: "#5FB089"; number: "6021" }
                ListElement { ralColor: "#3BAB44"; number: "6098" }
                ListElement { ralColor: "#3BB6A3"; number: "6100" }
                ListElement { ralColor: "#13AAB8"; number: "6099" }
                ListElement { ralColor: "#28542A"; number: "6127" }
                ListElement { ralColor: "#BDDBAC"; number: "6156" }
                ListElement { ralColor: "#CDD4CA"; number: "7000" }
                ListElement { ralColor: "#F6F6FA"; number: "9001" }
                ListElement { ralColor: "#252221"; number: "9011" }
            }

            ListModel {
                id: bottomModel
                ListElement {ralColor: "transparent"; number: ""  }
                ListElement {ralColor: "white"; number: "9003"  }
                ListElement { ralColor: "#a5a5a5"; number: "9006" }
                ListElement { ralColor: "#e6d2b5"; number: "1015" }
            }


            GridView {
                id: gridColor
                anchors.fill: gridRectangle
                cellWidth: gridColor.width/4
                cellHeight: gridColor.height/4
                model: {
                    if(colorIndex == 14 ) topModel
                    else if ( colorIndex == 15 ) bottomModel
                }
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

                            Text{
                                id: colorNumber
                                anchors.centerIn: colorRectangle
                                text: number
                                font { family: "Arial"; pixelSize: colorRectangle.height/7 }
                            }

                            Image {
                                anchors.fill: colorRectangle
                                source: {
                                    if (ralColor == "transparent") "/images/images/add.png"
                                    else ""
                                }
                            }

                            MouseArea {
                                id: mouseArea
                                anchors.fill: colorRectangle
                                onClicked: {
                                    if( ralColor != "transparent") {
                                        optList.setText( colorNumber.text , colorIndex )
                                        optList.setColor( ralColor , colorIndex )
                                    }
                                    else {
                                        lineEdit.visible = true
                                        lineEdit.height = 50
                                    }
                                }
                        }
                    }
                } // Item

              } // Compontent

            } // GridView

        } // Grid Rectangle

    } // Rectangle

} // Window
