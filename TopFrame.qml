import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Item
{
    id: topFrame

    Rectangle {
        id: rectangle
        anchors.fill: topFrame
        radius: 20
        gradient: Gradient {
            GradientStop { position: 0;    color: "#2E2E2E" }
            GradientStop { position: 1;   color: "#0F0F0F" }
        }

        Row {
            id: row
            anchors.fill: rectangle
            anchors.margins: 10
            spacing: 10
            property real itemWidth : ((width*.85 + spacing) / 3) - spacing - 3 ;

            MainButton {
                id: t2
                width: row.itemWidth
                height: row.height
                bName: "Noxi T2"
            } 
           MainButton {
                id: t3
                width:  row.itemWidth
                height: row.height
                bName: "Noxi T3"
            }
            MainButton {
                id: t7
                width : row.itemWidth
                height : row.height
                bName: "Noxi T7"
            }
            GenerateButton {
                id: generateButton
                width: row.width * .15
                height : row.height
            }

        } // Row

    } // Rectangle

} // Item
