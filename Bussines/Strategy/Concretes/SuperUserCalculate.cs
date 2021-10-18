using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines.Strategy.Concretes
{
    class SuperUserCalculate : IStrategyCalculate
    {
        public double GetPercentage(decimal moneyToCalculate)
        {
            var percentage = 0.0;
            if (moneyToCalculate > 100)
            {
                percentage = 0.20;
            }
            return percentage;
        }
    }
}
