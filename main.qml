import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt QML Blur Effect")

    header: ToolBar
    {

        Row
        {

            ToolButton
            {
                id: toolButtonBlurBackground
                text: qsTr("Blur Background")

                onClicked: stack.replace(blurBackgroundPage)
            }

            ToolButton
            {
                id: toolButtonBlurImage
                text: qsTr("Blur Image")

                onClicked: stack.replace(blurImagePage)
            }

            ToolButton
            {
                id: toolButtonBlurRectangleAndSubitems
                text: qsTr("Blur Rectangle and Subitems")

                onClicked: stack.replace(blurRectangleAndSubitemsPage)

            }

            ToolButton
            {
                id: toolButtonAnimateBlur
                text: qsTr("Animate Blur")

                onClicked: {
                    stack.replace(animateBlurPage)
                    timerBlurAnimation.start()
                }

            }

        }
    }

    // Blur background content
    Item {
        id: blurBackgroundPage
        visible: false

        // Main content that will be blurred
        Item {
            id: blurPageMainContent
            anchors.fill: parent

            Image {
                id: imgBackground
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/images/saee-park-flowers.jpg"
            }

            Rectangle {
                anchors.centerIn: parent
                radius: 5
                color: "#dddddddd"
                width: 200
                height: 100

                Column {
                    spacing: 5
                    anchors.centerIn: parent

                    Text {
                        text: qsTr("Hi")
                    }

                    Button {
                        text: qsTr("Blur")
                        onClicked: {
                            blurBackgroundOverlay.visible = true
                            blurPageOverlayContent.visible = true
                        }
                    }
                }

            }

        }

        FastBlur
        {
            id: blurBackgroundOverlay
            visible: false
            anchors.fill: blurPageMainContent
            source: blurPageMainContent
            radius: 85
        }

        // Top content to show up on blurred area
        Item {
            id: blurPageOverlayContent
            anchors.fill: parent
            visible: false

            Rectangle {
                anchors.centerIn: parent
                radius: 5
                color: "#dddddddd"
                width: 400
                height: 300

                Column {
                    spacing: 5
                    anchors.centerIn: parent

                    Text {
                        text: qsTr("This item is on top of main content")
                    }

                    Button {
                        text: qsTr("Close")
                        onClicked: {
                            blurBackgroundOverlay.visible = false
                            blurPageOverlayContent.visible = false
                        }
                    }
                }
            }

        }

    }

    // Blur single item
    Item {
        id: blurImagePage
        visible: false

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: buttonBlurToggleFilbandMountainsImage.top
            text: qsTr("Blur only an image item")
        }

        Button {
            id: buttonBlurToggleFilbandMountainsImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: imgFilbandMountainsWithSnow.top
            text: qsTr("Toggle Blur")
            onClicked: {
                blurImageFilbandMountains.visible = !blurImageFilbandMountains.visible
            }
        }

        Image {
            id: imgFilbandMountainsWithSnow
            width: 300
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/filband-mountains.jpg"
        }

        FastBlur
        {
            id: blurImageFilbandMountains
            visible: false
            anchors.fill: imgFilbandMountainsWithSnow
            source: imgFilbandMountainsWithSnow
            radius: 85
        }
    }

    // Blur an item and subitems
    Item {
        id: blurRectangleAndSubitemsPage
        visible: false

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("In this effect we will blur a rectangle with all of its subitems.")
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: rectMultpleSubitems.top
            text: qsTr("Toggle Blur")
            onClicked: {
                blurRectangleAndSubItems.visible = !blurRectangleAndSubItems.visible
            }
        }

        // This rectangle has multiple items which all of them will be blurred
        Rectangle {
            id: rectMultpleSubitems
            anchors.centerIn: parent
            width: 500
            height: 300
            color: "#aaa"

            Row {
                anchors.centerIn: parent
                Image {
                    id: imgFilbandGuySmoking
                    width: 200
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/filband-guy-smoking.jpg"
                }

                Image {
                    id: imgFilbandMakingLove
                    width: 200
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/filband-making-love.jpg"
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("I am a text inside this rectangle!")
            }
        }

        FastBlur
        {
            id: blurRectangleAndSubItems
            visible: false
            anchors.fill: rectMultpleSubitems
            source: rectMultpleSubitems
            radius: 85
        }
    }

    // Animate a blur effect itself
    Item {
        id: animateBlurPage
        visible: false

        Timer {
            id: timerBlurAnimation
            running: false
            interval: 2000
            repeat: true

            onTriggered: blurAnimationOverlay.opacity = blurAnimationOverlay.visible ? 0 : 1
        }

        Item {
            id: blurAnimationPageMainContent
            anchors.fill: parent

            Image {
                id: imgAnimatedBlurBackground
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/images/filband-houses-from-far.jpg"
            }

            Rectangle {
                anchors.centerIn: parent
                radius: 5
                color: "#dddddddd"
                width: 200
                height: 400

                Column {
                    spacing: 5
                    anchors.centerIn: parent

                    Text {
                        text: qsTr("Wait to see blur")
                    }

                    Button {
                        text: qsTr("Dummy")
                    }

                    CheckBox {
                        text: qsTr("Dummy")
                    }

                    RadioButton {
                        text: qsTr("Dummy")
                    }
                }

            }

        }

        FastBlur
        {
            id: blurAnimationOverlay
            opacity: 0
            visible: opacity !== 0
            anchors.fill: blurAnimationPageMainContent
            source: blurAnimationPageMainContent
            radius: 85

            Behavior on opacity
            {
                NumberAnimation
                {
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }


    StackView {
        id: stack
        initialItem: blurBackgroundPage
        anchors.fill: parent
    }


}
