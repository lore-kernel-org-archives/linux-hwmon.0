Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/66] use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:29 +0100
Message-Id: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-hwmon@vger.kernel.org>

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.  A previous version of this semantic patch transformed
only cases where the show and store functions followed particular naming
conventions.  This semantic patch additionally renames functions as
needed.  It can, however, fail to transform some occurrences where a single
function is used for multiple attributes.  In that case, the first case is
transformed an the others are left as is.

The complete semantic patch is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@initialize:ocaml@
@@

let taken = Hashtbl.create 101

// -------------------------------------------------------------------------
// Easy case

@d@
declarer name DEVICE_ATTR;
identifier x;
@@

DEVICE_ATTR(x,...);

@script:ocaml depends on d@
@@

Hashtbl.clear taken

@script:ocaml expected@
x << d.x;
x_show;
x_store;
@@
x_show := make_ident (x^"_show");
x_store := make_ident (x^"_store")

@@
declarer name DEVICE_ATTR_RO;
identifier d.x,expected.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);

@@
declarer name DEVICE_ATTR_WO;
identifier d.x,expected.x_store;
@@

- DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);
+ DEVICE_ATTR_WO(x);

@@
declarer name DEVICE_ATTR_RW;
identifier d.x,expected.x_show,expected.x_store;
@@

- DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);
+ DEVICE_ATTR_RW(x);

// -------------------------------------------------------------------------
// Other calls

@o@
declarer name DEVICE_ATTR;
identifier d.x,show,store;
@@

DEVICE_ATTR(x,\(0444\|S_IRUGO\|0200\|S_IWUSR\|0644\|S_IRUGO|S_IWUSR\),
            show,store);

@script:ocaml@
x << d.x;
show << o.show;
store << o.store;
@@

if (not(show = "NULL") && Hashtbl.mem taken show) ||
   (not(store = "NULL") && Hashtbl.mem taken store)
then Coccilib.include_match false
else (Hashtbl.add taken show (); Hashtbl.add taken store ())

// rename functions

@show1@
identifier o.show,expected.x_show;
parameter list ps;
@@

static
- show(ps)
+ x_show(ps)
  { ... }

@depends on show1@
identifier o.show,expected.x_show;
expression list es;
@@
- show(es)
+ x_show(es)

@depends on show1@
identifier o.show,expected.x_show;
@@
- show
+ x_show

@store1@
identifier o.store,expected.x_store;
parameter list ps;
@@

static
- store(ps)
+ x_store(ps)
  { ... }

@depends on store1@
identifier o.store,expected.x_store;
expression list es;
@@
- store(es)
+ x_store(es)

@depends on store1@
identifier o.store,expected.x_store;
@@
- store
+ x_store

// try again

@@
declarer name DEVICE_ATTR_RO;
identifier d.x,expected.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);

@@
declarer name DEVICE_ATTR_WO;
identifier d.x,expected.x_store;
@@

- DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);
+ DEVICE_ATTR_WO(x);

@@
declarer name DEVICE_ATTR_RW;
identifier d.x,expected.x_show,expected.x_store;
@@

- DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);
+ DEVICE_ATTR_RW(x);
// </smpl>

---

 drivers/hwmon/adm1021.c      |   14 ++--
 drivers/hwmon/adm1025.c      |   16 ++---
 drivers/hwmon/adm1026.c      |  128 ++++++++++++++++++++++---------------------
 drivers/hwmon/adm1031.c      |   15 ++---
 drivers/hwmon/adm9240.c      |   28 ++++-----
 drivers/hwmon/adt7470.c      |   48 +++++++---------
 drivers/hwmon/adt7475.c      |   28 ++++-----
 drivers/hwmon/adt7x10.c      |    7 +-
 drivers/hwmon/asb100.c       |   36 ++++++------
 drivers/hwmon/atxp1.c        |   35 +++++------
 drivers/hwmon/dme1737.c      |   18 +++---
 drivers/hwmon/ds1621.c       |   16 ++---
 drivers/hwmon/emc2103.c      |   36 ++++++------
 drivers/hwmon/f71805f.c      |   16 ++---
 drivers/hwmon/f71882fg.c     |    6 +-
 drivers/hwmon/fam15h_power.c |   34 +++++------
 drivers/hwmon/fschmd.c       |    6 +-
 drivers/hwmon/g760a.c        |   22 +++----
 drivers/hwmon/g762.c         |   86 ++++++++++++++--------------
 drivers/hwmon/gl520sm.c      |   48 ++++++++--------
 drivers/hwmon/gpio-fan.c     |   54 +++++++++---------
 drivers/hwmon/hwmon.c        |    4 -
 drivers/hwmon/i5500_temp.c   |    6 +-
 drivers/hwmon/i5k_amb.c      |    4 -
 drivers/hwmon/it87.c         |   20 +++---
 drivers/hwmon/jz4740-hwmon.c |    6 +-
 drivers/hwmon/k10temp.c      |   12 ++--
 drivers/hwmon/k8temp.c       |    4 -
 drivers/hwmon/lm63.c         |   48 +++++++---------
 drivers/hwmon/lm70.c         |    6 +-
 drivers/hwmon/lm78.c         |   38 ++++++------
 drivers/hwmon/lm80.c         |    4 -
 drivers/hwmon/lm83.c         |    4 -
 drivers/hwmon/lm85.c         |   22 +++----
 drivers/hwmon/lm87.c         |   43 +++++++-------
 drivers/hwmon/lm90.c         |    8 +-
 drivers/hwmon/lm92.c         |   10 +--
 drivers/hwmon/lm93.c         |   39 +++++--------
 drivers/hwmon/lm95234.c      |   12 ++--
 drivers/hwmon/max1111.c      |    4 -
 drivers/hwmon/max1619.c      |    4 -
 drivers/hwmon/max197.c       |    6 +-
 drivers/hwmon/max6650.c      |   44 ++++++++------
 drivers/hwmon/mc13783-adc.c  |    6 +-
 drivers/hwmon/mcp3021.c      |    6 +-
 drivers/hwmon/nct6683.c      |   17 ++---
 drivers/hwmon/nct6775.c      |    4 -
 drivers/hwmon/nsa320-hwmon.c |   12 ++--
 drivers/hwmon/pc87360.c      |   26 ++++----
 drivers/hwmon/pc87427.c      |    4 -
 drivers/hwmon/pcf8591.c      |   24 +++-----
 drivers/hwmon/sch5627.c      |    4 -
 drivers/hwmon/sht15.c        |    4 -
 drivers/hwmon/sis5595.c      |   36 ++++++------
 drivers/hwmon/smsc47m1.c     |   10 +--
 drivers/hwmon/smsc47m192.c   |   14 ++--
 drivers/hwmon/tmp401.c       |   11 +--
 drivers/hwmon/via-cputemp.c  |    6 +-
 drivers/hwmon/via686a.c      |    8 +-
 drivers/hwmon/vt8231.c       |   59 ++++++++++---------
 drivers/hwmon/w83627ehf.c    |    8 +-
 drivers/hwmon/w83627hf.c     |   53 +++++++++--------
 drivers/hwmon/w83781d.c      |   34 +++++------
 drivers/hwmon/w83791d.c      |   23 +++----
 drivers/hwmon/w83792d.c      |   15 ++---
 drivers/hwmon/w83793.c       |    6 +-
 66 files changed, 709 insertions(+), 726 deletions(-)
