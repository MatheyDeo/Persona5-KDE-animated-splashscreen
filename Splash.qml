import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = animation;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        
        AnimatedImage { 
            id: animation; source: "images/animation.gif"
            // If the image doesent fit your monitor correctly or you cant see it at all try fiddling with these settings.
            y: 700      // Increase y to move in downwards
            x : 1500    // Increase x to move it right
            width: 450  // Change the size to suit your monitor
            height: 350 
            fillMode: Image.PreserveAspectFit
        }
        Row {
            spacing: PlasmaCore.Units.smallSpacing*2
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: PlasmaCore.Units.gridUnit
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: PlasmaCore.Units.veryLongDuration * 1
        easing.type: Easing.InOutQuad
    }
}
