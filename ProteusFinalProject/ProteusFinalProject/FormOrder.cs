using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using System.Threading;
using System.Windows.Threading;
namespace ProteusFinalProject
{
    public partial class FormOrder : Form
    {
        List<ItemId> DataCollection = new List<ItemId>();
        ItemId Item;
        MqttClient mqttClient;
        public FormOrder()
        {
            InitializeComponent();
        }

        private void FormOrder_Load(object sender, EventArgs e)
        {
            InitialValue();
            mqttClient = new MqttClient(currentIpValue.Text);
            mqttClient.Connect("Application2");
            mqttClient.MqttMsgPublishReceived += MqttClient_MqttMsgPublishReceived;
            mqttClient.Subscribe(new string[] { "Application2/Weight" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
        }
        public void MqttClient_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e)
        {
            var message = Encoding.UTF8.GetString(e.Message);
            currentWeightValue.Invoke((MethodInvoker)(() => currentWeightValue.Text = message));
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            string NewName, NewNumber, NewWeight;
            int NewQuantity;
            NewName = itemNameValue.Text;
            NewNumber = itemNumberValue.Text;
            NewWeight = currentWeightValue.Text;
            NewQuantity = int.Parse(itemQuantityValue.Text);
            ItemId Item = new ItemId() { ItemName = NewName, ItemNumber = NewNumber, ItemQuantity = NewQuantity, ItemWeight = NewWeight };
            DataCollection.Add(Item);
            itemDataGrid.DataSource = null;
            itemDataGrid.DataSource = DataCollection;
            itemDataGrid.Refresh();
        }
        private void InitialValue()
        {
            currentWeightValue.Text = "0";
        }

        private void disconnectButton_Click(object sender, EventArgs e)
        {
            mqttClient.Disconnect();
        }
    }
}
