Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20161230193404.GB8516@roeck-us.net>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, corbet@lwn.net, devicetree@vger.kernel.org,
        eajames.ibm@gmail.com, jdelvare@suse.com, joel@jms.id.au,
        linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Fri, 6 Jan 2017 16:17:28 -0600
References: <1483120568-21082-1-git-send-email-eajames.ibm@gmail.com>
 <1483120568-21082-3-git-send-email-eajames.ibm@gmail.com>
 <20161230193404.GB8516@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A33DFE9AFF68f9e8a93df938690918c8FBB0A33DFE9AFF6"
Content-Disposition: inline
Message-Id: <OFA812992D.D19B1368-ON002580A0.007A2966-862580A0.007A72F0@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A33DFE9AFF68f9e8a93df938690918c8FBB0A33DFE9AFF6
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi,

Thanks for your comments Guenter. Sorry to switch email addresses, but
gmail is rejecting my messages to this thread.


Guenter Roeck <linux@roeck-us.net> wrote on 12/30/2016 01:34:04 PM:

> On Fri, Dec 30, 2016 at 11:56:04AM -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> >
> > Add a generic mechanism to expose the sensors provided by the OCC in
> > sysfs.
> >
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/hwmon/occ       |  48 +++++
> >  drivers/hwmon/occ/Makefile    |   2 +-
> >  drivers/hwmon/occ/occ=5Fsysfs.c | 492 +++++++++++++++++++++++++++++
> +++++++++++++
> >  drivers/hwmon/occ/occ=5Fsysfs.h |  52 +++++
> >  4 files changed, 593 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c
> >  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h
> >
> > diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> > index 79d1642..1ee8689 100644
> > --- a/Documentation/hwmon/occ
> > +++ b/Documentation/hwmon/occ
> > @@ -25,6 +25,54 @@ Currently, all versions of the OCC support four
> types of sensor data: power,
> >  temperature, frequency, and "caps," which indicate limits and
> thresholds used
> >  internally on the OCC.
> >
> > +sysfs Entries
> > +-------------
> > +
> > +The OCC driver uses the hwmon sysfs framework to provide data to
userspace.
> > +
> > +The driver exports two sysfs files for each frequency,
> temperature, and power
> > +sensor. These are "input" and "label". The input file contains
> the value of the
> > +sensor. The label file contains the sensor id. The sensor id is the
unique
> > +internal OCC identifier. Sensor ids may be provided by the OCC
> specification.
> > +The names of these files will be in the following format:
> > +   <sensor type><sensor index>=5Finput
> > +   <sensor type><sensor index>=5Flabel
> > +Sensor types will be one of "temp", "freq", or "power". The sensor
index is
> > +an index to differentiate different sensor files. For example, a
single
> > +temperature sensor will have two sysfs files: temp1=5Finput and
temp1=5Flabel.
> > +
> > +Caps sensors are exported differently. For each caps sensor, the
> driver will
> > +export 6 entries:
> > +   curr=5Fpowercap - current power cap in watts
> > +   curr=5Fpowerreading - current power output in watts
> > +   norm=5Fpowercap - power cap without redundant power
> > +   max=5Fpowercap - maximum power cap that can be set in watts
> > +   min=5Fpowercap - minimum power cap that can be set in watts
> > +   user=5Fpowerlimit - power limit specified by the user in watts
> > +In addition, the OCC driver for P9 will export a 7th entry:
> > +   user=5Fpowerlimit=5Fsource - can be one of two values depending on =
who
set
> > +      the user=5Fpowerlimit. 0x1 - out of band from BMC or host. 0x2 -
> > +      in band from other source.
> > +The format for these files is caps<sensor index>=5F<entry type>. For
example,
> > +caps1=5Fcurr=5Fpowercap.
> > +
> > +The driver also provides a number of sysfs entries through hwmon to
better
> > +control the driver and monitor the OCC.
> > +   powercap - read or write the OCC user power limit in watts.
> > +   name - read the name of the driver
> > +   update=5Finterval - read or write the minimum interval for polling
the
> > +      OCC.
> > +
> > +The driver also exports a single sysfs file through the
> communication protocol
> > +device (see BMC - Host Communications). The filename is "online"
> and represents
> > +the status of the OCC with respect to the driver. The OCC can be
> in one of two
> > +states: OCC polling enabled or OCC polling disabled. The purpose
> of this file
> > +is to control the behavior of the driver and it's hwmon sysfs
> entries, not to
> > +infer any information about the state of the physical OCC. Reading the
file
> > +returns either a 0 (polling disabled) or 1 (polling enabled).
> Writing 1 to the
> > +file enables OCC polling in the driver if communications can be
established
> > +with the OCC. Writing a 0 to the driver disables OCC polling.
> > +
> >  BMC - Host Communications
> >  -------------------------
> >
> > diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> > index 93cb52f..a6881f9 100644
> > --- a/drivers/hwmon/occ/Makefile
> > +++ b/drivers/hwmon/occ/Makefile
> > @@ -1 +1 @@
> > -obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o
> > +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o
> > diff --git a/drivers/hwmon/occ/occ=5Fsysfs.c
b/drivers/hwmon/occ/occ=5Fsysfs.c
> > new file mode 100644
> > index 0000000..b0e063da
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fsysfs.c
> > @@ -0,0 +1,492 @@
> > +/*
> > + * occ=5Fsysfs.c - OCC sysfs interface
> > + *
> > + * This file contains the methods and data structures for
> implementing the OCC
> > + * hwmon sysfs entries.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
modify
> > + * it under the terms of the GNU General Public License as published
by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/err.h>
> > +#include <linux/mutex.h>
> > +#include <linux/delay.h>
> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +
> > +#include "occ=5Fsysfs.h"
> > +
> > +#define MAX=5FSENSOR=5FATTR=5FLEN   32
> > +
> > +#define RESP=5FRETURN=5FCMD=5FINVAL   0x13
> > +
> > +struct sensor=5Fattr=5Fdata {
> > +   enum sensor=5Ftype type;
> > +   u32 hwmon=5Findex;
> > +   u32 attr=5Fid;
> > +   char name[MAX=5FSENSOR=5FATTR=5FLEN];
> > +   struct device=5Fattribute dev=5Fattr;
> > +};
> > +
> > +static ssize=5Ft show=5Finput(struct device *dev,
> > +           struct device=5Fattribute *attr, char *buf)
> > +{
> > +   int val;
> > +   struct sensor=5Fattr=5Fdata *sdata =3D container=5Fof(attr,
> > +                        struct sensor=5Fattr=5Fdata,
> > +                        dev=5Fattr);
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   val =3D occ=5Fget=5Fsensor=5Fvalue(driver->occ, sdata->type,
> > +               sdata->hwmon=5Findex - 1);
> > +   if (sdata->type =3D=3D TEMP)
> > +      val *=3D 1000;   /* in millidegree Celsius */
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%d\n", val);
> > +}
> > +
> > +/* show=5Flabel provides the OCC sensor id. The sensor id will be eith=
er
a
> > + * 2-byte (for P8) or 4-byte (for P9) value. The sensor id is a way to
> > + * identify what each sensor represents, according to the OCC
> specification.
> > + */
> > +static ssize=5Ft show=5Flabel(struct device *dev,
> > +           struct device=5Fattribute *attr, char *buf)
> > +{
> > +   int val;
> > +   struct sensor=5Fattr=5Fdata *sdata =3D container=5Fof(attr,
> > +                        struct sensor=5Fattr=5Fdata,
> > +                        dev=5Fattr);
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   val =3D occ=5Fget=5Fsensor=5Fid(driver->occ, sdata->type,
> > +            sdata->hwmon=5Findex - 1);
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%d\n", val);
> > +}
> > +
> > +static ssize=5Ft show=5Fcaps(struct device *dev,
> > +          struct device=5Fattribute *attr, char *buf)
> > +{
> > +   int val;
> > +   struct caps=5Fsensor *sensor;
> > +   struct sensor=5Fattr=5Fdata *sdata =3D container=5Fof(attr,
> > +                        struct sensor=5Fattr=5Fdata,
> > +                        dev=5Fattr);
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   sensor =3D occ=5Fget=5Fsensor(driver->occ, CAPS);
> > +   if (!sensor) {
> > +      val =3D -1;
> > +      return snprintf(buf, PAGE=5FSIZE - 1, "%d\n", val);
> > +   }
> > +
> > +   val =3D occ=5Fget=5Fcaps=5Fvalue(driver->occ, sensor, sdata->hwmon=
=5Findex -
1,
> > +             sdata->attr=5Fid);
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%d\n", val);
> > +}
> > +
> > +static ssize=5Ft show=5Fupdate=5Finterval(struct device *dev,
> > +                struct device=5Fattribute *attr, char *buf)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%lu\n", driver->
update=5Finterval);
> > +}
> > +
> > +static ssize=5Ft store=5Fupdate=5Finterval(struct device *dev,
> > +                 struct device=5Fattribute *attr,
> > +                 const char *buf, size=5Ft count)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +   unsigned long val;
> > +   int rc;
> > +
> > +   rc =3D kstrtoul(buf, 10, &val);
> > +   if (rc)
> > +      return rc;
> > +
> > +   driver->update=5Finterval =3D val;
> > +   occ=5Fset=5Fupdate=5Finterval(driver->occ, val);
> > +
> > +   return count;
> > +}
> > +
> > +static DEVICE=5FATTR(update=5Finterval, S=5FIWUSR | S=5FIRUGO,
> show=5Fupdate=5Finterval,
> > +         store=5Fupdate=5Finterval);
> > +
> > +static ssize=5Ft show=5Fname(struct device *dev,
> > +          struct device=5Fattribute *attr, char *buf)
> > +{
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "occ\n");
> > +}
> > +
> > +static DEVICE=5FATTR(name, S=5FIRUGO, show=5Fname, NULL);
> > +
> > +static ssize=5Ft show=5Fuser=5Fpowercap(struct device *dev,
> > +              struct device=5Fattribute *attr, char *buf)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%u\n", driver->user=5Fpowerc=
ap);
> > +}
> > +
> > +static ssize=5Ft store=5Fuser=5Fpowercap(struct device *dev,
> > +               struct device=5Fattribute *attr,
> > +               const char *buf, size=5Ft count)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +   u16 val;
> > +   int rc;
> > +
> > +   rc =3D kstrtou16(buf, 10, &val);
> > +   if (rc)
> > +      return rc;
> > +
> > +   dev=5Fdbg(dev, "set user powercap to: %d\n", val);
> > +   rc =3D occ=5Fset=5Fuser=5Fpowercap(driver->occ, val);
> > +   if (rc) {
> > +      dev=5Ferr(dev, "set user powercap failed: 0x%x\n", rc);
> > +      if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVAL) {
> > +         dev=5Ferr(dev, "set invalid powercap value: %d\n", val);
> > +         return -EINVAL;
> > +      }
> > +
> > +      return rc;
> > +   }
> > +
> > +   driver->user=5Fpowercap =3D val;
> > +
> > +   return count;
> > +}
> > +
> > +static DEVICE=5FATTR(user=5Fpowercap, S=5FIWUSR | S=5FIRUGO,
show=5Fuser=5Fpowercap,
> > +         store=5Fuser=5Fpowercap);
> > +
> > +static void deinit=5Fsensor=5Fgroups(struct device *dev,
> > +             struct sensor=5Fgroup *sensor=5Fgroups)
> > +{
> > +   int i;
> > +
> > +   for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; i++) {
> > +      if (sensor=5Fgroups[i].group.attrs)
> > +         devm=5Fkfree(dev, sensor=5Fgroups[i].group.attrs);
> > +      if (sensor=5Fgroups[i].sattr)
> > +         devm=5Fkfree(dev, sensor=5Fgroups[i].sattr);
> > +      sensor=5Fgroups[i].group.attrs =3D NULL;
> > +      sensor=5Fgroups[i].sattr =3D NULL;
> > +   }
> > +}
> > +
> > +static void sensor=5Fattr=5Finit(struct sensor=5Fattr=5Fdata *sdata,
> > +              char *sensor=5Fgroup=5Fname,
> > +              char *attr=5Fname,
> > +              ssize=5Ft (*show)(struct device *dev,
> > +                    struct device=5Fattribute *attr,
> > +                    char *buf))
> > +{
> > +   sysfs=5Fattr=5Finit(&sdata->dev=5Fattr.attr);
> > +
> > +   snprintf(sdata->name, MAX=5FSENSOR=5FATTR=5FLEN, "%s%d=5F%s",
> > +       sensor=5Fgroup=5Fname, sdata->hwmon=5Findex, attr=5Fname);
> > +   sdata->dev=5Fattr.attr.name =3D sdata->name;
> > +   sdata->dev=5Fattr.attr.mode =3D S=5FIRUGO;
> > +   sdata->dev=5Fattr.show =3D show;
> > +}
> > +
> > +static int create=5Fsensor=5Fgroup(struct occ=5Fsysfs *driver,
> > +                enum sensor=5Ftype type, int sensor=5Fnum)
> > +{
> > +   struct device *dev =3D driver->dev;
> > +   struct sensor=5Fgroup *sensor=5Fgroups =3D driver->sensor=5Fgroups;
> > +   struct sensor=5Fattr=5Fdata *sdata;
> > +   int rc, i;
> > +
> > +   /* each sensor has 'label' and 'input' attributes */
> > +   sensor=5Fgroups[type].group.attrs =3D
> > +      devm=5Fkzalloc(dev, sizeof(struct attribute *) *
> > +              sensor=5Fnum * 2 + 1, GFP=5FKERNEL);
> > +   if (!sensor=5Fgroups[type].group.attrs) {
> > +      rc =3D -ENOMEM;
> > +      goto err;
> > +   }
> > +
> > +   sensor=5Fgroups[type].sattr =3D
> > +      devm=5Fkzalloc(dev, sizeof(struct sensor=5Fattr=5Fdata) *
> > +              sensor=5Fnum * 2, GFP=5FKERNEL);
> > +   if (!sensor=5Fgroups[type].sattr) {
> > +      rc =3D -ENOMEM;
> > +      goto err;
> > +   }
> > +
> > +   for (i =3D 0; i < sensor=5Fnum; i++) {
> > +      sdata =3D &sensor=5Fgroups[type].sattr[i];
> > +      /* hwmon attributes index starts from 1 */
> > +      sdata->hwmon=5Findex =3D i + 1;
> > +      sdata->type =3D type;
> > +      sensor=5Fattr=5Finit(sdata, sensor=5Fgroups[type].name, "input",
> > +             show=5Finput);
> > +      sensor=5Fgroups[type].group.attrs[i] =3D &sdata->dev=5Fattr.attr;
> > +
> > +      sdata =3D &sensor=5Fgroups[type].sattr[i + sensor=5Fnum];
> > +      sdata->hwmon=5Findex =3D i + 1;
> > +      sdata->type =3D type;
> > +      sensor=5Fattr=5Finit(sdata, sensor=5Fgroups[type].name, "label",
> > +             show=5Flabel);
> > +      sensor=5Fgroups[type].group.attrs[i + sensor=5Fnum] =3D
> > +         &sdata->dev=5Fattr.attr;
> > +   }
> > +
> > +   rc =3D sysfs=5Fcreate=5Fgroup(&dev->kobj, &sensor=5Fgroups[type].gr=
oup);
> > +   if (rc)
> > +      goto err;
> > +
> > +   return 0;
> > +err:
> > +   deinit=5Fsensor=5Fgroups(dev, sensor=5Fgroups);
> > +   return rc;
> > +}
> > +
> > +static void caps=5Fsensor=5Fattr=5Finit(struct sensor=5Fattr=5Fdata *s=
data,
> > +              char *attr=5Fname, uint32=5Ft hwmon=5Findex,
> > +              uint32=5Ft attr=5Fid)
> > +{
> > +   sdata->type =3D CAPS;
> > +   sdata->hwmon=5Findex =3D hwmon=5Findex;
> > +   sdata->attr=5Fid =3D attr=5Fid;
> > +
> > +   snprintf(sdata->name, MAX=5FSENSOR=5FATTR=5FLEN, "%s%d=5F%s",
> > +       "caps", sdata->hwmon=5Findex, attr=5Fname);
> > +
> > +   sysfs=5Fattr=5Finit(&sdata->dev=5Fattr.attr);
> > +   sdata->dev=5Fattr.attr.name =3D sdata->name;
> > +   sdata->dev=5Fattr.attr.mode =3D S=5FIRUGO;
> > +   sdata->dev=5Fattr.show =3D show=5Fcaps;
> > +}
> > +
> > +static int create=5Fcaps=5Fsensor=5Fgroup(struct occ=5Fsysfs *driver, =
int
> sensor=5Fnum)
> > +{
> > +   struct device *dev =3D driver->dev;
> > +   struct sensor=5Fgroup *sensor=5Fgroups =3D driver->sensor=5Fgroups;
> > +   int field=5Fnum =3D driver->num=5Fcaps=5Ffields;
> > +   struct sensor=5Fattr=5Fdata *sdata;
> > +   int i, j, rc;
> > +
> > +   sensor=5Fgroups[CAPS].group.attrs =3D
> > +      devm=5Fkzalloc(dev, sizeof(struct attribute *) * sensor=5Fnum *
> > +              field=5Fnum + 1, GFP=5FKERNEL);
> > +   if (!sensor=5Fgroups[CAPS].group.attrs) {
> > +      rc =3D -ENOMEM;
> > +      goto err;
> > +   }
> > +
> > +   sensor=5Fgroups[CAPS].sattr =3D
> > +      devm=5Fkzalloc(dev, sizeof(struct sensor=5Fattr=5Fdata) *
> > +              sensor=5Fnum * field=5Fnum, GFP=5FKERNEL);
> > +   if (!sensor=5Fgroups[CAPS].sattr) {
> > +      rc =3D -ENOMEM;
> > +      goto err;
> > +   }
> > +
> > +   for (j =3D 0; j < sensor=5Fnum; ++j) {
> > +      for (i =3D 0; i < field=5Fnum; ++i) {
> > +         sdata =3D &sensor=5Fgroups[CAPS].sattr[j * field=5Fnum + i];
> > +         caps=5Fsensor=5Fattr=5Finit(sdata,
> > +                     driver->caps=5Fnames[i], j + 1, i);
> > +         sensor=5Fgroups[CAPS].group.attrs[j * field=5Fnum + i] =3D
> > +            &sdata->dev=5Fattr.attr;
> > +      }
> > +   }
> > +
> > +   rc =3D sysfs=5Fcreate=5Fgroup(&dev->kobj, &sensor=5Fgroups[CAPS].gr=
oup);
> > +   if (rc)
> > +      goto err;
> > +
> > +   return rc;
> > +err:
> > +   deinit=5Fsensor=5Fgroups(dev, sensor=5Fgroups);
> > +   return rc;
> > +}
> > +
> > +static void occ=5Fremove=5Fhwmon=5Fattrs(struct occ=5Fsysfs *driver)
> > +{
> > +   struct device *dev =3D driver->dev;
> > +
> > +   device=5Fremove=5Ffile(dev, &dev=5Fattr=5Fuser=5Fpowercap);
> > +   device=5Fremove=5Ffile(dev, &dev=5Fattr=5Fupdate=5Finterval);
> > +   device=5Fremove=5Ffile(dev, &dev=5Fattr=5Fname);
> > +}
> > +
> > +static int occ=5Fcreate=5Fhwmon=5Fattrs(struct occ=5Fsysfs *driver)
> > +{
> > +   int i, rc, id, sensor=5Fnum;
> > +   struct device *dev =3D driver->dev;
> > +   struct sensor=5Fgroup *sensor=5Fgroups =3D driver->sensor=5Fgroups;
> > +   struct occ=5Fblocks *resp =3D NULL;
> > +
> > +   occ=5Fget=5Fresponse=5Fblocks(driver->occ, &resp);
> > +
> > +   for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
> > +      resp->sensor=5Fblock=5Fid[i] =3D -1;
> > +
> > +   /* read sensor data from occ */
> > +   rc =3D occ=5Fupdate=5Fdevice(driver->occ);
> > +   if (rc) {
> > +      dev=5Ferr(dev, "cannot get occ sensor data: %d\n", rc);
> > +      return rc;
> > +   }
> > +   if (!resp->blocks)
> > +      return -ENOMEM;
> > +
> > +   rc =3D device=5Fcreate=5Ffile(dev, &dev=5Fattr=5Fname);
> > +   if (rc)
> > +      goto error;
> > +
> > +   rc =3D device=5Fcreate=5Ffile(dev, &dev=5Fattr=5Fupdate=5Finterval);
> > +   if (rc)
> > +      goto error;
> > +
> > +   if (resp->sensor=5Fblock=5Fid[CAPS] >=3D 0) {
> > +      /* user powercap: only for master OCC */
> > +      rc =3D device=5Fcreate=5Ffile(dev, &dev=5Fattr=5Fuser=5Fpowercap=
);
> > +      if (rc)
> > +         goto error;
> > +   }
> > +
> > +   sensor=5Fgroups[FREQ].name =3D "freq";
> > +   sensor=5Fgroups[TEMP].name =3D "temp";
> > +   sensor=5Fgroups[POWER].name =3D "power";
> > +   sensor=5Fgroups[CAPS].name =3D "caps";
> > +
> > +   for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; i++) {
> > +      id =3D resp->sensor=5Fblock=5Fid[i];
> > +      if (id < 0)
> > +         continue;
> > +
> > +      sensor=5Fnum =3D resp->blocks[id].header.sensor=5Fnum;
> > +      if (i =3D=3D CAPS)
> > +         rc =3D create=5Fcaps=5Fsensor=5Fgroup(driver, sensor=5Fnum);
> > +      else
> > +         rc =3D create=5Fsensor=5Fgroup(driver, i, sensor=5Fnum);
> > +      if (rc)
> > +         goto error;
> > +   }
> > +
> > +   return 0;
> > +
> > +error:
> > +   dev=5Ferr(dev, "cannot create hwmon attributes: %d\n", rc);
> > +   occ=5Fremove=5Fhwmon=5Fattrs(driver);
> > +   return rc;
> > +}
> > +
> > +static ssize=5Ft show=5Focc=5Fonline(struct device *dev,
> > +                struct device=5Fattribute *attr, char *buf)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   return snprintf(buf, PAGE=5FSIZE - 1, "%u\n", driver->occ=5Fonline);
> > +}
> > +
> > +static ssize=5Ft store=5Focc=5Fonline(struct device *dev,
> > +            struct device=5Fattribute *attr,
> > +            const char *buf, size=5Ft count)
> > +{
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +   unsigned long val;
> > +   int rc;
> > +
> > +   rc =3D kstrtoul(buf, 10, &val);
> > +   if (rc)
> > +      return rc;
> > +
> > +   if (val =3D=3D 1) {
> > +      if (driver->occ=5Fonline)
> > +         return count;
> > +
> > +      driver->dev =3D hwmon=5Fdevice=5Fregister(dev);
>
> hwmon=5Fdevice=5Fregister() is deprecated. Please consider using
> devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finfo() or at least
> hwmon=5Fdevice=5Fregister=5Fwith=5Finfo().

OK, I'll address this.

>
> Uuh ... and registering a hwmon device based on writing into a
sysfsattribute
> is completely out of the question.
>
> Thanks,
> Guenter
>
> > +      if (IS=5FERR(driver->dev))
> > +         return PTR=5FERR(driver->dev);
> > +
> > +      dev=5Fset=5Fdrvdata(driver->dev, driver);
> > +
> > +      rc =3D occ=5Fcreate=5Fhwmon=5Fattrs(driver);
> > +      if (rc) {
> > +         hwmon=5Fdevice=5Funregister(driver->dev);
> > +         driver->dev =3D NULL;
> > +         return rc;
> > +      }
> > +   } else if (val =3D=3D 0) {
> > +      if (!driver->occ=5Fonline)
> > +         return count;
> > +
> > +      occ=5Fremove=5Fhwmon=5Fattrs(driver);
> > +      hwmon=5Fdevice=5Funregister(driver->dev);
> > +      driver->dev =3D NULL;
> > +   } else
> > +      return -EINVAL;
> > +
> > +   driver->occ=5Fonline =3D val;
> > +   return count;
> > +}
> > +
> > +static DEVICE=5FATTR(online, S=5FIWUSR | S=5FIRUGO, show=5Focc=5Fonlin=
e,
> > +         store=5Focc=5Fonline);
> > +
> > +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ=
 *occ,
> > +              struct occ=5Fsysfs=5Fconfig *config)
> > +{
> > +   struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(struct
occ=5Fsysfs),
> > +                      GFP=5FKERNEL);
> > +   int rc;
> > +
> > +   if (!hwmon)
> > +      return ERR=5FPTR(-ENOMEM);
> > +
> > +   hwmon->occ =3D occ;
> > +   hwmon->num=5Fcaps=5Ffields =3D config->num=5Fcaps=5Ffields;
> > +   hwmon->caps=5Fnames =3D config->caps=5Fnames;
> > +
> > +   dev=5Fset=5Fdrvdata(dev, hwmon);
> > +
> > +   rc =3D device=5Fcreate=5Ffile(dev, &dev=5Fattr=5Fonline);
> > +   if (rc)
> > +      return ERR=5FPTR(rc);
> > +
> > +   return hwmon;
> > +}
> > +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstart);
> > +
> > +int occ=5Fsysfs=5Fstop(struct device *dev, struct occ=5Fsysfs *driver)
> > +{
> > +   if (driver->dev) {
> > +      occ=5Fremove=5Fhwmon=5Fattrs(driver);
> > +      hwmon=5Fdevice=5Funregister(driver->dev);
> > +   }
> > +
> > +   device=5Fremove=5Ffile(driver->dev, &dev=5Fattr=5Fonline);
> > +
> > +   devm=5Fkfree(dev, driver);
>
> Thw point of using devm=5F functions is not to require remove/free
functions.
> Something is completely wrong here if you need that call.
>
> Overall, this is architectually completely wrong. One does not register
> or instantiate drivers based on writing into sysfs attributes. Please
> reconsider your approach.

We had some trouble designing this driver because the BMC only has
access to the OCC once the processor is powered on. This will happen
sometime after the BMC boots (this driver runs only on the BMC). With
no access to the OCC, we don't know what sensors are present on the
system without a large static enumeration. Also any sysfs files created
before we have OCC access won't be able to return any data.

Instead of the "online" attribute, what do you think about using the
"bind"/"unbind" API to probe the device from user space once the system
is powered on? All the hwmon registration would take place in the probe
function, it would just occur some time after boot.

Thanks again,
Eddie

>
> > +
> > +   return 0;
> > +}
> > +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstop);
> > +
> > +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE=5FDESCRIPTION("OCC sysfs driver");
> > +MODULE=5FLICENSE("GPL");
> > diff --git a/drivers/hwmon/occ/occ=5Fsysfs.h
b/drivers/hwmon/occ/occ=5Fsysfs.h
> > new file mode 100644
> > index 0000000..2a8044f
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fsysfs.h
> > @@ -0,0 +1,52 @@
> > +/*
> > + * occ=5Fsysfs.h - OCC sysfs interface
> > + *
> > + * This file contains the data structures and function prototypes
> for the OCC
> > + * hwmon sysfs entries.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
modify
> > + * it under the terms of the GNU General Public License as published
by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef =5F=5FOCC=5FSYSFS=5FH=5F=5F
> > +#define =5F=5FOCC=5FSYSFS=5FH=5F=5F
> > +
> > +#include "occ.h"
> > +
> > +struct sensor=5Fgroup {
> > +   char *name;
> > +   struct sensor=5Fattr=5Fdata *sattr;
> > +   struct attribute=5Fgroup group;
> > +};
> > +
> > +struct occ=5Fsysfs=5Fconfig {
> > +   unsigned int num=5Fcaps=5Ffields;
> > +   char **caps=5Fnames;
> > +};
> > +
> > +struct occ=5Fsysfs {
> > +   struct device *dev;
> > +   struct occ *occ;
> > +
> > +   u16 user=5Fpowercap;
> > +   bool occ=5Fonline;
> > +   struct sensor=5Fgroup sensor=5Fgroups[MAX=5FOCC=5FSENSOR=5FTYPE];
> > +   unsigned long update=5Finterval;
> > +   unsigned int num=5Fcaps=5Ffields;
> > +   char **caps=5Fnames;
> > +};
> > +
> > +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ=
 *occ,
> > +              struct occ=5Fsysfs=5Fconfig *config);
> > +int occ=5Fsysfs=5Fstop(struct device *dev, struct occ=5Fsysfs *driver);
> > +
> > +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */
> > --
> > 1.9.1
> >
>

--0__=8FBB0A33DFE9AFF68f9e8a93df938690918c8FBB0A33DFE9AFF6
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Hi,</tt><br><br><tt>Thanks for your comments Guenter. So=
rry to switch email addresses, but</tt><br><tt>gmail is rejecting my messag=
es to this thread.</tt><br><br><br><tt>Guenter Roeck &lt;linux@roeck-us.net=
&gt; wrote on 12/30/2016 01:34:04 PM:<br><br>&gt; On Fri, Dec 30, 2016 at 1=
1:56:04AM -0600, eajames.ibm@gmail.com wrote:<br>&gt; &gt; From: &quot;Edwa=
rd A. James&quot; &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; <br>&gt; &gt; Add=
 a generic mechanism to expose the sensors provided by the OCC in<br>&gt; &=
gt; sysfs.<br>&gt; &gt; <br>&gt; &gt; Signed-off-by: Edward A. James &lt;ea=
james@us.ibm.com&gt;<br>&gt; &gt; Signed-off-by: Andrew Jeffery &lt;andrew@=
aj.id.au&gt;<br>&gt; &gt; Reviewed-by: Andrew Jeffery &lt;andrew@aj.id.au&g=
t;<br>&gt; &gt; ---<br>&gt; &gt; &nbsp;Documentation/hwmon/occ &nbsp; &nbsp=
; &nbsp; | &nbsp;48 +++++<br>&gt; &gt; &nbsp;drivers/hwmon/occ/Makefile &nb=
sp; &nbsp;| &nbsp; 2 +-<br>&gt; &gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.c =
| 492 +++++++++++++++++++++++++++++<br>&gt; +++++++++++++<br>&gt; &gt; &nbs=
p;drivers/hwmon/occ/occ=5Fsysfs.h | &nbsp;52 +++++<br>&gt; &gt; &nbsp;4 fil=
es changed, 593 insertions(+), 1 deletion(-)<br>&gt; &gt; &nbsp;create mode=
 100644 drivers/hwmon/occ/occ=5Fsysfs.c<br>&gt; &gt; &nbsp;create mode 1006=
44 drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; <br>&gt; &gt; diff --git a/=
Documentation/hwmon/occ b/Documentation/hwmon/occ<br>&gt; &gt; index 79d164=
2..1ee8689 100644<br>&gt; &gt; --- a/Documentation/hwmon/occ<br>&gt; &gt; +=
++ b/Documentation/hwmon/occ<br>&gt; &gt; @@ -25,6 +25,54 @@ Currently, all=
 versions of the OCC support four<br>&gt; types of sensor data: power,<br>&=
gt; &gt; &nbsp;temperature, frequency, and &quot;caps,&quot; which indicate=
 limits and <br>&gt; thresholds used<br>&gt; &gt; &nbsp;internally on the O=
CC.<br>&gt; &gt; &nbsp;<br>&gt; &gt; +sysfs Entries<br>&gt; &gt; +---------=
----<br>&gt; &gt; +<br>&gt; &gt; +The OCC driver uses the hwmon sysfs frame=
work to provide data to userspace.<br>&gt; &gt; +<br>&gt; &gt; +The driver =
exports two sysfs files for each frequency, <br>&gt; temperature, and power=
<br>&gt; &gt; +sensor. These are &quot;input&quot; and &quot;label&quot;. T=
he input file contains <br>&gt; the value of the<br>&gt; &gt; +sensor. The =
label file contains the sensor id. The sensor id is the unique<br>&gt; &gt;=
 +internal OCC identifier. Sensor ids may be provided by the OCC <br>&gt; s=
pecification.<br>&gt; &gt; +The names of these files will be in the followi=
ng format:<br>&gt; &gt; + &nbsp; &lt;sensor type&gt;&lt;sensor index&gt;=5F=
input<br>&gt; &gt; + &nbsp; &lt;sensor type&gt;&lt;sensor index&gt;=5Flabel=
<br>&gt; &gt; +Sensor types will be one of &quot;temp&quot;, &quot;freq&quo=
t;, or &quot;power&quot;. The sensor index is<br>&gt; &gt; +an index to dif=
ferentiate different sensor files. For example, a single<br>&gt; &gt; +temp=
erature sensor will have two sysfs files: temp1=5Finput and temp1=5Flabel.<=
br>&gt; &gt; +<br>&gt; &gt; +Caps sensors are exported differently. For eac=
h caps sensor, the <br>&gt; driver will<br>&gt; &gt; +export 6 entries:<br>=
&gt; &gt; + &nbsp; curr=5Fpowercap - current power cap in watts<br>&gt; &gt=
; + &nbsp; curr=5Fpowerreading - current power output in watts<br>&gt; &gt;=
 + &nbsp; norm=5Fpowercap - power cap without redundant power<br>&gt; &gt; =
+ &nbsp; max=5Fpowercap - maximum power cap that can be set in watts<br>&gt=
; &gt; + &nbsp; min=5Fpowercap - minimum power cap that can be set in watts=
<br>&gt; &gt; + &nbsp; user=5Fpowerlimit - power limit specified by the use=
r in watts<br>&gt; &gt; +In addition, the OCC driver for P9 will export a 7=
th entry:<br>&gt; &gt; + &nbsp; user=5Fpowerlimit=5Fsource - can be one of =
two values depending on who set<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;the user=
=5Fpowerlimit. 0x1 - out of band from BMC or host. 0x2 -<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp;in band from other source.<br>&gt; &gt; +The format for th=
ese files is caps&lt;sensor index&gt;=5F&lt;entry type&gt;. For example,<br=
>&gt; &gt; +caps1=5Fcurr=5Fpowercap.<br>&gt; &gt; +<br>&gt; &gt; +The drive=
r also provides a number of sysfs entries through hwmon to better<br>&gt; &=
gt; +control the driver and monitor the OCC.<br>&gt; &gt; + &nbsp; powercap=
 - read or write the OCC user power limit in watts.<br>&gt; &gt; + &nbsp; n=
ame - read the name of the driver<br>&gt; &gt; + &nbsp; update=5Finterval -=
 read or write the minimum interval for polling the<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp;OCC.<br>&gt; &gt; +<br>&gt; &gt; +The driver also exports a sin=
gle sysfs file through the <br>&gt; communication protocol<br>&gt; &gt; +de=
vice (see BMC - Host Communications). The filename is &quot;online&quot; <b=
r>&gt; and represents<br>&gt; &gt; +the status of the OCC with respect to t=
he driver. The OCC can be <br>&gt; in one of two<br>&gt; &gt; +states: OCC =
polling enabled or OCC polling disabled. The purpose <br>&gt; of this file<=
br>&gt; &gt; +is to control the behavior of the driver and it's hwmon sysfs=
 <br>&gt; entries, not to<br>&gt; &gt; +infer any information about the sta=
te of the physical OCC. Reading the file<br>&gt; &gt; +returns either a 0 (=
polling disabled) or 1 (polling enabled). <br>&gt; Writing 1 to the<br>&gt;=
 &gt; +file enables OCC polling in the driver if communications can be esta=
blished<br>&gt; &gt; +with the OCC. Writing a 0 to the driver disables OCC =
polling.<br>&gt; &gt; +<br>&gt; &gt; &nbsp;BMC - Host Communications<br>&gt=
; &gt; &nbsp;-------------------------<br>&gt; &gt; &nbsp;<br>&gt; &gt; dif=
f --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile<br>&gt; &=
gt; index 93cb52f..a6881f9 100644<br>&gt; &gt; --- a/drivers/hwmon/occ/Make=
file<br>&gt; &gt; +++ b/drivers/hwmon/occ/Makefile<br>&gt; &gt; @@ -1 +1 @@=
<br>&gt; &gt; -obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o<br>&gt; &gt; =
+obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o<br>&gt; &gt; =
diff --git a/drivers/hwmon/occ/occ=5Fsysfs.c b/drivers/hwmon/occ/occ=5Fsysf=
s.c<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000..b0e063da<=
br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/drivers/hwmon/occ/occ=5Fsysfs=
.c<br>&gt; &gt; @@ -0,0 +1,492 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * occ=5Fs=
ysfs.c - OCC sysfs interface<br>&gt; &gt; + *<br>&gt; &gt; + * This file co=
ntains the methods and data structures for <br>&gt; implementing the OCC<br=
>&gt; &gt; + * hwmon sysfs entries.<br>&gt; &gt; + *<br>&gt; &gt; + * Copyr=
ight 2016 IBM Corp.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is free =
software; you can redistribute it and/or modify<br>&gt; &gt; + * it under t=
he terms of the GNU General Public License as published by<br>&gt; &gt; + *=
 the Free Software Foundation; either version 2 of the License, or<br>&gt; =
&gt; + * (at your option) any later version.<br>&gt; &gt; + *<br>&gt; &gt; =
+ * This program is distributed in the hope that it will be useful,<br>&gt;=
 &gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br=
>&gt; &gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the=
<br>&gt; &gt; + * GNU General Public License for more details.<br>&gt; &gt;=
 + */<br>&gt; &gt; +<br>&gt; &gt; +#include &lt;linux/module.h&gt;<br>&gt; =
&gt; +#include &lt;linux/init.h&gt;<br>&gt; &gt; +#include &lt;linux/slab.h=
&gt;<br>&gt; &gt; +#include &lt;linux/jiffies.h&gt;<br>&gt; &gt; +#include =
&lt;linux/hwmon.h&gt;<br>&gt; &gt; +#include &lt;linux/hwmon-sysfs.h&gt;<br=
>&gt; &gt; +#include &lt;linux/err.h&gt;<br>&gt; &gt; +#include &lt;linux/m=
utex.h&gt;<br>&gt; &gt; +#include &lt;linux/delay.h&gt;<br>&gt; &gt; +#incl=
ude &lt;linux/kernel.h&gt;<br>&gt; &gt; +#include &lt;linux/device.h&gt;<br=
>&gt; &gt; +<br>&gt; &gt; +#include &quot;occ=5Fsysfs.h&quot;<br>&gt; &gt; =
+<br>&gt; &gt; +#define MAX=5FSENSOR=5FATTR=5FLEN &nbsp; 32<br>&gt; &gt; +<=
br>&gt; &gt; +#define RESP=5FRETURN=5FCMD=5FINVAL &nbsp; 0x13<br>&gt; &gt; =
+<br>&gt; &gt; +struct sensor=5Fattr=5Fdata {<br>&gt; &gt; + &nbsp; enum se=
nsor=5Ftype type;<br>&gt; &gt; + &nbsp; u32 hwmon=5Findex;<br>&gt; &gt; + &=
nbsp; u32 attr=5Fid;<br>&gt; &gt; + &nbsp; char name[MAX=5FSENSOR=5FATTR=5F=
LEN];<br>&gt; &gt; + &nbsp; struct device=5Fattribute dev=5Fattr;<br>&gt; &=
gt; +};<br>&gt; &gt; +<br>&gt; &gt; +static ssize=5Ft show=5Finput(struct d=
evice *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct device=
=5Fattribute *attr, char *buf)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int va=
l;<br>&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sdata =3D container=
=5Fof(attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sensor=5Fattr=5Fdata,<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;dev=5Fattr);<br>&gt; &gt; + &nbsp; struct occ=5Fsysfs *driver =
=3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; val =3D =
occ=5Fget=5Fsensor=5Fvalue(driver-&gt;occ, sdata-&gt;type,<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sdata-&gt;hwmon=5Findex - 1=
);<br>&gt; &gt; + &nbsp; if (sdata-&gt;type =3D=3D TEMP)<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp;val *=3D 1000; &nbsp; /* in millidegree Celsius */<br>&gt;=
 &gt; +<br>&gt; &gt; + &nbsp; return snprintf(buf, PAGE=5FSIZE - 1, &quot;%=
d\n&quot;, val);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +/* show=5Flab=
el provides the OCC sensor id. The sensor id will be either a<br>&gt; &gt; =
+ * 2-byte (for P8) or 4-byte (for P9) value. The sensor id is a way to<br>=
&gt; &gt; + * identify what each sensor represents, according to the OCC <b=
r>&gt; specification.<br>&gt; &gt; + */<br>&gt; &gt; +static ssize=5Ft show=
=5Flabel(struct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; struct device=5Fattribute *attr, char *buf)<br>&gt; &gt; +{<br>&gt; &gt=
; + &nbsp; int val;<br>&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sdat=
a =3D container=5Fof(attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sensor=5Fattr=5Fda=
ta,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;dev=5Fattr);<br>&gt; &gt; + &nbsp; struct occ=5F=
sysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; +<br>&gt; &gt; + &=
nbsp; val =3D occ=5Fget=5Fsensor=5Fid(driver-&gt;occ, sdata-&gt;type,<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sdata-&gt;hwmon=5Findex =
- 1);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return snprintf(buf, PAGE=5FSIZE=
 - 1, &quot;%d\n&quot;, val);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +=
static ssize=5Ft show=5Fcaps(struct device *dev,<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;struct device=5Fattribute *attr, char *buf)<br>&gt; =
&gt; +{<br>&gt; &gt; + &nbsp; int val;<br>&gt; &gt; + &nbsp; struct caps=5F=
sensor *sensor;<br>&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sdata =
=3D container=5Fof(attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sensor=5Fattr=5Fdata=
,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;dev=5Fattr);<br>&gt; &gt; + &nbsp; struct occ=5Fsy=
sfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; +<br>&gt; &gt; + &nb=
sp; sensor =3D occ=5Fget=5Fsensor(driver-&gt;occ, CAPS);<br>&gt; &gt; + &nb=
sp; if (!sensor) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;val =3D -1;<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp;return snprintf(buf, PAGE=5FSIZE - 1, &quot;%d\n&=
quot;, val);<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; v=
al =3D occ=5Fget=5Fcaps=5Fvalue(driver-&gt;occ, sensor, sdata-&gt;hwmon=5Fi=
ndex - 1,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sdata-&g=
t;attr=5Fid);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return snprintf(buf, PAG=
E=5FSIZE - 1, &quot;%d\n&quot;, val);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt=
; &gt; +static ssize=5Ft show=5Fupdate=5Finterval(struct device *dev,<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct dev=
ice=5Fattribute *attr, char *buf)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; str=
uct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; +<br>&gt=
; &gt; + &nbsp; return snprintf(buf, PAGE=5FSIZE - 1, &quot;%lu\n&quot;, dr=
iver-&gt;update=5Finterval);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +s=
tatic ssize=5Ft store=5Fupdate=5Finterval(struct device *dev,<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct device=5Fa=
ttribute *attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; const char *buf, size=5Ft count)<br>&gt; &gt; +{<br>&gt; &gt; +=
 &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &g=
t; + &nbsp; unsigned long val;<br>&gt; &gt; + &nbsp; int rc;<br>&gt; &gt; +=
<br>&gt; &gt; + &nbsp; rc =3D kstrtoul(buf, 10, &amp;val);<br>&gt; &gt; + &=
nbsp; if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; +<=
br>&gt; &gt; + &nbsp; driver-&gt;update=5Finterval =3D val;<br>&gt; &gt; + =
&nbsp; occ=5Fset=5Fupdate=5Finterval(driver-&gt;occ, val);<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; return count;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &=
gt; +static DEVICE=5FATTR(update=5Finterval, S=5FIWUSR | S=5FIRUGO, <br>&gt=
; show=5Fupdate=5Finterval,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; stor=
e=5Fupdate=5Finterval);<br>&gt; &gt; +<br>&gt; &gt; +static ssize=5Ft show=
=5Fname(struct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct device=5Fattribute *attr, char *buf)<br>&gt; &gt; +{<br>&gt; &gt; =
+ &nbsp; return snprintf(buf, PAGE=5FSIZE - 1, &quot;occ\n&quot;);<br>&gt; =
&gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static DEVICE=5FATTR(name, S=5FIRUGO, =
show=5Fname, NULL);<br>&gt; &gt; +<br>&gt; &gt; +static ssize=5Ft show=5Fus=
er=5Fpowercap(struct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;struct device=5Fattribute *attr, char *buf)<br>&gt; &=
gt; +{<br>&gt; &gt; + &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrv=
data(dev);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return snprintf(buf, PAGE=
=5FSIZE - 1, &quot;%u\n&quot;, driver-&gt;user=5Fpowercap);<br>&gt; &gt; +}=
<br>&gt; &gt; +<br>&gt; &gt; +static ssize=5Ft store=5Fuser=5Fpowercap(stru=
ct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; struct device=5Fattribute *attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; const char *buf, size=5Ft count)<br>&gt; &gt; +{=
<br>&gt; &gt; + &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(d=
ev);<br>&gt; &gt; + &nbsp; u16 val;<br>&gt; &gt; + &nbsp; int rc;<br>&gt; &=
gt; +<br>&gt; &gt; + &nbsp; rc =3D kstrtou16(buf, 10, &amp;val);<br>&gt; &g=
t; + &nbsp; if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &=
gt; +<br>&gt; &gt; + &nbsp; dev=5Fdbg(dev, &quot;set user powercap to: %d\n=
&quot;, val);<br>&gt; &gt; + &nbsp; rc =3D occ=5Fset=5Fuser=5Fpowercap(driv=
er-&gt;occ, val);<br>&gt; &gt; + &nbsp; if (rc) {<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp;dev=5Ferr(dev, &quot;set user powercap failed: 0x%x\n&quot;, rc);=
<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINV=
AL) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;set i=
nvalid powercap value: %d\n&quot;, val);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; return -EINVAL;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; =
+<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; + &nbsp; }<br>=
&gt; &gt; +<br>&gt; &gt; + &nbsp; driver-&gt;user=5Fpowercap =3D val;<br>&g=
t; &gt; +<br>&gt; &gt; + &nbsp; return count;<br>&gt; &gt; +}<br>&gt; &gt; =
+<br>&gt; &gt; +static DEVICE=5FATTR(user=5Fpowercap, S=5FIWUSR | S=5FIRUGO=
, show=5Fuser=5Fpowercap,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; store=
=5Fuser=5Fpowercap);<br>&gt; &gt; +<br>&gt; &gt; +static void deinit=5Fsens=
or=5Fgroups(struct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; struct sensor=5Fgroup *sensor=5Fgroups)<br>&gt; &gt; +{<br>&g=
t; &gt; + &nbsp; int i;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; =
i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; i++) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
;if (sensor=5Fgroups[i].group.attrs)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; devm=5Fkfree(dev, sensor=5Fgroups[i].group.attrs);<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp;if (sensor=5Fgroups[i].sattr)<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; devm=5Fkfree(dev, sensor=5Fgroups[i].sattr);<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp;sensor=5Fgroups[i].group.attrs =3D NULL;<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp;sensor=5Fgroups[i].sattr =3D NULL;<br>&gt; &gt; + &nbsp=
; }<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static void sensor=5Fattr=
=5Finit(struct sensor=5Fattr=5Fdata *sdata,<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;char *sensor=5Fgroup=5Fname,<br>&gt; &gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *attr=5Fname,<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ssize=5Ft (*show)(s=
truct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;struct device=5Fattribute *attr,<br>&gt; &gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char =
*buf))<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; sysfs=5Fattr=5Finit(&amp;sdata=
-&gt;dev=5Fattr.attr);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; snprintf(sdata-=
&gt;name, MAX=5FSENSOR=5FATTR=5FLEN, &quot;%s%d=5F%s&quot;,<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; sensor=5Fgroup=5Fname, sdata-&gt;hwmon=5Findex, attr=
=5Fname);<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.attr.name =3D sdata-&g=
t;name;<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.attr.mode =3D S=5FIRUGO;=
<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.show =3D show;<br>&gt; &gt; +}<=
br>&gt; &gt; +<br>&gt; &gt; +static int create=5Fsensor=5Fgroup(struct occ=
=5Fsysfs *driver,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;enum sensor=5Ftype type, int sensor=5Fnum)<br>&gt; &gt; +{<br>=
&gt; &gt; + &nbsp; struct device *dev =3D driver-&gt;dev;<br>&gt; &gt; + &n=
bsp; struct sensor=5Fgroup *sensor=5Fgroups =3D driver-&gt;sensor=5Fgroups;=
<br>&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sdata;<br>&gt; &gt; + &=
nbsp; int rc, i;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; /* each sensor has 'l=
abel' and 'input' attributes */<br>&gt; &gt; + &nbsp; sensor=5Fgroups[type]=
.group.attrs =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;devm=5Fkzalloc(dev, siz=
eof(struct attribute *) *<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;sensor=5Fnum * 2 + 1, GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; if=
 (!sensor=5Fgroups[type].group.attrs) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
rc =3D -ENOMEM;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;goto err;<br>&gt; &gt; +=
 &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; sensor=5Fgroups[type].sattr =
=3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;devm=5Fkzalloc(dev, sizeof(struct se=
nsor=5Fattr=5Fdata) *<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;sensor=5Fnum * 2, GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; if (!senso=
r=5Fgroups[type].sattr) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D -ENOMEM=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;goto err;<br>&gt; &gt; + &nbsp; }<br>&=
gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; sensor=5Fnum; i++) {<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sdata =3D &amp;sensor=5Fgroups[type].sat=
tr[i];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;/* hwmon attributes index starts =
from 1 */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sdata-&gt;hwmon=5Findex =3D i =
+ 1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sdata-&gt;type =3D type;<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp;sensor=5Fattr=5Finit(sdata, sensor=5Fgroups[type].=
name, &quot;input&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; show=5Finput);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sensor=5Fgroups[ty=
pe].group.attrs[i] =3D &amp;sdata-&gt;dev=5Fattr.attr;<br>&gt; &gt; +<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp;sdata =3D &amp;sensor=5Fgroups[type].sattr[i =
+ sensor=5Fnum];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sdata-&gt;hwmon=5Findex=
 =3D i + 1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sdata-&gt;type =3D type;<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;sensor=5Fattr=5Finit(sdata, sensor=5Fgroups=
[type].name, &quot;label&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; show=5Flabel);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sensor=5Fgr=
oups[type].group.attrs[i + sensor=5Fnum] =3D<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &amp;sdata-&gt;dev=5Fattr.attr;<br>&gt; &gt; + &nbsp; }<br>&gt=
; &gt; +<br>&gt; &gt; + &nbsp; rc =3D sysfs=5Fcreate=5Fgroup(&amp;dev-&gt;k=
obj, &amp;sensor=5Fgroups[type].group);<br>&gt; &gt; + &nbsp; if (rc)<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp;goto err;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; return 0;<br>&gt; &gt; +err:<br>&gt; &gt; + &nbsp; deinit=5Fsensor=5Fgrou=
ps(dev, sensor=5Fgroups);<br>&gt; &gt; + &nbsp; return rc;<br>&gt; &gt; +}<=
br>&gt; &gt; +<br>&gt; &gt; +static void caps=5Fsensor=5Fattr=5Finit(struct=
 sensor=5Fattr=5Fdata *sdata,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;char *attr=5Fname, uint32=5Ft hwmon=5Findex,<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32=5Ft attr=5Fid)<br=
>&gt; &gt; +{<br>&gt; &gt; + &nbsp; sdata-&gt;type =3D CAPS;<br>&gt; &gt; +=
 &nbsp; sdata-&gt;hwmon=5Findex =3D hwmon=5Findex;<br>&gt; &gt; + &nbsp; sd=
ata-&gt;attr=5Fid =3D attr=5Fid;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; snpri=
ntf(sdata-&gt;name, MAX=5FSENSOR=5FATTR=5FLEN, &quot;%s%d=5F%s&quot;,<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &quot;caps&quot;, sdata-&gt;hwmon=5Findex, a=
ttr=5Fname);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; sysfs=5Fattr=5Finit(&amp;=
sdata-&gt;dev=5Fattr.attr);<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.attr=
.name =3D sdata-&gt;name;<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.attr.m=
ode =3D S=5FIRUGO;<br>&gt; &gt; + &nbsp; sdata-&gt;dev=5Fattr.show =3D show=
=5Fcaps;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static int create=5Fc=
aps=5Fsensor=5Fgroup(struct occ=5Fsysfs *driver, int<br>&gt; sensor=5Fnum)<=
br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; struct device *dev =3D driver-&gt;dev=
;<br>&gt; &gt; + &nbsp; struct sensor=5Fgroup *sensor=5Fgroups =3D driver-&=
gt;sensor=5Fgroups;<br>&gt; &gt; + &nbsp; int field=5Fnum =3D driver-&gt;nu=
m=5Fcaps=5Ffields;<br>&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sdata=
;<br>&gt; &gt; + &nbsp; int i, j, rc;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; =
sensor=5Fgroups[CAPS].group.attrs =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;de=
vm=5Fkzalloc(dev, sizeof(struct attribute *) * sensor=5Fnum *<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;field=5Fnum + 1, GFP=5FKE=
RNEL);<br>&gt; &gt; + &nbsp; if (!sensor=5Fgroups[CAPS].group.attrs) {<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D -ENOMEM;<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp;goto err;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; sensor=5Fgroups[CAPS].sattr =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;devm=
=5Fkzalloc(dev, sizeof(struct sensor=5Fattr=5Fdata) *<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sensor=5Fnum * field=5Fnum, GFP=
=5FKERNEL);<br>&gt; &gt; + &nbsp; if (!sensor=5Fgroups[CAPS].sattr) {<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp;rc =3D -ENOMEM;<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp;goto err;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; for (j =3D 0; j &lt; sensor=5Fnum; ++j) {<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp;for (i =3D 0; i &lt; field=5Fnum; ++i) {<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; sdata =3D &amp;sensor=5Fgroups[CAPS].sattr[j * field=5Fnum + i=
];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; caps=5Fsensor=5Fattr=5Finit(s=
data,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; driver-&gt;caps=5Fnames[i], j + 1, i);<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; sensor=5Fgroups[CAPS].group.attrs[j * field=5Fnum + =
i] =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;sdata-&=
gt;dev=5Fattr.attr;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; + &nb=
sp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; rc =3D sysfs=5Fcreate=5Fgroup(&a=
mp;dev-&gt;kobj, &amp;sensor=5Fgroups[CAPS].group);<br>&gt; &gt; + &nbsp; i=
f (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;goto err;<br>&gt; &gt; +<br>&gt; =
&gt; + &nbsp; return rc;<br>&gt; &gt; +err:<br>&gt; &gt; + &nbsp; deinit=5F=
sensor=5Fgroups(dev, sensor=5Fgroups);<br>&gt; &gt; + &nbsp; return rc;<br>=
&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static void occ=5Fremove=5Fhwmon=
=5Fattrs(struct occ=5Fsysfs *driver)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; =
struct device *dev =3D driver-&gt;dev;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp;=
 device=5Fremove=5Ffile(dev, &amp;dev=5Fattr=5Fuser=5Fpowercap);<br>&gt; &g=
t; + &nbsp; device=5Fremove=5Ffile(dev, &amp;dev=5Fattr=5Fupdate=5Finterval=
);<br>&gt; &gt; + &nbsp; device=5Fremove=5Ffile(dev, &amp;dev=5Fattr=5Fname=
);<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static int occ=5Fcreate=5Fh=
wmon=5Fattrs(struct occ=5Fsysfs *driver)<br>&gt; &gt; +{<br>&gt; &gt; + &nb=
sp; int i, rc, id, sensor=5Fnum;<br>&gt; &gt; + &nbsp; struct device *dev =
=3D driver-&gt;dev;<br>&gt; &gt; + &nbsp; struct sensor=5Fgroup *sensor=5Fg=
roups =3D driver-&gt;sensor=5Fgroups;<br>&gt; &gt; + &nbsp; struct occ=5Fbl=
ocks *resp =3D NULL;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; occ=5Fget=5Frespo=
nse=5Fblocks(driver-&gt;occ, &amp;resp);<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; ++i)<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp;resp-&gt;sensor=5Fblock=5Fid[i] =3D -1;<br>&gt; &gt; +<br>&=
gt; &gt; + &nbsp; /* read sensor data from occ */<br>&gt; &gt; + &nbsp; rc =
=3D occ=5Fupdate=5Fdevice(driver-&gt;occ);<br>&gt; &gt; + &nbsp; if (rc) {<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;cannot get occ sens=
or data: %d\n&quot;, rc);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>=
&gt; &gt; + &nbsp; }<br>&gt; &gt; + &nbsp; if (!resp-&gt;blocks)<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; rc =3D device=5Fcreate=5Ffile(dev, &amp;dev=5Fattr=5Fname);<br>&gt; &gt;=
 + &nbsp; if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;goto error;<br>&gt; &g=
t; +<br>&gt; &gt; + &nbsp; rc =3D device=5Fcreate=5Ffile(dev, &amp;dev=5Fat=
tr=5Fupdate=5Finterval);<br>&gt; &gt; + &nbsp; if (rc)<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp;goto error;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; if (resp-&g=
t;sensor=5Fblock=5Fid[CAPS] &gt;=3D 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
;/* user powercap: only for master OCC */<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p;rc =3D device=5Fcreate=5Ffile(dev, &amp;dev=5Fattr=5Fuser=5Fpowercap);<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; goto error;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + =
&nbsp; sensor=5Fgroups[FREQ].name =3D &quot;freq&quot;;<br>&gt; &gt; + &nbs=
p; sensor=5Fgroups[TEMP].name =3D &quot;temp&quot;;<br>&gt; &gt; + &nbsp; s=
ensor=5Fgroups[POWER].name =3D &quot;power&quot;;<br>&gt; &gt; + &nbsp; sen=
sor=5Fgroups[CAPS].name =3D &quot;caps&quot;;<br>&gt; &gt; +<br>&gt; &gt; +=
 &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; i++) {<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;id =3D resp-&gt;sensor=5Fblock=5Fid[i];<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;if (id &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; continue;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sensor=5F=
num =3D resp-&gt;blocks[id].header.sensor=5Fnum;<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp;if (i =3D=3D CAPS)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rc =
=3D create=5Fcaps=5Fsensor=5Fgroup(driver, sensor=5Fnum);<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp;else<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rc =3D cr=
eate=5Fsensor=5Fgroup(driver, i, sensor=5Fnum);<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp;if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; goto error;<br>&=
gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return 0;<br>&gt; =
&gt; +<br>&gt; &gt; +error:<br>&gt; &gt; + &nbsp; dev=5Ferr(dev, &quot;cann=
ot create hwmon attributes: %d\n&quot;, rc);<br>&gt; &gt; + &nbsp; occ=5Fre=
move=5Fhwmon=5Fattrs(driver);<br>&gt; &gt; + &nbsp; return rc;<br>&gt; &gt;=
 +}<br>&gt; &gt; +<br>&gt; &gt; +static ssize=5Ft show=5Focc=5Fonline(struc=
t device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;struct device=5Fattribute *attr, char *buf)<br>&gt; &gt; +{<br>&g=
t; &gt; + &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<b=
r>&gt; &gt; +<br>&gt; &gt; + &nbsp; return snprintf(buf, PAGE=5FSIZE - 1, &=
quot;%u\n&quot;, driver-&gt;occ=5Fonline);<br>&gt; &gt; +}<br>&gt; &gt; +<b=
r>&gt; &gt; +static ssize=5Ft store=5Focc=5Fonline(struct device *dev,<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct device=5Fattribu=
te *attr,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const cha=
r *buf, size=5Ft count)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; struct occ=5F=
sysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; + &nbsp; unsigned =
long val;<br>&gt; &gt; + &nbsp; int rc;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; rc =3D kstrtoul(buf, 10, &amp;val);<br>&gt; &gt; + &nbsp; if (rc)<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp;=
 if (val =3D=3D 1) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (driver-&gt;occ=
=5Fonline)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return count;<br>&gt;=
 &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;driver-&gt;dev =3D hwmon=5Fdevic=
e=5Fregister(dev);<br>&gt; <br>&gt; hwmon=5Fdevice=5Fregister() is deprecat=
ed. Please consider using<br>&gt; devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=
=5Finfo() or at least<br>&gt; hwmon=5Fdevice=5Fregister=5Fwith=5Finfo().</t=
t><br><br><tt>OK, I'll address this.</tt><br><tt><br>&gt; <br>&gt; Uuh ... =
and registering a hwmon device based on writing into a sysfsattribute<br>&g=
t; is completely out of the question.<br>&gt; <br>&gt; Thanks,<br>&gt; Guen=
ter<br>&gt; <br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (IS=5FERR(driver-&gt;dev=
))<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return PTR=5FERR(driver-&gt;d=
ev);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;dev=5Fset=5Fdrvdata(=
driver-&gt;dev, driver);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
rc =3D occ=5Fcreate=5Fhwmon=5Fattrs(driver);<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp;if (rc) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; hwmon=5Fdevice=5F=
unregister(driver-&gt;dev);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; driv=
er-&gt;dev =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return rc;<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; + &nbsp; } else if (val =
=3D=3D 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (!driver-&gt;occ=5Fonline=
)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return count;<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp;occ=5Fremove=5Fhwmon=5Fattrs(driver);<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;hwmon=5Fdevice=5Funregister(driver-&gt;dev)=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;driver-&gt;dev =3D NULL;<br>&gt; &gt; =
+ &nbsp; } else<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EINVAL;<br>&gt; =
&gt; +<br>&gt; &gt; + &nbsp; driver-&gt;occ=5Fonline =3D val;<br>&gt; &gt; =
+ &nbsp; return count;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static =
DEVICE=5FATTR(online, S=5FIWUSR | S=5FIRUGO, show=5Focc=5Fonline,<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; store=5Focc=5Fonline);<br>&gt; &gt; +<br>=
&gt; &gt; +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, stru=
ct occ *occ,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;struct occ=5Fsysfs=5Fconfig *config)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp;=
 struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(struct occ=5Fsysf=
s),<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; int rc;<br>&gt; &g=
t; +<br>&gt; &gt; + &nbsp; if (!hwmon)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;r=
eturn ERR=5FPTR(-ENOMEM);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; hwmon-&gt;oc=
c =3D occ;<br>&gt; &gt; + &nbsp; hwmon-&gt;num=5Fcaps=5Ffields =3D config-&=
gt;num=5Fcaps=5Ffields;<br>&gt; &gt; + &nbsp; hwmon-&gt;caps=5Fnames =3D co=
nfig-&gt;caps=5Fnames;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; dev=5Fset=5Fdrv=
data(dev, hwmon);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; rc =3D device=5Fcrea=
te=5Ffile(dev, &amp;dev=5Fattr=5Fonline);<br>&gt; &gt; + &nbsp; if (rc)<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;return ERR=5FPTR(rc);<br>&gt; &gt; +<br>&gt=
; &gt; + &nbsp; return hwmon;<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FSYMBOL=
(occ=5Fsysfs=5Fstart);<br>&gt; &gt; +<br>&gt; &gt; +int occ=5Fsysfs=5Fstop(=
struct device *dev, struct occ=5Fsysfs *driver)<br>&gt; &gt; +{<br>&gt; &gt=
; + &nbsp; if (driver-&gt;dev) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;occ=5Fr=
emove=5Fhwmon=5Fattrs(driver);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;hwmon=5Fd=
evice=5Funregister(driver-&gt;dev);<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<=
br>&gt; &gt; + &nbsp; device=5Fremove=5Ffile(driver-&gt;dev, &amp;dev=5Fatt=
r=5Fonline);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; devm=5Fkfree(dev, driver)=
;<br>&gt; <br>&gt; Thw point of using devm=5F functions is not to require r=
emove/free functions.<br>&gt; Something is completely wrong here if you nee=
d that call.<br>&gt; <br>&gt; Overall, this is architectually completely wr=
ong. One does not register<br>&gt; or instantiate drivers based on writing =
into sysfs attributes. Please<br>&gt; reconsider your approach.</tt><br><br=
><tt>We had some trouble designing this driver because the BMC only has</tt=
><br><tt>access to the OCC once the processor is powered on. This will happ=
en</tt><br><tt>sometime after the BMC boots (this driver runs only on the B=
MC). With</tt><br><tt>no access to the OCC, we don't know what sensors are =
present on the</tt><br><tt>system without a large static enumeration. Also =
any sysfs files created</tt><br><tt>before we have OCC access won't be able=
 to return any data.</tt><br><br><tt>Instead of the &quot;online&quot; attr=
ibute, what do you think about using the</tt><br><tt>&quot;bind&quot;/&quot=
;unbind&quot; API to probe the device from user space once the system</tt><=
br><tt>is powered on? All the hwmon registration would take place in the pr=
obe</tt><br><tt>function, it would just occur some time after boot.</tt><br=
><br><tt>Thanks again,</tt><br><tt>Eddie</tt><br><tt><br>&gt; <br>&gt; &gt;=
 +<br>&gt; &gt; + &nbsp; return 0;<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FS=
YMBOL(occ=5Fsysfs=5Fstop);<br>&gt; &gt; +<br>&gt; &gt; +MODULE=5FAUTHOR(&qu=
ot;Eddie James &lt;eajames@us.ibm.com&gt;&quot;);<br>&gt; &gt; +MODULE=5FDE=
SCRIPTION(&quot;OCC sysfs driver&quot;);</tt><br><tt>&gt; &gt; +MODULE=5FLI=
CENSE(&quot;GPL&quot;);<br>&gt; &gt; diff --git a/drivers/hwmon/occ/occ=5Fs=
ysfs.h b/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; new file mode 100644<=
br>&gt; &gt; index 0000000..2a8044f<br>&gt; &gt; --- /dev/null<br>&gt; &gt;=
 +++ b/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; @@ -0,0 +1,52 @@<br>&gt=
; &gt; +/*<br>&gt; &gt; + * occ=5Fsysfs.h - OCC sysfs interface<br>&gt; &gt=
; + *<br>&gt; &gt; + * This file contains the data structures and function =
prototypes<br>&gt; for the OCC<br>&gt; &gt; + * hwmon sysfs entries.<br>&gt=
; &gt; + *<br>&gt; &gt; + * Copyright 2016 IBM Corp.<br>&gt; &gt; + *<br>&g=
t; &gt; + * This program is free software; you can redistribute it and/or m=
odify<br>&gt; &gt; + * it under the terms of the GNU General Public License=
 as published by<br>&gt; &gt; + * the Free Software Foundation; either vers=
ion 2 of the License, or<br>&gt; &gt; + * (at your option) any later versio=
n.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is distributed in the hop=
e that it will be useful,<br>&gt; &gt; + * but WITHOUT ANY WARRANTY; withou=
t even the implied warranty of<br>&gt; &gt; + * MERCHANTABILITY or FITNESS =
FOR A PARTICULAR PURPOSE. See the<br>&gt; &gt; + * GNU General Public Licen=
se for more details.<br>&gt; &gt; + */<br>&gt; &gt; +<br>&gt; &gt; +#ifndef=
 =5F=5FOCC=5FSYSFS=5FH=5F=5F<br>&gt; &gt; +#define =5F=5FOCC=5FSYSFS=5FH=5F=
=5F<br>&gt; &gt; +<br>&gt; &gt; +#include &quot;occ.h&quot;<br>&gt; &gt; +<=
br>&gt; &gt; +struct sensor=5Fgroup {<br>&gt; &gt; + &nbsp; char *name;<br>=
&gt; &gt; + &nbsp; struct sensor=5Fattr=5Fdata *sattr;<br>&gt; &gt; + &nbsp=
; struct attribute=5Fgroup group;<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &=
gt; +struct occ=5Fsysfs=5Fconfig {<br>&gt; &gt; + &nbsp; unsigned int num=
=5Fcaps=5Ffields;<br>&gt; &gt; + &nbsp; char **caps=5Fnames;<br>&gt; &gt; +=
};<br>&gt; &gt; +<br>&gt; &gt; +struct occ=5Fsysfs {<br>&gt; &gt; + &nbsp; =
struct device *dev;<br>&gt; &gt; + &nbsp; struct occ *occ;<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; u16 user=5Fpowercap;<br>&gt; &gt; + &nbsp; bool occ=5F=
online;<br>&gt; &gt; + &nbsp; struct sensor=5Fgroup sensor=5Fgroups[MAX=5FO=
CC=5FSENSOR=5FTYPE];<br>&gt; &gt; + &nbsp; unsigned long update=5Finterval;=
<br>&gt; &gt; + &nbsp; unsigned int num=5Fcaps=5Ffields;<br>&gt; &gt; + &nb=
sp; char **caps=5Fnames;<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +stru=
ct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ *occ,<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct occ=5Fs=
ysfs=5Fconfig *config);<br>&gt; &gt; +int occ=5Fsysfs=5Fstop(struct device =
*dev, struct occ=5Fsysfs *driver);<br>&gt; &gt; +<br>&gt; &gt; +#endif /* =
=5F=5FOCC=5FSYSFS=5FH=5F=5F */<br>&gt; &gt; -- <br>&gt; &gt; 1.9.1<br>&gt; =
&gt; <br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A33DFE9AFF68f9e8a93df938690918c8FBB0A33DFE9AFF6--
