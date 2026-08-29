// Colors.qml
pragma Singleton
import QtQuick

QtObject {
    // --- Hardcoded choice ---
    readonly property bool isDark: true

    // --- Dynamic Mapping ---
    readonly property color primary: isDark ? dark.primary : light.primary
    readonly property color textPrimary: isDark ? dark.textPrimary : light.textPrimary
    readonly property color primaryContainer: isDark ? dark.primaryContainer : light.primaryContainer
    readonly property color textPrimaryContainer: isDark ? dark.textPrimaryContainer : light.textPrimaryContainer
    
    readonly property color secondary: isDark ? dark.secondary : light.secondary
    readonly property color textSecondary: isDark ? dark.textSecondary : light.textSecondary
    
    readonly property color background: isDark ? dark.background : light.background
    readonly property color textBackground: isDark ? dark.textBackground : light.textBackground
    
    readonly property color surface: isDark ? dark.surface : light.surface
    readonly property color textSurface: isDark ? dark.textSurface : light.textSurface
    readonly property color surfaceVariant: isDark ? dark.surfaceVariant : light.surfaceVariant
    readonly property color textSurfaceVariant: isDark ? dark.textSurfaceVariant : light.textSurfaceVariant
    readonly property color outline: isDark ? dark.outline : light.outline

    readonly property color transparent: "transparent"

    // --- Material You Theme Palettes ---
    readonly property QtObject light: QtObject {
        readonly property color primary: "#bc003a"
        readonly property color textPrimary: "#ffffff"
        readonly property color primaryContainer: "#ffdad9"
        readonly property color textPrimaryContainer: "#41000f"
        
        readonly property color secondary: "#775656"
        readonly property color textSecondary: "#ffffff"
        
        readonly property color background: "#fffbff"
        readonly property color textBackground: "#201a1a"
        
        readonly property color surface: "#fffbff"
        readonly property color textSurface: "#201a1a"
        readonly property color surfaceVariant: "#f4dddd"
        readonly property color textSurfaceVariant: "#534343"
        readonly property color outline: "#857373"
    }

    readonly property QtObject dark: QtObject {
        readonly property color primary: "#ffb3b4"
        readonly property color textPrimary: "#68001c"
        readonly property color primaryContainer: "#92002b"
        readonly property color textPrimaryContainer: "#ffdad9"
        
        readonly property color secondary: "#e6bdbc"
        readonly property color textSecondary: "#44292a"
        
        readonly property color background: "#201a1a"
        readonly property color textBackground: "#ece0df"
        
        readonly property color surface: "#251e1e"
        readonly property color textSurface: "#ece0df"
        readonly property color surfaceVariant: "#534343"
        readonly property color textSurfaceVariant: "#d8c2c1"
        readonly property color outline: "#a08c8c"
    }
}

