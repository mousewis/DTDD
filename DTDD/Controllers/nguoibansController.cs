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
    public class nguoibansController : Controller
    {
        private DTDDEntities db = new DTDDEntities();

        // GET: nguoibans
        public ActionResult Index()
        {
            return View(db.nguoibans.ToList());
        }

        // GET: nguoibans/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoiban nguoiban = db.nguoibans.Find(id);
            if (nguoiban == null)
            {
                return HttpNotFound();
            }
            return View(nguoiban);
        }

        // GET: nguoibans/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: nguoibans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maso,hoten,matkhau,gtinh,ngsinh,dchi,email,sdt,tinhtrang,rating,taikhoan")] nguoiban nguoiban)
        {
            if (ModelState.IsValid)
            {
                db.nguoibans.Add(nguoiban);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nguoiban);
        }

        // GET: nguoibans/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoiban nguoiban = db.nguoibans.Find(id);
            if (nguoiban == null)
            {
                return HttpNotFound();
            }
            return View(nguoiban);
        }

        // POST: nguoibans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maso,hoten,matkhau,gtinh,ngsinh,dchi,email,sdt,tinhtrang,rating,taikhoan")] nguoiban nguoiban)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoiban).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoiban);
        }

        // GET: nguoibans/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoiban nguoiban = db.nguoibans.Find(id);
            if (nguoiban == null)
            {
                return HttpNotFound();
            }
            return View(nguoiban);
        }

        // POST: nguoibans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            nguoiban nguoiban = db.nguoibans.Find(id);
            db.nguoibans.Remove(nguoiban);
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
