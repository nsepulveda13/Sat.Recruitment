using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines.Strategy
{
    class PremiumUserCalculate : IStrategyCalculate
    {
        public double GetPercentage(decimal moneyToCalculate)
        {
            var percentage = 0;
            if (moneyToCalculate > 100)
            {
                percentage = 2;
            }
            return percentage;
        }
    }
}
