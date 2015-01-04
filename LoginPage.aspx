<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="University.LoginPage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        
    <tr>
        <td>
             <h3>Welcome to the Online Portal of UT Dallas!</h3>
    <ol class="round">
        <li class="one">
            <h5>Course Lookup</h5>
             Course Lookup feature allows you to easily search for classes being taught in a given semester by specifying any of the following:Semester,Year,Course Name,Course Number,Instructor,Lecture Time.     
        </li>
        <li class="two">
            <h5>Course Registration</h5>
            You can view a section's details,seat availability and Enroll or Drop students to/from a Section.           
        </li>
        <li class="three">
            <h5>Find Students</h5>
            View the names of students who are registered in a given section using the Find Students feature. 
        </li>
        <li class="four">
            <h5>Student Center</h5>
            One stop shop for viewing a student's information including Personal Profile, Grades,Courses enrolled,Updating a student's contact details,etc. 
        </li>
        <li class="five">
            <h5>Faculty Profile</h5>
            View details of the faculty such as Rank,Office hours,Office room by searching by their last name.
        </li>
    </ol>
         </td>
        <td>
    <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false" OnAuthenticate="Login1_Authenticate"  OnLoginError="Login1_LoginError" DestinationPageUrl="~/CourseLookup.aspx">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                     </ol>
                    <asp:Button ID="Button1" runat="server" CommandName="Login" Text="Log in" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
            </td>
        </tr>
       </table>     
</asp:Content>
