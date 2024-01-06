
using System.Text;

namespace Assignment4
{
    internal class Program
    {
        static void ValueVsReference_ValueType(ref int a, int b)
        {
            a = 0;
            b = 0;
        }
        static void ValueVsReference_ReferenceType(ref int[] a, int[] b)
        {
            a = new int[] { 1, 2, 3 };
            b = new int[] { 1, 2, 3 };
        }
        static int[] Summation_Subtracting(int a, int b, int c, int d)
        {
            return new int[] { a + b, c - d };
        }
        static int SumDigits(string num)
        {
            int sum = 0;
            foreach (char c in num)
                sum += c - '0';
            return sum;
        }
        static bool IsPrime(int x)
        {
            // O(square root(x))
            if (x == 1)
                return false;

            for (int i = 2; i * i <= x; i++)
                if (x % i == 0)
                    return false;

            return true;
        }
        static void MinMaxArray(int[] arr, out int min, out int max)
        {
            max = arr.Max();
            min = arr.Min();
        }
        static int Factorial(int num)
        {
            int fact = 1;
            while (num > 0)
            {
                fact *= num;
                num--;
            }
            return fact;
        }
        static void ChangeChar(ref string s, int index, char NewChar)
        {
            StringBuilder sb = new StringBuilder(s);
            sb[index] = NewChar;
            s = sb.ToString();
        }
        static void Main(string[] args)
        {
            #region Problem1
            //int a = 10, b = 10;
            //Console.WriteLine($"Before update a = {a} , b = {b}");
            //ValueVsReference_ValueType(ref a, b);
            //Console.WriteLine($"After update a = {a} , b = {b}");
            ///*
            // That means b did not be affected from ValueVsReference_ValueType() as we passed it by value.
            // - Passing by value => Create a copy int to be used in ValueVsReference_ValueType().
            // - Passing by refernece => Use the passed and do not create a copy of it.
            // */
            #endregion

            #region Problem2
            //int[] a = { 5, 6, 7 }, b = { 5, 6, 7 };

            //Console.WriteLine($"Array a before update: {a[0]}, {a[1]}, {a[2]}");
            //Console.WriteLine($"Array b before update: {b[0]}, {b[1]}, {b[2]}");
            //Console.WriteLine("==========================");
            //ValueVsReference_ReferenceType(ref a, b);

            //Console.WriteLine($"Array a before update: {a[0]}, {a[1]}, {a[2]}");
            //Console.WriteLine($"Array b before update: {b[0]}, {b[1]}, {b[2]}");
            ///*
            // When we passed the refernce of array a by reference and made an update 
            // the compiler will create a new object and make the passed refernce refering to it.
            // when we pass by value and make update the compiler will create a new object but it 
            // will not make the given refernce refering to it.
            // */
            #endregion

            #region Problem3
            //int a = 0, b = 3, c = 5, d = 10;
            //Console.WriteLine(Summation_Subtracting(a, b, c, d));
            #endregion

            #region Problem4
            //Console.Write("Enter a number: ");
            //string s = Console.ReadLine();
            //Console.WriteLine($"The sum of the digits of the number {s} is: {SumDigits(s)}");
            #endregion

            #region Problem5
            //Console.WriteLine(IsPrime(25));
            #endregion

            #region Problem6
            //int[] arr = { 1, 2, -10, 5, 45 };
            //int max = default, min = default;
            //MinMaxArray(arr, out max, out min);
            //Console.WriteLine($"Max = {max}, Min = {min}");
            #endregion

            #region Problem7
            //int num = int.Parse(Console.ReadLine());
            //Console.WriteLine($"Factorial of {num} = {Factorial(num)}");
            #endregion

            #region Problem8
            //string a = "youdef";
            //ChangeChar(ref a, 3, 's');
            //Console.WriteLine(a);
            #endregion

            #region Note
            // Can't see difficult  problems :)
            #endregion
        }
    }
}
