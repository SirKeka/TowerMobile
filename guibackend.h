#ifndef GUIBACKEND_H
#define GUIBACKEND_H

#include <QObject>
#include <QString>

#include "client.h"

class GuiBackend : public QObject
{
    Q_OBJECT
public:
    explicit GuiBackend(QObject *parent = nullptr);

private:
    Client *m_pClient;

public slots:
    void onLoginButtonClicked(QString login, QString password);
    void onRegisterButtonClicked(QString name, QString birthDate, QString login, QString pass);
signals:
};

#endif // GUIBACKEND_H
