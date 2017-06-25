namespace Apresentacao
{
    partial class frmBancas
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
            this.lvBancas = new System.Windows.Forms.ListView();
            this.lvIdBancas = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lvBancasDescricao = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lvBancasPC = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lvBancasIpNet = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lblReferencia = new System.Windows.Forms.Label();
            this.lblData = new System.Windows.Forms.Label();
            this.lblUser = new System.Windows.Forms.Label();
            this.lblID = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label12 = new System.Windows.Forms.Label();
            this.label29 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.label27 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.txtNotas = new System.Windows.Forms.TextBox();
            this.lblNotasBancas = new System.Windows.Forms.Label();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // lvBancas
            // 
            this.lvBancas.Activation = System.Windows.Forms.ItemActivation.OneClick;
            this.lvBancas.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.lvIdBancas,
            this.lvBancasDescricao,
            this.lvBancasPC,
            this.lvBancasIpNet});
            this.lvBancas.GridLines = true;
            this.lvBancas.Location = new System.Drawing.Point(229, 109);
            this.lvBancas.Name = "lvBancas";
            this.lvBancas.Size = new System.Drawing.Size(568, 198);
            this.lvBancas.TabIndex = 47;
            this.lvBancas.UseCompatibleStateImageBehavior = false;
            this.lvBancas.View = System.Windows.Forms.View.Details;
            this.lvBancas.SelectedIndexChanged += new System.EventHandler(this.lvCarencia_SelectedIndexChanged);
            // 
            // lvIdBancas
            // 
            this.lvIdBancas.Text = "Id";
            // 
            // lvBancasDescricao
            // 
            this.lvBancasDescricao.Text = "Descrição";
            this.lvBancasDescricao.Width = 247;
            // 
            // lvBancasPC
            // 
            this.lvBancasPC.Text = "PC";
            this.lvBancasPC.Width = 134;
            // 
            // lvBancasIpNet
            // 
            this.lvBancasIpNet.Text = "Ip Net";
            this.lvBancasIpNet.Width = 122;
            // 
            // lblReferencia
            // 
            this.lblReferencia.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblReferencia.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblReferencia.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lblReferencia.Location = new System.Drawing.Point(542, 36);
            this.lblReferencia.Name = "lblReferencia";
            this.lblReferencia.Size = new System.Drawing.Size(75, 17);
            this.lblReferencia.TabIndex = 50;
            this.lblReferencia.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblData
            // 
            this.lblData.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblData.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblData.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lblData.Location = new System.Drawing.Point(623, 36);
            this.lblData.Name = "lblData";
            this.lblData.Size = new System.Drawing.Size(75, 17);
            this.lblData.TabIndex = 51;
            this.lblData.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblUser
            // 
            this.lblUser.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblUser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblUser.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lblUser.Location = new System.Drawing.Point(461, 36);
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(75, 17);
            this.lblUser.TabIndex = 49;
            this.lblUser.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblID
            // 
            this.lblID.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblID.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lblID.Location = new System.Drawing.Point(362, 36);
            this.lblID.Name = "lblID";
            this.lblID.Size = new System.Drawing.Size(68, 17);
            this.lblID.TabIndex = 52;
            this.lblID.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.panel2.Controls.Add(this.label12);
            this.panel2.Controls.Add(this.label29);
            this.panel2.Controls.Add(this.label28);
            this.panel2.Controls.Add(this.label27);
            this.panel2.Controls.Add(this.label14);
            this.panel2.Location = new System.Drawing.Point(1, 1);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(813, 32);
            this.panel2.TabIndex = 48;
            // 
            // label12
            // 
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label12.Location = new System.Drawing.Point(361, 11);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(68, 13);
            this.label12.TabIndex = 35;
            this.label12.Text = "ID";
            this.label12.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label29
            // 
            this.label29.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label29.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label29.Location = new System.Drawing.Point(620, 11);
            this.label29.Name = "label29";
            this.label29.Size = new System.Drawing.Size(77, 13);
            this.label29.TabIndex = 6;
            this.label29.Text = "Data";
            this.label29.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label28
            // 
            this.label28.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label28.Location = new System.Drawing.Point(541, 11);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(76, 13);
            this.label28.TabIndex = 5;
            this.label28.Text = "Referência";
            this.label28.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label27
            // 
            this.label27.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label27.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label27.Location = new System.Drawing.Point(460, 11);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(75, 13);
            this.label27.TabIndex = 4;
            this.label27.Text = "User";
            this.label27.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Bodoni MT", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label14.Location = new System.Drawing.Point(15, 7);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(185, 19);
            this.label14.TabIndex = 3;
            this.label14.Text = "Gerenciamento de Bancas";
            // 
            // txtNotas
            // 
            this.txtNotas.Location = new System.Drawing.Point(229, 334);
            this.txtNotas.Multiline = true;
            this.txtNotas.Name = "txtNotas";
            this.txtNotas.Size = new System.Drawing.Size(568, 69);
            this.txtNotas.TabIndex = 53;
            // 
            // lblNotasBancas
            // 
            this.lblNotasBancas.AutoSize = true;
            this.lblNotasBancas.Location = new System.Drawing.Point(233, 316);
            this.lblNotasBancas.Name = "lblNotasBancas";
            this.lblNotasBancas.Size = new System.Drawing.Size(38, 13);
            this.lblNotasBancas.TabIndex = 54;
            this.lblNotasBancas.Text = "Notas:";
            // 
            // frmBancas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(815, 415);
            this.Controls.Add(this.lblNotasBancas);
            this.Controls.Add(this.txtNotas);
            this.Controls.Add(this.lvBancas);
            this.Controls.Add(this.lblReferencia);
            this.Controls.Add(this.lblData);
            this.Controls.Add(this.lblUser);
            this.Controls.Add(this.lblID);
            this.Controls.Add(this.panel2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmBancas";
            this.Text = ".:::   Gerenciamento de Bancas   :::.";
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView lvBancas;
        private System.Windows.Forms.ColumnHeader lvIdBancas;
        private System.Windows.Forms.ColumnHeader lvBancasDescricao;
        private System.Windows.Forms.ColumnHeader lvBancasPC;
        private System.Windows.Forms.ColumnHeader lvBancasIpNet;
        protected System.Windows.Forms.Label lblReferencia;
        protected System.Windows.Forms.Label lblData;
        protected System.Windows.Forms.Label lblUser;
        private System.Windows.Forms.Label lblID;
        private System.Windows.Forms.Panel panel2;
        protected System.Windows.Forms.Label label12;
        protected System.Windows.Forms.Label label29;
        protected System.Windows.Forms.Label label28;
        protected System.Windows.Forms.Label label27;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox txtNotas;
        private System.Windows.Forms.Label lblNotasBancas;
    }
}