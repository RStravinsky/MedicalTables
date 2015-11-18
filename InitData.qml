import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.3

Item {

    id: initData

    function clearText() {
        dayLineEdit.text = ""
        monthLineEdit.text = ""
        yearLineEdit.text = ""
        orderLineEdit.text = ""
        recipientLineEdit.text = "" }

    Rectangle {
        id: rectangle
        anchors.fill: initData
        color: Qt.rgba(0.239, 0.237, 0.237, 0.3)
        border.width: 5
        border.color: "lightgray"
        radius: 20

        Column {
            id: column
            spacing: 10
            anchors.fill: rectangle
            anchors.margins: 2*column.spacing
            width: rectangle.width
            height: rectangle.height

            Row {
                id: orderRow
                width: column.width
                height: column.height * .23 - column.spacing

                Text {
                    text: "Numer zlecenia:"
                    height: orderRow.height
                    width: orderRow.width *.35
                    color: "white"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: orderRow.width * .035 }
                }

                TextField {
                    id: orderLineEdit
                    height: orderRow.height
                    width: orderRow.width *.65
                    anchors.verticalCenter: orderRow.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font { family: "Arial"; pixelSize: orderRow.width * .035  }
                    style: TextFieldStyle {
                            textColor: "gray"
                            background: Rectangle {
                                implicitWidth: orderLineEdit.width
                                implicitHeight: orderLineEdit.height
                                radius: 20
                                border.color: orderLineEdit.focus === true ? "#69C0D9" : "lightgray"
                                border.width: 3
                            }
                    }
                    onTextChanged: {
                        optList.onOrderChanged(orderLineEdit.text)
                    }
                }
            }

            Row {
                id: recipientRow
                width: column.width
                height: column.height * .23 - column.spacing

                Text {
                    text: "Odbiorca:"
                    height: recipientRow.height
                    width: recipientRow.width *.35
                    color: "white"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: recipientRow.width * .035 }
                }

                TextField {
                    id: recipientLineEdit
                    height: recipientRow.height
                    width: recipientRow.width *.65
                    anchors.verticalCenter: recipientRow.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font { family: "Arial"; pixelSize: recipientRow.width * .035 }
                    style: TextFieldStyle {
                            textColor: "gray"
                            background: Rectangle {
                                implicitWidth: recipientLineEdit.width
                                implicitHeight: recipientLineEdit.height
                                radius: 20
                                border.color: recipientLineEdit.focus === true ? "#69C0D9" : "lightgray"
                                border.width: 3
                            }
                    }
                    onTextChanged: {
                        optList.onRecipientChanged(recipientLineEdit.text)
                    }
                }
            }

            Row {
                id: termRow
                width: column.width
                height: column.height * 0.23 - column.spacing

                Text {
                    text: "Termin dostawy:"
                    height: termRow.height
                    width: termRow.width*.35
                    color: "white"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: termRow.width * .035 }
                }

                Row {
                    id: dateRow
                    width: termRow.width * 0.65
                    height: termRow.height
                    spacing: 10

                    property int offset: (2*dateRow.spacing)/3

                    TextField {
                        property string type: "year"
                        id: yearLineEdit
                        height: termRow.height
                        width: dateRow.width/3 - dateRow.offset
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "rrrr"                                     
                        validator: IntValidator { bottom: 2015; top: 7999}
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: {
                                    if ( yearLineEdit.text < 2015 && yearLineEdit.text != "") "#FFA07A"
                                    else "gray"
                                }
                                background: Rectangle {
                                    implicitWidth: yearLineEdit.width
                                    implicitHeight: yearLineEdit.height
                                    radius: 20
                                    border.color: yearLineEdit.focus === true ? "#69C0D9" : "lightgray"
                                    border.width: 3
                                }
                        }

                        onTextChanged: {
                            optList.onDateChanged(yearLineEdit.text, type)
                        }
                    }

                    TextField {
                        id: monthLineEdit
                        property string type: "month"
                        height: termRow.height
                        width: dateRow.width/3 - dateRow.offset
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "mm"
                        validator: IntValidator { bottom: 1; top: 12}
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: {
                                    if ( monthLineEdit.text < 1 && monthLineEdit.text != "") "#FFA07A"
                                    else "gray"
                                }
                                background: Rectangle {
                                    implicitWidth: monthLineEdit.width
                                    implicitHeight: monthLineEdit.height
                                    radius: 20
                                    border.color: monthLineEdit.focus === true ? "#69C0D9" : "lightgray"
                                    border.width: 3
                                }
                        }

                        onTextChanged: {
                            optList.onDateChanged(monthLineEdit.text, type)
                        }
                    }

                    TextField {
                        id: dayLineEdit
                        property string type: "day"
                        height: termRow.height
                        width: dateRow.width/3 - dateRow.offset
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "dd"
                        validator: IntValidator { bottom: 1; top: 31}
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: {
                                    if ( dayLineEdit.text < 1 && dayLineEdit.text != "") "#FFA07A"
                                    else "gray"
                                }
                                background: Rectangle {
                                    implicitWidth: dayLineEdit.width
                                    implicitHeight: dayLineEdit.height
                                    radius: 20
                                    border.color: dayLineEdit.focus === true ? "#69C0D9" : "lightgray"
                                    border.width: 3
                                }
                        }

                        onTextChanged: {
                            optList.onDateChanged(dayLineEdit.text, type)
                        }
                    }
                }
            }

            Image {
                id: acceptButton
                width: height
                height: rectangle.height * .31
                anchors.right: column.right
                source: "/images/images/go.png"
                smooth: true
                scale: mouseArea.pressed ? 0.7 : 1

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        if( optList.checkData() === true) {
                            topFrame.visible = true
                            order.visible = false
                            initData.forceActiveFocus()
                        }
                    }
                }
            }

        } // Columns

    } // Rectangle

} // Item

