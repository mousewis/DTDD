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
    public class nguoimuasController : Controller
    {
        private DTDDEntities db = new DTDDEntities();

        // GET: nguoimuas
        public ActionResult Index()
        {
            return View(db.nguoimuas.ToList());
        }

        // GET: nguoimuas/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoimua nguoimua = db.nguoimuas.Find(id);
            if (nguoimua == null)
            {
                return HttpNotFound();
            }
            return View(nguoimua);
        }

        // GET: nguoimuas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: nguoimuas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maso,hoten,matkhau,gtinh,ngsinh,dchi,email,sdt")] nguoimua nguoimua)
        {
            if (ModelState.IsValid)
            {
                db.nguoimuas.Add(nguoimua);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nguoimua);
        }

        // GET: nguoimuas/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoimua nguoimua = db.nguoimuas.Find(id);
            if (nguoimua == null)
            {
                return HttpNotFound();
            }
            return View(nguoimua);
        }

        // POST: nguoimuas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maso,hoten,matkhau,gtinh,ngsinh,dchi,email,sdt")] nguoimua nguoimua)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoimua).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoimua);
        }

        // GET: nguoimuas/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoimua nguoimua = db.nguoimuas.Find(id);
            if (nguoimua == null)
            {
                return HttpNotFound();
            }
            return View(nguoimua);
        }

        // POST: nguoimuas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            nguoimua nguoimua = db.nguoimuas.Find(id);
            db.nguoimuas.Remove(nguoimua);
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
