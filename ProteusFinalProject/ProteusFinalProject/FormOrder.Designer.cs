
namespace ProteusFinalProject
{
    partial class FormOrder
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
            this.currentWeightLabel = new System.Windows.Forms.Label();
            this.currentWeightValue = new System.Windows.Forms.TextBox();
            this.currentIpValue = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.itemDataGrid = new System.Windows.Forms.DataGridView();
            this.addButton = new System.Windows.Forms.Button();
            this.itemNameLabel = new System.Windows.Forms.Label();
            this.itemNameValue = new System.Windows.Forms.TextBox();
            this.numberLabel = new System.Windows.Forms.Label();
            this.itemNumberValue = new System.Windows.Forms.TextBox();
            this.itemQuantityLabel = new System.Windows.Forms.Label();
            this.itemQuantityValue = new System.Windows.Forms.TextBox();
            this.disconnectButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.itemDataGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // currentWeightLabel
            // 
            this.currentWeightLabel.AutoSize = true;
            this.currentWeightLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.currentWeightLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.currentWeightLabel.Location = new System.Drawing.Point(67, 29);
            this.currentWeightLabel.Name = "currentWeightLabel";
            this.currentWeightLabel.Size = new System.Drawing.Size(158, 25);
            this.currentWeightLabel.TabIndex = 0;
            this.currentWeightLabel.Text = "Current Weight";
            // 
            // currentWeightValue
            // 
            this.currentWeightValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.currentWeightValue.Location = new System.Drawing.Point(261, 26);
            this.currentWeightValue.Multiline = true;
            this.currentWeightValue.Name = "currentWeightValue";
            this.currentWeightValue.Size = new System.Drawing.Size(154, 49);
            this.currentWeightValue.TabIndex = 1;
            this.currentWeightValue.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // currentIpValue
            // 
            this.currentIpValue.FormattingEnabled = true;
            this.currentIpValue.Location = new System.Drawing.Point(925, 33);
            this.currentIpValue.Name = "currentIpValue";
            this.currentIpValue.Size = new System.Drawing.Size(217, 24);
            this.currentIpValue.TabIndex = 2;
            this.currentIpValue.Text = "192.168.1.9";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(800, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(110, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Current IP";
            // 
            // itemDataGrid
            // 
            this.itemDataGrid.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.itemDataGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.itemDataGrid.Location = new System.Drawing.Point(72, 277);
            this.itemDataGrid.Name = "itemDataGrid";
            this.itemDataGrid.RowHeadersWidth = 51;
            this.itemDataGrid.RowTemplate.Height = 24;
            this.itemDataGrid.Size = new System.Drawing.Size(871, 288);
            this.itemDataGrid.TabIndex = 3;
            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(980, 514);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(162, 51);
            this.addButton.TabIndex = 4;
            this.addButton.Text = "ADD";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.addButton_Click);
            // 
            // itemNameLabel
            // 
            this.itemNameLabel.AutoSize = true;
            this.itemNameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemNameLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.itemNameLabel.Location = new System.Drawing.Point(67, 104);
            this.itemNameLabel.Name = "itemNameLabel";
            this.itemNameLabel.Size = new System.Drawing.Size(115, 25);
            this.itemNameLabel.TabIndex = 0;
            this.itemNameLabel.Text = "Item Name";
            // 
            // itemNameValue
            // 
            this.itemNameValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemNameValue.Location = new System.Drawing.Point(261, 101);
            this.itemNameValue.Multiline = true;
            this.itemNameValue.Name = "itemNameValue";
            this.itemNameValue.Size = new System.Drawing.Size(338, 28);
            this.itemNameValue.TabIndex = 1;
            this.itemNameValue.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // numberLabel
            // 
            this.numberLabel.AutoSize = true;
            this.numberLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numberLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.numberLabel.Location = new System.Drawing.Point(67, 138);
            this.numberLabel.Name = "numberLabel";
            this.numberLabel.Size = new System.Drawing.Size(87, 25);
            this.numberLabel.TabIndex = 0;
            this.numberLabel.Text = "Number";
            // 
            // itemNumberValue
            // 
            this.itemNumberValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemNumberValue.Location = new System.Drawing.Point(261, 135);
            this.itemNumberValue.Multiline = true;
            this.itemNumberValue.Name = "itemNumberValue";
            this.itemNumberValue.Size = new System.Drawing.Size(338, 28);
            this.itemNumberValue.TabIndex = 1;
            this.itemNumberValue.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // itemQuantityLabel
            // 
            this.itemQuantityLabel.AutoSize = true;
            this.itemQuantityLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemQuantityLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.itemQuantityLabel.Location = new System.Drawing.Point(67, 172);
            this.itemQuantityLabel.Name = "itemQuantityLabel";
            this.itemQuantityLabel.Size = new System.Drawing.Size(93, 25);
            this.itemQuantityLabel.TabIndex = 0;
            this.itemQuantityLabel.Text = "Quantity";
            // 
            // itemQuantityValue
            // 
            this.itemQuantityValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.itemQuantityValue.Location = new System.Drawing.Point(261, 169);
            this.itemQuantityValue.Multiline = true;
            this.itemQuantityValue.Name = "itemQuantityValue";
            this.itemQuantityValue.Size = new System.Drawing.Size(338, 28);
            this.itemQuantityValue.TabIndex = 1;
            this.itemQuantityValue.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // disconnectButton
            // 
            this.disconnectButton.Location = new System.Drawing.Point(990, 84);
            this.disconnectButton.Name = "disconnectButton";
            this.disconnectButton.Size = new System.Drawing.Size(163, 71);
            this.disconnectButton.TabIndex = 8;
            this.disconnectButton.Text = "Disconnect Form";
            this.disconnectButton.UseVisualStyleBackColor = true;
            this.disconnectButton.Click += new System.EventHandler(this.disconnectButton_Click);
            // 
            // FormOrder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.ClientSize = new System.Drawing.Size(1225, 632);
            this.Controls.Add(this.disconnectButton);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.itemDataGrid);
            this.Controls.Add(this.currentIpValue);
            this.Controls.Add(this.itemQuantityValue);
            this.Controls.Add(this.itemQuantityLabel);
            this.Controls.Add(this.itemNumberValue);
            this.Controls.Add(this.itemNameValue);
            this.Controls.Add(this.numberLabel);
            this.Controls.Add(this.currentWeightValue);
            this.Controls.Add(this.itemNameLabel);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.currentWeightLabel);
            this.Name = "FormOrder";
            this.Text = "FormOrder";
            this.Load += new System.EventHandler(this.FormOrder_Load);
            ((System.ComponentModel.ISupportInitialize)(this.itemDataGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label currentWeightLabel;
        private System.Windows.Forms.TextBox currentWeightValue;
        private System.Windows.Forms.ComboBox currentIpValue;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView itemDataGrid;
        private System.Windows.Forms.Button addButton;
        private System.Windows.Forms.Label itemNameLabel;
        private System.Windows.Forms.TextBox itemNameValue;
        private System.Windows.Forms.Label numberLabel;
        private System.Windows.Forms.TextBox itemNumberValue;
        private System.Windows.Forms.Label itemQuantityLabel;
        private System.Windows.Forms.TextBox itemQuantityValue;
        private System.Windows.Forms.Button disconnectButton;
    }
}