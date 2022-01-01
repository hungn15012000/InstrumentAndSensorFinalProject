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
    public partial class FormSetting : Form
    {
        MqttClient mqttClient;
        public FormSetting()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void connectMqttButton_Click(object sender, EventArgs e)
        {
            mqttClient = new MqttClient(ipAddressValue.Text);
            mqttClient.Connect("Application2");
            if (mqttClient.IsConnected)
            {
                MessageBox.Show("MQTT is connected!!!");
            }
            else MessageBox.Show("MQTT is not connected!!!");
        }
    }
}
