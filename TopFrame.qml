import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Item
{
    Rectangle
    {
        id: frame
        width: parent.width
        height: parent.height
        visible: true
        gradient: Gradient {
            GradientStop { position: 0;    color: "#2E2E2E" }
            GradientStop { position: 1;   color: "#0F0F0F" }
        }
        radius: 20

        Row {
            id: row
            spacing: 10
            width:  frame.width
            height: frame.height
            anchors.fill: frame
            anchors.margins: 10

            property real itemWidth : ((width + spacing) / 3) - spacing;

            Tbutton {
                id: t2
                bName: "T2"
                bWidth: row.itemWidth
                bHeight: row.height
                bText: "Noxi T2"
                //titleImg: "/images/images/t2logo.png"
                //tableImg: "/images/images/t2izo.png"
            }
            Tbutton {
                id: t3
                bName: "T3"
                bWidth: row.itemWidth
                bHeight: row.height
                bText: "Noxi T3"
                //titleImg: "/images/images/t3logo.png"
                //tableImg: "/images/images/t3izo.png"
            }
            Tbutton {
                id: t7
                bName: "T7"
                bWidth: row.itemWidth
                bHeight: row.height
                bText: "Noxi T7"
                //titleImg: "/images/images/t7logo.png"
                //tableImg: "/images/images/t7izo.png"
            }
        }
    }
}
