QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += ../Librarys/LZLib
COPY_PWD = $$replace(PWD, /, \\)
COPY_OUT_PWD = $$replace(OUT_PWD, /, \\)
CONFIG(debug, debug|release) {
    win32{
        DESTDIR = $$PWD/../../rundir/debug

        LIBS += -L$$COPY_OUT_PWD/../Librarys/LZLib/debug -lLZLib
    }
} else {
    win32{
        DESTDIR = $$PWD/../../rundir/release

        LIBS += -L$$COPY_OUT_PWD/../Librarys/LZLib/release -lLZLib
    }
}

SOURCES += \
    PluginManager.cpp \
    main.cpp \
    MainWindow.cpp

HEADERS += \
    Interface/IDataCenter.h \
    Interface/IMainWindow.h \
    Interface/IOrder.h \
    Interface/IPlugin.h \
    MainWindow.h \
    PluginManager.h

FORMS += \
    MainWindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
