TEMPLATE = app

QT += qml quick widgets gui xlsx

SOURCES += main.cpp \
    medicaltable.cpp \
    itemslist.cpp \
    schedule.cpp

RESOURCES += qml.qrc

RC_ICONS += logo.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    medicaltable.h \
    itemslist.h \
    schedule.h
