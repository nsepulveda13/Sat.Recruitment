using Bussines.Strategy;
using Bussines.Strategy.Concretes;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines
{
    public class FactoryUser
    {
        private readonly Dictionary<string, IStrategyCalculate> users;


        public FactoryUser()
        {
            users = new Dictionary<string, IStrategyCalculate>
            {
                { "Normal", new NormalUserCalculate() },
                { "SuperUser", new SuperUserCalculate() },
                { "Premium", new PremiumUserCalculate() }
            };
        }

        public decimal GetMoneyCalculatedByUser(User user)
        {
            var percentage = users[user.UserType].GetPercentage(user.Money);
            var gif = user.Money * Convert.ToDecimal(percentage);
            return user.Money + gif;
        }

    }
}
