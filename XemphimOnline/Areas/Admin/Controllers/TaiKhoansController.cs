using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using XemphimOnline.Model;

namespace XemphimOnline.Areas.Admin.Controllers
{
    public class TaiKhoansController : ApiController
    {
        private ModelOneMovie db = new ModelOneMovie();

        // GET: api/TaiKhoans
        public IQueryable<TaiKhoan> GetTaiKhoans()
        {
            return db.TaiKhoans;
        }

        // GET: api/TaiKhoans/5
        [ResponseType(typeof(TaiKhoan))]
        public IHttpActionResult GetTaiKhoan(string id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return NotFound();
            }

            return Ok(taiKhoan);
        }

        // PUT: api/TaiKhoans/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTaiKhoan(string id, TaiKhoan taiKhoan)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != taiKhoan.TaiKhoan1)
            {
                return BadRequest();
            }

            db.Entry(taiKhoan).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TaiKhoanExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/TaiKhoans
        [ResponseType(typeof(TaiKhoan))]
        public IHttpActionResult PostTaiKhoan(TaiKhoan taiKhoan)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TaiKhoans.Add(taiKhoan);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TaiKhoanExists(taiKhoan.TaiKhoan1))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = taiKhoan.TaiKhoan1 }, taiKhoan);
        }

        // DELETE: api/TaiKhoans/5
        [ResponseType(typeof(TaiKhoan))]
        public IHttpActionResult DeleteTaiKhoan(string id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return NotFound();
            }

            db.TaiKhoans.Remove(taiKhoan);
            db.SaveChanges();

            return Ok(taiKhoan);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TaiKhoanExists(string id)
        {
            return db.TaiKhoans.Count(e => e.TaiKhoan1 == id) > 0;
        }
    }
}