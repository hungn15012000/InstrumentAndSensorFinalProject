
namespace ProteusFinalProject
{
    partial class Form1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.panelMenu = new System.Windows.Forms.Panel();
            this.settingButton = new FontAwesome.Sharp.IconButton();
            this.orderButton = new FontAwesome.Sharp.IconButton();
            this.conveyorButton = new FontAwesome.Sharp.IconButton();
            this.modeButton = new FontAwesome.Sharp.IconButton();
            this.dashBoardButton = new FontAwesome.Sharp.IconButton();
            this.panelLogo = new System.Windows.Forms.Panel();
            this.homeButton = new FontAwesome.Sharp.IconButton();
            this.panelTitle = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.labelChildForm = new System.Windows.Forms.Label();
            this.iconCurrentChildForm = new FontAwesome.Sharp.IconPictureBox();
            this.panelShadow = new System.Windows.Forms.Panel();
            this.panelDesktop = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.panelMenu.SuspendLayout();
            this.panelLogo.SuspendLayout();
            this.panelTitle.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.iconCurrentChildForm)).BeginInit();
            this.panelDesktop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panelMenu
            // 
            this.panelMenu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(31)))), ((int)(((byte)(30)))), ((int)(((byte)(68)))));
            this.panelMenu.Controls.Add(this.settingButton);
            this.panelMenu.Controls.Add(this.orderButton);
            this.panelMenu.Controls.Add(this.conveyorButton);
            this.panelMenu.Controls.Add(this.modeButton);
            this.panelMenu.Controls.Add(this.dashBoardButton);
            this.panelMenu.Controls.Add(this.panelLogo);
            this.panelMenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelMenu.Location = new System.Drawing.Point(0, 0);
            this.panelMenu.Name = "panelMenu";
            this.panelMenu.Size = new System.Drawing.Size(220, 726);
            this.panelMenu.TabIndex = 0;
            // 
            // settingButton
            // 
            this.settingButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.settingButton.FlatAppearance.BorderSize = 0;
            this.settingButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.settingButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold);
            this.settingButton.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.settingButton.IconChar = FontAwesome.Sharp.IconChar.Tools;
            this.settingButton.IconColor = System.Drawing.Color.White;
            this.settingButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.settingButton.IconSize = 32;
            this.settingButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.settingButton.Location = new System.Drawing.Point(0, 340);
            this.settingButton.Name = "settingButton";
            this.settingButton.Padding = new System.Windows.Forms.Padding(10, 0, 20, 0);
            this.settingButton.Size = new System.Drawing.Size(220, 50);
            this.settingButton.TabIndex = 5;
            this.settingButton.Text = "SETTING";
            this.settingButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.settingButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.settingButton.UseVisualStyleBackColor = true;
            this.settingButton.Click += new System.EventHandler(this.settingButton_Click);
            // 
            // orderButton
            // 
            this.orderButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.orderButton.FlatAppearance.BorderSize = 0;
            this.orderButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.orderButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold);
            this.orderButton.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.orderButton.IconChar = FontAwesome.Sharp.IconChar.Amazon;
            this.orderButton.IconColor = System.Drawing.Color.White;
            this.orderButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.orderButton.IconSize = 32;
            this.orderButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.orderButton.Location = new System.Drawing.Point(0, 290);
            this.orderButton.Name = "orderButton";
            this.orderButton.Padding = new System.Windows.Forms.Padding(10, 0, 20, 0);
            this.orderButton.Size = new System.Drawing.Size(220, 50);
            this.orderButton.TabIndex = 4;
            this.orderButton.Text = "ORDER";
            this.orderButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.orderButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.orderButton.UseVisualStyleBackColor = true;
            this.orderButton.Click += new System.EventHandler(this.orderButton_Click);
            // 
            // conveyorButton
            // 
            this.conveyorButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.conveyorButton.FlatAppearance.BorderSize = 0;
            this.conveyorButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.conveyorButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold);
            this.conveyorButton.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.conveyorButton.IconChar = FontAwesome.Sharp.IconChar.ChevronCircleDown;
            this.conveyorButton.IconColor = System.Drawing.Color.White;
            this.conveyorButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.conveyorButton.IconSize = 32;
            this.conveyorButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.conveyorButton.Location = new System.Drawing.Point(0, 240);
            this.conveyorButton.Name = "conveyorButton";
            this.conveyorButton.Padding = new System.Windows.Forms.Padding(10, 0, 20, 0);
            this.conveyorButton.Size = new System.Drawing.Size(220, 50);
            this.conveyorButton.TabIndex = 3;
            this.conveyorButton.Text = "CONVEYOR";
            this.conveyorButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.conveyorButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.conveyorButton.UseVisualStyleBackColor = true;
            this.conveyorButton.Click += new System.EventHandler(this.conveyorButton_Click);
            // 
            // modeButton
            // 
            this.modeButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.modeButton.FlatAppearance.BorderSize = 0;
            this.modeButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.modeButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold);
            this.modeButton.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.modeButton.IconChar = FontAwesome.Sharp.IconChar.Cubes;
            this.modeButton.IconColor = System.Drawing.Color.White;
            this.modeButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.modeButton.IconSize = 32;
            this.modeButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.modeButton.Location = new System.Drawing.Point(0, 190);
            this.modeButton.Name = "modeButton";
            this.modeButton.Padding = new System.Windows.Forms.Padding(10, 0, 20, 0);
            this.modeButton.Size = new System.Drawing.Size(220, 50);
            this.modeButton.TabIndex = 2;
            this.modeButton.Text = "MODE";
            this.modeButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.modeButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.modeButton.UseVisualStyleBackColor = true;
            this.modeButton.Click += new System.EventHandler(this.modeButton_Click);
            // 
            // dashBoardButton
            // 
            this.dashBoardButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.dashBoardButton.FlatAppearance.BorderSize = 0;
            this.dashBoardButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.dashBoardButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dashBoardButton.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dashBoardButton.IconChar = FontAwesome.Sharp.IconChar.ChartArea;
            this.dashBoardButton.IconColor = System.Drawing.Color.White;
            this.dashBoardButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.dashBoardButton.IconSize = 32;
            this.dashBoardButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.dashBoardButton.Location = new System.Drawing.Point(0, 140);
            this.dashBoardButton.Name = "dashBoardButton";
            this.dashBoardButton.Padding = new System.Windows.Forms.Padding(10, 0, 20, 0);
            this.dashBoardButton.Size = new System.Drawing.Size(220, 50);
            this.dashBoardButton.TabIndex = 1;
            this.dashBoardButton.Text = "DASH BOARD";
            this.dashBoardButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.dashBoardButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.dashBoardButton.UseVisualStyleBackColor = true;
            this.dashBoardButton.Click += new System.EventHandler(this.dashBoardButton_Click);
            // 
            // panelLogo
            // 
            this.panelLogo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(31)))), ((int)(((byte)(30)))), ((int)(((byte)(68)))));
            this.panelLogo.Controls.Add(this.homeButton);
            this.panelLogo.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelLogo.Location = new System.Drawing.Point(0, 0);
            this.panelLogo.Name = "panelLogo";
            this.panelLogo.Size = new System.Drawing.Size(220, 140);
            this.panelLogo.TabIndex = 0;
            // 
            // homeButton
            // 
            this.homeButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.homeButton.FlatAppearance.BorderSize = 0;
            this.homeButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.homeButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.homeButton.ForeColor = System.Drawing.Color.White;
            this.homeButton.IconChar = FontAwesome.Sharp.IconChar.Heading;
            this.homeButton.IconColor = System.Drawing.Color.White;
            this.homeButton.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.homeButton.IconSize = 90;
            this.homeButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.homeButton.Location = new System.Drawing.Point(0, 0);
            this.homeButton.Name = "homeButton";
            this.homeButton.Size = new System.Drawing.Size(220, 140);
            this.homeButton.TabIndex = 0;
            this.homeButton.Text = "OME";
            this.homeButton.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.homeButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.homeButton.UseVisualStyleBackColor = true;
            this.homeButton.Click += new System.EventHandler(this.homeButton_Click);
            // 
            // panelTitle
            // 
            this.panelTitle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(31)))), ((int)(((byte)(30)))), ((int)(((byte)(68)))));
            this.panelTitle.Controls.Add(this.label1);
            this.panelTitle.Controls.Add(this.labelChildForm);
            this.panelTitle.Controls.Add(this.iconCurrentChildForm);
            this.panelTitle.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelTitle.ForeColor = System.Drawing.Color.CornflowerBlue;
            this.panelTitle.Location = new System.Drawing.Point(220, 0);
            this.panelTitle.Name = "panelTitle";
            this.panelTitle.Size = new System.Drawing.Size(1268, 140);
            this.panelTitle.TabIndex = 1;
            this.panelTitle.MouseDown += new System.Windows.Forms.MouseEventHandler(this.panelTitle_MouseDown);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(373, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(449, 29);
            this.label1.TabIndex = 1;
            this.label1.Text = "Ho Chi Minh University of Technology";
            // 
            // labelChildForm
            // 
            this.labelChildForm.AutoSize = true;
            this.labelChildForm.Location = new System.Drawing.Point(75, 44);
            this.labelChildForm.Name = "labelChildForm";
            this.labelChildForm.Size = new System.Drawing.Size(0, 17);
            this.labelChildForm.TabIndex = 1;
            // 
            // iconCurrentChildForm
            // 
            this.iconCurrentChildForm.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(31)))), ((int)(((byte)(30)))), ((int)(((byte)(68)))));
            this.iconCurrentChildForm.ForeColor = System.Drawing.Color.CornflowerBlue;
            this.iconCurrentChildForm.IconChar = FontAwesome.Sharp.IconChar.Home;
            this.iconCurrentChildForm.IconColor = System.Drawing.Color.CornflowerBlue;
            this.iconCurrentChildForm.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconCurrentChildForm.Location = new System.Drawing.Point(36, 29);
            this.iconCurrentChildForm.Name = "iconCurrentChildForm";
            this.iconCurrentChildForm.Size = new System.Drawing.Size(32, 32);
            this.iconCurrentChildForm.TabIndex = 0;
            this.iconCurrentChildForm.TabStop = false;
            // 
            // panelShadow
            // 
            this.panelShadow.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(24)))), ((int)(((byte)(58)))));
            this.panelShadow.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelShadow.Location = new System.Drawing.Point(220, 140);
            this.panelShadow.Name = "panelShadow";
            this.panelShadow.Size = new System.Drawing.Size(1268, 12);
            this.panelShadow.TabIndex = 2;
            // 
            // panelDesktop
            // 
            this.panelDesktop.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.panelDesktop.Controls.Add(this.label4);
            this.panelDesktop.Controls.Add(this.label5);
            this.panelDesktop.Controls.Add(this.label3);
            this.panelDesktop.Controls.Add(this.label2);
            this.panelDesktop.Controls.Add(this.pictureBox1);
            this.panelDesktop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelDesktop.Location = new System.Drawing.Point(220, 152);
            this.panelDesktop.Name = "panelDesktop";
            this.panelDesktop.Size = new System.Drawing.Size(1268, 574);
            this.panelDesktop.TabIndex = 3;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(433, 23);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(294, 272);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label2.Location = new System.Drawing.Point(759, 383);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(346, 29);
            this.label2.TabIndex = 1;
            this.label2.Text = "Nguyễn Trí Cường - 1851049";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label3.Location = new System.Drawing.Point(759, 440);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(358, 29);
            this.label3.TabIndex = 1;
            this.label3.Text = "Nguyễn Xuân Hùng - 1851007";
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label4.Location = new System.Drawing.Point(759, 491);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(265, 29);
            this.label4.TabIndex = 1;
            this.label4.Text = "Lê Anh Huy - 1851068";
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label5.Location = new System.Drawing.Point(31, 383);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(486, 32);
            this.label5.TabIndex = 1;
            this.label5.Text = "Supervisor: PhD Nguyễn Trọng Tài";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1488, 726);
            this.Controls.Add(this.panelDesktop);
            this.Controls.Add(this.panelShadow);
            this.Controls.Add(this.panelTitle);
            this.Controls.Add(this.panelMenu);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panelMenu.ResumeLayout(false);
            this.panelLogo.ResumeLayout(false);
            this.panelTitle.ResumeLayout(false);
            this.panelTitle.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.iconCurrentChildForm)).EndInit();
            this.panelDesktop.ResumeLayout(false);
            this.panelDesktop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelMenu;
        private System.Windows.Forms.Panel panelLogo;
        private FontAwesome.Sharp.IconButton settingButton;
        private FontAwesome.Sharp.IconButton orderButton;
        private FontAwesome.Sharp.IconButton conveyorButton;
        private FontAwesome.Sharp.IconButton modeButton;
        private FontAwesome.Sharp.IconButton dashBoardButton;
        private FontAwesome.Sharp.IconButton homeButton;
        private System.Windows.Forms.Panel panelTitle;
        private FontAwesome.Sharp.IconPictureBox iconCurrentChildForm;
        private System.Windows.Forms.Panel panelShadow;
        private System.Windows.Forms.Panel panelDesktop;
        private System.Windows.Forms.Label labelChildForm;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
    }
}

