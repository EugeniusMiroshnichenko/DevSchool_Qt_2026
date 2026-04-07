#include "mainwindow.h"
#include <QRandomGenerator>
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QTimer* createTimer = new QTimer(this);

    QObject::connect(createTimer, &QTimer::timeout, [this, createTimer]() {
        QPushButton *button = new QPushButton(this);
        int buttonWidth = 25;
        button->setFixedSize(buttonWidth, buttonWidth);
        button->setText("*");
        int maxX = width();
        int maxY = 100;
        if(maxX < 0) maxX = 0;
        int randomX = QRandomGenerator::global()->generate() % (maxX - buttonWidth);
        int randomY = QRandomGenerator::global()->generate() % (maxY - buttonWidth);
        button->move(randomX, randomY);
        button->show();

        QObject::connect(button, &QPushButton::clicked, [this, button]() {
            delete button;
        });

        int speed = QRandomGenerator::global()->bounded(1, 5);
        QTimer* moveTimer = new QTimer(button);
        QObject::connect(moveTimer, &QTimer::timeout, [button, this, moveTimer, speed]() {
            int current_speed = speed;
            if(button->underMouse()) current_speed *= 2;
            button->move(button->x(), button->y() + current_speed);

            if(button->y() + button->height() >= this->height()) {
                setStyleSheet("QMainWindow { background-color: red; }");
                setWindowTitle("YOU LOOSE!");
                delete button;
            }
        });
        moveTimer->start(100);
        createTimer->setInterval(QRandomGenerator::global()->bounded(100, 1000));
    });  

    createTimer->start(500);
}

MainWindow::~MainWindow()
{
    delete ui;
}

