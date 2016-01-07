TEMPLATE = app

QT += qml quick
QT += network

CONFIG += c++11

SOURCES += main.cpp \
    cppconnector.cpp \
    bruceCL/DataProcessor/dataprocessorbase.cpp \
    bruceCL/TcpClient/tcpclient.cpp \
    bruceCL/TcpClient/tcpclientdataprocessor.cpp

RESOURCES += qml/qml.qrc


# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    cppconnector.h \
    bruceCL/Connection/connectionstatus.h \
    bruceCL/Connection/iconnection.h \
    bruceCL/DataProcessor/dataprocessorbase.h \
    bruceCL/DataProcessor/datatype.h \
    bruceCL/DataProcessor/instruction.h \
    bruceCL/DataProcessor/messagetype.h \
    bruceCL/TcpClient/tcpclient.h \
    bruceCL/TcpClient/tcpclientdataprocessor.h


