namespace Project_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Test Add
            Console.WriteLine(Maths.Add(int.MaxValue, int.MaxValue));

            // Test Subtract
            Console.WriteLine(Maths.Subtract(int.MinValue, int.MaxValue));

            // Test Multiply
            Console.WriteLine(Maths.Multiply(int.MaxValue, int.MaxValue));

            // Test Divide
            Console.WriteLine(Maths.Divide(int.MaxValue, int.MaxValue));
            Console.WriteLine(Maths.Divide(int.MaxValue, 0));

        }
    }
}
