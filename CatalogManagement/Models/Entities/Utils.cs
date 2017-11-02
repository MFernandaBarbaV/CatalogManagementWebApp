﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public static class Utils
    {
        public static readonly string RegexEmail = @"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$";



        public static readonly string OnlyNumber = @"^([0-9]{1,6})$";

        public static readonly string ErrorOnlyNumber = "El campo solo acepta valores numéricos";

        public static readonly string Money = @"\d+(?:.\d{1,2})?";

        public static string ErrorMoney = "El campo solo acepta valores numéricos";

        public static string GenerateRegex(bool aphabeticLower, bool alphabeticUpper, bool numbers, bool spaces, int minLenght, int maxLenght, bool accent, bool specialChars, ref string messageValidation)
        {
            string regex = string.Empty;

            string tempRegex = (alphabeticUpper ? "A-ZÑ" : "") +
                                (aphabeticLower ? "a-zñ" : "") +
                                (numbers ? "0-9" : "") +
                                (spaces ? @"\s" : "") +
                                (specialChars ? @".,\-/&\"";:*/°/$/_/#/|@<>()/\^+~¿¡?=%/|/=/~/¬/!/¿/¡/?/(/)/@/</>/[\]/{/}/+\\/^" : "") +
                                (accent & alphabeticUpper ? "ÁÉÍÓÚ" : "") +
                                (accent & aphabeticLower ? "áéíóú" : "");

            regex = "^([" + tempRegex + "]{" + minLenght + "," + maxLenght + "})$";

            messageValidation = "El campo no acepta: " +
                                (alphabeticUpper ? "" : "Mayúsculas A-Z, ") +
                                (aphabeticLower ? "" : "Minúsculas a-z, ") +
                                (accent ? "" : "Acentos, ") +
                                (numbers ? "" : "Números 0-9, ") +
                                (spaces ? "" : "Espacios, ") +
                                (specialChars ? "" : @"Caracteres especiales:  .,:;-=*+°_{}()[]¿?¡!#$%&^*~¬\/|") +
                                " y una longitud de " + minLenght + " a " + maxLenght + " caracteres.";



            return regex;
        }
    }
}