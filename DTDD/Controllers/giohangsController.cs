using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DTDD.Models;

namespace DTDD.Controllers
{
    public class giohangsController : Controller
    {
        private DTDDEntities db = new DTDDEntities();

        // GET: giohangs
        public ActionResult Index()
        {
            var giohangs = db.giohangs.Include(g => g.nguoimua).Include(g => g.sanpham);
            return View(giohangs.ToList());
        }

        // GET: giohangs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            giohang giohang = db.giohangs.Find(id);
            if (giohang == null)
            {
                return HttpNotFound();
            }
            return View(giohang);
        }

        // GET: giohangs/Create
        public ActionResult Create()
        {
            ViewBag.manm = new SelectList(db.nguoimuas, "maso", "hoten");
            ViewBag.masp = new SelectList(db.sanphams, "masp", "tensp");
            return View();
        }

        // POST: giohangs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "manm,masp,soluong")] giohang giohang)
        {
            if (ModelState.IsValid)
            {
                db.giohangs.Add(giohang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.manm = new SelectList(db.nguoimuas, "maso", "hoten", giohang.manm);
            ViewBag.masp = new SelectList(db.sanphams, "masp", "tensp", giohang.masp);
            return View(giohang);
        }

        // GET: giohangs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            giohang giohang = db.giohangs.Find(id);
            if (giohang == null)
            {
                return HttpNotFound();
            }
            ViewBag.manm = new SelectList(db.nguoimuas, "maso", "hoten", giohang.manm);
            ViewBag.masp = new SelectList(db.sanphams, "masp", "tensp", giohang.masp);
            return View(giohang);
        }

        // POST: giohangs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "manm,masp,soluong")] giohang giohang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(giohang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.manm = new SelectList(db.nguoimuas, "maso", "hoten", giohang.manm);
            ViewBag.masp = new SelectList(db.sanphams, "masp", "tensp", giohang.masp);
            return View(giohang);
        }

        // GET: giohangs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            giohang giohang = db.giohangs.Find(id);
            if (giohang == null)
            {
                return HttpNotFound();
            }
            return View(giohang);
        }

        // POST: giohangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            giohang giohang = db.giohangs.Find(id);
            db.giohangs.Remove(giohang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
