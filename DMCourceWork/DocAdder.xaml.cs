using System.Windows;
namespace DMCourceWork
{
    public partial class DocAdder : Window
    {
        Admin parent;
        public DocAdder(Admin admin)
        {
            parent = admin;
            InitializeComponent();
            var reader = parent.REQ("select Название from тема");
            if (reader != null) while (reader.Read()) Tema.Items.Add(reader[0]);
            reader.Close();
            reader = parent.REQ("select Номер from Ячейки");
            if (reader != null) while (reader.Read()) Cell.Items.Add(reader[0]);
            reader.Close();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var reader = parent.REQ("select Номер from тема where Название=\""  + Tema.SelectedItem + "\"");
            if (reader == null) { Close(); return; }
            reader.Read();
            string tema = reader[0].ToString();
            reader.Close();
            parent.REQ($"INSERT INTO Документация (Название, Тема, Количество, Ячейка) VALUES (\"{Name.Text}\", {tema} ,{Count.Text}, {Cell.SelectedItem} )", false);
            Close();
        }
    }
}
