
namespace ProteusFinalProject
{
    partial class FormDashBoard
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.currentIpValue = new System.Windows.Forms.ComboBox();
            this.currentIpLabel = new System.Windows.Forms.Label();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.weightValue = new System.Windows.Forms.Label();
            this.weightLabel = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.voltValue = new System.Windows.Forms.Label();
            this.voltLabel = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.adcValue = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.disconnectButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // currentIpValue
            // 
            this.currentIpValue.FormattingEnabled = true;
            this.currentIpValue.Location = new System.Drawing.Point(1046, 28);
            this.currentIpValue.Name = "currentIpValue";
            this.currentIpValue.Size = new System.Drawing.Size(217, 24);
            this.currentIpValue.TabIndex = 4;
            this.currentIpValue.Text = "192.168.1.9";
            // 
            // currentIpLabel
            // 
            this.currentIpLabel.AutoSize = true;
            this.currentIpLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.currentIpLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.currentIpLabel.Location = new System.Drawing.Point(930, 28);
            this.currentIpLabel.Name = "currentIpLabel";
            this.currentIpLabel.Size = new System.Drawing.Size(110, 25);
            this.currentIpLabel.TabIndex = 3;
            this.currentIpLabel.Text = "Current IP";
            // 
            // chart1
            // 
            chartArea1.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.chart1.Legends.Add(legend1);
            this.chart1.Location = new System.Drawing.Point(27, 28);
            this.chart1.Name = "chart1";
            this.chart1.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.Chocolate;
            series1.BorderWidth = 7;
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.chart1.Series.Add(series1);
            this.chart1.Size = new System.Drawing.Size(883, 397);
            this.chart1.TabIndex = 5;
            this.chart1.Text = "chart1";
            this.chart1.Click += new System.EventHandler(this.chart1_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel4);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 462);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1337, 231);
            this.panel1.TabIndex = 6;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.weightValue);
            this.panel4.Controls.Add(this.weightLabel);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel4.Location = new System.Drawing.Point(898, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(439, 231);
            this.panel4.TabIndex = 0;
            // 
            // weightValue
            // 
            this.weightValue.AutoSize = true;
            this.weightValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.weightValue.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.weightValue.Location = new System.Drawing.Point(185, 87);
            this.weightValue.Name = "weightValue";
            this.weightValue.Size = new System.Drawing.Size(142, 25);
            this.weightValue.TabIndex = 3;
            this.weightValue.Text = "Weight Value";
            // 
            // weightLabel
            // 
            this.weightLabel.AutoSize = true;
            this.weightLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.weightLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.weightLabel.Location = new System.Drawing.Point(32, 87);
            this.weightLabel.Name = "weightLabel";
            this.weightLabel.Size = new System.Drawing.Size(87, 25);
            this.weightLabel.TabIndex = 3;
            this.weightLabel.Text = "Weight:";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.voltValue);
            this.panel3.Controls.Add(this.voltLabel);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel3.Location = new System.Drawing.Point(476, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(422, 231);
            this.panel3.TabIndex = 0;
            // 
            // voltValue
            // 
            this.voltValue.AutoSize = true;
            this.voltValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.voltValue.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.voltValue.Location = new System.Drawing.Point(199, 87);
            this.voltValue.Name = "voltValue";
            this.voltValue.Size = new System.Drawing.Size(112, 25);
            this.voltValue.TabIndex = 3;
            this.voltValue.Text = "Volt Value";
            // 
            // voltLabel
            // 
            this.voltLabel.AutoSize = true;
            this.voltLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.voltLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.voltLabel.Location = new System.Drawing.Point(37, 87);
            this.voltLabel.Name = "voltLabel";
            this.voltLabel.Size = new System.Drawing.Size(57, 25);
            this.voltLabel.TabIndex = 3;
            this.voltLabel.Text = "Volt:";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.adcValue);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(476, 231);
            this.panel2.TabIndex = 0;
            // 
            // adcValue
            // 
            this.adcValue.AutoSize = true;
            this.adcValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.adcValue.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.adcValue.Location = new System.Drawing.Point(218, 87);
            this.adcValue.Name = "adcValue";
            this.adcValue.Size = new System.Drawing.Size(120, 25);
            this.adcValue.TabIndex = 3;
            this.adcValue.Text = "ADC Value";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(55, 87);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 25);
            this.label1.TabIndex = 3;
            this.label1.Text = "ADC:";
            // 
            // disconnectButton
            // 
            this.disconnectButton.Location = new System.Drawing.Point(1020, 248);
            this.disconnectButton.Name = "disconnectButton";
            this.disconnectButton.Size = new System.Drawing.Size(163, 71);
            this.disconnectButton.TabIndex = 7;
            this.disconnectButton.Text = "Disconnect Form";
            this.disconnectButton.UseVisualStyleBackColor = true;
            this.disconnectButton.Click += new System.EventHandler(this.disconnectButton_Click);
            // 
            // FormDashBoard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.ClientSize = new System.Drawing.Size(1337, 693);
            this.Controls.Add(this.disconnectButton);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.chart1);
            this.Controls.Add(this.currentIpValue);
            this.Controls.Add(this.currentIpLabel);
            this.Name = "FormDashBoard";
            this.Text = "FormDashBoard";
            this.Load += new System.EventHandler(this.FormDashBoard_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox currentIpValue;
        private System.Windows.Forms.Label currentIpLabel;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label weightValue;
        private System.Windows.Forms.Label weightLabel;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label voltValue;
        private System.Windows.Forms.Label voltLabel;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label adcValue;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button disconnectButton;
    }
}