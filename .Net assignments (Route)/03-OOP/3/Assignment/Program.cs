using System.Collections;
using System.Text;

namespace Assignment
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Read 2 points with validation
            Point3D[] point3D = new Point3D[2];
            for (int i = 0; i < 2; i++)
            {
                bool ValidX = false, ValidY = false, ValidZ = false;
                int X, Y, Z;
                do
                {
                    Console.Write($"Enter P{i + 1} X: ");
                    ValidX = int.TryParse(Console.ReadLine(), out X);

                    Console.Write($"Enter P{i + 1} Y: ");
                    ValidY = int.TryParse(Console.ReadLine(), out Y);

                    Console.Write($"Enter P{i + 1} Z: ");
                    ValidZ = int.TryParse(Console.ReadLine(), out Z);

                } while (!ValidX || !ValidY || !ValidZ);

                point3D[i] = new Point3D(X, Y, Z);
            }


            if (point3D[0] == point3D[1])
                Console.WriteLine("The two objects have the same hash code but may have different values");

            // This line is enough to sort based on X, Y but i will implement CompareTo().
            Array.Sort(point3D);

        }
    }
}
