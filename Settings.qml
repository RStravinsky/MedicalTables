import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4

Window {
    id: settingDialog
    onClosing: {
        gridColor.positionViewAtBeginning()
        lineEdit.clearTextField()
    }
    title: qsTr("Ustawienia dodatkowe")
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width

    Rectangle {
        id: rectangle
        width: settingDialog.width
        height: settingDialog.height

        Column {
            id: column
            spacing: 10
            anchors.fill: rectangle
            anchors.margins: 2*column.spacing
            width: rectangle.width
            height: rectangle.height

            Row {
                id: countRow
                width: column.width
                height: column.height * .5 - column.spacing

                Text {
                    text: "Ilość sztuk:"
                    height: countRow.height
                    width: countRow.width *.5
                    color: "#323232"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: countRow.width * .07 }
                }

                TextField {
                    id: countLineEdit
                    height: countRow.height - 2*column.spacing
                    width: countRow.width *.5
                    anchors.verticalCenter: countRow.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    focus: countLineEdit.hovered == true ? true : false
                    font { family: "Arial"; pixelSize: countRow.width * .07  }
                    style: TextFieldStyle {
                            textColor: "#323232"
                            background: Rectangle {
                                implicitWidth: countLineEdit.width
                                implicitHeight: countLineEdit.height
                                radius: 20
                                border.color: "gray"
                                border.width: 2
                            }
                    }

                    Image {
                        id: clearText
                        anchors { right: countLineEdit.right; margins: 1; verticalCenter: parent.verticalCenter }
                        source: "/images/images/clear.png"
                        smooth: true
                        visible: countLineEdit.text
                        height: countLineEdit.height - 2*column.spacing
                        width: height

                        MouseArea {
                            id: clear
                            anchors.fill: clearText
                            height: clearText.height; width: clearText.height
                            onClicked: {
                                countLineEdit.text = ""
                                countLineEdit.forceActiveFocus()
                            }
                        }
                    }

                }
            }

            Row {
                id: commentsRow
                width: column.width
                height: column.height * .5 - column.spacing

                Text {
                    text: "Uwagi:"
                    height: commentsRow.height
                    width: commentsRow.width *.5
                    color: "#323232"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: commentsRow.width * .07 }
                }

                Rectangle {
                    id: textArea
                    height: commentsRow.height
                    width: commentsRow.width *.5
                    border.width: 3
                    border.color: "lightgrey"
                    radius: 20
                    smooth: true

                    Flickable {
                        id: flickArea
                        anchors.fill: textArea
                        contentWidth: textArea.width; contentHeight: commentsText.paintedHeight
                        flickableDirection: Flickable.VerticalFlick
                        clip: true

                        TextEdit {
                             id: commentsText
                             wrapMode: TextEdit.Wrap
                             width: textArea.width - 10
                             anchors.margins: 20
                             anchors.centerIn: textArea
                             onFocusChanged: {
                                 if(focus){
                                     textArea.border.color = "#569ffd"
                                 }else{
                                     textArea.border.color = "lightgray"
                                 }
                            }
                        }

                    }
                }
           }

        } // Columns

    } // Rectangle

} // Window
