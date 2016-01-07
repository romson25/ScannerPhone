#ifndef CPPCONNECTOR_H
#define CPPCONNECTOR_H

#include <QObject>
#include "bruceCL/TcpClient/tcpclient.h"

class CppConnector : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool connectionStatus    READ connectionStatus   WRITE setConnectionStatus   NOTIFY connectionStatusChanged)
    Q_PROPERTY(bool isWaitingForPhoto   READ isWaitingForPhoto  WRITE setIsWaitingForPhoto  NOTIFY isWaitingForPhotoChanged)
    Q_PROPERTY(bool isEndScanning       READ isEndScanning      WRITE setIsEndScanning      NOTIFY isEndScanningChanged)

public:
    explicit CppConnector(QObject *parent = 0);
    ~CppConnector();

    Q_INVOKABLE void openConnection (QString ip, QString port);
    Q_INVOKABLE void imageCaptured  (QString path);

signals:
    void connectionStatusChanged    ();
    void isWaitingForPhotoChanged   ();
    void isEndScanningChanged       ();

private:
    TcpClient pc     {};

    bool status      {};
    bool waiting     {};
    bool endScanning {};

    bool connectionStatus       ();
    bool isWaitingForPhoto      ();
    bool isEndScanning          ();

    void setConnectionStatus    (bool);
    void setIsWaitingForPhoto   (bool);
    void setIsEndScanning       (bool);

private slots:
    void readConnectionStatus   (ConnectionStatus);
    void readInstruction        (Instruction);
};

#endif // CPPCONNECTOR_H
