using System.Windows;
namespace DMCourceWork
{
    public partial class ChangeNumber : Window
    {
        Admin parent;
        public ChangeNumber(Admin admin)
        {
            InitializeComponent();
            parent = admin;
            var reader = parent.REQ("select Название from Отделы");
            if (reader != null) while (reader.Read()) Otdel.Items.Add(reader[0]);
            reader.Close();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            parent.REQ($"UPDATE Отделы SET Телефон=\"{Phone.Text}\" where Название=\"{Otdel.SelectedItem}\"", false);
            Close();
        }
    }
}
