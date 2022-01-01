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
namespace ProteusFinalProject
{

    public partial class ModeForm : Form
    {
        MqttClient mqttClient;
        public ModeForm()
        {
            InitializeComponent();
        }
        
        private void mode1Button_Click(object sender, EventArgs e)
        {
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes("mode 001"));
                }
            }
                );
        }

        private void ModeForm_Load(object sender, EventArgs e)
        {
            mqttClient = new MqttClient(currentIpValue.Text);
            mqttClient.Connect("Application2");
        }

        private void disconnectButton_Click(object sender, EventArgs e)
        {
            mqttClient.Disconnect();
        }

        private void mode2Button_Click(object sender, EventArgs e)
        {
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes("mode 002"));
                }
            }
               );
        }
    }
}
