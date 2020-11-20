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
    public class PhanPhimsController : ApiController
    {
        private ModelOneMovie db = new ModelOneMovie();

        // GET: api/PhanPhims
        public IQueryable<PhanPhim> GetPhanPhims()
        {
            return db.PhanPhims;
        }

        // GET: api/PhanPhims/5
        [ResponseType(typeof(PhanPhim))]
        public IHttpActionResult GetPhanPhim(string id)
        {
            PhanPhim phanPhim = db.PhanPhims.Find(id);
            if (phanPhim == null)
            {
                return NotFound();
            }

            return Ok(phanPhim);
        }

        // PUT: api/PhanPhims/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPhanPhim(string id, PhanPhim phanPhim)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != phanPhim.MaPhim)
            {
                return BadRequest();
            }

            db.Entry(phanPhim).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PhanPhimExists(id))
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

        // POST: api/PhanPhims
        [ResponseType(typeof(PhanPhim))]
        public IHttpActionResult PostPhanPhim(PhanPhim phanPhim)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.PhanPhims.Add(phanPhim);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (PhanPhimExists(phanPhim.MaPhim))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = phanPhim.MaPhim }, phanPhim);
        }

        // DELETE: api/PhanPhims/5
        [ResponseType(typeof(PhanPhim))]
        public IHttpActionResult DeletePhanPhim(string id)
        {
            PhanPhim phanPhim = db.PhanPhims.Find(id);
            if (phanPhim == null)
            {
                return NotFound();
            }

            db.PhanPhims.Remove(phanPhim);
            db.SaveChanges();

            return Ok(phanPhim);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PhanPhimExists(string id)
        {
            return db.PhanPhims.Count(e => e.MaPhim == id) > 0;
        }
    }
}