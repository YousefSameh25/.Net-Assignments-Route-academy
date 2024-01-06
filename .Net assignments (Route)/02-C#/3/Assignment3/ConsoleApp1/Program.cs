namespace ConsoleApp1
{
    internal class Program
    {
        static int FastPower(int b, int p)
        {
            if (p == 0 || b == 1)
                return 1;

            int half = FastPower(b, p / 2);

            half *= half;

            if (p % 2 == 1)
                half *= b;

            return half;
        }

        static void Main(string[] args)
        {
            #region Problem1
            //int x = int.Parse(Console.ReadLine());
            //if (x % 3 == 0 && x % 4 == 0)
            //    Console.WriteLine("Yes");
            //else
            //    Console.WriteLine("No");
            #endregion

            #region Problem2
            //int x = int.Parse(Console.ReadLine());
            //if (x < 0)
            //    Console.WriteLine("Negative");
            //else
            //    Console.WriteLine("Positive");
            #endregion

            #region Problem3
            //int mx = int.MinValue, mn = int.MaxValue;
            //for (int i = 0; i < 3; i++)
            //{
            //    int x = int.Parse(Console.ReadLine());
            //    if (x > mx) mx = x;
            //    if (x < mn) mn = x;
            //}
            //Console.WriteLine($"Max value = {mx}"); 
            //Console.WriteLine($"Min value = {mn}");
            #endregion

            #region Problem4
            //int x = int.Parse(Console.ReadLine());
            //Console.WriteLine((x & 1) == 1 ? "Odd" : "Even");
            #endregion

            #region Problem5
            //bool[] IsVowel = new bool[26];

            //// Mark vowel characters
            //IsVowel['a' - 'a'] = true;
            //IsVowel['e' - 'a'] = true;
            //IsVowel['i' - 'a'] = true;
            //IsVowel['o' - 'a'] = true;
            //IsVowel['u' - 'a'] = true;

            //char c = char.Parse(Console.ReadLine());
            //c = char.ToLower(c);

            //Console.WriteLine(IsVowel[c - 'a'] == true ? "vowel" : "Consonant");

            #endregion

            #region Problem6
            //int r = int.Parse(Console.ReadLine());

            //StringBuilder sb = new StringBuilder();
            //string comma = "";

            //for (int i = 1; i <= r; i++)
            //{
            //    sb.Append(comma);
            //    sb.Append(i.ToString());
            //    comma = ", ";
            //}
            //Console.WriteLine(sb);
            #endregion

            #region Problem7
            //int x = int.Parse(Console.ReadLine());

            //for (int i = 1; i <= 12; i++)
            //{
            //    Console.Write(x * i);
            //    Console.Write(" ");
            //}
            #endregion

            #region Problem8
            //int r = int.Parse(Console.ReadLine());

            //for (int i = 2; i <= r; i += 2)
            //{
            //    Console.Write(i);
            //    Console.Write(" ");
            //}
            #endregion

            #region Problem9
            //int b = int.Parse(Console.ReadLine());
            //int p = int.Parse(Console.ReadLine());

            //Console.WriteLine(FastPower(b , p));
            //// In O(Log2(p)) not O(p) :)
            #endregion

            #region Problem10
            //Console.Write("Enter Marks of five subjects:");

            //int sum = 0;

            //for (int i = 0; i < 5; i++)
            //{
            //    int x = int.Parse(Console.ReadLine());
            //    sum += x;
            //}

            //Console.WriteLine($"Total marks = {sum}");
            //Console.WriteLine($"Average Marks = {sum / 5}");
            //Console.WriteLine($"Percentage = {sum / 500f * 100}%");
            #endregion

            #region Problem11
            //Console.Write("Month Number: ");
            //int m = int.Parse(Console.ReadLine());

            //Console.Write("Days in Month: ");
            //if (m == 2)
            //    Console.WriteLine("28 or 29");
            //else if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12)
            //    Console.WriteLine(31);
            //else if (m == 4 || m == 6 || m == 9 || m == 11)
            //    Console.WriteLine(30);
            #endregion

            #region Problem12
            //Console.Write("Enter the firsat number: ");
            //int a = int.Parse(Console.ReadLine());

            //Console.Write("Enter the second number: ");
            //int b = int.Parse(Console.ReadLine());

            //Console.Write("Enter the operator ('+', '-', '/', '*'): ");
            //char op = char.Parse(Console.ReadLine());

            //if (op == '+')
            //    Console.WriteLine($"{a} {op} {b} = {a + b}");
            //else if (op == '-')
            //    Console.WriteLine($"{a} {op} {b} = {a - b}");
            //else if (op == '/')
            //    Console.WriteLine($"{a} {op} {b} = {a / b}");
            //else
            //    Console.WriteLine($"{a} {op} {b} = {a * b}");
            #endregion

            #region Problem13
            //string s = Console.ReadLine();
            //Console.WriteLine(s.Reverse().ToArray());
            #endregion

            #region Problem14
            //int x = int.Parse(Console.ReadLine());
            //while (x > 0)
            //{
            //    Console.Write(x % 10);
            //    x /= 10;
            //}
            #endregion

            #region Problem15

            //Console.Write("starting number of range: ");
            //int l = int.Parse(Console.ReadLine());

            //Console.Write("ending number of range: ");
            //int r = int.Parse(Console.ReadLine());

            //// Use sieve algorithm to preprocess prime numbers.
            //bool[] IsPrime = new bool[r + 1];

            //// Initially all numbers are primes
            //for (int i = 2; i <= r; i++)
            //    IsPrime[i] = true;

            //// O(rlog(log(r)))
            //for (int i = 2; i <= r; i++)
            //{
            //    if (!IsPrime[i])
            //        continue;
            //    for (int j = i + i; j <= r; j += i)
            //        IsPrime[j] = false;
            //}

            //Console.Write($"The prime number between {l} and {r} are : ");
            //for (int i = l; i <= r; i++)
            //{
            //    if (IsPrime[i])
            //    {
            //        Console.Write(i);
            //        Console.Write(" ");
            //    }
            //}
            #endregion

            #region Problem16
            //Console.Write("Enter a number to convert: ");

            //int num = int.Parse(Console.ReadLine());

            //Console.Write($"The Binary of {num} is ");

            //// Loop from the most significant bit to the first bit.
            //for (int bit = (int)Math.Log2(num) ; bit >= 0 ; bit--)
            //{
            //    // check if the current bit is 1
            //    if (((1 << bit) & num) == (1 << bit))
            //        Console.Write(1);
            //    else 
            //        Console.Write(0);
            //}
            #endregion

            #region Problem17
            //int[] x = new int[3];
            //int[] y = new int[3];
            //for (int i = 0; i < 3; i++)
            //{
            //    Console.Write($"Enter X{i + 1}: ");
            //    x[i] = int.Parse(Console.ReadLine());
            //    Console.Write($"Enter Y{i + 1}: ");
            //    y[i] = int.Parse(Console.ReadLine());
            //}

            //// Check if the slope between the first point and second point equal
            //// the slope between the first line and third point.
            //if ((y[1] - y[0]) * (x[2] - x[0]) == (y[2] - y[0]) * (x[1] - x[0]))
            //    Console.WriteLine("The 3 points lie on a single straight line.");
            //else
            //    Console.WriteLine("The 3 points do not lie on a single straight line.");
            #endregion

            #region Problem18
            //float h = float.Parse(Console.ReadLine());

            //if (h > 5f)
            //    Console.WriteLine("They are required to leave the company.");
            //else if (h >= 4f)
            //    Console.WriteLine("They are provided with training to enhance their speed.");
            //else if (h > 3f)
            //    Console.WriteLine("They are instructed to increase their speed.");
            //else if (h >= 2f)
            //    Console.WriteLine("They are considered highly efficient.");
            #endregion

            #region Problem19
            //int n = int.Parse(Console.ReadLine());

            //for (int i = 0; i < n; i++)
            //{
            //    for (int j = 0; j < n; j++)
            //        Console.Write((i == j) ? "1 " : "0 ");
            //    Console.WriteLine("");
            //}
            #endregion

            #region Problem20
            //Console.Write("Enter the size of the array: ");
            //int n = int.Parse(Console.ReadLine());

            //Console.WriteLine("Enter the values: ");
            //int[] arr = new int[n];
            //for (int i = 0; i < n; i++)
            //    arr[i] = int.Parse(Console.ReadLine());

            //Console.WriteLine(arr.Sum());
            #endregion

            #region Problem21
            //// Reading the two arrays.
            //Console.Write("Enter the size of the array: ");
            //int n = int.Parse(Console.ReadLine());

            //int[] arr1 = new int[n];
            //int[] arr2 = new int[n];

            //Console.Write("Enter the values of the first array: ");
            //for (int ii = 0; ii < n; ii++)
            //    arr1[ii] = int.Parse(Console.ReadLine());

            //Array.Sort(arr1);

            //Console.Write("Enter the values of the second array: ");
            //for (int ii = 0; ii < n; ii++)
            //    arr2[ii] = int.Parse(Console.ReadLine());

            //Array.Sort(arr2);

            //int[] result = new int[n * 2];

            //// Merge them in O(n) using 2 pointers approach.
            //int i = 0, j = 0, resi = 0;

            //while (i < n && j < n)
            //{
            //    if (arr1[i] <= arr2[j])
            //        result[resi++] = arr1[i++];
            //    else
            //        result[resi++] = arr2[j++];
            //}

            //// Add the remaining elements in array1 and array2
            //while (i < n)
            //    result[resi++] = arr1[i++];

            //while (j < n)
            //    result[resi++] = arr2[j++];

            //Console.Write("Result array is ");
            //foreach (var item in result)
            //    Console.Write(item + " ");
            #endregion

            #region Problem22
            //int[] frq = new int[100000];

            //int n = int.Parse(Console.ReadLine());

            //for (int i = 0; i < n; i++)
            //{
            //    int x = int.Parse(Console.ReadLine());
            //    frq[x]++;
            //}

            //for (int i = 0; i < 100000; i++)
            //{
            //    if (frq[i] > 0)
            //        Console.WriteLine($"Number {i} has appeared {frq[i]} times.");
            //}

            #endregion

            #region Problem23
            //int n = int.Parse(Console.ReadLine());

            //int[] arr = new int[n];

            //for (int i = 0; i < n; i++)
            //    arr[i] = int.Parse(Console.ReadLine());

            //Console.WriteLine($"Maximum number = {arr.Max()}");
            //Console.WriteLine($"Minimum number = {arr.Min()}");

            #endregion

            #region Problem24
            //int n = int.Parse(Console.ReadLine());

            //int[] arr = new int[n];

            //for (int i = 0; i < n; i++)
            //    arr[i] = int.Parse(Console.ReadLine());

            //int max = arr.Max();
            //int second_max = int.MinValue;
            //for (int i = 0; i < n; i++)
            //{
            //    if (arr[i] < max && arr[i] > second_max)
            //        second_max = arr[i];
            //}
            //Console.WriteLine($"The second maximum number is {second_max}");
            #endregion

            #region Problem25
            //int n = int.Parse(Console.ReadLine());

            //int[] arr = new int[n];

            //for (int i = 0; i < n; i++)
            //    arr[i] = int.Parse(Console.ReadLine());

            //int[] LastAppearance = new int[100000];
            //for (int i = 0; i < 100000; i++)
            //    LastAppearance[i] = -1;

            //int MaxRange = 0;

            //for (int i = 0; i < n; i++)
            //{
            //    if (LastAppearance[arr[i]] != -1)
            //        MaxRange = Math.Max(i - LastAppearance[arr[i]] - 1, MaxRange);
            //    else
            //        LastAppearance[arr[i]] = i;
            //}

            //Console.WriteLine(MaxRange);
            #endregion

            #region Problem26
            //string s = Console.ReadLine();
            //string[] arr = s.Split(' ');

            //Array.Reverse(arr);

            //foreach (var item in arr)
            //    Console.Write(item + " ");
            #endregion

            #region Problem27

            //int n = int.Parse(Console.ReadLine());

            //int[,] arr = new int[2, n];

            //for (int i = 0; i < n; i++)
            //    arr[0, i] = int.Parse(Console.ReadLine());

            //// Copping from the first array to second array.
            //for (int i = 0; i < n; i++)
            //    arr[1, i] = arr[0, i];

            //Console.Write("Elements of the first array: ");
            //for (int i = 0; i < n; i++)
            //    Console.Write($" {arr[0, i]}");

            //Console.WriteLine("");

            //Console.Write("Elements of the second array: ");
            //for (int i = 0; i < n; i++)
            //    Console.Write($" {arr[1, i]}");

            #endregion

            #region Problem28
            //int n = int.Parse(Console.ReadLine());

            //int[] arr = new int[n];

            //for (int i = 0; i < n; i++)
            //    arr[i] = int.Parse(Console.ReadLine());

            //Array.Reverse(arr);

            //foreach (var item in arr)
            //    Console.Write($"{item} ");
            #endregion
        }
    }
}
