import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.3

Item {

    id: order

    function clearText() {
        dayLineEdit.text = ""
        monthLineEdit.text = ""
        yearLineEdit.text = ""
        orderLineEdit.text = ""
        recipientLineEdit.text = "" }

    Rectangle {
        id: rectangle
        anchors.fill: order
        color: "lightgray"
        border.width: 5
        border.color: "gray"
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
                height: column.height * .25 - column.spacing

                Text {
                    text: "Numer zlecenia:"
                    height: orderRow.height
                    width: orderRow.width *.35
                    color: "#323232"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: orderRow.width * .035 }
                }

                TextField {
                    id: orderLineEdit
                    height: orderRow.height
                    width: orderRow.width *.65
                    opacity: 0.6
                    anchors.verticalCenter: orderRow.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    focus: orderLineEdit.hovered == true ? true : false
                    font { family: "Arial"; pixelSize: orderRow.width * .035  }
                    style: TextFieldStyle {
                            textColor: "#323232"
                            background: Rectangle {
                                implicitWidth: orderLineEdit.width
                                implicitHeight: orderLineEdit.height
                                radius: 20
                                border.color: "gray"
                                border.width: 2
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
                height: column.height * .25 - column.spacing

                Text {
                    text: "Odbiorca:"
                    height: recipientRow.height
                    width: recipientRow.width *.35
                    color: "#323232"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: recipientRow.width * .035 }
                }

                TextField {
                    id: recipientLineEdit
                    height: recipientRow.height
                    width: recipientRow.width *.65
                    opacity: 0.6
                    anchors.verticalCenter: recipientRow.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    focus: recipientLineEdit.hovered == true ? true : false
                    font { family: "Arial"; pixelSize: recipientRow.width * .035 }
                    style: TextFieldStyle {
                            textColor: "#323232"
                            background: Rectangle {
                                implicitWidth: recipientLineEdit.width
                                implicitHeight: recipientLineEdit.height
                                radius: 20
                                border.color: "gray"
                                border.width: 2
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
                height: column.height * 0.25 - column.spacing

                Text {
                    text: "Termin dostawy:"
                    height: termRow.height
                    width: termRow.width*.35
                    color: "#323232"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font { family: "Arial"; pixelSize: termRow.width * .035 }
                }

                Row {
                    id: dateRow
                    width: termRow.width * 0.65
                    height: termRow.height
                    spacing: 10

                    TextField {
                        property string type: "year"
                        id: yearLineEdit
                        height: termRow.height
                        width: dateRow.width * .33 - dateRow.spacing
                        opacity: 0.6
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "rrrr"
                        focus: yearLineEdit.hovered == true ? true : false
                        validator: IntValidator { bottom: 2015; top: 7999}
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: "#323232"
                                background: Rectangle {
                                    implicitWidth: yearLineEdit.width
                                    implicitHeight: yearLineEdit.height
                                    radius: 20
                                    border.color: {
                                        if ( yearLineEdit.text < 2015 && yearLineEdit.text != "") "#FFA07A"
                                        else "gray"
                                        }
                                    border.width: 2
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
                        width: dateRow.width * .33 - dateRow.spacing
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        opacity: 0.6
                        placeholderText: "mm"
                        validator: IntValidator { bottom: 1; top: 12}
                        focus: monthLineEdit.hovered == true ? true : false
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: "#323232"
                                background: Rectangle {
                                    implicitWidth: monthLineEdit.width
                                    implicitHeight: monthLineEdit.height
                                    radius: 20
                                    border.color: {
                                        if ( monthLineEdit.text < 1 && monthLineEdit.text != "") "#FFA07A"
                                        else "gray"
                                        }
                                    border.width: 2
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
                        width: dateRow.width * .33 - dateRow.spacing
                        anchors.verticalCenter: dateRow.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        opacity: 0.6
                        placeholderText: "dd"
                        validator: IntValidator { bottom: 1; top: 31}
                        focus: dayLineEdit.hovered == true ? true : false
                        font { family: "Arial"; pixelSize: termRow.width * .035 }
                        style: TextFieldStyle {
                                textColor: "#323232"
                                background: Rectangle {
                                    implicitWidth: dayLineEdit.width
                                    implicitHeight: dayLineEdit.height
                                    radius: 20
                                    border.color: {
                                        if ( dayLineEdit.text < 1 && dayLineEdit.text != "") "#FFA07A"
                                        else "gray"
                                        }
                                    border.width: 2
                                }
                        }
                        onTextChanged: {
                            optList.onDateChanged(dayLineEdit.text, type)
                        }
                    }
                }
            }

            Rectangle
            {
                id: acceptButton
                width: height
                height: rectangle.height * .25 - column.spacing
                anchors.right: column.right
                radius: 20
                color: {
                       if( mouseArea.containsMouse ) "#919191"
                       else "gray"
                }

                Image {
                    anchors.fill: acceptButton
                    source: "/images/images/check.png"
                    smooth: true
                    scale: mouseArea.pressed ? 0.8 : 1
                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true
                    anchors.fill: acceptButton
                    onClicked: {
                        if( optList.checkData() === true) {
                            topFrame.visible = true
                            order.visible = false
                        }
                    }
                }
            }

        }

    }
}

