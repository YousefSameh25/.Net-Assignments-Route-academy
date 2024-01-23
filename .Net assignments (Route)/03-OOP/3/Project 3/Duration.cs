using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_3
{
    internal class Duration
    {
        #region Properties
        public int Hours { get; set; }
        public int Minutes { get; set; }
        public int Seconds { get; set; }
        #endregion

        #region Constructors
        public Duration()
        {
            Hours = Minutes = Seconds = 0;
        }
        public Duration(int Seconds) : this()
        {
            Hours = Seconds / 3600;
            Seconds %= 3600;
            Minutes = Seconds / 60;
            Seconds %= 60;
            this.Seconds = Seconds;
        }
        public Duration(int Hours, int Minutes, int Seconds) : this(Seconds)
        {
            this.Minutes = Minutes;
            this.Hours = Hours;
        }
        #endregion

        #region Object methods override
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();

            if (Hours > 0)
                sb.Append($"Hours: {Hours}, ");

            if (Minutes > 0 || Hours > 0)
                sb.Append($"Minutes: {Minutes}, ");

            if (Seconds > 0 || Hours > 0 || Minutes > 0 || Minutes + Hours == 0)
                sb.Append($"Seconds: {Seconds}");

            return sb.ToString();
        }

        public override bool Equals(object? obj)
        {
            if (obj == null)
                return false;

            Duration other = obj as Duration;
            return Hours == other.Hours && Minutes == other.Minutes && Seconds == other.Seconds;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
        #endregion

        #region Operators overload
        public static Duration operator +(Duration D1, Duration D2)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;
            int TotalSecondsInD2 = D2.Hours * 3600 + D2.Minutes * 60 + D2.Seconds;

            return new Duration(TotalSecondsInD1 + TotalSecondsInD2);
        }

        public static Duration operator +(Duration D1, int Seconds)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;

            return new Duration(TotalSecondsInD1 + Seconds);
        }

        public static Duration operator +(int Seconds, Duration D1)
        {
            // Flip the paramerters :)
            return D1 + Seconds;
        }

        public static Duration operator ++(Duration D1)
        {
            D1.Minutes++;

            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;

            return new Duration(TotalSecondsInD1);
        }

        public static Duration operator --(Duration D1)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;

            if (TotalSecondsInD1 < 60)
                throw new Exception("Time can't be negative");

            return new Duration(TotalSecondsInD1 - 60);
        }

        public static Duration operator -(Duration D1, Duration D2)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;
            int TotalSecondsInD2 = D2.Hours * 3600 + D2.Minutes * 60 + D2.Seconds;

            if (TotalSecondsInD1 < TotalSecondsInD2)
                throw new Exception("Time can't be negative");

            return new Duration(TotalSecondsInD1 - TotalSecondsInD2);
        }

        public static bool operator >(Duration D1, Duration D2)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;
            int TotalSecondsInD2 = D2.Hours * 3600 + D2.Minutes * 60 + D2.Seconds;

            return TotalSecondsInD1 > TotalSecondsInD2;
        }

        public static bool operator <(Duration D1, Duration D2)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;
            int TotalSecondsInD2 = D2.Hours * 3600 + D2.Minutes * 60 + D2.Seconds;

            return TotalSecondsInD1 <= TotalSecondsInD2;
        }

        public static implicit operator bool(Duration D1)
        {
            int TotalSecondsInD1 = D1.Hours * 3600 + D1.Minutes * 60 + D1.Seconds;

            return TotalSecondsInD1 > 0;
        }

        public static explicit operator DateTime(Duration D1)
        {
            return new DateTime(
                year: 0,
                month: 0,
                day: 0,
                hour: D1.Hours,
                minute: D1.Minutes,
                second: D1.Seconds);
        }
        // Clean code always win :)
        #endregion
    }
}
