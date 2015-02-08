pragma Singleton
import QtQuick 2.0

Item {
    id: styleRoot
    property real windowWidth
    property real windowHeight
    property real minimumTouchableSize: windowWidth / 25
    property real maximumTouchableSize: windowWidth / 10
    property real pixelDensity: 72
    property real touchableSize: 6 * baseSize
    property real baseSize: 72
    property real baseMargin: 4 * baseSize
    property real scale: 1.0

    property alias font: fontObject
    property alias button: buttonObject

    Item {
        id: buttonObject
        property color color: "#dedede"
        property color fontColor: Qt.rgba(0.15, 0.15, 0.15, 0.9)
        property real fontSize: 1.6 * font.size
    }

    Item {
        id: fontObject
        property alias heading: headingObject
        property alias button: buttonObject

        property real size: 3 * baseSize
        property color color: Qt.rgba(0.15, 0.15, 0.15, 0.9)

        Item {
            id: headingObject
            property color color: Qt.rgba(0.4, 0.4, 0.4, 1.0)
            property real size: 2.5 * font.size
        }
    }

    function reset(width, height, pixelDensity) {
        console.log("Resetting style")

        styleRoot.windowWidth = width
        styleRoot.windowHeight = height
        styleRoot.pixelDensity = pixelDensity

        if(Qt.platform.os === "android" || Qt.platform.os === "ios") {
            if(pixelDensity === 0) {
                console.warn("Style.reset(): Pixel density is zero. Assuming 4 ppmm.")
                pixelDensity = 4
            }

            baseSize = pixelDensity

            console.log("Pixel density is " + pixelDensity)
            scale = pixelDensity / 4
            console.log("Scale set to " + scale)
        } else {
            baseSize = styleRoot.windowWidth * 0.01
        }
    }
}
