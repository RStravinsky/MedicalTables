#ifndef TABLEDIALOG_H
#define TABLEDIALOG_H

#include <QDialog>
#include <QStandardItemModel>
#include <QKeyEvent>
#include <QMessageBox>
#include <QDebug>
#include <QPushButton>
#include <QTextStream>
#include <QFile>
#include <QDir>
#include <QVBoxLayout>
#include <QScrollArea>
#include <QLabel>

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
     void generateCSV();
    ~TableDialog();

private slots:
     void on_tableView_doubleClicked(const QModelIndex &index);

private:
    Ui::TableDialog *ui;
    void keyPressEvent(QKeyEvent *e);
};

#endif // TABLEDIALOG_H
