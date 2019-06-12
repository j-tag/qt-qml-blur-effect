import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

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

    Item {
        id: blurBackgroundPage
        visible: false

        Text {
            text: qsTr("Hi")
        }
    }

    Item {
        id: blurImagePage
        visible: false

        Text {
            text: qsTr("Blur image page")
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
