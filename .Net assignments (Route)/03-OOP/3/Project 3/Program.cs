namespace Project_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Duration D1 = new Duration(1, 10, 15);
            Console.WriteLine("Duration D1 = new Duration(1, 10, 15);");
            Console.WriteLine(D1);
            Console.WriteLine("=====================================");


            Duration D2 = new Duration(3600);
            Console.WriteLine("Duration D2 = new Duration(3600);");
            Console.WriteLine(D2);
            Console.WriteLine("=====================================");


            Duration D3 = new Duration(7800);
            Console.WriteLine("Duration D3 = new Duration(7800);");
            Console.WriteLine(D3);
            Console.WriteLine("=====================================");


            Duration D4 = new Duration(666);
            Console.WriteLine("Duration D4 = new Duration(666);");
            Console.WriteLine(D4);
            Console.WriteLine("=====================================");


            Duration D5 = new Duration(5);
            Console.WriteLine("Duration D5 = new Duration(5);");
            Console.WriteLine(D5);
            Console.WriteLine("=====================================");


            Duration D6 = new Duration(0);
            Console.WriteLine("Duration D6 = new Duration(0);");
            Console.WriteLine(D6);
            
        }
    }
}
