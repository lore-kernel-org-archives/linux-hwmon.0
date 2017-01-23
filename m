Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <40f255c4-b490-5548-3c1e-1be15f3a2a5d@roeck-us.net>
Subject: Re: [PATCH linux v3 2/6] hwmon: occ: Add sysfs interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 16:01:25 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-3-git-send-email-eajames.ibm@gmail.com>
 <40f255c4-b490-5548-3c1e-1be15f3a2a5d@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DFEB2CF18f9e8a93df938690918c8FBB0A22DFEB2CF1"
Content-Disposition: inline
Message-Id: <OFE34EEAB4.7855326B-ON002580B1.0078AA61-862580B1.0078FABB@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DFEB2CF18f9e8a93df938690918c8FBB0A22DFEB2CF1
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



On Sat, Jan 21, 2017 at 12:08 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add a generic mechanism to expose the sensors provided by the OCC in
>> sysfs.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  Documentation/hwmon/occ       |  62 ++++++++++
>>  drivers/hwmon/occ/Makefile    |   2 +-
>>  drivers/hwmon/occ/occ=5Fsysfs.c | 271
>> ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/hwmon/occ/occ=5Fsysfs.h |  44 +++++++
>>  4 files changed, 378 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c
>>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h
>>
>> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
>> index 79d1642..d0bdf06 100644
>> --- a/Documentation/hwmon/occ
>> +++ b/Documentation/hwmon/occ
>> @@ -25,6 +25,68 @@ Currently, all versions of the OCC support four types
>> of sensor data: power,
>>  temperature, frequency, and "caps," which indicate limits and
thresholds
>> used
>>  internally on the OCC.
>>
>> +sysfs Entries
>> +-------------
>> +
>> +The OCC driver uses the hwmon sysfs framework to provide data to
>> userspace.
>> +
>> +The driver exports a number of sysfs files for each type of sensor. The
>> +sensor-specific files vary depending on the processor type, though many
>> of the
>> +attributes are common for both the POWER8 and POWER9.
>> +
>> +The hwmon interface cannot define every type of sensor that may be
used.
>> +Therefore, the frequency sensor on the OCC uses the "input" type sensor
>> defined
>> +by the hwmon interface, rather than defining a new type of custom
sensor.
>> +
>> +Below are detailed the names and meaning of each sensor file for both
>> types of
>> +processors. All sensors are read-only unless otherwise specified. <x>
>> indicates
>> +the hwmon index. sensor id indicates the unique internal OCC identifer.
>> Please
>> +see the POWER OCC specification for details on all these sensor values.
>> +
>> +frequency:
>> +       all processors:
>> +               in<x>=5Finput - frequency value
>> +               in<x>=5Flabel - sensor id
>> +temperature:
>> +       POWER8:
>> +               temp<x>=5Finput - temperature value
>> +               temp<x>=5Flabel - sensor id
>> +       POWER9 (in addition to above):
>> +               temp<x>=5Ftype - FRU type
>> +
>> +power:
>> +       POWER8:
>> +               power<x>=5Finput - power value
>> +               power<x>=5Flabel - sensor id
>> +               power<x>=5Faverage - accumulator
>> +               power<x>=5Faverage=5Finterval - update tag (number of
samples
>> in
>> +                       accumulator)
>> +       POWER9:
>> +               power<x>=5Finput - power value
>> +               power<x>=5Flabel - sensor id
>> +               power<x>=5Faverage=5Fmin - accumulator[0]
>> +               power<x>=5Faverage=5Fmax - accumulator[1] (64 bits total)
>> +               power<x>=5Faverage=5Finterval - update tag
>> +               power<x>=5Freset=5Fhistory - (function=5Fid | (apss=5Fch=
annel <<
>> 8)
>> +
>> +caps:
>> +       POWER8:
>> +               power<x>=5Fcap - current powercap
>> +               power<x>=5Fcap=5Fmax - max powercap
>> +               power<x>=5Fcap=5Fmin - min powercap
>> +               power<x>=5Fmax - normal powercap
>> +               power<x>=5Falarm - user powercap, r/w
>> +       POWER9:
>> +               power<x>=5Fcap=5Falarm - user powercap source
>> +
>> +The driver also provides two sysfs entries through hwmon to better
>> +control the driver and monitor the master OCC. Though there may be
>> multiple
>> +OCCs present on the system, these two files are only present for the
>> "master"
>> +OCC.
>> +       name - read the name of the driver
>> +       update=5Finterval - read or write the minimum interval for polli=
ng
>> the
>> +               OCC.
>> +
>>  BMC - Host Communications
>>  -------------------------
>>
>> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
>> index 93cb52f..a6881f9 100644
>> --- a/drivers/hwmon/occ/Makefile
>> +++ b/drivers/hwmon/occ/Makefile
>> @@ -1 +1 @@
>> -obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o
>> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o
>> diff --git a/drivers/hwmon/occ/occ=5Fsysfs.c
b/drivers/hwmon/occ/occ=5Fsysfs.c
>> new file mode 100644
>> index 0000000..2f20c40
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ=5Fsysfs.c
>> @@ -0,0 +1,271 @@
>> +/*
>> + * occ=5Fsysfs.c - OCC sysfs interface
>> + *
>> + * This file contains the methods and data structures for implementing
>> the OCC
>> + * hwmon sysfs entries.
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/init.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include "occ.h"
>> +#include "occ=5Fsysfs.h"
>> +
>> +#define RESP=5FRETURN=5FCMD=5FINVAL  0x13
>> +
>> +static int occ=5Fhwmon=5Fread(struct device *dev, enum hwmon=5Fsensor=
=5Ftypes
>> type,
>> +                         u32 attr, int channel, long *val)
>> +{
>> +       int rc =3D 0;
>
>
> Unnecessary initialization.

Got it.

>
>
>> +       struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
>> +       struct occ *occ =3D driver->occ;
>> +
>> +       switch (type) {
>> +       case hwmon=5Fin:
>> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, FREQ, channel, at=
tr,
val);
>> +               break;
>> +       case hwmon=5Ftemp:
>> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, TEMP, channel, at=
tr,
val);
>> +               break;
>> +       case hwmon=5Fpower:
>> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, POWER, channel, a=
ttr,
val);
>> +               break;
>> +       default:
>> +               rc =3D -EOPNOTSUPP;
>> +       }
>> +
>> +       return rc;
>> +}
>> +
>> +static int occ=5Fhwmon=5Fread=5Fstring(struct device *dev,
>> +                                enum hwmon=5Fsensor=5Ftypes type, u32 a=
ttr,
>> +                                int channel, char **str)
>> +{
>> +       int rc;
>> +       unsigned long val =3D 0;
>> +
>> +       if (!((type =3D=3D hwmon=5Fin && attr =3D=3D hwmon=5Fin=5Flabel)=
 ||
>> +           (type =3D=3D hwmon=5Ftemp && attr =3D=3D hwmon=5Ftemp=5Flabe=
l) ||
>> +           (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5Fpower=5Fla=
bel)))
>> +               return -EOPNOTSUPP;
>> +
>> +       rc =3D occ=5Fhwmon=5Fread(dev, type, attr, channel, &val);
>> +       if (rc < 0)
>> +               return rc;
>> +
>> +       rc =3D snprintf(*str, PAGE=5FSIZE - 1, "%ld", val);
>
>
> val is unsigned long.
>
> I am quite confused what this is for, though. The function is used for
> string attributes,
> or in other words for labels. What is the benefit of having a label that
> returns the same
> data as the value attribute ? Is this maybe a misunderstanding ?

So this does work, though I admit it's a bit confusing.
occ=5Fget=5Fsensor=5Fvalue returns either the value or the occ sensor id
depending on the "type" passed in. I'll rename occ=5Fget=5Fsensor=5Fvalue
and add a comment.

>
>> +       if (rc > 0)
>> +               rc =3D 0;
>> +
>> +       return rc;
>> +}
>> +
>> +static int occ=5Fhwmon=5Fwrite(struct device *dev, enum hwmon=5Fsensor=
=5Ftypes
>> type,
>> +                          u32 attr, int channel, long val)
>> +{
>> +       int rc =3D 0;
>> +       struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
>> +
>> +       if (type =3D=3D hwmon=5Fchip && attr =3D=3D hwmon=5Fchip=5Fupdat=
e=5Finterval) {
>> +               occ=5Fset=5Fupdate=5Finterval(driver->occ, val);
>
>
> As mentioned in the other patch, please drop. This is not the intended
use
> case
> for this attribute.

OK.

>
>
>> +               return 0;
>> +       } else if (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5Fpowe=
r=5Falarm) {
>> +               rc =3D occ=5Fset=5Fuser=5Fpowercap(driver->occ, val);
>> +               if (rc) {
>> +                       if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVAL) {
>> +                               dev=5Ferr(dev,
>> +                                       "set invalid powercap value:
>> %ld\n",
>> +                                       val);
>> +                               return -EINVAL;
>> +                       }
>> +
>> +                       dev=5Ferr(dev, "set user powercap failed: 0x:%x
\n",
>> rc);
>> +                       return rc;
>> +               }
>> +
>> +               driver->user=5Fpowercap =3D val;
>> +
>> +               return rc;
>> +       }
>> +
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static umode=5Ft occ=5Fis=5Fvisible(const void *data, enum hwmon=5Fsens=
or=5Ftypes
>> type,
>> +                             u32 attr, int channel)
>> +{
>> +       const struct occ=5Fsysfs *driver =3D data;
>> +
>> +       switch (type) {
>> +       case hwmon=5Fchip:
>> +               if (attr =3D=3D hwmon=5Fchip=5Fupdate=5Finterval)
>> +                       return S=5FIRUGO | S=5FIWUSR;
>> +               break;
>> +       case hwmon=5Fin:
>> +               if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[0])
>> +                       return S=5FIRUGO;
>> +               break;
>> +       case hwmon=5Ftemp:
>> +               if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[1])
>> +                       return S=5FIRUGO;
>> +               break;
>> +       case hwmon=5Fpower:
>> +               /* user power limit */
>> +               if (attr =3D=3D hwmon=5Fpower=5Falarm)
>> +                       return S=5FIRUGO | S=5FIWUSR;
>> +               else if ((BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[2=
])
||
>> +                        (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[3=
]))
>> +                       return S=5FIRUGO;
>> +               break;
>> +       default:
>> +               return 0;
>
>
> Might as well use break; here for consistency.
>
>
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct hwmon=5Fops occ=5Fhwmon=5Fops =3D {
>> +       .is=5Fvisible =3D occ=5Fis=5Fvisible,
>> +       .read =3D occ=5Fhwmon=5Fread,
>> +       .read=5Fstring =3D occ=5Fhwmon=5Fread=5Fstring,
>> +       .write =3D occ=5Fhwmon=5Fwrite,
>> +};
>> +
>> +static const u32 occ=5Fchip=5Fconfig[] =3D {
>> +       HWMON=5FC=5FUPDATE=5FINTERVAL,
>> +       0
>> +};
>> +
>> +static const struct hwmon=5Fchannel=5Finfo occ=5Fchip =3D {
>> +       .type =3D hwmon=5Fchip,
>> +       .config =3D occ=5Fchip=5Fconfig
>> +};
>> +
>> +static const enum hwmon=5Fsensor=5Ftypes
>> occ=5Fsensor=5Ftypes[MAX=5FOCC=5FSENSOR=5FTYPE] =3D {
>> +       hwmon=5Fin,
>> +       hwmon=5Ftemp,
>> +       hwmon=5Fpower,
>> +       hwmon=5Fpower
>> +};
>> +
>> +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ =
*occ,
>> +                                 const u32 *sensor=5Fhwmon=5Fconfigs,
>> +                                 const char *name)
>> +{
>> +       bool master=5Focc =3D false;
>> +       int rc, i, j, sensor=5Fnum, index =3D 0, id;
>> +       char *brk;
>> +       struct occ=5Fblocks *resp =3D NULL;
>> +       u32 *sensor=5Fconfig;
>> +       struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(struct
>> occ=5Fsysfs),
>> +                                              GFP=5FKERNEL);
>> +       if (!hwmon)
>> +               return ERR=5FPTR(-ENOMEM);
>> +
>> +       /* need space for null-termination and occ chip */
>> +       hwmon->occ=5Fsensors =3D
>> +               devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo=
 *) *
>> +                            (MAX=5FOCC=5FSENSOR=5FTYPE + 2), GFP=5FKERN=
EL);
>> +       if (!hwmon->occ=5Fsensors)
>> +               return ERR=5FPTR(-ENOMEM);
>> +
>> +       hwmon->occ =3D occ;
>> +       hwmon->sensor=5Fhwmon=5Fconfigs =3D (u32 *)sensor=5Fhwmon=5Fconf=
igs;
>
>
> Either this is a const or it isn't. If it isn't, it should not be passed
in
> as const.
> If it is, it can be declared const in struct occ=5Fsysfs.

It is const, i'll fix.

>
>
>> +       hwmon->occ=5Finfo.ops =3D &occ=5Fhwmon=5Fops;
>> +       hwmon->occ=5Finfo.info =3D
>> +               (const struct hwmon=5Fchannel=5Finfo **)hwmon->occ=5Fsen=
sors;
>
>
> Why is this typecast needed ?

struct hwmon=5Fchip=5Finfo {
        const struct hwmon=5Fops *ops;
        const struct hwmon=5Fchannel=5Finfo **info;
};

My compiler throws an error without a cast here.

occ=5Fsysfs.c:195:23: error: assignment from incompatible pointer type
[-Werror=3Dincompatible-pointer-types]
|   hwmon->occ=5Finfo.info =3D hwmon->occ=5Fsensors;

occ=5Fsensors is not const, as it's dynamically zero-allocated and then
if we poll and get a sensor, we allocate a new hwmon=5Fchannel=5Finfo. Not
sure what the best solution is here except to cast.

>
>
>> +
>> +       occ=5Fget=5Fresponse=5Fblocks(occ, &resp);
>> +
>> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
>> +               resp->sensor=5Fblock=5Fid[i] =3D -1;
>> +
>> +       /* read sensor data from occ */
>> +       rc =3D occ=5Fupdate=5Fdevice(occ);
>> +       if (rc) {
>> +               dev=5Ferr(dev, "cannot get occ sensor data: %d\n", rc);
>> +               return ERR=5FPTR(rc);
>> +       }
>> +       if (!resp->blocks)
>> +               return ERR=5FPTR(-ENOMEM);
>> +
>> +       master=5Focc =3D resp->sensor=5Fblock=5Fid[CAPS] >=3D 0;
>> +
>> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; i++) {
>> +               id =3D resp->sensor=5Fblock=5Fid[i];
>> +               if (id < 0)
>> +                       continue;
>> +
>> +               sensor=5Fnum =3D resp->blocks[id].header.sensor=5Fnum;
>> +               /* need null-termination */
>> +               sensor=5Fconfig =3D devm=5Fkzalloc(dev,
>> +                                            sizeof(u32) * (sensor=5Fnum=
 +
>> 1),
>> +                                            GFP=5FKERNEL);
>> +               if (!sensor=5Fconfig)
>> +                       return ERR=5FPTR(-ENOMEM);
>> +
>> +               for (j =3D 0; j < sensor=5Fnum; j++)
>> +                       sensor=5Fconfig[j] =3D sensor=5Fhwmon=5Fconfigs[=
i];
>> +
>> +               hwmon->occ=5Fsensors[index] =3D
>> +                       devm=5Fkzalloc(dev, sizeof(struct
>> hwmon=5Fchannel=5Finfo),
>> +                                    GFP=5FKERNEL);
>> +               if (!hwmon->occ=5Fsensors[index])
>> +                       return ERR=5FPTR(-ENOMEM);
>> +
>> +               hwmon->occ=5Fsensors[index]->type =3D occ=5Fsensor=5Ftyp=
es[i];
>> +               hwmon->occ=5Fsensors[index]->config =3D sensor=5Fconfig;
>> +               index++;
>> +       }
>
>
> I had the impression from patch 1 that the number of sensors can change
at
> runtime.
> If so, this doesn't really work well; the sysfs attributes won't be
updated
> in this
> case.
>
> Can it really happen that the sensor information can change ?

Well, the number of sensors won't change while we are running. But we
don't know how many sensors we have when we start up. So this first
poll will tell us how many we need and allow the driver to initialize
the correct number of hwmon attributes. But yes, it shouldn't change while
we
are running.

>
>> +
>> +       /* only need one of these for any number of occs */
>> +       if (master=5Focc)
>> +               hwmon->occ=5Fsensors[index] =3D
>> +                       (struct hwmon=5Fchannel=5Finfo *)&occ=5Fchip;
>
>
> Why this typecast ?

occ=5Fchip is const but my occ=5Fsensors field isn't.

>
>
>> +
>> +       /* search for bad chars */
>> +       strncpy(hwmon->hwmon=5Fname, name, OCC=5FHWMON=5FNAME=5FLENGTH);
>> +       brk =3D strpbrk(hwmon->hwmon=5Fname, "-* \t\n");
>> +       while (brk) {
>> +               *brk =3D '=5F';
>> +               brk =3D strpbrk(brk,  "-* \t\n");
>> +       }
>> +
>> +       hwmon->dev =3D devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finfo(de=
v,
>> +
>> hwmon->hwmon=5Fname,
>> +                                                         hwmon,
>> +
>> &hwmon->occ=5Finfo,
>> +                                                         NULL);
>> +       if (IS=5FERR(hwmon->dev)) {
>> +               dev=5Ferr(dev, "cannot register hwmon device %s: %ld\n",
>> +                       hwmon->hwmon=5Fname, PTR=5FERR(hwmon->dev));
>> +               return ERR=5FCAST(hwmon->dev);
>> +       }
>> +
>> +       return hwmon;
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstart);
>> +
>> +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
>> +MODULE=5FDESCRIPTION("OCC sysfs driver");
>> +MODULE=5FLICENSE("GPL");
>> diff --git a/drivers/hwmon/occ/occ=5Fsysfs.h
b/drivers/hwmon/occ/occ=5Fsysfs.h
>> new file mode 100644
>> index 0000000..7de92e7
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ=5Fsysfs.h
>> @@ -0,0 +1,44 @@
>> +/*
>> + * occ=5Fsysfs.h - OCC sysfs interface
>> + *
>> + * This file contains the data structures and function prototypes for
the
>> OCC
>> + * hwmon sysfs entries.
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef =5F=5FOCC=5FSYSFS=5FH=5F=5F
>> +#define =5F=5FOCC=5FSYSFS=5FH=5F=5F
>> +
>> +#include <linux/hwmon.h>
>> +
>> +struct occ;
>> +struct device;
>> +
>> +#define OCC=5FHWMON=5FNAME=5FLENGTH  32
>> +
>> +struct occ=5Fsysfs {
>> +       struct device *dev;
>> +       struct occ *occ;
>> +
>> +       char hwmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];
>> +       u32 *sensor=5Fhwmon=5Fconfigs;
>> +       struct hwmon=5Fchannel=5Finfo **occ=5Fsensors;
>> +       struct hwmon=5Fchip=5Finfo occ=5Finfo;
>> +       u16 user=5Fpowercap;
>> +};
>
>
> Is this information used outside the sysfs code ? If not, it should be
> defined
> in the source file and not be available outside of it.

OK. It is used in p8=5Focc=5Fi2c.c but none of the members are accessed so
we shouldn't need it defined there, just declared, you're right.


>
>
>> +
>> +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ =
*occ,
>> +                                 const u32 *sensor=5Fhwmon=5Fconfigs,
>> +                                 const char *name);
>> +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */
>>
>

--0__=8FBB0A22DFEB2CF18f9e8a93df938690918c8FBB0A22DFEB2CF1
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>On Sat, Jan 21, 2017 at 12:08 PM, Guenter Roeck &lt;linu=
x@roeck-us.net&gt; wrote:</tt><br><tt>&gt; On 01/16/2017 01:13 PM, eajames.=
ibm@gmail.com wrote:</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; From: &quot;=
Edward A. James&quot; &lt;eajames@us.ibm.com&gt;</tt><br><tt>&gt;&gt;</tt><=
br><tt>&gt;&gt; Add a generic mechanism to expose the sensors provided by t=
he OCC in</tt><br><tt>&gt;&gt; sysfs.</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;=
&gt; Signed-off-by: Edward A. James &lt;eajames@us.ibm.com&gt;</tt><br><tt>=
&gt;&gt; Signed-off-by: Andrew Jeffery &lt;andrew@aj.id.au&gt;</tt><br><tt>=
&gt;&gt; ---</tt><br><tt>&gt;&gt; &nbsp;Documentation/hwmon/occ &nbsp; &nbs=
p; &nbsp; | &nbsp;62 ++++++++++</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/oc=
c/Makefile &nbsp; &nbsp;| &nbsp; 2 +-</tt><br><tt>&gt;&gt; &nbsp;drivers/hw=
mon/occ/occ=5Fsysfs.c | 271</tt><br><tt>&gt;&gt; ++++++++++++++++++++++++++=
++++++++++++++++</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.h=
 | &nbsp;44 +++++++</tt><br><tt>&gt;&gt; &nbsp;4 files changed, 378 inserti=
ons(+), 1 deletion(-)</tt><br><tt>&gt;&gt; &nbsp;create mode 100644 drivers=
/hwmon/occ/occ=5Fsysfs.c</tt><br><tt>&gt;&gt; &nbsp;create mode 100644 driv=
ers/hwmon/occ/occ=5Fsysfs.h</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; diff =
--git a/Documentation/hwmon/occ b/Documentation/hwmon/occ</tt><br><tt>&gt;&=
gt; index 79d1642..d0bdf06 100644</tt><br><tt>&gt;&gt; --- a/Documentation/=
hwmon/occ</tt><br><tt>&gt;&gt; +++ b/Documentation/hwmon/occ</tt><br><tt>&g=
t;&gt; @@ -25,6 +25,68 @@ Currently, all versions of the OCC support four t=
ypes</tt><br><tt>&gt;&gt; of sensor data: power,</tt><br><tt>&gt;&gt; &nbsp=
;temperature, frequency, and &quot;caps,&quot; which indicate limits and th=
resholds</tt><br><tt>&gt;&gt; used</tt><br><tt>&gt;&gt; &nbsp;internally on=
 the OCC.</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; +sysfs Entries</tt><br>=
<tt>&gt;&gt; +-------------</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +Th=
e OCC driver uses the hwmon sysfs framework to provide data to</tt><br><tt>=
&gt;&gt; userspace.</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +The driver=
 exports a number of sysfs files for each type of sensor. The</tt><br><tt>&=
gt;&gt; +sensor-specific files vary depending on the processor type, though=
 many</tt><br><tt>&gt;&gt; of the</tt><br><tt>&gt;&gt; +attributes are comm=
on for both the POWER8 and POWER9.</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&=
gt; +The hwmon interface cannot define every type of sensor that may be use=
d.</tt><br><tt>&gt;&gt; +Therefore, the frequency sensor on the OCC uses th=
e &quot;input&quot; type sensor</tt><br><tt>&gt;&gt; defined</tt><br><tt>&g=
t;&gt; +by the hwmon interface, rather than defining a new type of custom s=
ensor.</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +Below are detailed the =
names and meaning of each sensor file for both</tt><br><tt>&gt;&gt; types o=
f</tt><br><tt>&gt;&gt; +processors. All sensors are read-only unless otherw=
ise specified. &lt;x&gt;</tt><br><tt>&gt;&gt; indicates</tt><br><tt>&gt;&gt=
; +the hwmon index. sensor id indicates the unique internal OCC identifer.<=
/tt><br><tt>&gt;&gt; Please</tt><br><tt>&gt;&gt; +see the POWER OCC specifi=
cation for details on all these sensor values.</tt><br><tt>&gt;&gt; +</tt><=
br><tt>&gt;&gt; +frequency:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; all=
 processors:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; in&lt;x&gt;=5Finput - frequency value</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in&lt;x&gt;=5Flabel - sensor i=
d</tt><br><tt>&gt;&gt; +temperature:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; POWER8:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; temp&lt;x&gt;=5Finput - temperature value</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; temp&lt;x&gt;=5Flabel - s=
ensor id</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; POWER9 (in addition to=
 above):</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; temp&lt;x&gt;=5Ftype - FRU type</tt><br><tt>&gt;&gt; +</tt><br><tt>&g=
t;&gt; +power:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; POWER8:</tt><br>=
<tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&=
gt;=5Finput - power value</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Flabel - sensor id</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fave=
rage - accumulator</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; power&lt;x&gt;=5Faverage=5Finterval - update tag (number of=
 samples</tt><br><tt>&gt;&gt; in</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accumulator)</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; POWER9:</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Finput - power=
 value</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; power&lt;x&gt;=5Flabel - sensor id</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Faverage=5Fmin - accumu=
lator[0]</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; power&lt;x&gt;=5Faverage=5Fmax - accumulator[1] (64 bits total)</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt=
;x&gt;=5Faverage=5Finterval - update tag</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Freset=5Fhistory - (f=
unction=5Fid | (apss=5Fchannel &lt;&lt;</tt><br><tt>&gt;&gt; 8)</tt><br><tt=
>&gt;&gt; +</tt><br><tt>&gt;&gt; +caps:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; POWER8:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; power&lt;x&gt;=5Fcap - current powercap</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fcap=5Fm=
ax - max powercap</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; power&lt;x&gt;=5Fcap=5Fmin - min powercap</tt><br><tt>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fmax =
- normal powercap</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; power&lt;x&gt;=5Falarm - user powercap, r/w</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; POWER9:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fcap=5Falarm - user powerc=
ap source</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +The driver also prov=
ides two sysfs entries through hwmon to better</tt><br><tt>&gt;&gt; +contro=
l the driver and monitor the master OCC. Though there may be</tt><br><tt>&g=
t;&gt; multiple</tt><br><tt>&gt;&gt; +OCCs present on the system, these two=
 files are only present for the</tt><br><tt>&gt;&gt; &quot;master&quot;</tt=
><br><tt>&gt;&gt; +OCC.</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; name - =
read the name of the driver</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; upd=
ate=5Finterval - read or write the minimum interval for polling</tt><br><tt=
>&gt;&gt; the</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; OCC.</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; &nbsp;BMC - Hos=
t Communications</tt><br><tt>&gt;&gt; &nbsp;-------------------------</tt><=
br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/occ/Makefil=
e b/drivers/hwmon/occ/Makefile</tt><br><tt>&gt;&gt; index 93cb52f..a6881f9 =
100644</tt><br><tt>&gt;&gt; --- a/drivers/hwmon/occ/Makefile</tt><br><tt>&g=
t;&gt; +++ b/drivers/hwmon/occ/Makefile</tt><br><tt>&gt;&gt; @@ -1 +1 @@</t=
t><br><tt>&gt;&gt; -obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o</tt><br>=
<tt>&gt;&gt; +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o<=
/tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/occ/occ=5Fsysfs.c b/drivers=
/hwmon/occ/occ=5Fsysfs.c</tt><br><tt>&gt;&gt; new file mode 100644</tt><br>=
<tt>&gt;&gt; index 0000000..2f20c40</tt><br><tt>&gt;&gt; --- /dev/null</tt>=
<br><tt>&gt;&gt; +++ b/drivers/hwmon/occ/occ=5Fsysfs.c</tt><br><tt>&gt;&gt;=
 @@ -0,0 +1,271 @@</tt><br><tt>&gt;&gt; +/*</tt><br><tt>&gt;&gt; + * occ=5F=
sysfs.c - OCC sysfs interface</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt;=
 + * This file contains the methods and data structures for implementing</t=
t><br><tt>&gt;&gt; the OCC</tt><br><tt>&gt;&gt; + * hwmon sysfs entries.</t=
t><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * Copyright 2016 IBM Corp.</t=
t><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This program is free softwa=
re; you can redistribute it and/or modify</tt><br><tt>&gt;&gt; + * it under=
 the terms of the GNU General Public License as published by</tt><br><tt>&g=
t;&gt; + * the Free Software Foundation; either version 2 of the License, o=
r</tt><br><tt>&gt;&gt; + * (at your option) any later version.</tt><br><tt>=
&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This program is distributed in the ho=
pe that it will be useful,</tt><br><tt>&gt;&gt; + * but WITHOUT ANY WARRANT=
Y; without even the implied warranty of</tt><br><tt>&gt;&gt; + * MERCHANTAB=
ILITY or FITNESS FOR A PARTICULAR PURPOSE. See the</tt><br><tt>&gt;&gt; + *=
 GNU General Public License for more details.</tt><br><tt>&gt;&gt; + */</tt=
><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +#include &lt;linux/delay.h&gt;</t=
t><br><tt>&gt;&gt; +#include &lt;linux/device.h&gt;</tt><br><tt>&gt;&gt; +#=
include &lt;linux/err.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/hwmon.=
h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/hwmon-sysfs.h&gt;</tt><br><t=
t>&gt;&gt; +#include &lt;linux/init.h&gt;</tt><br><tt>&gt;&gt; +#include &l=
t;linux/jiffies.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/kernel.h&gt;=
</tt><br><tt>&gt;&gt; +#include &lt;linux/module.h&gt;</tt><br><tt>&gt;&gt;=
 +#include &lt;linux/mutex.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/s=
lab.h&gt;</tt><br><tt>&gt;&gt; +#include &quot;occ.h&quot;</tt><br><tt>&gt;=
&gt; +#include &quot;occ=5Fsysfs.h&quot;</tt><br><tt>&gt;&gt; +</tt><br><tt=
>&gt;&gt; +#define RESP=5FRETURN=5FCMD=5FINVAL &nbsp;0x13</tt><br><tt>&gt;&=
gt; +</tt><br><tt>&gt;&gt; +static int occ=5Fhwmon=5Fread(struct device *de=
v, enum hwmon=5Fsensor=5Ftypes</tt><br><tt>&gt;&gt; type,</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; u32 attr, int channel, long *val)</tt><br><tt>&gt;&gt; +{</t=
t><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int rc =3D 0;</tt><br><tt>&gt;</t=
t><br><tt>&gt;</tt><br><tt>&gt; Unnecessary initialization.</tt><br><br><tt=
>Got it.</tt><br><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);</t=
t><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ *occ =3D driver-&gt;oc=
c;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; switc=
h (type) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fin:</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D=
 occ=5Fget=5Fsensor=5Fvalue(occ, FREQ, channel, attr, val);</tt><br><tt>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Ftemp:</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D occ=5Fget=5Fsensor=
=5Fvalue(occ, TEMP, channel, attr, val);</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; case hwmon=5Fpower:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, POWER=
, channel, attr, val);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; defa=
ult:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; rc =3D -EOPNOTSUPP;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br=
><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt>=
<br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static int=
 occ=5Fhwmon=5Fread=5Fstring(struct device *dev,</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum hwmon=5Fsensor=5Ftypes type, u32 attr=
,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int channel, c=
har **str)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; int rc;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; unsigned long val =
=3D 0;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; i=
f (!((type =3D=3D hwmon=5Fin &amp;&amp; attr =3D=3D hwmon=5Fin=5Flabel) ||<=
/tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (type =3D=3D hwmo=
n=5Ftemp &amp;&amp; attr =3D=3D hwmon=5Ftemp=5Flabel) ||</tt><br><tt>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (type =3D=3D hwmon=5Fpower &amp;&am=
p; attr =3D=3D hwmon=5Fpower=5Flabel)))</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EOPNOTSUPP;</tt><br><tt>&gt;&g=
t; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fhwmon=5Fread(=
dev, type, attr, channel, &amp;val);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; if (rc &lt; 0)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; rc =3D snprintf(*str, PAGE=5FSIZE - 1, &quot;%ld&quot;=
, val);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; val is unsigned =
long.</tt><br><tt>&gt;</tt><br><tt>&gt; I am quite confused what this is fo=
r, though. The function is used for</tt><br><tt>&gt; string attributes,</tt=
><br><tt>&gt; or in other words for labels. What is the benefit of having a=
 label that</tt><br><tt>&gt; returns the same</tt><br><tt>&gt; data as the =
value attribute ? Is this maybe a misunderstanding ?</tt><br><br><tt>So thi=
s does work, though I admit it's a bit confusing.</tt><br><tt>occ=5Fget=5Fs=
ensor=5Fvalue returns either the value or the occ sensor id</tt><br><tt>dep=
ending on the &quot;type&quot; passed in. I'll rename occ=5Fget=5Fsensor=5F=
value</tt><br><tt>and add a comment.</tt><br><br><tt>&gt;</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; if (rc &gt; 0)</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0;</tt><br><tt>&gt;&gt; +</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&gt; +}=
</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static int occ=5Fhwmon=5Fwrit=
e(struct device *dev, enum hwmon=5Fsensor=5Ftypes</tt><br><tt>&gt;&gt; type=
,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 attr, int channel, long val)</t=
t><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int rc =
=3D 0;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsysfs *driv=
er =3D dev=5Fget=5Fdrvdata(dev);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; if (type =3D=3D hwmon=5Fchip &amp;&amp; attr =3D=
=3D hwmon=5Fchip=5Fupdate=5Finterval) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; occ=5Fset=5Fupdate=5Finterval(driver-&=
gt;occ, val);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; As mention=
ed in the other patch, please drop. This is not the intended use</tt><br><t=
t>&gt; case</tt><br><tt>&gt; for this attribute.</tt><br><br><tt>OK.</tt><b=
r><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; return 0;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; } else if (type =3D=3D hwmon=5Fpower &amp;&amp; attr =3D=3D hwmon=
=5Fpower=5Falarm) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rc =3D occ=5Fset=5Fuser=5Fpowercap(driver-&gt;occ, val);</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (=
rc) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVAL) {=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev,</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;set invalid powercap value:</tt><br><tt>&gt;&gt; %ld\n&quot;,</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v=
al);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d=
ev=5Ferr(dev, &quot;set user powercap failed: 0x:%x\n&quot;,</tt><br><tt>&g=
t;&gt; rc);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; driver-&=
gt;user=5Fpowercap =3D val;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; return -EOPNOTSUPP;</tt><br><tt>&gt;&gt; +}</tt><br><=
tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static umode=5Ft occ=5Fis=5Fvisible(con=
st void *data, enum hwmon=5Fsensor=5Ftypes</tt><br><tt>&gt;&gt; type,</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 attr, int channel)</tt><br><tt=
>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; const struct occ=
=5Fsysfs *driver =3D data;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; switch (type) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; case hwmon=5Fchip:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; if (attr =3D=3D hwmon=5Fchip=5Fupdate=5Finterval)</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; return S=5FIRUGO | S=5FIWUSR;</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; case hwmon=5Fin:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (BIT(attr) &amp; driver-&gt;sensor=
=5Fhwmon=5Fconfigs[0])</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return S=5FIRUGO;</tt><br><=
tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Ftemp:</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (BIT(attr) &amp; =
driver-&gt;sensor=5Fhwmon=5Fconfigs[1])</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return S=
=5FIRUGO;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fpowe=
r:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
/* user power limit */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; if (attr =3D=3D hwmon=5Fpower=5Falarm)</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; return S=5FIRUGO | S=5FIWUSR;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else if ((BIT(attr) &amp; driver-&gt;se=
nsor=5Fhwmon=5Fconfigs[2]) ||</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(BIT(attr) &am=
p; driver-&gt;sensor=5Fhwmon=5Fconfigs[3]))</tt><br><tt>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 S=5FIRUGO;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; default:</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;=
</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Might as well use break=
; here for consistency.</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; return 0;</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; +static const struct hwmon=5Fops occ=5Fhwmon=5Fops =
=3D {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .is=5Fvisible =3D occ=5Fi=
s=5Fvisible,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .read =3D occ=5Fhw=
mon=5Fread,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .read=5Fstring =3D =
occ=5Fhwmon=5Fread=5Fstring,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .w=
rite =3D occ=5Fhwmon=5Fwrite,</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; +static const u32 occ=5Fchip=5Fconfig[] =3D {</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; HWMON=5FC=5FUPDATE=5FINTERVAL,</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; 0</tt><br><tt>&gt;&gt; +};</tt><br><=
tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static const struct hwmon=5Fchannel=5Fi=
nfo occ=5Fchip =3D {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .type =3D =
hwmon=5Fchip,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; .config =3D occ=
=5Fchip=5Fconfig</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><t=
t>&gt;&gt; +static const enum hwmon=5Fsensor=5Ftypes</tt><br><tt>&gt;&gt; o=
cc=5Fsensor=5Ftypes[MAX=5FOCC=5FSENSOR=5FTYPE] =3D {</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; hwmon=5Fin,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; hwmon=5Ftemp,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon=5Fpower,=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon=5Fpower</tt><br><tt>&gt;=
&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct occ=5Fsysfs *o=
cc=5Fsysfs=5Fstart(struct device *dev, struct occ *occ,</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const u32 *sensor=5Fhwmon=5Fconfig=
s,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const char *=
name)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; b=
ool master=5Focc =3D false;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int=
 rc, i, j, sensor=5Fnum, index =3D 0, id;</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; char *brk;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct oc=
c=5Fblocks *resp =3D NULL;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u32 =
*sensor=5Fconfig;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5F=
sysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(struct</tt><br><tt>&gt;&gt; occ=
=5Fsysfs),</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; if (!hwmon)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br><tt=
>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* need space for n=
ull-termination and occ chip */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 hwmon-&gt;occ=5Fsensors =3D</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=
=5Finfo *) *</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(MAX=5FOCC=5FSENS=
OR=5FTYPE + 2), GFP=5FKERNEL);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
if (!hwmon-&gt;occ=5Fsensors)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br><tt>&gt;&gt; =
+</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ =3D occ;</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;sensor=5Fhwmon=5Fconfigs =
=3D (u32 *)sensor=5Fhwmon=5Fconfigs;</tt><br><tt>&gt;</tt><br><tt>&gt;</tt>=
<br><tt>&gt; Either this is a const or it isn't. If it isn't, it should not=
 be passed in</tt><br><tt>&gt; as const.</tt><br><tt>&gt; If it is, it can =
be declared const in struct occ=5Fsysfs.</tt><br><br><tt>It is const, i'll =
fix.</tt><br><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; hwmon-&gt;occ=5Finfo.ops =3D &amp;occ=5Fhwmon=5Fops;</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Finfo.info =3D</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (const struct =
hwmon=5Fchannel=5Finfo **)hwmon-&gt;occ=5Fsensors;</tt><br><tt>&gt;</tt><br=
><tt>&gt;</tt><br><tt>&gt; Why is this typecast needed ?</tt><br><br><tt>st=
ruct hwmon=5Fchip=5Finfo {</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; const st=
ruct hwmon=5Fops *ops;</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp; const struct=
 hwmon=5Fchannel=5Finfo **info;</tt><br><tt>};</tt><br><br><tt>My compiler =
throws an error without a cast here.</tt><br><br><tt>occ=5Fsysfs.c:195:23: =
error: assignment from incompatible pointer type</tt><br><tt>[-Werror=3Dinc=
ompatible-pointer-types]</tt><br><tt>| &nbsp; hwmon-&gt;occ=5Finfo.info =3D=
 hwmon-&gt;occ=5Fsensors;</tt><br><br><tt>occ=5Fsensors is not const, as it=
's dynamically zero-allocated and then</tt><br><tt>if we poll and get a sen=
sor, we allocate a new hwmon=5Fchannel=5Finfo. Not</tt><br><tt>sure what th=
e best solution is here except to cast.</tt><br><br><tt>&gt;</tt><br><tt>&g=
t;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; occ=
=5Fget=5Fresponse=5Fblocks(occ, &amp;resp);</tt><br><tt>&gt;&gt; +</tt><br>=
<tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=
=5FTYPE; ++i)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; resp-&gt;sensor=5Fblock=5Fid[i] =3D -1;</tt><br><tt>&gt;&gt; +</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* read sensor data from occ */<=
/tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fupdate=5Fdevice(oc=
c);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc) {</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot=
;cannot get occ sensor data: %d\n&quot;, rc);</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(rc);</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; if (!resp-&gt;blocks)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br><tt>&gt;&gt; +</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; master=5Focc =3D resp-&gt;sensor=
=5Fblock=5Fid[CAPS] &gt;=3D 0;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; i++)=
 {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
id =3D resp-&gt;sensor=5Fblock=5Fid[i];</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (id &lt; 0)</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; continue;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fnum =3D resp-&gt;blocks[id].header=
.sensor=5Fnum;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; /* need null-termination */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fconfig =3D devm=5Fkzalloc(dev=
,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;sizeof(u32) * (sensor=5Fnum +</tt><br><tt>&gt;&=
gt; 1),</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!sensor=5Fconfig)</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br><tt>&gt;&gt; +</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (j =3D=
 0; j &lt; sensor=5Fnum; j++)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fconfig[j] =
=3D sensor=5Fhwmon=5Fconfigs[i];</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsensor=
s[index] =3D</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; devm=5Fkzalloc(dev, sizeof(struct</tt=
><br><tt>&gt;&gt; hwmon=5Fchannel=5Finfo),</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!hwmon-&gt;occ=5Fs=
ensors[index])</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br>=
<tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; hwmon-&gt;occ=5Fsensors[index]-&gt;type =3D occ=5Fsensor=5Ftype=
s[i];</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; hwmon-&gt;occ=5Fsensors[index]-&gt;config =3D sensor=5Fconfig;</tt><br><=
tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; index++;</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;</tt><br><tt>&gt=
;</tt><br><tt>&gt; I had the impression from patch 1 that the number of sen=
sors can change at</tt><br><tt>&gt; runtime.</tt><br><tt>&gt; If so, this d=
oesn't really work well; the sysfs attributes won't be updated</tt><br><tt>=
&gt; in this</tt><br><tt>&gt; case.</tt><br><tt>&gt;</tt><br><tt>&gt; Can i=
t really happen that the sensor information can change ?</tt><br><br><tt>We=
ll, the number of sensors won't change while we are running. But we</tt><br=
><tt>don't know how many sensors we have when we start up. So this first</t=
t><br><tt>poll will tell us how many we need and allow the driver to initia=
lize</tt><br><tt>the correct number of hwmon attributes. But yes, it should=
n't change while we</tt><br><tt>are running.</tt><br><br><tt>&gt;</tt><br><=
tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* only need one =
of these for any number of occs */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; if (master=5Focc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsensors[index] =3D</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; (struct hwmon=5Fchannel=5Finfo *)&amp;occ=5Fchip;</tt><br><tt>&gt;</tt>=
<br><tt>&gt;</tt><br><tt>&gt; Why this typecast ?</tt><br><br><tt>occ=5Fchi=
p is const but my occ=5Fsensors field isn't.</tt><br><br><tt>&gt;</tt><br><=
tt>&gt;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
/* search for bad chars */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; strn=
cpy(hwmon-&gt;hwmon=5Fname, name, OCC=5FHWMON=5FNAME=5FLENGTH);</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; brk =3D strpbrk(hwmon-&gt;hwmon=5Fname, &q=
uot;-* \t\n&quot;);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; while (brk)=
 {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
*brk =3D '=5F';</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; brk =3D strpbrk(brk, &nbsp;&quot;-* \t\n&quot;);</tt><br><tt>&=
gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; hwmon-&gt;dev =3D devm=5Fhwmon=5Fdevice=5Fregister=
=5Fwith=5Finfo(dev,</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; hwmon-&gt;h=
wmon=5Fname,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; hwmon,</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; &amp;hwmon-&gt;oc=
c=5Finfo,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; NULL);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (IS=5FERR(hwmon-&=
gt;dev)) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; dev=5Ferr(dev, &quot;cannot register hwmon device %s: %ld\n&quot;,<=
/tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; hwmon-&gt;hwmon=5Fname, PTR=5FERR(hwmon-&gt;dev));=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; re=
turn ERR=5FCAST(hwmon-&gt;dev);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; retur=
n hwmon;</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +EXPORT=5FSYMBOL(occ=
=5Fsysfs=5Fstart);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +MODULE=5FAU=
THOR(&quot;Eddie James &lt;eajames@us.ibm.com&gt;&quot;);</tt><br><tt>&gt;&=
gt; +MODULE=5FDESCRIPTION(&quot;OCC sysfs driver&quot;);</tt><br><tt>&gt;&g=
t; +MODULE=5FLICENSE(&quot;GPL&quot;);</tt><br><tt>&gt;&gt; diff --git a/dr=
ivers/hwmon/occ/occ=5Fsysfs.h b/drivers/hwmon/occ/occ=5Fsysfs.h</tt><br><tt=
>&gt;&gt; new file mode 100644</tt><br><tt>&gt;&gt; index 0000000..7de92e7<=
/tt><br><tt>&gt;&gt; --- /dev/null</tt><br><tt>&gt;&gt; +++ b/drivers/hwmon=
/occ/occ=5Fsysfs.h</tt><br><tt>&gt;&gt; @@ -0,0 +1,44 @@</tt><br><tt>&gt;&g=
t; +/*</tt><br><tt>&gt;&gt; + * occ=5Fsysfs.h - OCC sysfs interface</tt><br=
><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This file contains the data stru=
ctures and function prototypes for the</tt><br><tt>&gt;&gt; OCC</tt><br><tt=
>&gt;&gt; + * hwmon sysfs entries.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt=
;&gt; + * Copyright 2016 IBM Corp.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt=
;&gt; + * This program is free software; you can redistribute it and/or mod=
ify</tt><br><tt>&gt;&gt; + * it under the terms of the GNU General Public L=
icense as published by</tt><br><tt>&gt;&gt; + * the Free Software Foundatio=
n; either version 2 of the License, or</tt><br><tt>&gt;&gt; + * (at your op=
tion) any later version.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * =
This program is distributed in the hope that it will be useful,</tt><br><tt=
>&gt;&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty o=
f</tt><br><tt>&gt;&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE. See the</tt><br><tt>&gt;&gt; + * GNU General Public License for more d=
etails.</tt><br><tt>&gt;&gt; + */</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&g=
t; +#ifndef =5F=5FOCC=5FSYSFS=5FH=5F=5F</tt><br><tt>&gt;&gt; +#define =5F=
=5FOCC=5FSYSFS=5FH=5F=5F</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +#incl=
ude &lt;linux/hwmon.h&gt;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +stru=
ct occ;</tt><br><tt>&gt;&gt; +struct device;</tt><br><tt>&gt;&gt; +</tt><br=
><tt>&gt;&gt; +#define OCC=5FHWMON=5FNAME=5FLENGTH &nbsp;32</tt><br><tt>&gt=
;&gt; +</tt><br><tt>&gt;&gt; +struct occ=5Fsysfs {</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; struct device *dev;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; struct occ *occ;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; char hwmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u32 *sensor=5Fhwmon=5Fconfigs;</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct hwmon=5Fchannel=5Finfo **occ=
=5Fsensors;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct hwmon=5Fchip=
=5Finfo occ=5Finfo;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u16 user=5F=
powercap;</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><b=
r><tt>&gt; Is this information used outside the sysfs code ? If not, it sho=
uld be</tt><br><tt>&gt; defined</tt><br><tt>&gt; in the source file and not=
 be available outside of it.</tt><br><br><tt>OK. It is used in p8=5Focc=5Fi=
2c.c but none of the members are accessed so</tt><br><tt>we shouldn't need =
it defined there, just declared, you're right.</tt><br><br><br><tt>&gt;</tt=
><br><tt>&gt;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct occ=5Fsys=
fs *occ=5Fsysfs=5Fstart(struct device *dev, struct occ *occ,</tt><br><tt>&g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const u32 *sensor=5Fhwmon=5Fc=
onfigs,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const c=
har *name);</tt><br><tt>&gt;&gt; +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */<=
/tt><br><tt>&gt;&gt;</tt><br><tt>&gt;</tt><BR>
</body></html>

--0__=8FBB0A22DFEB2CF18f9e8a93df938690918c8FBB0A22DFEB2CF1--
