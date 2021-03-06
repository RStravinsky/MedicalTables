import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0

Item {

    id: initAnimation

    Image {
        id: logoNoxi
        anchors.fill: initAnimation
        source: "/images/images/logoNOXI.png"
        scale: 0
    }

    Glow {
        id: glowNoxi
        anchors.fill: logoNoxi
        radius: 0
        samples: 30
        color: "orange"
        source: logoNoxi
        fast: true
    }

    Image {
        id: logoMove
        anchors.bottom: initAnimation.bottom
        anchors.right: initAnimation.right
        width: initAnimation.width/2
        height: initAnimation.height/2
        source: "/images/images/logoMOVE.png"
        scale: 0
    }

    Glow {
        id: glowMove
        anchors.fill: logoMove
        radius: 80
        samples: 30
        color: "orange"
        source: logoMove
        fast: true
        visible: false
    }

    SequentialAnimation {

        running: true

        NumberAnimation {
            id: logoAnimation
            target: glowNoxi
            property: "scale"
            from: 0
            to: 1
            duration: 3000
            easing.type: Easing.OutQuart
        }

        NumberAnimation {
            target: glowNoxi
            property: "radius"
            from: 0
            to: 50
            duration: 500
        }

        ParallelAnimation
        {
            NumberAnimation {
                target: glowMove
                property: "visible"
                from: 0
                to: 1
                duration: 500
            }
            NumberAnimation {
                target: glowMove
                property: "scale"
                from: 0
                to: 1
                duration: 1000
            }
        }

        SequentialAnimation {
            loops: Animation.Infinite

            NumberAnimation {
                target: glowNoxi
                property: "spread"
                from: 0
                to: 0.55
                duration: 2000
            }
            NumberAnimation {
                target: glowNoxi
                property: "spread"
                from: 0.55
                to: 0
                duration: 2000
            }
        }

    } // SequentialAnimation

} // Item

