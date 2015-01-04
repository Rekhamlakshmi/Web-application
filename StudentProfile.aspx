<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="University.StudentProfile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label Text="Enter the Student's NetID" runat="server" Font-Bold="true"></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblnetid" runat="server" Text="Student Net ID"></asp:Label>
        <asp:TextBox ID="txtnetid" runat="server" Width="90px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqnetid"  ControlToValidate="txtnetid" ErrorMessage="Please enter a student ID." runat="server" Font-Bold="True" CssClass="field-validation-error"></asp:RequiredFieldValidator> </div>
    <div>
        <div>
            <asp:Label ID="lblinvalidnetid" runat="server" Text="Invalid Student NetID.Please enter another value." Visible="false" Font-Bold="True" CssClass="field-validation-error"></asp:Label>
        </div>
        <asp:Button ID="btnPersonalinfo" runat="server" Text="View Profile" OnClick="btnPersonalinfo_Click" />
        <asp:Button ID="btnviewprofile" runat="server"  Text="View Grades" OnClick="btnviewprofile_Click" />
        <asp:Button ID="btnClassSchedule" runat="server" Text="View Class Schedule" OnClick="btnClassSchedule_Click" />
    </div>
    <div>
            <asp:GridView ID="gridProfile" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
                <asp:GridView ID="gridProfile1" runat="server"  BorderColor="#E7E7FF" BorderStyle="None" Font-Names="Calibri" Font-Size="15px" BackColor="White" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowEditing="gridProfile1_RowEditing" AutoGenerateEditButton="True" OnRowUpdating="gridProfile1_RowUpdating" AutoGenerateColumns="False" OnRowCancelingEdit="gridProfile1_RowCancelingEdit">

                    <AlternatingRowStyle BackColor="#F7F7F7" />

                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />

                    <HeaderStyle BorderStyle="Solid" Font-Names="Calibri" Font-Size="Medium" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    <Columns>
                        <asp:BoundField DataField="StudentNo" HeaderText="StudentNo" ReadOnly="True" ControlStyle-CssClass="cssWdth" />
                        <asp:TemplateField HeaderText="FName">
                            <ItemTemplate> <%#Eval("FName")%></ItemTemplate>
                                <EditItemTemplate>
                          <asp:TextBox ID="txtFName" runat="server" Text='<%#Eval("FName")%>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LName">
                            <ItemTemplate>
                                <%#Eval("LName")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                          <asp:TextBox ID="txtLName" runat="server" Text='<%#Eval("LName")%>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <%#Eval("Address")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                          <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("Address")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate>
                                <%#Eval("Phone")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                          <asp:TextBox ID="txtPhone" runat="server" Text='<%#Eval("Phone")%>' Width="60px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sex">
                            <ItemTemplate>
                                <%#Eval("Sex")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                          <asp:TextBox ID="txtSex" runat="server" Text='<%#Eval("Sex")%>' Width="15px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Degree">
                            <ItemTemplate>
                                <%#Eval("Degree")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                          <asp:TextBox ID="txtDegree" runat="server" Text='<%#Eval("Degree")%>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
        
        
    </div>      
</asp:Content>
