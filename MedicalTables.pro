TEMPLATE = app

QT += qml quick widgets gui

SOURCES += main.cpp \
    medicaltable.cpp \
    itemslist.cpp

RESOURCES += qml.qrc

RC_ICONS += logo.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    medicaltable.h \
    itemslist.h
