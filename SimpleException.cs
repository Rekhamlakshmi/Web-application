using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Error_Handler_Control;

namespace University.Exception_Handling
{
    public class SimpleException
    {
        public static void HandleException(Exception ex)
        {
            ErrorMessageControl.AddErrorMessage("The following error has occurred:" + ex.Message + "Please correct the error.");
        }
    }
}