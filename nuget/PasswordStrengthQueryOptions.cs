using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PasswordStrength
{
    /// <summary>
    /// Query options for the Password Strength API
    /// </summary>
    public class PasswordStrengthQueryOptions
    {
        /// <summary>
        /// The password to check the strength of
        /// Example: Password123
        /// </summary>
        [JsonProperty("password")]
        public string Password { get; set; }
    }
}
