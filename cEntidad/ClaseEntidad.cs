using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cEntidad
{
    public class ClaseEntidad
    {
        private int id;
        private String marca;
        private String tipo;
        private String genero;
        private int cantidad_disponible;
        private double precio;

        public int Id { get => id; set => id = value; }
        public string Marca { get => marca; set => marca = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public string Genero { get => genero; set => genero = value; }
        public int Cantidad_disponible { get => cantidad_disponible; set => cantidad_disponible = value; }
        public double Precio { get => precio; set => precio = value; }
    }
}
