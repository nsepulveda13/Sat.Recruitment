using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines.Strategy
{
  public  interface IStrategyCalculate
    {

       public double GetPercentage(decimal moneyToCalculate);
    }
}
