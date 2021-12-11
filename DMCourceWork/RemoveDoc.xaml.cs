using System.Windows;
namespace DMCourceWork
{
    public partial class RemoveDoc : Window
    {
        Admin parent;
        public RemoveDoc(Admin admin)
        {
            InitializeComponent();
            parent = admin;
            var reader = parent.REQ("select Название from Документация");
            if (reader != null) while (reader.Read()) Doc.Items.Add(reader[0]);
            reader.Close();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            parent.REQ($"Delete FROM Документация where Название=\"{Doc.SelectedItem}\"", false);
            Close();
        }
    }
}
