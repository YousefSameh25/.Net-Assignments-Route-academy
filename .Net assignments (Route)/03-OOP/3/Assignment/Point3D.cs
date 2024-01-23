using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment
{
    internal class Point3D : IComparable<Point3D>, ICloneable
    {
        #region Properties
        public int X { get; set; }
        public int Y { get; set; }
        public int Z { get; set; }
        #endregion

        #region Constructor
        public Point3D()
        {
            X = 0;
            Y = 0;
            Z = 0;
        }
        public Point3D(int X) : this()
        {
            Y = Y;
        }
        public Point3D(int X, int Y) : this(X)
        {
            this.Y = Y;
        }
        public Point3D(int X, int Y, int Z) : this(X, Y)
        {
            this.Z = Z;
        }
        #endregion

        #region Methods
        public override string ToString()
        {
            return $"Point Coordinates: ({X}, {Y}, {Z})";
        }

        public int CompareTo(Point3D? other)
        {
            if (other == null)
                throw new Exception();

            if (X.CompareTo(other.X) == 0)
                return Y.CompareTo(other.Y);

            return X.CompareTo(other.X);
        }

        public object Clone()
        {
            // All properties here is value type so we can use MemberwiseClone() which create a shallow copy.
            return MemberwiseClone();
        }
        #endregion

    }
}
