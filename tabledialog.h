#ifndef TABLEDIALOG_H
#define TABLEDIALOG_H

#include <QDialog>
#include <QStandardItemModel>
#include <QKeyEvent>
#include <QMessageBox>
#include <QDebug>
#include <QPushButton>

namespace Ui {
class TableDialog;
}

class TableDialog : public QDialog
{
    Q_OBJECT

public:
    explicit TableDialog(QWidget *parent = 0);
     QStandardItemModel * model;
     void deleteRecord();
    ~TableDialog();

private:
    Ui::TableDialog *ui;
    void keyPressEvent(QKeyEvent *e);
};

#endif // TABLEDIALOG_H
