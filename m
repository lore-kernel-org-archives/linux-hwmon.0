Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c2dce65a-6e7a-0c5b-49e9-b50b4f4e91ea@roeck-us.net>
Subject: Re: [PATCH linux v4 2/6] hwmon: occ: Add sysfs interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 30 Jan 2017 13:49:56 -0600
References: <1485472758-11003-1-git-send-email-eajames.ibm@gmail.com>
 <1485472758-11003-3-git-send-email-eajames.ibm@gmail.com>
 <c2dce65a-6e7a-0c5b-49e9-b50b4f4e91ea@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A2BDFFF23608f9e8a93df938690918c8FBB0A2BDFFF2360"
Content-Disposition: inline
Message-Id: <OFA71A82F0.957F7772-ON002580B8.006CA5F0-862580B8.006CF128@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A2BDFFF23608f9e8a93df938690918c8FBB0A2BDFFF2360
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Guenter Roeck <linux@roeck-us.net> wrote on 01/29/2017 01:50:55 PM:
> On 01/26/2017 03:19 PM, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> >
> > Add a generic mechanism to expose the sensors provided by the OCC in
> > sysfs.
> >
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/hwmon/occ       |  62 ++++++++++
> >  drivers/hwmon/occ/Makefile    |   2 +-
> >  drivers/hwmon/occ/occ=5Fsysfs.c | 259 +++++++++++++++++++++++++++++
> +++++++++++++
> >  drivers/hwmon/occ/occ=5Fsysfs.h |  30 +++++
> >  4 files changed, 352 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c
> >  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h
> >
> > diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> > index 79d1642..d0bdf06 100644
> > --- a/Documentation/hwmon/occ
> > +++ b/Documentation/hwmon/occ
> > @@ -25,6 +25,68 @@ Currently, all versions of the OCC support four
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
> > +The driver exports a number of sysfs files for each type of sensor.
The
> > +sensor-specific files vary depending on the processor type,
> though many of the
> > +attributes are common for both the POWER8 and POWER9.
> > +
> > +The hwmon interface cannot define every type of sensor that may be
used.
> > +Therefore, the frequency sensor on the OCC uses the "input" type
> sensor defined
> > +by the hwmon interface, rather than defining a new type of custom
sensor.
> > +
> > +Below are detailed the names and meaning of each sensor file for
> both types of
> > +processors. All sensors are read-only unless otherwise specified.
> <x> indicates
> > +the hwmon index. sensor id indicates the unique internal OCC
> identifer. Please
> > +see the POWER OCC specification for details on all these sensor
values.
> > +
> > +frequency:
> > +   all processors:
> > +      in<x>=5Finput - frequency value
> > +      in<x>=5Flabel - sensor id
> > +temperature:
> > +   POWER8:
> > +      temp<x>=5Finput - temperature value
> > +      temp<x>=5Flabel - sensor id
> > +   POWER9 (in addition to above):
> > +      temp<x>=5Ftype - FRU type
> > +
> > +power:
> > +   POWER8:
> > +      power<x>=5Finput - power value
> > +      power<x>=5Flabel - sensor id
> > +      power<x>=5Faverage - accumulator
> > +      power<x>=5Faverage=5Finterval - update tag (number of samples in
> > +         accumulator)
> > +   POWER9:
> > +      power<x>=5Finput - power value
> > +      power<x>=5Flabel - sensor id
> > +      power<x>=5Faverage=5Fmin - accumulator[0]
> > +      power<x>=5Faverage=5Fmax - accumulator[1] (64 bits total)
> > +      power<x>=5Faverage=5Finterval - update tag
> > +      power<x>=5Freset=5Fhistory - (function=5Fid | (apss=5Fchannel <<=
 8)
> > +
> > +caps:
> > +   POWER8:
> > +      power<x>=5Fcap - current powercap
> > +      power<x>=5Fcap=5Fmax - max powercap
> > +      power<x>=5Fcap=5Fmin - min powercap
> > +      power<x>=5Fmax - normal powercap
> > +      power<x>=5Falarm - user powercap, r/w
> > +   POWER9:
> > +      power<x>=5Fcap=5Falarm - user powercap source
> > +
> > +The driver also provides two sysfs entries through hwmon to better
> > +control the driver and monitor the master OCC. Though there may be
multiple
> > +OCCs present on the system, these two files are only present for
> the "master"
> > +OCC.
> > +   name - read the name of the driver
> > +   update=5Finterval - read or write the minimum interval for polling
the
> > +      OCC.
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
> > index 0000000..ea2aa04
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fsysfs.c
> > @@ -0,0 +1,259 @@
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
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/init.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include "occ.h"
> > +#include "occ=5Fsysfs.h"
> > +
> > +#define RESP=5FRETURN=5FCMD=5FINVAL   0x13
> > +#define OCC=5FHWMON=5FNAME=5FLENGTH   32
> > +
> > +struct occ=5Fsysfs {
> > +   struct device *dev;
> > +   struct occ *occ;
> > +
> > +   char hwmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];
> > +   const u32 *sensor=5Fhwmon=5Fconfigs;
> > +   struct hwmon=5Fchannel=5Finfo **occ=5Fsensors;
> > +   struct hwmon=5Fchip=5Finfo occ=5Finfo;
> > +   u16 user=5Fpowercap;
> > +};
> > +
> > +static int occ=5Fhwmon=5Fread(struct device *dev, enum hwmon=5Fsensor=
=5Ftypes
type,
> > +           u32 attr, int channel, long *val)
> > +{
> > +   int rc;
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +   struct occ *occ =3D driver->occ;
> > +
> > +   switch (type) {
> > +   case hwmon=5Fin:
> > +      rc =3D occ=5Fget=5Fsensor=5Ffield(occ, FREQ, channel, attr, val);
> > +      break;
> > +   case hwmon=5Ftemp:
> > +      rc =3D occ=5Fget=5Fsensor=5Ffield(occ, TEMP, channel, attr, val);
> > +      break;
> > +   case hwmon=5Fpower:
> > +      rc =3D occ=5Fget=5Fsensor=5Ffield(occ, POWER, channel, attr, val=
);
> > +      break;
> > +   default:
> > +      rc =3D -EOPNOTSUPP;
> > +   }
> > +
> > +   return rc;
> > +}
> > +
> > +static int occ=5Fhwmon=5Fread=5Fstring(struct device *dev,
> > +             enum hwmon=5Fsensor=5Ftypes type, u32 attr,
> > +             int channel, char **str)
> > +{
> > +   int rc;
> > +   unsigned long val =3D 0;
> > +
> > +   if (!((type =3D=3D hwmon=5Fin && attr =3D=3D hwmon=5Fin=5Flabel) ||
> > +       (type =3D=3D hwmon=5Ftemp && attr =3D=3D hwmon=5Ftemp=5Flabel) =
||
> > +       (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5Fpower=5Flabel=
)))
> > +      return -EOPNOTSUPP;
> > +
> > +   /* will fetch the "label", the sensor=5Fid */
> > +   rc =3D occ=5Fhwmon=5Fread(dev, type, attr, channel, &val);
> > +   if (rc < 0)
> > +      return rc;
> > +
> > +   rc =3D snprintf(*str, PAGE=5FSIZE - 1, "%lu", val);
> > +   if (rc > 0)
> > +      rc =3D 0;
> > +
> > +   return rc;
> > +}
> > +
> > +static int occ=5Fhwmon=5Fwrite(struct device *dev, enum
> hwmon=5Fsensor=5Ftypes type,
> > +            u32 attr, int channel, long val)
> > +{
> > +   int rc =3D 0;
>
> Unnecessary initialization.
>
> > +   struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > +
> > +   if (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5Fpower=5Falarm)=
 {
> > +      rc =3D occ=5Fset=5Fuser=5Fpowercap(driver->occ, val);
> > +      if (rc) {
> > +         if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVAL) {
>
> Is the mix of private and public error codes necessary ? Any chance
> the called code can just return -EINVAL ?
>
> > +            dev=5Ferr(dev,
> > +               "set invalid powercap value: %ld\n",
> > +               val);
> > +            return -EINVAL;
> > +         }
> > +
> > +         dev=5Ferr(dev, "set user powercap failed: 0x:%x\n", rc);
> > +         return rc;
> > +      }
> > +
> > +      driver->user=5Fpowercap =3D val;
> > +
> > +      return rc;
> > +   }
> > +
> > +   return -EOPNOTSUPP;
> > +}
> > +
> > +static umode=5Ft occ=5Fis=5Fvisible(const void *data, enum
> hwmon=5Fsensor=5Ftypes type,
> > +               u32 attr, int channel)
> > +{
> > +   const struct occ=5Fsysfs *driver =3D data;
> > +
> > +   switch (type) {
> > +   case hwmon=5Fchip:
> > +      if (attr =3D=3D hwmon=5Fchip=5Fupdate=5Finterval)
> > +         return S=5FIRUGO | S=5FIWUSR;
>
> It might be better to just use octals directly to avoid the
annoyingcheckpatch
> warnings.
>
> > +      break;
> > +   case hwmon=5Fin:
> > +      if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[0])
> > +         return S=5FIRUGO;
> > +      break;
> > +   case hwmon=5Ftemp:
> > +      if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[1])
> > +         return S=5FIRUGO;
> > +      break;
> > +   case hwmon=5Fpower:
> > +      /* user power limit */
> > +      if (attr =3D=3D hwmon=5Fpower=5Falarm)
> > +         return S=5FIRUGO | S=5FIWUSR;
> > +      else if ((BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[2]) ||
> > +          (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[3]))
> > +         return S=5FIRUGO;
> > +      break;
> > +   default:
> > +      return 0;
> > +   }
> > +
> > +   return 0;
> > +}
> > +
> > +static const struct hwmon=5Fops occ=5Fhwmon=5Fops =3D {
> > +   .is=5Fvisible =3D occ=5Fis=5Fvisible,
> > +   .read =3D occ=5Fhwmon=5Fread,
> > +   .read=5Fstring =3D occ=5Fhwmon=5Fread=5Fstring,
> > +   .write =3D occ=5Fhwmon=5Fwrite,
> > +};
> > +
> > +static const enum hwmon=5Fsensor=5Ftypes occ=5Fsensor=5Ftypes
> [MAX=5FOCC=5FSENSOR=5FTYPE] =3D {
> > +   hwmon=5Fin,
> > +   hwmon=5Ftemp,
> > +   hwmon=5Fpower,
> > +   hwmon=5Fpower
>
> So you have two sets of power sensors, meaning you'll end up with two
sets
> of hwmon=5Fchannel=5Finfo describing hwmon=5Fpower ? This kind of misuses=
 the
API.
> I hope that doesn't create duplicate attributes; I think it might if
> the actually supported attributes overlap. Also, this means that
theattribute
> index association gets lost. For example, if the alarm attributes
> are in the second group, power1=5Falarm would not necessarily align with,
> say, power1=5Fmax.
>
> Is there any chance to avoid this ?

They will overlap if we use the attributes incorrectly. Those are defined
in
occ=5Fp8.c or occ=5Fp9.c, as they specific to the OCC version. But the curr=
ent
definitions I have cannot overlap.

The problem is both the "caps" sensor and the "power" sensor coming off the
OCC
are relevant to the power hwmon type, so I didn't want to use another type.
The
problem is that for each OCC, there may be any number of power sensors, but
only
one caps sensor. So I can't combine the two, as I believe that would create
all
the hwmon power attributes specified (for both "caps" and "power" sensors)
for
each power sensor. However, this does mean the indexing is not an issue, as
the
caps sensor doesn't need to correspond to the power sensors at all.

This current set up works pretty well for us, though I agree it is a little
confusing. Not sure of any more ideal way to do it. Our sensors just don't
line up
well with the currently defined hwmon types.

Thanks for the feedback,
Eddie

>
> > +};
> > +
> > +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ=
 *occ,
> > +              const u32 *sensor=5Fhwmon=5Fconfigs,
> > +              const char *name)
> > +{
> > +   int rc, i, j, num=5Fsensors, index =3D 0, id;
> > +   char *brk;
> > +   struct occ=5Fblocks *resp =3D NULL;
> > +   u32 *sensor=5Fconfig;
> > +   struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(struct
occ=5Fsysfs),
> > +                      GFP=5FKERNEL);
> > +   if (!hwmon)
> > +      return ERR=5FPTR(-ENOMEM);
> > +
> > +   /* need space for null-termination */
> > +   hwmon->occ=5Fsensors =3D
> > +      devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo *) *
> > +              (MAX=5FOCC=5FSENSOR=5FTYPE + 1), GFP=5FKERNEL);
> > +   if (!hwmon->occ=5Fsensors)
> > +      return ERR=5FPTR(-ENOMEM);
> > +
> > +   hwmon->occ =3D occ;
> > +   hwmon->sensor=5Fhwmon=5Fconfigs =3D sensor=5Fhwmon=5Fconfigs;
> > +   hwmon->occ=5Finfo.ops =3D &occ=5Fhwmon=5Fops;
> > +   hwmon->occ=5Finfo.info =3D
> > +      (const struct hwmon=5Fchannel=5Finfo **)hwmon->occ=5Fsensors;
> > +
> > +   occ=5Fget=5Fresponse=5Fblocks(occ, &resp);
> > +
> > +   for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
> > +      resp->sensor=5Fblock=5Fid[i] =3D -1;
> > +
> > +   /* read sensor data from occ */
> > +   rc =3D occ=5Fupdate=5Fdevice(occ);
> > +   if (rc)
> > +      return ERR=5FPTR(rc);
> > +
> > +   for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; i++) {
> > +      id =3D resp->sensor=5Fblock=5Fid[i];
> > +      if (id < 0)
> > +         continue;
> > +
> > +      num=5Fsensors =3D resp->blocks[id].header.num=5Fsensors;
> > +      /* need null-termination */
> > +      sensor=5Fconfig =3D devm=5Fkzalloc(dev,
> > +                    sizeof(u32) * (num=5Fsensors + 1),
> > +                    GFP=5FKERNEL);
> > +      if (!sensor=5Fconfig)
> > +         return ERR=5FPTR(-ENOMEM);
> > +
> > +      for (j =3D 0; j < num=5Fsensors; j++)
> > +         sensor=5Fconfig[j] =3D sensor=5Fhwmon=5Fconfigs[i];
> > +
> > +      hwmon->occ=5Fsensors[index] =3D
> > +         devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo),
> > +                 GFP=5FKERNEL);
> > +      if (!hwmon->occ=5Fsensors[index])
> > +         return ERR=5FPTR(-ENOMEM);
> > +
> > +      hwmon->occ=5Fsensors[index]->type =3D occ=5Fsensor=5Ftypes[i];
> > +      hwmon->occ=5Fsensors[index]->config =3D sensor=5Fconfig;
> > +      index++;
> > +   }
> > +
> > +   /* search for bad chars */
> > +   strncpy(hwmon->hwmon=5Fname, name, OCC=5FHWMON=5FNAME=5FLENGTH);
> > +   brk =3D strpbrk(hwmon->hwmon=5Fname, "-* \t\n");
> > +   while (brk) {
> > +      *brk =3D '=5F';
> > +      brk =3D strpbrk(brk,  "-* \t\n");
> > +   }
> > +
> > +   hwmon->dev =3D devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finfo(dev,
> > +                       hwmon->hwmon=5Fname,
> > +                       hwmon,
> > +                       &hwmon->occ=5Finfo,
> > +                       NULL);
> > +   if (IS=5FERR(hwmon->dev)) {
> > +      dev=5Ferr(dev, "cannot register hwmon device %s: %ld\n",
> > +         hwmon->hwmon=5Fname, PTR=5FERR(hwmon->dev));
> > +      return ERR=5FCAST(hwmon->dev);
> > +   }
> > +
> > +   return hwmon;
> > +}
> > +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstart);
> > +
> > +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE=5FDESCRIPTION("OCC sysfs driver");
> > +MODULE=5FLICENSE("GPL");
> > diff --git a/drivers/hwmon/occ/occ=5Fsysfs.h
b/drivers/hwmon/occ/occ=5Fsysfs.h
> > new file mode 100644
> > index 0000000..462f9d2
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fsysfs.h
> > @@ -0,0 +1,30 @@
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
> > +struct occ;
> > +struct device;
> > +struct occ=5Fsysfs;
> > +
> > +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ=
 *occ,
> > +              const u32 *sensor=5Fhwmon=5Fconfigs,
> > +              const char *name);
> > +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */
> >
>

--0__=8FBB0A2BDFFF23608f9e8a93df938690918c8FBB0A2BDFFF2360
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/29/=
2017 01:50:55 PM:<br>&gt; On 01/26/2017 03:19 PM, eajames.ibm@gmail.com wro=
te:<br>&gt; &gt; From: &quot;Edward A. James&quot; &lt;eajames@us.ibm.com&g=
t;<br>&gt; &gt;<br>&gt; &gt; Add a generic mechanism to expose the sensors =
provided by the OCC in<br>&gt; &gt; sysfs.<br>&gt; &gt;<br>&gt; &gt; Signed=
-off-by: Edward A. James &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; Signed-off=
-by: Andrew Jeffery &lt;andrew@aj.id.au&gt;<br>&gt; &gt; ---<br>&gt; &gt; &=
nbsp;Documentation/hwmon/occ &nbsp; &nbsp; &nbsp; | &nbsp;62 ++++++++++<br>=
&gt; &gt; &nbsp;drivers/hwmon/occ/Makefile &nbsp; &nbsp;| &nbsp; 2 +-<br>&g=
t; &gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.c | 259 +++++++++++++++++++++++=
++++++<br>&gt; +++++++++++++<br>&gt; &gt; &nbsp;drivers/hwmon/occ/occ=5Fsys=
fs.h | &nbsp;30 +++++<br>&gt; &gt; &nbsp;4 files changed, 352 insertions(+)=
, 1 deletion(-)<br>&gt; &gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=
=5Fsysfs.c<br>&gt; &gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsy=
sfs.h<br>&gt; &gt;<br>&gt; &gt; diff --git a/Documentation/hwmon/occ b/Docu=
mentation/hwmon/occ<br>&gt; &gt; index 79d1642..d0bdf06 100644<br>&gt; &gt;=
 --- a/Documentation/hwmon/occ<br>&gt; &gt; +++ b/Documentation/hwmon/occ<b=
r>&gt; &gt; @@ -25,6 +25,68 @@ Currently, all versions of the OCC support f=
our<br>&gt; types of sensor data: power,<br>&gt; &gt; &nbsp;temperature, fr=
equency, and &quot;caps,&quot; which indicate limits and <br>&gt; threshold=
s used<br>&gt; &gt; &nbsp;internally on the OCC.<br>&gt; &gt;<br>&gt; &gt; =
+sysfs Entries<br>&gt; &gt; +-------------<br>&gt; &gt; +<br>&gt; &gt; +The=
 OCC driver uses the hwmon sysfs framework to provide data to userspace.<br=
>&gt; &gt; +<br>&gt; &gt; +The driver exports a number of sysfs files for e=
ach type of sensor. The<br>&gt; &gt; +sensor-specific files vary depending =
on the processor type, <br>&gt; though many of the<br>&gt; &gt; +attributes=
 are common for both the POWER8 and POWER9.<br>&gt; &gt; +<br>&gt; &gt; +Th=
e hwmon interface cannot define every type of sensor that may be used.<br>&=
gt; &gt; +Therefore, the frequency sensor on the OCC uses the &quot;input&q=
uot; type <br>&gt; sensor defined<br>&gt; &gt; +by the hwmon interface, rat=
her than defining a new type of custom sensor.<br>&gt; &gt; +<br>&gt; &gt; =
+Below are detailed the names and meaning of each sensor file for <br>&gt; =
both types of<br>&gt; &gt; +processors. All sensors are read-only unless ot=
herwise specified.<br>&gt; &lt;x&gt; indicates<br>&gt; &gt; +the hwmon inde=
x. sensor id indicates the unique internal OCC <br>&gt; identifer. Please<b=
r>&gt; &gt; +see the POWER OCC specification for details on all these senso=
r values.<br>&gt; &gt; +<br>&gt; &gt; +frequency:<br>&gt; &gt; + &nbsp; all=
 processors:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;in&lt;x&gt;=5Finput - frequ=
ency value<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;in&lt;x&gt;=5Flabel - sensor =
id<br>&gt; &gt; +temperature:<br>&gt; &gt; + &nbsp; POWER8:<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp;temp&lt;x&gt;=5Finput - temperature value<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp;temp&lt;x&gt;=5Flabel - sensor id<br>&gt; &gt; + &nbs=
p; POWER9 (in addition to above):<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;temp&l=
t;x&gt;=5Ftype - FRU type<br>&gt; &gt; +<br>&gt; &gt; +power:<br>&gt; &gt; =
+ &nbsp; POWER8:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Finput =
- power value<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Flabel - s=
ensor id<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Faverage - accu=
mulator<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Faverage=5Finter=
val - update tag (number of samples in<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; accumulator)<br>&gt; &gt; + &nbsp; POWER9:<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp;power&lt;x&gt;=5Finput - power value<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp;power&lt;x&gt;=5Flabel - sensor id<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p;power&lt;x&gt;=5Faverage=5Fmin - accumulator[0]<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp;power&lt;x&gt;=5Faverage=5Fmax - accumulator[1] (64 bits total)<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Faverage=5Finterval - upd=
ate tag<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Freset=5Fhistory=
 - (function=5Fid | (apss=5Fchannel &lt;&lt; 8)<br>&gt; &gt; +<br>&gt; &gt;=
 +caps:<br>&gt; &gt; + &nbsp; POWER8:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;po=
wer&lt;x&gt;=5Fcap - current powercap<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;po=
wer&lt;x&gt;=5Fcap=5Fmax - max powercap<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
power&lt;x&gt;=5Fcap=5Fmin - min powercap<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p;power&lt;x&gt;=5Fmax - normal powercap<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
;power&lt;x&gt;=5Falarm - user powercap, r/w<br>&gt; &gt; + &nbsp; POWER9:<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;power&lt;x&gt;=5Fcap=5Falarm - user powe=
rcap source<br>&gt; &gt; +<br>&gt; &gt; +The driver also provides two sysfs=
 entries through hwmon to better<br>&gt; &gt; +control the driver and monit=
or the master OCC. Though there may be multiple<br>&gt; &gt; +OCCs present =
on the system, these two files are only present for <br>&gt; the &quot;mast=
er&quot;<br>&gt; &gt; +OCC.<br>&gt; &gt; + &nbsp; name - read the name of t=
he driver<br>&gt; &gt; + &nbsp; update=5Finterval - read or write the minim=
um interval for polling the<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;OCC.<br>&gt;=
 &gt; +<br>&gt; &gt; &nbsp;BMC - Host Communications<br>&gt; &gt; &nbsp;---=
----------------------<br>&gt; &gt;<br>&gt; &gt; diff --git a/drivers/hwmon=
/occ/Makefile b/drivers/hwmon/occ/Makefile<br>&gt; &gt; index 93cb52f..a688=
1f9 100644<br>&gt; &gt; --- a/drivers/hwmon/occ/Makefile<br>&gt; &gt; +++ b=
/drivers/hwmon/occ/Makefile<br>&gt; &gt; @@ -1 +1 @@<br>&gt; &gt; -obj-$(CO=
NFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o<br>&gt; &gt; +obj-$(CONFIG=5FSENSORS=
=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o<br>&gt; &gt; diff --git a/drivers/hw=
mon/occ/occ=5Fsysfs.c b/drivers/hwmon/occ/occ=5Fsysfs.c<br>&gt; &gt; new fi=
le mode 100644<br>&gt; &gt; index 0000000..ea2aa04<br>&gt; &gt; --- /dev/nu=
ll<br>&gt; &gt; +++ b/drivers/hwmon/occ/occ=5Fsysfs.c<br>&gt; &gt; @@ -0,0 =
+1,259 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * occ=5Fsysfs.c - OCC sysfs inter=
face<br>&gt; &gt; + *<br>&gt; &gt; + * This file contains the methods and d=
ata structures for <br>&gt; implementing the OCC<br>&gt; &gt; + * hwmon sys=
fs entries.<br>&gt; &gt; + *<br>&gt; &gt; + * Copyright 2016 IBM Corp.<br>&=
gt; &gt; + *<br>&gt; &gt; + * This program is free software; you can redist=
ribute it and/or modify<br>&gt; &gt; + * it under the terms of the GNU Gene=
ral Public License as published by<br>&gt; &gt; + * the Free Software Found=
ation; either version 2 of the License, or<br>&gt; &gt; + * (at your option=
) any later version.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is dist=
ributed in the hope that it will be useful,<br>&gt; &gt; + * but WITHOUT AN=
Y WARRANTY; without even the implied warranty of<br>&gt; &gt; + * MERCHANTA=
BILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<br>&gt; &gt; + * GNU Ge=
neral Public License for more details.<br>&gt; &gt; + */<br>&gt; &gt; +<br>=
&gt; &gt; +#include &lt;linux/delay.h&gt;<br>&gt; &gt; +#include &lt;linux/=
device.h&gt;<br>&gt; &gt; +#include &lt;linux/err.h&gt;<br>&gt; &gt; +#incl=
ude &lt;linux/hwmon.h&gt;<br>&gt; &gt; +#include &lt;linux/hwmon-sysfs.h&gt=
;<br>&gt; &gt; +#include &lt;linux/init.h&gt;<br>&gt; &gt; +#include &lt;li=
nux/jiffies.h&gt;<br>&gt; &gt; +#include &lt;linux/kernel.h&gt;<br>&gt; &gt=
; +#include &lt;linux/module.h&gt;<br>&gt; &gt; +#include &lt;linux/mutex.h=
&gt;<br>&gt; &gt; +#include &lt;linux/slab.h&gt;<br>&gt; &gt; +#include &qu=
ot;occ.h&quot;<br>&gt; &gt; +#include &quot;occ=5Fsysfs.h&quot;<br>&gt; &gt=
; +<br>&gt; &gt; +#define RESP=5FRETURN=5FCMD=5FINVAL &nbsp; 0x13<br>&gt; &=
gt; +#define OCC=5FHWMON=5FNAME=5FLENGTH &nbsp; 32<br>&gt; &gt; +<br>&gt; &=
gt; +struct occ=5Fsysfs {<br>&gt; &gt; + &nbsp; struct device *dev;<br>&gt;=
 &gt; + &nbsp; struct occ *occ;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; char h=
wmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];<br>&gt; &gt; + &nbsp; const u=
32 *sensor=5Fhwmon=5Fconfigs;<br>&gt; &gt; + &nbsp; struct hwmon=5Fchannel=
=5Finfo **occ=5Fsensors;<br>&gt; &gt; + &nbsp; struct hwmon=5Fchip=5Finfo o=
cc=5Finfo;<br>&gt; &gt; + &nbsp; u16 user=5Fpowercap;<br>&gt; &gt; +};<br>&=
gt; &gt; +<br>&gt; &gt; +static int occ=5Fhwmon=5Fread(struct device *dev, =
enum hwmon=5Fsensor=5Ftypes type,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; u32 attr, int channel, long *val)<br>&gt; &gt; +{<br>&gt; &gt; + &=
nbsp; int rc;<br>&gt; &gt; + &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fge=
t=5Fdrvdata(dev);<br>&gt; &gt; + &nbsp; struct occ *occ =3D driver-&gt;occ;=
<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; switch (type) {<br>&gt; &gt; + &nbsp;=
 case hwmon=5Fin:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D occ=5Fget=5Fsen=
sor=5Ffield(occ, FREQ, channel, attr, val);<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp;break;<br>&gt; &gt; + &nbsp; case hwmon=5Ftemp:<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp;rc =3D occ=5Fget=5Fsensor=5Ffield(occ, TEMP, channel, attr, val=
);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; case hwm=
on=5Fpower:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D occ=5Fget=5Fsensor=5F=
field(occ, POWER, channel, attr, val);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;b=
reak;<br>&gt; &gt; + &nbsp; default:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =
=3D -EOPNOTSUPP;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; return rc;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static int occ=
=5Fhwmon=5Fread=5Fstring(struct device *dev,<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; enum hwmon=5Fsensor=5Ftypes type, u32 attr,<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int channel, char **st=
r)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int rc;<br>&gt; &gt; + &nbsp; unsi=
gned long val =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; if (!((type =3D=
=3D hwmon=5Fin &amp;&amp; attr =3D=3D hwmon=5Fin=5Flabel) ||<br>&gt; &gt; +=
 &nbsp; &nbsp; &nbsp; (type =3D=3D hwmon=5Ftemp &amp;&amp; attr =3D=3D hwmo=
n=5Ftemp=5Flabel) ||<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; (type =3D=3D hwmon=
=5Fpower &amp;&amp; attr =3D=3D hwmon=5Fpower=5Flabel)))<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp;return -EOPNOTSUPP;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; /=
* will fetch the &quot;label&quot;, the sensor=5Fid */<br>&gt; &gt; + &nbsp=
; rc =3D occ=5Fhwmon=5Fread(dev, type, attr, channel, &amp;val);<br>&gt; &g=
t; + &nbsp; if (rc &lt; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br=
>&gt; &gt; +<br>&gt; &gt; + &nbsp; rc =3D snprintf(*str, PAGE=5FSIZE - 1, &=
quot;%lu&quot;, val);<br>&gt; &gt; + &nbsp; if (rc &gt; 0)<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp;rc =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return rc=
;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static int occ=5Fhwmon=5Fwri=
te(struct device *dev, enum <br>&gt; hwmon=5Fsensor=5Ftypes type,<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 attr, int channel, long =
val)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int rc =3D 0;<br>&gt; <br>&gt; U=
nnecessary initialization.<br>&gt; <br>&gt; &gt; + &nbsp; struct occ=5Fsysf=
s *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; if (type =3D=3D hwmon=5Fpower &amp;&amp; attr =3D=3D hwmon=5Fpower=5Falar=
m) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D occ=5Fset=5Fuser=5Fpowercap(=
driver-&gt;occ, val);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (rc) {<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVA=
L) {<br>&gt; <br>&gt; Is the mix of private and public error codes necessar=
y ? Any chance<br>&gt; the called code can just return -EINVAL ?<br>&gt; <b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;set invali=
d powercap value: %ld\n&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; val);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return -EINVAL;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt;=
 &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;set=
 user powercap failed: 0x:%x\n&quot;, rc);<br>&gt; &gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; return rc;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp;driver-&gt;user=5Fpowercap =3D val;<br>&g=
t; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; + &nbs=
p; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return -EOPNOTSUPP;<br>&gt; &gt; =
+}<br>&gt; &gt; +<br>&gt; &gt; +static umode=5Ft occ=5Fis=5Fvisible(const v=
oid *data, enum <br>&gt; hwmon=5Fsensor=5Ftypes type,<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 attr, int channel)<br>&gt; &=
gt; +{<br>&gt; &gt; + &nbsp; const struct occ=5Fsysfs *driver =3D data;<br>=
&gt; &gt; +<br>&gt; &gt; + &nbsp; switch (type) {<br>&gt; &gt; + &nbsp; cas=
e hwmon=5Fchip:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (attr =3D=3D hwmon=5F=
chip=5Fupdate=5Finterval)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return=
 S=5FIRUGO | S=5FIWUSR;<br>&gt; <br>&gt; It might be better to just use oct=
als directly to avoid the annoyingcheckpatch<br>&gt; warnings.<br>&gt; <br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; case hwmon=5Fi=
n:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (BIT(attr) &amp; driver-&gt;sensor=
=5Fhwmon=5Fconfigs[0])<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return S=
=5FIRUGO;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; c=
ase hwmon=5Ftemp:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (BIT(attr) &amp; dr=
iver-&gt;sensor=5Fhwmon=5Fconfigs[1])<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; return S=5FIRUGO;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &=
gt; + &nbsp; case hwmon=5Fpower:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;/* user=
 power limit */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (attr =3D=3D hwmon=5F=
power=5Falarm)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return S=5FIRUGO =
| S=5FIWUSR;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;else if ((BIT(attr) &amp; d=
river-&gt;sensor=5Fhwmon=5Fconfigs[2]) ||<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;(BIT(attr) &amp; driver-&gt;sensor=5Fhwmon=5Fconfigs[3]))<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return S=5FIRUGO;<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; default:<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp;return 0;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; =
&gt; + &nbsp; return 0;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static=
 const struct hwmon=5Fops occ=5Fhwmon=5Fops =3D {<br>&gt; &gt; + &nbsp; .is=
=5Fvisible =3D occ=5Fis=5Fvisible,<br>&gt; &gt; + &nbsp; .read =3D occ=5Fhw=
mon=5Fread,<br>&gt; &gt; + &nbsp; .read=5Fstring =3D occ=5Fhwmon=5Fread=5Fs=
tring,<br>&gt; &gt; + &nbsp; .write =3D occ=5Fhwmon=5Fwrite,<br>&gt; &gt; +=
};<br>&gt; &gt; +<br>&gt; &gt; +static const enum hwmon=5Fsensor=5Ftypes oc=
c=5Fsensor=5Ftypes<br>&gt; [MAX=5FOCC=5FSENSOR=5FTYPE] =3D {<br>&gt; &gt; +=
 &nbsp; hwmon=5Fin,<br>&gt; &gt; + &nbsp; hwmon=5Ftemp,<br>&gt; &gt; + &nbs=
p; hwmon=5Fpower,<br>&gt; &gt; + &nbsp; hwmon=5Fpower<br>&gt; <br>&gt; So y=
ou have two sets of power sensors, meaning you'll end up with two sets<br>&=
gt; of hwmon=5Fchannel=5Finfo describing hwmon=5Fpower ? This kind of misus=
es the API.<br>&gt; I hope that doesn't create duplicate attributes; I thin=
k it might if<br>&gt; the actually supported attributes overlap. Also, this=
 means that theattribute<br>&gt; index association gets lost. For example, =
if the alarm attributes<br>&gt; are in the second group, power1=5Falarm wou=
ld not necessarily align with,<br>&gt; say, power1=5Fmax.<br>&gt; <br>&gt; =
Is there any chance to avoid this ?</tt><br><br><tt>They will overlap if we=
 use the attributes incorrectly. </tt><tt>Those are defined in</tt><br><tt>=
occ=5Fp8.c or occ=5Fp9.c, as they specific to the OCC version. But the curr=
ent</tt><br><tt>definitions I have cannot overlap.</tt><br><br><tt>The prob=
lem is both the &quot;caps&quot; sensor and the &quot;power&quot; sensor co=
ming off the OCC</tt><br><tt>are relevant to the power hwmon type, so I did=
n't want to use another type. The</tt><br><tt>problem is that for each OCC,=
 there may be any number of power sensors, but only</tt><br><tt>one caps se=
nsor. So I can't combine the two, as I believe that would create all</tt><b=
r><tt>the hwmon power attributes specified (for both &quot;caps&quot; and &=
quot;power&quot; sensors) for</tt><br><tt>each power sensor. However, this =
does mean the indexing is not an issue, as the</tt><br><tt>caps sensor does=
n't need to correspond to the power sensors at all.</tt><br><br><tt>This cu=
rrent set up works pretty well for us, though I agree it is a little</tt><b=
r><tt>confusing. Not sure of any more ideal way to do it. Our sensors just =
don't line up</tt><br><tt>well with the currently defined hwmon types.</tt>=
<br><br><tt>Thanks for the feedback,</tt><br><tt>Eddie</tt><br><tt><br>&gt;=
 <br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +struct occ=5Fsysfs *occ=5Fs=
ysfs=5Fstart(struct device *dev, struct occ *occ,<br>&gt; &gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const u32 *sensor=5Fhwmon=5Fconfigs,<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *=
name)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int rc, i, j, num=5Fsensors, in=
dex =3D 0, id;<br>&gt; &gt; + &nbsp; char *brk;<br>&gt; &gt; + &nbsp; struc=
t occ=5Fblocks *resp =3D NULL;<br>&gt; &gt; + &nbsp; u32 *sensor=5Fconfig;<=
br>&gt; &gt; + &nbsp; struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, siz=
eof(struct occ=5Fsysfs),<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; + &nbs=
p; if (!hwmon)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return ERR=5FPTR(-ENOMEM)=
;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; /* need space for null-termination *=
/<br>&gt; &gt; + &nbsp; hwmon-&gt;occ=5Fsensors =3D<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp;devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo *) *<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(MAX=5FOCC=5F=
SENSOR=5FTYPE + 1), GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; if (!hwmon-&gt;occ=
=5Fsensors)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return ERR=5FPTR(-ENOMEM);<b=
r>&gt; &gt; +<br>&gt; &gt; + &nbsp; hwmon-&gt;occ =3D occ;<br>&gt; &gt; + &=
nbsp; hwmon-&gt;sensor=5Fhwmon=5Fconfigs =3D sensor=5Fhwmon=5Fconfigs;<br>&=
gt; &gt; + &nbsp; hwmon-&gt;occ=5Finfo.ops =3D &amp;occ=5Fhwmon=5Fops;<br>&=
gt; &gt; + &nbsp; hwmon-&gt;occ=5Finfo.info =3D<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp;(const struct hwmon=5Fchannel=5Finfo **)hwmon-&gt;occ=5Fsensors;<br=
>&gt; &gt; +<br>&gt; &gt; + &nbsp; occ=5Fget=5Fresponse=5Fblocks(occ, &amp;=
resp);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=
=5FSENSOR=5FTYPE; ++i)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;resp-&gt;sensor=
=5Fblock=5Fid[i] =3D -1;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; /* read senso=
r data from occ */<br>&gt; &gt; + &nbsp; rc =3D occ=5Fupdate=5Fdevice(occ);=
<br>&gt; &gt; + &nbsp; if (rc)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return ER=
R=5FPTR(rc);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; for (i =3D 0; i &lt; MAX=
=5FOCC=5FSENSOR=5FTYPE; i++) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;id =3D re=
sp-&gt;sensor=5Fblock=5Fid[i];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (id &l=
t; 0)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp;num=5Fsensors =3D resp-&gt;blocks[id].hea=
der.num=5Fsensors;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;/* need null-terminat=
ion */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;sensor=5Fconfig =3D devm=5Fkzallo=
c(dev,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;sizeof(u32) * (num=5Fsensors + 1),<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (!sensor=5Fconfig)<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; +<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp;for (j =3D 0; j &lt; num=5Fsensors; j++)<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fconfig[j] =3D sensor=5Fhwmon=
=5Fconfigs[i];<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;hwmon-&gt;=
occ=5Fsensors[index] =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; devm=5F=
kzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo),<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GFP=5FKERNEL);<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;if (!hwmon-&gt;occ=5Fsensors[index])<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; +<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp;hwmon-&gt;occ=5Fsensors[index]-&gt;type =3D o=
cc=5Fsensor=5Ftypes[i];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;hwmon-&gt;occ=5F=
sensors[index]-&gt;config =3D sensor=5Fconfig;<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp;index++;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; /* search for bad chars */<br>&gt; &gt; + &nbsp; strncpy(hwmon-&gt;hwmon=
=5Fname, name, OCC=5FHWMON=5FNAME=5FLENGTH);<br>&gt; &gt; + &nbsp; brk =3D =
strpbrk(hwmon-&gt;hwmon=5Fname, &quot;-* \t\n&quot;);<br>&gt; &gt; + &nbsp;=
 while (brk) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;*brk =3D '=5F';<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp;brk =3D strpbrk(brk, &nbsp;&quot;-* \t\n&quot;);<=
br>&gt; &gt; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; hwmon-&gt;dev =
=3D devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finfo(dev,<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hw=
mon-&gt;hwmon=5Fname,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmon,<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;hwmon-&=
gt;occ=5Finfo,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; NULL);<br>&gt; &gt; + &nbsp; if (IS=5FERR(h=
wmon-&gt;dev)) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;ca=
nnot register hwmon device %s: %ld\n&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; hwmon-&gt;hwmon=5Fname, PTR=5FERR(hwmon-&gt;dev));<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;return ERR=5FCAST(hwmon-&gt;dev);<br>&gt; &gt; + &nb=
sp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return hwmon;<br>&gt; &gt; +}<br=
>&gt; &gt; +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstart);<br>&gt; &gt; +<br>&gt; &g=
t; +MODULE=5FAUTHOR(&quot;Eddie James &lt;eajames@us.ibm.com&gt;&quot;);<br=
>&gt; &gt; +MODULE=5FDESCRIPTION(&quot;OCC sysfs driver&quot;);<br>&gt; &gt=
; +MODULE=5FLICENSE(&quot;GPL&quot;);<br>&gt; &gt; diff --git a/drivers/hwm=
on/occ/occ=5Fsysfs.h b/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; new fil=
e mode 100644<br>&gt; &gt; index 0000000..462f9d2<br>&gt; &gt; --- /dev/nul=
l<br>&gt; &gt; +++ b/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; @@ -0,0 +=
1,30 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * occ=5Fsysfs.h - OCC sysfs interfa=
ce<br>&gt; &gt; + *<br>&gt; &gt; + * This file contains the data structures=
 and function prototypes<br>&gt; for the OCC<br>&gt; &gt; + * hwmon sysfs e=
ntries.<br>&gt; &gt; + *<br>&gt; &gt; + * Copyright 2016 IBM Corp.<br>&gt; =
&gt; + *<br>&gt; &gt; + * This program is free software; you can redistribu=
te it and/or modify<br>&gt; &gt; + * it under the terms of the GNU General =
Public License as published by<br>&gt; &gt; + * the Free Software Foundatio=
n; either version 2 of the License, or<br>&gt; &gt; + * (at your option) an=
y later version.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is distribu=
ted in the hope that it will be useful,<br>&gt; &gt; + * but WITHOUT ANY WA=
RRANTY; without even the implied warranty of<br>&gt; &gt; + * MERCHANTABILI=
TY or FITNESS FOR A PARTICULAR PURPOSE. See the<br>&gt; &gt; + * GNU Genera=
l Public License for more details.<br>&gt; &gt; + */<br>&gt; &gt; +<br>&gt;=
 &gt; +#ifndef =5F=5FOCC=5FSYSFS=5FH=5F=5F<br>&gt; &gt; +#define =5F=5FOCC=
=5FSYSFS=5FH=5F=5F<br>&gt; &gt; +<br>&gt; &gt; +struct occ;<br>&gt; &gt; +s=
truct device;<br>&gt; &gt; +struct occ=5Fsysfs;<br>&gt; &gt; +<br>&gt; &gt;=
 +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ *o=
cc,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const u3=
2 *sensor=5Fhwmon=5Fconfigs,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;const char *name);<br>&gt; &gt; +#endif /* =5F=5FOCC=5FSYS=
FS=5FH=5F=5F */<br>&gt; &gt;<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A2BDFFF23608f9e8a93df938690918c8FBB0A2BDFFF2360--
