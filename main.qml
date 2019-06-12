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

                onClicked: stack.replace(animateBlurPage)

            }

        }
    }

    // Blur background content
    Item {
        id: blurBackgroundPage
        visible: false

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

    Item {
        id: blurRectangleAndSubitemsPage
        visible: false

        Text {
            text: qsTr("Blur rec and subitems page")
        }
    }

    Item {
        id: animateBlurPage
        visible: false

        Text {
            text: qsTr("Animate blur page")
        }
    }


    StackView {
        id: stack
        initialItem: blurBackgroundPage
        anchors.fill: parent
    }


}
