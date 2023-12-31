#include "guibackend.h"

GuiBackend::GuiBackend(QObject *parent)
    : QObject{parent}
{
    m_pClient = new Client;
    m_pClient->connectToServer(QHostAddress::LocalHost, 2323);
}

void GuiBackend::onLoginButtonClicked(QString login, QString password)
{
    m_pClient->login(login,password);
}

void GuiBackend::onRegisterButtonClicked(QString name, QString birthDate, QString login, QString pass)
{
    m_pClient->reg(name, birthDate, login, pass);
}
