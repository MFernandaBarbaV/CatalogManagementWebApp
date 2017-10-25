using Microsoft.VisualStudio.TestTools.UnitTesting;
using CatalogManagement.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CatalogManagement.Code.Tests
{
    [TestClass()]
    public class SecurityTests
    {
        [TestMethod()]
        public void EncryptTest()
        {
            try
            {
                string text = "321321321";
                string result = Security.Encrypt(text);
                string result2 = Security.Decrypt(result);

                Assert.AreEqual(text, result2, result2);               

                Assert.AreEqual(Security.Encrypt(text), Security.Encrypt(text), "Son diferentes");
            }
            catch ( Exception e)
            {
                Assert.Fail(e.Message);
            }
        }
    }
}