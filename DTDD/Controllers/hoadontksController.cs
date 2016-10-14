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
    public class hoadontksController : Controller
    {
        private DTDDEntities db = new DTDDEntities();

        // GET: hoadontks
        public ActionResult Index()
        {
            var hoadontks = db.hoadontks.Include(h => h.nguoiban);
            return View(hoadontks.ToList());
        }

        // GET: hoadontks/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoadontk hoadontk = db.hoadontks.Find(id);
            if (hoadontk == null)
            {
                return HttpNotFound();
            }
            return View(hoadontk);
        }

        // GET: hoadontks/Create
        public ActionResult Create()
        {
            ViewBag.manb = new SelectList(db.nguoibans, "maso", "hoten");
            return View();
        }

        // POST: hoadontks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "mahd,manb,ngay,giatri")] hoadontk hoadontk)
        {
            if (ModelState.IsValid)
            {
                db.hoadontks.Add(hoadontk);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.manb = new SelectList(db.nguoibans, "maso", "hoten", hoadontk.manb);
            return View(hoadontk);
        }

        // GET: hoadontks/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoadontk hoadontk = db.hoadontks.Find(id);
            if (hoadontk == null)
            {
                return HttpNotFound();
            }
            ViewBag.manb = new SelectList(db.nguoibans, "maso", "hoten", hoadontk.manb);
            return View(hoadontk);
        }

        // POST: hoadontks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mahd,manb,ngay,giatri")] hoadontk hoadontk)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoadontk).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.manb = new SelectList(db.nguoibans, "maso", "hoten", hoadontk.manb);
            return View(hoadontk);
        }

        // GET: hoadontks/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoadontk hoadontk = db.hoadontks.Find(id);
            if (hoadontk == null)
            {
                return HttpNotFound();
            }
            return View(hoadontk);
        }

        // POST: hoadontks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            hoadontk hoadontk = db.hoadontks.Find(id);
            db.hoadontks.Remove(hoadontk);
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
