using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_2
{
    internal static class Maths
    {
        public static long Add(int X, int Y)
        {
            // Return long to handle overflow.
            return (long)X + Y;
        }
        public static long Subtract(int X, int Y)
        {
            return (long)X - Y;
        }
        public static long Multiply(int X, int Y)
        {
            return (long)X * Y;
        }
        public static float Divide(int X, int Y)
        {
            if (Y == 0)
                throw new DivideByZeroException();

            return 1f * X / Y;
        }
    }
}
