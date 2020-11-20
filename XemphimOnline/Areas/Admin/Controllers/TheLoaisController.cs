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
    public class TheLoaisController : ApiController
    {
        private ModelOneMovie db = new ModelOneMovie();

        // GET: api/TheLoais
        public IEnumerable<TheLoai> GetTheLoais()
        {
            return db.TheLoais.ToList();
        }

        // GET: api/TheLoais/5
        [ResponseType(typeof(TheLoai))]
        public IHttpActionResult GetTheLoai(int id)
        {
            TheLoai theLoai = db.TheLoais.Find(id);
            if (theLoai == null)
            {
                return NotFound();
            }

            return Ok(theLoai);
        }

        // PUT: api/TheLoais/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTheLoai(int id, TheLoai theLoai)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != theLoai.MaTL)
            {
                return BadRequest();
            }

            db.Entry(theLoai).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TheLoaiExists(id))
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

        // POST: api/TheLoais
        [ResponseType(typeof(TheLoai))]
        public IHttpActionResult PostTheLoai(TheLoai theLoai)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TheLoais.Add(theLoai);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = theLoai.MaTL }, theLoai);
        }

        // DELETE: api/TheLoais/5
        [ResponseType(typeof(TheLoai))]
        public IHttpActionResult DeleteTheLoai(int id)
        {
            TheLoai theLoai = db.TheLoais.Find(id);
            if (theLoai == null)
            {
                return NotFound();
            }

            db.TheLoais.Remove(theLoai);
            db.SaveChanges();

            return Ok(theLoai);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TheLoaiExists(int id)
        {
            return db.TheLoais.Count(e => e.MaTL == id) > 0;
        }
    }
}