﻿using ApiProyecto.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiProyecto.Controllers
{
    public class CarritoController : ApiController
    {
        [HttpPost]
        [Route("RegistrarCarrito")]
        public string RegistrarCarrito(CARRITO carrito)
        {
            using (var context = new ProyectoG7Entities())
            {

                var datos = (from x in context.CARRITOes
                             where x.ConUsuario == carrito.ConUsuario
                             && x.ConProducto == carrito.ConProducto
                             select x).FirstOrDefault();

                if (datos == null)
                {
                    context.CARRITOes.Add(carrito);
                    context.SaveChanges();

                }
                else
                {
                    datos.Cantidad = carrito.Cantidad;
                    context.SaveChanges();
                }

                return "OK";
            }
        }

        [HttpGet]
        [Route("ConsultarCarrito")]
        public object ConsultarCarrito(long q)
        {
            using (var context = new ProyectoG7Entities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.CARRITOes
                        join y in context.PRODUCTOes on x.ConProducto equals y.ConProducto
                        join m in context.MODELOes on y.ConModelo equals m.ConModelo
                        join ma in context.MARCAs on y.ConMarca equals ma.ConMarca
                        where x.ConUsuario == q
                        select new
                        {
                            x.ConProducto,
                            x.ConCarrito,
                            x.ConUsuario,
                            x.Cantidad,
                            x.FechaCarrito,
                            y.Precio,
                            y.Nombre,
                            Modelo = m.Descripcion,
                            Marca = ma.Descripcion,
                            subTotal = y.Precio * x.Cantidad,
                            Impuesto = (y.Precio * x.Cantidad) * 0.13M,
                            Total = (y.Precio * x.Cantidad) + (y.Precio * x.Cantidad) * 0.13M
                        }).ToList();
            }
        }
        [HttpPost]
        [Route("PagarCarrito")]
        public string PagarCarrito(CARRITO carrito)
        {
            using (var context = new ProyectoG7Entities())
            {

                context.PagarCarrito_SP(carrito.ConUsuario);

                return "OK";
            }
        }

        [HttpDelete]
        [Route("EliminarProductoCarrito")]
        public void EliminarProductoCarrito(long q)
        {
            using (var context = new ProyectoG7Entities())

            {
                var datos = (from x in context.CARRITOes
                             where x.ConCarrito == q
                             select x).FirstOrDefault();

                context.CARRITOes.Remove(datos);
                context.SaveChanges();
            }
        }

        [HttpGet]
        [Route("ConsultarFacturas")]
        public List<MAESTRO> ConsultarFacturas(long q)
        {
            using (var context = new ProyectoG7Entities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.MAESTROes
                        where x.ConUsuario == q
                        select x).ToList();
            }
        }

        [HttpGet]
        [Route("ConsultarDetalleFactura")]
        public object ConsultarDetalleFactura(long q)
        {
            using (var context = new ProyectoG7Entities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.DETALLEs
                        join y in context.PRODUCTOes on x.ConProducto equals y.ConProducto
                        join m in context.MODELOes on y.ConModelo equals m.ConModelo
                        join ma in context.MARCAs on y.ConMarca equals ma.ConMarca
                        where x.ConMaestro == q
                        select new
                        {
                            x.ConMaestro,
                            x.PrecioCompra,
                            x.CantidadCompra,
                            x.Impuesto,
                            y.Nombre,
                            Modelo = m.Descripcion,
                            Marca = ma.Descripcion,
                            SubTotal = x.PrecioCompra * x.CantidadCompra,
                            ImpuestoTotal = x.Impuesto * x.CantidadCompra,
                            Total = (x.PrecioCompra * x.CantidadCompra) + (x.Impuesto * x.CantidadCompra)
                        }).ToList();
            }
        }


    }
}

