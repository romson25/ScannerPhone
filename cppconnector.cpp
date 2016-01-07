#include "cppconnector.h"
#include <QDebug>

CppConnector::CppConnector(QObject *parent) : QObject(parent)
{
    connect(&pc, &TcpClient::connectionStatusChanged,   this, &CppConnector::readConnectionStatus);
    connect(&pc, &TcpClient::receivedInstruction,       this, &CppConnector::readInstruction);

}
CppConnector::~CppConnector()
{
    qDebug()<<"Destruktor CppConnector";
}

void CppConnector::openConnection (QString ip, QString port)
{
    pc.openConnection(ip, port);
}
void CppConnector::imageCaptured  (QString path)
{
    pc.sendImage(path);
    pc.sendInstruction(Instruction::takePhoto);
}

bool CppConnector::connectionStatus       ()
{
    return status;
}
bool CppConnector::isWaitingForPhoto      ()
{
    return waiting;
}
bool CppConnector::isEndScanning          ()
{
    return endScanning;
}

void CppConnector::setConnectionStatus    (bool b)
{
    status = b;
    emit connectionStatusChanged();
}
void CppConnector::setIsWaitingForPhoto   (bool b)
{
    waiting = b;

    if(waiting)
        emit isWaitingForPhotoChanged();
}
void CppConnector::setIsEndScanning       (bool b)
{
    endScanning = b;

    if(endScanning)
        emit isEndScanningChanged();
}

void CppConnector::readConnectionStatus   (ConnectionStatus s)
{
    status = (bool)s;
    emit connectionStatusChanged();
}
void CppConnector::readInstruction        (Instruction instruction)
{
    if(instruction == Instruction::takePhoto)
        setIsWaitingForPhoto(true);
    else if(instruction == Instruction::endScanning)
        setIsWaitingForPhoto(false);
}
