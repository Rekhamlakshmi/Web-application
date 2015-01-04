<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseLookup.aspx.cs" Inherits="University.CourseLookup" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   
     <table>
         
        <tr>
        <td> 
            <asp:Label  ID="lblSemester" Text="Semester" runat="server"></asp:Label> 
        </td>
            <td>
            <asp:DropDownList ID="ddSemester" runat="server"></asp:DropDownList>
            </td> 
            
    <tr>
        <td>
            <asp:Label ID="lblYear" Text="Year" runat="server"></asp:Label>
        </td>
        <td><asp:TextBox ID="txtYear" runat="server" Width="100px" CssClass="textbox" ></asp:TextBox></td>
        <td>
            <asp:Label ID="lblInstructor" Text="Instructor" runat="server"></asp:Label>
        </td>
        <td> 
            <asp:DropDownList ID="ddInstructor" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblCName" Text="Course Name" runat="server"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="ddCourseName" runat="server"></asp:DropDownList>
    </td>
        <td>
            <asp:Label ID="lblCourseNumber" Text="Course Number" runat="server"></asp:Label>
        </td>
        <td> 
            <asp:DropDownList ID="ddCourseNumber" runat="server" AppendDataBoundItems="False"></asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click"  />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLectStart" Text="Lecture Start Time" runat="server"></asp:Label>
        </td>
        <td> 
            <asp:DropDownList ID="ddLectstart" runat="server"></asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="lblLecEnd" Text="Lecture End Time" runat="server"></asp:Label>
        </td>
        <td> 
            <asp:DropDownList ID="ddLecEnd" runat="server"></asp:DropDownList>
        </td>
    </tr>
    </table>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
</div>       
   <div>
              <asp:DataGrid ID="gridCourseLookup" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                  <AlternatingItemStyle BackColor="#F7F7F7" />
                  <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                  <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                  <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                  <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Mode="NumericPages" />
                  <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
              </asp:DataGrid>
   </div>
</asp:Content>
