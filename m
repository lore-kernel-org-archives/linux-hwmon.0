Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20170123221540.GA31280@roeck-us.net>
Subject: Re: [PATCH linux v3 2/6] hwmon: occ: Add sysfs interface
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 16:34:48 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-3-git-send-email-eajames.ibm@gmail.com>
 <40f255c4-b490-5548-3c1e-1be15f3a2a5d@roeck-us.net>
 <OFE34EEAB4.7855326B-ON002580B1.0078AA61-862580B1.0078FABB@notes.na.collabserv.com>
 <20170123221540.GA31280@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DFE8861C8f9e8a93df938690918c8FBB0A22DFE8861C"
Content-Disposition: inline
Message-Id: <OF6932CA2B.2472ABB0-ON002580B1.007B008C-862580B1.007C0956@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DFE8861C8f9e8a93df938690918c8FBB0A22DFE8861C
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Guenter Roeck <linux@roeck-us.net> wrote on 01/23/2017 04:15:40 PM:
> On Mon, Jan 23, 2017 at 04:01:25PM -0600, Edward James wrote:
> >
> >
> > On Sat, Jan 21, 2017 at 12:08 PM, Guenter Roeck <linux@roeck-us.net>
wrote:
> > > On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> > >>
> > >> From: "Edward A. James" <eajames@us.ibm.com>
> > >>
> > >> Add a generic mechanism to expose the sensors provided by the OCC in
> > >> sysfs.
> > >>
> > >> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >> ---
> > >>  Documentation/hwmon/occ       |  62 ++++++++++
> > >>  drivers/hwmon/occ/Makefile    |   2 +-
> > >>  drivers/hwmon/occ/occ=5Fsysfs.c | 271
> > >> ++++++++++++++++++++++++++++++++++++++++++
> > >>  drivers/hwmon/occ/occ=5Fsysfs.h |  44 +++++++
> > >>  4 files changed, 378 insertions(+), 1 deletion(-)
> > >>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c
> > >>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h
> > >>
> > >> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> > >> index 79d1642..d0bdf06 100644
> > >> --- a/Documentation/hwmon/occ
> > >> +++ b/Documentation/hwmon/occ
> > >> @@ -25,6 +25,68 @@ Currently, all versions of the OCC support four
types
> > >> of sensor data: power,
> > >>  temperature, frequency, and "caps," which indicate limits and
> > thresholds
> > >> used
> > >>  internally on the OCC.
> > >>
> > >> +sysfs Entries
> > >> +-------------
> > >> +
> > >> +The OCC driver uses the hwmon sysfs framework to provide data to
> > >> userspace.
> > >> +
> > >> +The driver exports a number of sysfs files for each type of sensor.
The
> > >> +sensor-specific files vary depending on the processor type, though
many
> > >> of the
> > >> +attributes are common for both the POWER8 and POWER9.
> > >> +
> > >> +The hwmon interface cannot define every type of sensor that may be
> > used.
> > >> +Therefore, the frequency sensor on the OCC uses the "input" type
sensor
> > >> defined
> > >> +by the hwmon interface, rather than defining a new type of custom
> > sensor.
> > >> +
> > >> +Below are detailed the names and meaning of each sensor file for
both
> > >> types of
> > >> +processors. All sensors are read-only unless otherwise specified.
<x>
> > >> indicates
> > >> +the hwmon index. sensor id indicates the unique internal OCC
identifer.
> > >> Please
> > >> +see the POWER OCC specification for details on all these sensor
values.
> > >> +
> > >> +frequency:
> > >> +       all processors:
> > >> +               in<x>=5Finput - frequency value
> > >> +               in<x>=5Flabel - sensor id
> > >> +temperature:
> > >> +       POWER8:
> > >> +               temp<x>=5Finput - temperature value
> > >> +               temp<x>=5Flabel - sensor id
> > >> +       POWER9 (in addition to above):
> > >> +               temp<x>=5Ftype - FRU type
> > >> +
> > >> +power:
> > >> +       POWER8:
> > >> +               power<x>=5Finput - power value
> > >> +               power<x>=5Flabel - sensor id
> > >> +               power<x>=5Faverage - accumulator
> > >> +               power<x>=5Faverage=5Finterval - update tag (number of
> > samples
> > >> in
> > >> +                       accumulator)
> > >> +       POWER9:
> > >> +               power<x>=5Finput - power value
> > >> +               power<x>=5Flabel - sensor id
> > >> +               power<x>=5Faverage=5Fmin - accumulator[0]
> > >> +               power<x>=5Faverage=5Fmax - accumulator[1] (64 bits
total)
> > >> +               power<x>=5Faverage=5Finterval - update tag
> > >> +               power<x>=5Freset=5Fhistory - (function=5Fid |
(apss=5Fchannel <<
> > >> 8)
> > >> +
> > >> +caps:
> > >> +       POWER8:
> > >> +               power<x>=5Fcap - current powercap
> > >> +               power<x>=5Fcap=5Fmax - max powercap
> > >> +               power<x>=5Fcap=5Fmin - min powercap
> > >> +               power<x>=5Fmax - normal powercap
> > >> +               power<x>=5Falarm - user powercap, r/w
> > >> +       POWER9:
> > >> +               power<x>=5Fcap=5Falarm - user powercap source
> > >> +
> > >> +The driver also provides two sysfs entries through hwmon to better
> > >> +control the driver and monitor the master OCC. Though there may be
> > >> multiple
> > >> +OCCs present on the system, these two files are only present for
the
> > >> "master"
> > >> +OCC.
> > >> +       name - read the name of the driver
> > >> +       update=5Finterval - read or write the minimum interval for
polling
> > >> the
> > >> +               OCC.
> > >> +
> > >>  BMC - Host Communications
> > >>  -------------------------
> > >>
> > >> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> > >> index 93cb52f..a6881f9 100644
> > >> --- a/drivers/hwmon/occ/Makefile
> > >> +++ b/drivers/hwmon/occ/Makefile
> > >> @@ -1 +1 @@
> > >> -obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o
> > >> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o
> > >> diff --git a/drivers/hwmon/occ/occ=5Fsysfs.c
> > b/drivers/hwmon/occ/occ=5Fsysfs.c
> > >> new file mode 100644
> > >> index 0000000..2f20c40
> > >> --- /dev/null
> > >> +++ b/drivers/hwmon/occ/occ=5Fsysfs.c
> > >> @@ -0,0 +1,271 @@
> > >> +/*
> > >> + * occ=5Fsysfs.c - OCC sysfs interface
> > >> + *
> > >> + * This file contains the methods and data structures for
implementing
> > >> the OCC
> > >> + * hwmon sysfs entries.
> > >> + *
> > >> + * Copyright 2016 IBM Corp.
> > >> + *
> > >> + * This program is free software; you can redistribute it and/or
modify
> > >> + * it under the terms of the GNU General Public License as
published by
> > >> + * the Free Software Foundation; either version 2 of the License,
or
> > >> + * (at your option) any later version.
> > >> + *
> > >> + * This program is distributed in the hope that it will be useful,
> > >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > >> + * GNU General Public License for more details.
> > >> + */
> > >> +
> > >> +#include <linux/delay.h>
> > >> +#include <linux/device.h>
> > >> +#include <linux/err.h>
> > >> +#include <linux/hwmon.h>
> > >> +#include <linux/hwmon-sysfs.h>
> > >> +#include <linux/init.h>
> > >> +#include <linux/jiffies.h>
> > >> +#include <linux/kernel.h>
> > >> +#include <linux/module.h>
> > >> +#include <linux/mutex.h>
> > >> +#include <linux/slab.h>
> > >> +#include "occ.h"
> > >> +#include "occ=5Fsysfs.h"
> > >> +
> > >> +#define RESP=5FRETURN=5FCMD=5FINVAL  0x13
> > >> +
> > >> +static int occ=5Fhwmon=5Fread(struct device *dev, enum
hwmon=5Fsensor=5Ftypes
> > >> type,
> > >> +                         u32 attr, int channel, long *val)
> > >> +{
> > >> +       int rc =3D 0;
> > >
> > >
> > > Unnecessary initialization.
> >
> > Got it.
> >
> > >
> > >
> > >> +       struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > >> +       struct occ *occ =3D driver->occ;
> > >> +
> > >> +       switch (type) {
> > >> +       case hwmon=5Fin:
> > >> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, FREQ, channel=
, attr,
> > val);
> > >> +               break;
> > >> +       case hwmon=5Ftemp:
> > >> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, TEMP, channel=
, attr,
> > val);
> > >> +               break;
> > >> +       case hwmon=5Fpower:
> > >> +               rc =3D occ=5Fget=5Fsensor=5Fvalue(occ, POWER, channe=
l, attr,
> > val);
> > >> +               break;
> > >> +       default:
> > >> +               rc =3D -EOPNOTSUPP;
> > >> +       }
> > >> +
> > >> +       return rc;
> > >> +}
> > >> +
> > >> +static int occ=5Fhwmon=5Fread=5Fstring(struct device *dev,
> > >> +                                enum hwmon=5Fsensor=5Ftypes type, u=
32
attr,
> > >> +                                int channel, char **str)
> > >> +{
> > >> +       int rc;
> > >> +       unsigned long val =3D 0;
> > >> +
> > >> +       if (!((type =3D=3D hwmon=5Fin && attr =3D=3D hwmon=5Fin=5Fla=
bel) ||
> > >> +           (type =3D=3D hwmon=5Ftemp && attr =3D=3D hwmon=5Ftemp=5F=
label) ||
> > >> +           (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5Fpower=
=5Flabel)))
> > >> +               return -EOPNOTSUPP;
> > >> +
> > >> +       rc =3D occ=5Fhwmon=5Fread(dev, type, attr, channel, &val);
> > >> +       if (rc < 0)
> > >> +               return rc;
> > >> +
> > >> +       rc =3D snprintf(*str, PAGE=5FSIZE - 1, "%ld", val);
> > >
> > >
> > > val is unsigned long.
> > >
> > > I am quite confused what this is for, though. The function is used
for
> > > string attributes,
> > > or in other words for labels. What is the benefit of having a label
that
> > > returns the same
> > > data as the value attribute ? Is this maybe a misunderstanding ?
> >
> > So this does work, though I admit it's a bit confusing.
> > occ=5Fget=5Fsensor=5Fvalue returns either the value or the occ sensor id
> > depending on the "type" passed in. I'll rename occ=5Fget=5Fsensor=5Fval=
ue
> > and add a comment.
> >
> > >
> > >> +       if (rc > 0)
> > >> +               rc =3D 0;
> > >> +
> > >> +       return rc;
> > >> +}
> > >> +
> > >> +static int occ=5Fhwmon=5Fwrite(struct device *dev, enum
hwmon=5Fsensor=5Ftypes
> > >> type,
> > >> +                          u32 attr, int channel, long val)
> > >> +{
> > >> +       int rc =3D 0;
> > >> +       struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);
> > >> +
> > >> +       if (type =3D=3D hwmon=5Fchip && attr =3D=3D
hwmon=5Fchip=5Fupdate=5Finterval) {
> > >> +               occ=5Fset=5Fupdate=5Finterval(driver->occ, val);
> > >
> > >
> > > As mentioned in the other patch, please drop. This is not the
intended
> > use
> > > case
> > > for this attribute.
> >
> > OK.
> >
> > >
> > >
> > >> +               return 0;
> > >> +       } else if (type =3D=3D hwmon=5Fpower && attr =3D=3D hwmon=5F=
power=5Falarm)
{
> > >> +               rc =3D occ=5Fset=5Fuser=5Fpowercap(driver->occ, val);
> > >> +               if (rc) {
> > >> +                       if (rc =3D=3D RESP=5FRETURN=5FCMD=5FINVAL) {
> > >> +                               dev=5Ferr(dev,
> > >> +                                       "set invalid powercap value:
> > >> %ld\n",
> > >> +                                       val);
> > >> +                               return -EINVAL;
> > >> +                       }
> > >> +
> > >> +                       dev=5Ferr(dev, "set user powercap failed:
0x:%x
> > \n",
> > >> rc);
> > >> +                       return rc;
> > >> +               }
> > >> +
> > >> +               driver->user=5Fpowercap =3D val;
> > >> +
> > >> +               return rc;
> > >> +       }
> > >> +
> > >> +       return -EOPNOTSUPP;
> > >> +}
> > >> +
> > >> +static umode=5Ft occ=5Fis=5Fvisible(const void *data, enum
hwmon=5Fsensor=5Ftypes
> > >> type,
> > >> +                             u32 attr, int channel)
> > >> +{
> > >> +       const struct occ=5Fsysfs *driver =3D data;
> > >> +
> > >> +       switch (type) {
> > >> +       case hwmon=5Fchip:
> > >> +               if (attr =3D=3D hwmon=5Fchip=5Fupdate=5Finterval)
> > >> +                       return S=5FIRUGO | S=5FIWUSR;
> > >> +               break;
> > >> +       case hwmon=5Fin:
> > >> +               if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[0])
> > >> +                       return S=5FIRUGO;
> > >> +               break;
> > >> +       case hwmon=5Ftemp:
> > >> +               if (BIT(attr) & driver->sensor=5Fhwmon=5Fconfigs[1])
> > >> +                       return S=5FIRUGO;
> > >> +               break;
> > >> +       case hwmon=5Fpower:
> > >> +               /* user power limit */
> > >> +               if (attr =3D=3D hwmon=5Fpower=5Falarm)
> > >> +                       return S=5FIRUGO | S=5FIWUSR;
> > >> +               else if ((BIT(attr) & driver->sensor=5Fhwmon=5Fconfi=
gs
[2])
> > ||
> > >> +                        (BIT(attr) & driver->sensor=5Fhwmon=5Fconfi=
gs
[3]))
> > >> +                       return S=5FIRUGO;
> > >> +               break;
> > >> +       default:
> > >> +               return 0;
> > >
> > >
> > > Might as well use break; here for consistency.
> > >
> > >
> > >> +       }
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static const struct hwmon=5Fops occ=5Fhwmon=5Fops =3D {
> > >> +       .is=5Fvisible =3D occ=5Fis=5Fvisible,
> > >> +       .read =3D occ=5Fhwmon=5Fread,
> > >> +       .read=5Fstring =3D occ=5Fhwmon=5Fread=5Fstring,
> > >> +       .write =3D occ=5Fhwmon=5Fwrite,
> > >> +};
> > >> +
> > >> +static const u32 occ=5Fchip=5Fconfig[] =3D {
> > >> +       HWMON=5FC=5FUPDATE=5FINTERVAL,
> > >> +       0
> > >> +};
> > >> +
> > >> +static const struct hwmon=5Fchannel=5Finfo occ=5Fchip =3D {
> > >> +       .type =3D hwmon=5Fchip,
> > >> +       .config =3D occ=5Fchip=5Fconfig
> > >> +};
> > >> +
> > >> +static const enum hwmon=5Fsensor=5Ftypes
> > >> occ=5Fsensor=5Ftypes[MAX=5FOCC=5FSENSOR=5FTYPE] =3D {
> > >> +       hwmon=5Fin,
> > >> +       hwmon=5Ftemp,
> > >> +       hwmon=5Fpower,
> > >> +       hwmon=5Fpower
> > >> +};
> > >> +
> > >> +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct =
occ
*occ,
> > >> +                                 const u32 *sensor=5Fhwmon=5Fconfig=
s,
> > >> +                                 const char *name)
> > >> +{
> > >> +       bool master=5Focc =3D false;
> > >> +       int rc, i, j, sensor=5Fnum, index =3D 0, id;
> > >> +       char *brk;
> > >> +       struct occ=5Fblocks *resp =3D NULL;
> > >> +       u32 *sensor=5Fconfig;
> > >> +       struct occ=5Fsysfs *hwmon =3D devm=5Fkzalloc(dev, sizeof(str=
uct
> > >> occ=5Fsysfs),
> > >> +                                              GFP=5FKERNEL);
> > >> +       if (!hwmon)
> > >> +               return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +       /* need space for null-termination and occ chip */
> > >> +       hwmon->occ=5Fsensors =3D
> > >> +               devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5F=
info
*) *
> > >> +                            (MAX=5FOCC=5FSENSOR=5FTYPE + 2), GFP=5F=
KERNEL);
> > >> +       if (!hwmon->occ=5Fsensors)
> > >> +               return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +       hwmon->occ =3D occ;
> > >> +       hwmon->sensor=5Fhwmon=5Fconfigs =3D (u32 *)sensor=5Fhwmon=5F=
configs;
> > >
> > >
> > > Either this is a const or it isn't. If it isn't, it should not be
passed
> > in
> > > as const.
> > > If it is, it can be declared const in struct occ=5Fsysfs.
> >
> > It is const, i'll fix.
> >
> > >
> > >
> > >> +       hwmon->occ=5Finfo.ops =3D &occ=5Fhwmon=5Fops;
> > >> +       hwmon->occ=5Finfo.info =3D
> > >> +               (const struct hwmon=5Fchannel=5Finfo **)hwmon->
occ=5Fsensors;
> > >
> > >
> > > Why is this typecast needed ?
> >
> > struct hwmon=5Fchip=5Finfo {
> >         const struct hwmon=5Fops *ops;
> >         const struct hwmon=5Fchannel=5Finfo **info;
> > };
> >
> > My compiler throws an error without a cast here.
> >
> > occ=5Fsysfs.c:195:23: error: assignment from incompatible pointer type
> > [-Werror=3Dincompatible-pointer-types]
> > |   hwmon->occ=5Finfo.info =3D hwmon->occ=5Fsensors;
> >
> > occ=5Fsensors is not const, as it's dynamically zero-allocated and then
> > if we poll and get a sensor, we allocate a new hwmon=5Fchannel=5Finfo. =
Not
> > sure what the best solution is here except to cast.
> >
>
> Your statement makes me quite concerned. "if we poll and get a sensor, we
> allocate a new hwmon=5Fchannel=5Finfo". Are you doing that before or after
> registering with the hwmon core ? Hopefully before.

All before registration. There is no changing of hwmon attributes after we
probe the driver. But we need the first poll response to allocate the
hwmon=5Fchannel=5Finfo structures and others to match the sensors found in =
the
first poll response.

>
> > >
> > >
> > >> +
> > >> +       occ=5Fget=5Fresponse=5Fblocks(occ, &resp);
> > >> +
> > >> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
> > >> +               resp->sensor=5Fblock=5Fid[i] =3D -1;
> > >> +
> > >> +       /* read sensor data from occ */
> > >> +       rc =3D occ=5Fupdate=5Fdevice(occ);
> > >> +       if (rc) {
> > >> +               dev=5Ferr(dev, "cannot get occ sensor data: %d\n",
rc);
> > >> +               return ERR=5FPTR(rc);
> > >> +       }
> > >> +       if (!resp->blocks)
> > >> +               return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +       master=5Focc =3D resp->sensor=5Fblock=5Fid[CAPS] >=3D 0;
> > >> +
> > >> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; i++) {
> > >> +               id =3D resp->sensor=5Fblock=5Fid[i];
> > >> +               if (id < 0)
> > >> +                       continue;
> > >> +
> > >> +               sensor=5Fnum =3D resp->blocks[id].header.sensor=5Fnu=
m;
> > >> +               /* need null-termination */
> > >> +               sensor=5Fconfig =3D devm=5Fkzalloc(dev,
> > >> +                                            sizeof(u32) *
(sensor=5Fnum +
> > >> 1),
> > >> +                                            GFP=5FKERNEL);
> > >> +               if (!sensor=5Fconfig)
> > >> +                       return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +               for (j =3D 0; j < sensor=5Fnum; j++)
> > >> +                       sensor=5Fconfig[j] =3D sensor=5Fhwmon=5Fconf=
igs[i];
> > >> +
> > >> +               hwmon->occ=5Fsensors[index] =3D
> > >> +                       devm=5Fkzalloc(dev, sizeof(struct
> > >> hwmon=5Fchannel=5Finfo),
> > >> +                                    GFP=5FKERNEL);
> > >> +               if (!hwmon->occ=5Fsensors[index])
> > >> +                       return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +               hwmon->occ=5Fsensors[index]->type =3D occ=5Fsensor=
=5Ftypes
[i];
> > >> +               hwmon->occ=5Fsensors[index]->config =3D sensor=5Fcon=
fig;
> > >> +               index++;
> > >> +       }
> > >
> > >
> > > I had the impression from patch 1 that the number of sensors can
change
> > at
> > > runtime.
> > > If so, this doesn't really work well; the sysfs attributes won't be
> > updated
> > > in this
> > > case.
> > >
> > > Can it really happen that the sensor information can change ?
> >
> > Well, the number of sensors won't change while we are running. But we
> > don't know how many sensors we have when we start up. So this first
> > poll will tell us how many we need and allow the driver to initialize
> > the correct number of hwmon attributes. But yes, it shouldn't change
while
> > we
> > are running.
> >
> I'll have to look into the other patch again. I seem to recall that it
does
> handle changing number of sensors, but I may be wrong.

Yes, the core driver does handle varying sensors. But this was designed
mainly
just to handle the first poll response. The core doesn't know which poll
response is the first, so it made sense to just handle any number of
sensors
each time we poll.

Also, the OCC specification doesn't indicate that the poll
response *must* have the same number of sensors each time it's polled... so
perhaps it may change in some conditions. But the hwmon attributes won't
change.
That's OK for us.

>
> > >
> > >> +
> > >> +       /* only need one of these for any number of occs */
> > >> +       if (master=5Focc)
> > >> +               hwmon->occ=5Fsensors[index] =3D
> > >> +                       (struct hwmon=5Fchannel=5Finfo *)&occ=5Fchip;
> > >
> > >
> > > Why this typecast ?
> >
> > occ=5Fchip is const but my occ=5Fsensors field isn't.
> >
> Hmm .. I'll have to have a closer look. Maybe I need to make the core
fields
> non-const. Having to use typecasts isn't really desirable and defeats the
> purpose.

OK, agreed, thanks.

Eddie

>
> Guenter
>
> > >
> > >
> > >> +
> > >> +       /* search for bad chars */
> > >> +       strncpy(hwmon->hwmon=5Fname, name, OCC=5FHWMON=5FNAME=5FLENG=
TH);
> > >> +       brk =3D strpbrk(hwmon->hwmon=5Fname, "-* \t\n");
> > >> +       while (brk) {
> > >> +               *brk =3D '=5F';
> > >> +               brk =3D strpbrk(brk,  "-* \t\n");
> > >> +       }
> > >> +
> > >> +       hwmon->dev =3D devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finf=
o(dev,
> > >> +
> > >> hwmon->hwmon=5Fname,
> > >> +                                                         hwmon,
> > >> +
> > >> &hwmon->occ=5Finfo,
> > >> +                                                         NULL);
> > >> +       if (IS=5FERR(hwmon->dev)) {
> > >> +               dev=5Ferr(dev, "cannot register hwmon device %s: %ld
\n",
> > >> +                       hwmon->hwmon=5Fname, PTR=5FERR(hwmon->dev));
> > >> +               return ERR=5FCAST(hwmon->dev);
> > >> +       }
> > >> +
> > >> +       return hwmon;
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fsysfs=5Fstart);
> > >> +
> > >> +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
> > >> +MODULE=5FDESCRIPTION("OCC sysfs driver");
> > >> +MODULE=5FLICENSE("GPL");
> > >> diff --git a/drivers/hwmon/occ/occ=5Fsysfs.h
> > b/drivers/hwmon/occ/occ=5Fsysfs.h
> > >> new file mode 100644
> > >> index 0000000..7de92e7
> > >> --- /dev/null
> > >> +++ b/drivers/hwmon/occ/occ=5Fsysfs.h
> > >> @@ -0,0 +1,44 @@
> > >> +/*
> > >> + * occ=5Fsysfs.h - OCC sysfs interface
> > >> + *
> > >> + * This file contains the data structures and function prototypes
for
> > the
> > >> OCC
> > >> + * hwmon sysfs entries.
> > >> + *
> > >> + * Copyright 2016 IBM Corp.
> > >> + *
> > >> + * This program is free software; you can redistribute it and/or
modify
> > >> + * it under the terms of the GNU General Public License as
published by
> > >> + * the Free Software Foundation; either version 2 of the License,
or
> > >> + * (at your option) any later version.
> > >> + *
> > >> + * This program is distributed in the hope that it will be useful,
> > >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > >> + * GNU General Public License for more details.
> > >> + */
> > >> +
> > >> +#ifndef =5F=5FOCC=5FSYSFS=5FH=5F=5F
> > >> +#define =5F=5FOCC=5FSYSFS=5FH=5F=5F
> > >> +
> > >> +#include <linux/hwmon.h>
> > >> +
> > >> +struct occ;
> > >> +struct device;
> > >> +
> > >> +#define OCC=5FHWMON=5FNAME=5FLENGTH  32
> > >> +
> > >> +struct occ=5Fsysfs {
> > >> +       struct device *dev;
> > >> +       struct occ *occ;
> > >> +
> > >> +       char hwmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];
> > >> +       u32 *sensor=5Fhwmon=5Fconfigs;
> > >> +       struct hwmon=5Fchannel=5Finfo **occ=5Fsensors;
> > >> +       struct hwmon=5Fchip=5Finfo occ=5Finfo;
> > >> +       u16 user=5Fpowercap;
> > >> +};
> > >
> > >
> > > Is this information used outside the sysfs code ? If not, it should
be
> > > defined
> > > in the source file and not be available outside of it.
> >
> > OK. It is used in p8=5Focc=5Fi2c.c but none of the members are accessed=
 so
> > we shouldn't need it defined there, just declared, you're right.
> >
> >
> > >
> > >
> > >> +
> > >> +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *dev, struct =
occ
*occ,
> > >> +                                 const u32 *sensor=5Fhwmon=5Fconfig=
s,
> > >> +                                 const char *name);
> > >> +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */
> > >>
> > >
>

--0__=8FBB0A22DFE8861C8f9e8a93df938690918c8FBB0A22DFE8861C
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/23/=
2017 04:15:40 PM:<br>&gt; On Mon, Jan 23, 2017 at 04:01:25PM -0600, Edward =
James wrote:<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; On Sat, Jan 21, 2017 =
at 12:08 PM, Guenter Roeck &lt;linux@roeck-us.net&gt; wrote:<br>&gt; &gt; &=
gt; On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:<br>&gt; &gt; &gt;&=
gt;<br>&gt; &gt; &gt;&gt; From: &quot;Edward A. James&quot; &lt;eajames@us.=
ibm.com&gt;<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Add a generic mecha=
nism to expose the sensors provided by the OCC in<br>&gt; &gt; &gt;&gt; sys=
fs.<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Edward A. Ja=
mes &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Andrew =
Jeffery &lt;andrew@aj.id.au&gt;<br>&gt; &gt; &gt;&gt; ---<br>&gt; &gt; &gt;=
&gt; &nbsp;Documentation/hwmon/occ &nbsp; &nbsp; &nbsp; | &nbsp;62 ++++++++=
++<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/Makefile &nbsp; &nbsp;| &n=
bsp; 2 +-<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.c | 271=
<br>&gt; &gt; &gt;&gt; ++++++++++++++++++++++++++++++++++++++++++<br>&gt; &=
gt; &gt;&gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.h | &nbsp;44 +++++++<br>&g=
t; &gt; &gt;&gt; &nbsp;4 files changed, 378 insertions(+), 1 deletion(-)<br=
>&gt; &gt; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.=
c<br>&gt; &gt; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsy=
sfs.h<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; diff --git a/Documentatio=
n/hwmon/occ b/Documentation/hwmon/occ<br>&gt; &gt; &gt;&gt; index 79d1642..=
d0bdf06 100644<br>&gt; &gt; &gt;&gt; --- a/Documentation/hwmon/occ<br>&gt; =
&gt; &gt;&gt; +++ b/Documentation/hwmon/occ<br>&gt; &gt; &gt;&gt; @@ -25,6 =
+25,68 @@ Currently, all versions of the OCC support four types<br>&gt; &gt=
; &gt;&gt; of sensor data: power,<br>&gt; &gt; &gt;&gt; &nbsp;temperature, =
frequency, and &quot;caps,&quot; which indicate limits and<br>&gt; &gt; thr=
esholds<br>&gt; &gt; &gt;&gt; used<br>&gt; &gt; &gt;&gt; &nbsp;internally o=
n the OCC.<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; +sysfs Entries<br>&g=
t; &gt; &gt;&gt; +-------------<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&g=
t; +The OCC driver uses the hwmon sysfs framework to provide data to<br>&gt=
; &gt; &gt;&gt; userspace.<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +T=
he driver exports a number of sysfs files for each type of sensor. The<br>&=
gt; &gt; &gt;&gt; +sensor-specific files vary depending on the processor ty=
pe, though many<br>&gt; &gt; &gt;&gt; of the<br>&gt; &gt; &gt;&gt; +attribu=
tes are common for both the POWER8 and POWER9.<br>&gt; &gt; &gt;&gt; +<br>&=
gt; &gt; &gt;&gt; +The hwmon interface cannot define every type of sensor t=
hat may be<br>&gt; &gt; used.<br>&gt; &gt; &gt;&gt; +Therefore, the frequen=
cy sensor on the OCC uses the &quot;input&quot; type sensor<br>&gt; &gt; &g=
t;&gt; defined<br>&gt; &gt; &gt;&gt; +by the hwmon interface, rather than d=
efining a new type of custom<br>&gt; &gt; sensor.<br>&gt; &gt; &gt;&gt; +<b=
r>&gt; &gt; &gt;&gt; +Below are detailed the names and meaning of each sens=
or file for both<br>&gt; &gt; &gt;&gt; types of<br>&gt; &gt; &gt;&gt; +proc=
essors. All sensors are read-only unless otherwise specified. &lt;x&gt;<br>=
&gt; &gt; &gt;&gt; indicates<br>&gt; &gt; &gt;&gt; +the hwmon index. sensor=
 id indicates the unique internal OCC identifer.<br>&gt; &gt; &gt;&gt; Plea=
se<br>&gt; &gt; &gt;&gt; +see the POWER OCC specification for details on al=
l these sensor values.<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +frequ=
ency:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; all processors:<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in&lt;x&gt=
;=5Finput - frequency value<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; in&lt;x&gt;=5Flabel - sensor id<br>&gt; &gt; &gt;=
&gt; +temperature:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; POWER8:<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; temp&=
lt;x&gt;=5Finput - temperature value<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; temp&lt;x&gt;=5Flabel - sensor id<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; POWER9 (in addition to above):<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; temp&lt=
;x&gt;=5Ftype - FRU type<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +pow=
er:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; POWER8:<br>&gt; &gt; &gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Finp=
ut - power value<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; power&lt;x&gt;=5Flabel - sensor id<br>&gt; &gt; &gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Faverage - =
accumulator<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; power&lt;x&gt;=5Faverage=5Finterval - update tag (number of<br>&g=
t; &gt; samples<br>&gt; &gt; &gt;&gt; in<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accumula=
tor)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; POWER9:<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fin=
put - power value<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; power&lt;x&gt;=5Flabel - sensor id<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Faverage=
=5Fmin - accumulator[0]<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Faverage=5Fmax - accumulator[1] (64 b=
its total)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; power&lt;x&gt;=5Faverage=5Finterval - update tag<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fre=
set=5Fhistory - (function=5Fid | (apss=5Fchannel &lt;&lt;<br>&gt; &gt; &gt;=
&gt; 8)<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +caps:<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; POWER8:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fcap - current powerca=
p<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
power&lt;x&gt;=5Fcap=5Fmax - max powercap<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Fcap=5Fmin - min po=
wercap<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; power&lt;x&gt;=5Fmax - normal powercap<br>&gt; &gt; &gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt;=5Falarm - user pow=
ercap, r/w<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; POWER9:<br>&gt; &gt=
; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power&lt;x&gt=
;=5Fcap=5Falarm - user powercap source<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt;=
 &gt;&gt; +The driver also provides two sysfs entries through hwmon to bett=
er<br>&gt; &gt; &gt;&gt; +control the driver and monitor the master OCC. Th=
ough there may be<br>&gt; &gt; &gt;&gt; multiple<br>&gt; &gt; &gt;&gt; +OCC=
s present on the system, these two files are only present for the<br>&gt; &=
gt; &gt;&gt; &quot;master&quot;<br>&gt; &gt; &gt;&gt; +OCC.<br>&gt; &gt; &g=
t;&gt; + &nbsp; &nbsp; &nbsp; name - read the name of the driver<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; update=5Finterval - read or write the mi=
nimum interval for polling<br>&gt; &gt; &gt;&gt; the<br>&gt; &gt; &gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OCC.<br>&gt; &gt; &gt;&g=
t; +<br>&gt; &gt; &gt;&gt; &nbsp;BMC - Host Communications<br>&gt; &gt; &gt=
;&gt; &nbsp;-------------------------<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &g=
t;&gt; diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile=
<br>&gt; &gt; &gt;&gt; index 93cb52f..a6881f9 100644<br>&gt; &gt; &gt;&gt; =
--- a/drivers/hwmon/occ/Makefile<br>&gt; &gt; &gt;&gt; +++ b/drivers/hwmon/=
occ/Makefile<br>&gt; &gt; &gt;&gt; @@ -1 +1 @@<br>&gt; &gt; &gt;&gt; -obj-$=
(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o<br>&gt; &gt; &gt;&gt; +obj-$(CONF=
IG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o occ=5Fsysfs.o<br>&gt; &gt; &gt;&gt; di=
ff --git a/drivers/hwmon/occ/occ=5Fsysfs.c<br>&gt; &gt; b/drivers/hwmon/occ=
/occ=5Fsysfs.c<br>&gt; &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &gt;=
&gt; index 0000000..2f20c40<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt=
; &gt;&gt; +++ b/drivers/hwmon/occ/occ=5Fsysfs.c<br>&gt; &gt; &gt;&gt; @@ -=
0,0 +1,271 @@<br>&gt; &gt; &gt;&gt; +/*<br>&gt; &gt; &gt;&gt; + * occ=5Fsys=
fs.c - OCC sysfs interface<br>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; =
+ * This file contains the methods and data structures for implementing<br>=
&gt; &gt; &gt;&gt; the OCC<br>&gt; &gt; &gt;&gt; + * hwmon sysfs entries.<b=
r>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * Copyright 2016 IBM Corp.=
<br>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is free s=
oftware; you can redistribute it and/or modify<br>&gt; &gt; &gt;&gt; + * it=
 under the terms of the GNU General Public License as published by<br>&gt; =
&gt; &gt;&gt; + * the Free Software Foundation; either version 2 of the Lic=
ense, or<br>&gt; &gt; &gt;&gt; + * (at your option) any later version.<br>&=
gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is distributed=
 in the hope that it will be useful,<br>&gt; &gt; &gt;&gt; + * but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br>&gt; &gt; &gt;&gt; + =
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<br>&gt; &gt;=
 &gt;&gt; + * GNU General Public License for more details.<br>&gt; &gt; &gt=
;&gt; + */<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#include &lt;linu=
x/delay.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/device.h&gt;<br>&gt=
; &gt; &gt;&gt; +#include &lt;linux/err.h&gt;<br>&gt; &gt; &gt;&gt; +#inclu=
de &lt;linux/hwmon.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/hwmon-sy=
sfs.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/init.h&gt;<br>&gt; &gt;=
 &gt;&gt; +#include &lt;linux/jiffies.h&gt;<br>&gt; &gt; &gt;&gt; +#include=
 &lt;linux/kernel.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/module.h&=
gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/mutex.h&gt;<br>&gt; &gt; &gt;=
&gt; +#include &lt;linux/slab.h&gt;<br>&gt; &gt; &gt;&gt; +#include &quot;o=
cc.h&quot;<br>&gt; &gt; &gt;&gt; +#include &quot;occ=5Fsysfs.h&quot;<br>&gt=
; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#define RESP=5FRETURN=5FCMD=5FINVA=
L &nbsp;0x13<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static int occ=
=5Fhwmon=5Fread(struct device *dev, enum hwmon=5Fsensor=5Ftypes<br>&gt; &gt=
; &gt;&gt; type,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 attr, int channel, lo=
ng *val)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; int rc =3D 0;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Unn=
ecessary initialization.<br>&gt; &gt; <br>&gt; &gt; Got it.<br>&gt; &gt; <b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ *occ =3D driver-&gt;occ;<br>&gt;=
 &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; switch (type)=
 {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fin:<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D occ=
=5Fget=5Fsensor=5Fvalue(occ, FREQ, channel, attr,<br>&gt; &gt; val);<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Ftemp:<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D occ=5Fg=
et=5Fsensor=5Fvalue(occ, TEMP, channel, attr,<br>&gt; &gt; val);<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fpower:<br>&gt; &gt; &g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D occ=5Fget=
=5Fsensor=5Fvalue(occ, POWER, channel, attr,<br>&gt; &gt; val);<br>&gt; &gt=
; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; default:<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EOPNOTSUPP;<br>&gt; &=
gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;<br>&gt; &gt; &gt;&gt; +}<br>&gt;=
 &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static int occ=5Fhwmon=5Fread=5Fstr=
ing(struct device *dev,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum hwmon=5Fsensor=5Ftypes type, u32 attr,<br>&gt; &gt; &gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int channel, char **str)<br>&gt; &gt;=
 &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int rc;<br>&gt; &=
gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; unsigned long val =3D 0;<br>&gt; &gt; &=
gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!((type =3D=3D h=
wmon=5Fin &amp;&amp; attr =3D=3D hwmon=5Fin=5Flabel) ||<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (type =3D=3D hwmon=5Ftemp &amp;&amp=
; attr =3D=3D hwmon=5Ftemp=5Flabel) ||<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; (type =3D=3D hwmon=5Fpower &amp;&amp; attr =3D=3D hw=
mon=5Fpower=5Flabel)))<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; return -EOPNOTSUPP;<br>&gt; &gt; &gt;&gt; +<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fhwmon=5Fread(dev, type, att=
r, channel, &amp;val);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc =
&lt; 0)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; return rc;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; rc =3D snprintf(*str, PAGE=5FSIZE - 1, &quot;%ld&quot;, val);<br=
>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; val is unsigned long.<b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt; I am quite confused what this is for, th=
ough. The function is used for<br>&gt; &gt; &gt; string attributes,<br>&gt;=
 &gt; &gt; or in other words for labels. What is the benefit of having a la=
bel that<br>&gt; &gt; &gt; returns the same<br>&gt; &gt; &gt; data as the v=
alue attribute ? Is this maybe a misunderstanding ?<br>&gt; &gt; <br>&gt; &=
gt; So this does work, though I admit it's a bit confusing.<br>&gt; &gt; oc=
c=5Fget=5Fsensor=5Fvalue returns either the value or the occ sensor id<br>&=
gt; &gt; depending on the &quot;type&quot; passed in. I'll rename occ=5Fget=
=5Fsensor=5Fvalue<br>&gt; &gt; and add a comment.<br>&gt; &gt; <br>&gt; &gt=
; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc &gt; 0)<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0;<=
br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return=
 rc;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;=
 +static int occ=5Fhwmon=5Fwrite(struct device *dev, enum hwmon=5Fsensor=5F=
types<br>&gt; &gt; &gt;&gt; type,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u3=
2 attr, int channel, long val)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; int rc =3D 0;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbs=
p; &nbsp; struct occ=5Fsysfs *driver =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; =
&gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (type =3D=
=3D hwmon=5Fchip &amp;&amp; attr =3D=3D hwmon=5Fchip=5Fupdate=5Finterval) {=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; o=
cc=5Fset=5Fupdate=5Finterval(driver-&gt;occ, val);<br>&gt; &gt; &gt;<br>&gt=
; &gt; &gt;<br>&gt; &gt; &gt; As mentioned in the other patch, please drop.=
 This is not the intended<br>&gt; &gt; use<br>&gt; &gt; &gt; case<br>&gt; &=
gt; &gt; for this attribute.<br>&gt; &gt; <br>&gt; &gt; OK.<br>&gt; &gt; <b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; } else if (type =3D=3D hwmon=5Fpower &amp;&amp; attr =3D=3D hw=
mon=5Fpower=5Falarm) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; rc =3D occ=5Fset=5Fuser=5Fpowercap(driver-&gt;occ, val=
);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 if (rc) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (rc =3D=3D RESP=5FRETURN=5FCMD=5FIN=
VAL) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev,=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &quot;set invalid powercap value:<br>&gt; &gt; &gt;&gt; %ld\n&quot;=
,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; val);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 -EINVAL;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; dev=5Ferr(dev, &quot;set user powercap failed: 0x:%x<br>&gt; &=
gt; \n&quot;,<br>&gt; &gt; &gt;&gt; rc);<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return r=
c;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; driver-&gt;user=5Fpowercap =3D val;<br>&gt; &gt; &=
gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return rc;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &=
gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return -EOPNOTS=
UPP;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;=
 +static umode=5Ft occ=5Fis=5Fvisible(const void *data, enum hwmon=5Fsensor=
=5Ftypes<br>&gt; &gt; &gt;&gt; type,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; u32 attr, int channel)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&=
gt; + &nbsp; &nbsp; &nbsp; const struct occ=5Fsysfs *driver =3D data;<br>&g=
t; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; switch (typ=
e) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fchip:<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (attr=
 =3D=3D hwmon=5Fchip=5Fupdate=5Finterval)<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return =
S=5FIRUGO | S=5FIWUSR;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; ca=
se hwmon=5Fin:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; if (BIT(attr) &amp; driver-&gt;sensor=5Fhwmon=5Fconfigs[0])<br=
>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; return S=5FIRUGO;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; &gt;&gt; + &nbs=
p; &nbsp; &nbsp; case hwmon=5Ftemp:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (BIT(attr) &amp; driver-&gt;sensor=5Fh=
wmon=5Fconfigs[1])<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return S=5FIRUGO;<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case hwmon=5Fpower:<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* user power limit=
 */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; if (attr =3D=3D hwmon=5Fpower=5Falarm)<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return S=
=5FIRUGO | S=5FIWUSR;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; else if ((BIT(attr) &amp; driver-&gt;sensor=5Fhwmon=5Fc=
onfigs[2])<br>&gt; &gt; ||<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(BIT(attr) &amp;=
 driver-&gt;sensor=5Fhwmon=5Fconfigs[3]))<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return =
S=5FIRUGO;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; break;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; default:<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return =
0;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Might as well use =
break; here for consistency.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; return 0;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &=
gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static const struct hwmon=5Fops occ=
=5Fhwmon=5Fops =3D {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; .is=5Fvis=
ible =3D occ=5Fis=5Fvisible,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; .=
read =3D occ=5Fhwmon=5Fread,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; .=
read=5Fstring =3D occ=5Fhwmon=5Fread=5Fstring,<br>&gt; &gt; &gt;&gt; + &nbs=
p; &nbsp; &nbsp; .write =3D occ=5Fhwmon=5Fwrite,<br>&gt; &gt; &gt;&gt; +};<=
br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static const u32 occ=5Fchip=
=5Fconfig[] =3D {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; HWMON=5FC=5F=
UPDATE=5FINTERVAL,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; 0<br>&gt; &=
gt; &gt;&gt; +};<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static cons=
t struct hwmon=5Fchannel=5Finfo occ=5Fchip =3D {<br>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; .type =3D hwmon=5Fchip,<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; .config =3D occ=5Fchip=5Fconfig<br>&gt; &gt; &gt;&gt; +};<br>&=
gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static const enum hwmon=5Fsensor=
=5Ftypes<br>&gt; &gt; &gt;&gt; occ=5Fsensor=5Ftypes[MAX=5FOCC=5FSENSOR=5FTY=
PE] =3D {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon=5Fin,<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon=5Ftemp,<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; hwmon=5Fpower,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; hwmon=5Fpower<br>&gt; &gt; &gt;&gt; +};<br>&gt; &gt; &gt;&gt; +<br>&g=
t; &gt; &gt;&gt; +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct device *de=
v, struct occ *occ,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; const u32 *sensor=5Fhwmon=5Fconfigs,<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; const char *name)<br>&gt; &gt; &gt;&gt; +{<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; bool master=5Focc =3D false;<br>&=
gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int rc, i, j, sensor=5Fnum, index =
=3D 0, id;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; char *brk;<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fblocks *resp =3D NULL;<br=
>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u32 *sensor=5Fconfig;<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsysfs *hwmon =3D devm=5Fkza=
lloc(dev, sizeof(struct<br>&gt; &gt; &gt;&gt; occ=5Fsysfs),<br>&gt; &gt; &g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; if (!hwmon)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; &gt;&gt; +<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* need space for null-termination and o=
cc chip */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsen=
sors =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; devm=5Fkzalloc(dev, sizeof(struct hwmon=5Fchannel=5Finfo *) *<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(MAX=5FOCC=5FSENSOR=5FTYPE + 2), GF=
P=5FKERNEL);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!hwmon-&gt;oc=
c=5Fsensors)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ =3D occ;<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; hwmon-&gt;sensor=5Fhwmon=5Fconfigs =3D (u32 *)sens=
or=5Fhwmon=5Fconfigs;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;=
 Either this is a const or it isn't. If it isn't, it should not be passed<b=
r>&gt; &gt; in<br>&gt; &gt; &gt; as const.<br>&gt; &gt; &gt; If it is, it c=
an be declared const in struct occ=5Fsysfs.<br>&gt; &gt; <br>&gt; &gt; It i=
s const, i'll fix.<br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Finfo.ops =3D &amp;oc=
c=5Fhwmon=5Fops;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=
=5Finfo.info =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; (const struct hwmon=5Fchannel=5Finfo **)hwmon-&gt;occ=5Fsens=
ors;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Why is this type=
cast needed ?<br>&gt; &gt; <br>&gt; &gt; struct hwmon=5Fchip=5Finfo {<br>&g=
t; &gt; &nbsp; &nbsp; &nbsp; &nbsp; const struct hwmon=5Fops *ops;<br>&gt; =
&gt; &nbsp; &nbsp; &nbsp; &nbsp; const struct hwmon=5Fchannel=5Finfo **info=
;<br>&gt; &gt; };<br>&gt; &gt; <br>&gt; &gt; My compiler throws an error wi=
thout a cast here.<br>&gt; &gt; <br>&gt; &gt; occ=5Fsysfs.c:195:23: error: =
assignment from incompatible pointer type<br>&gt; &gt; [-Werror=3Dincompati=
ble-pointer-types]<br>&gt; &gt; | &nbsp; hwmon-&gt;occ=5Finfo.info =3D hwmo=
n-&gt;occ=5Fsensors;<br>&gt; &gt; <br>&gt; &gt; occ=5Fsensors is not const,=
 as it's dynamically zero-allocated and then<br>&gt; &gt; if we poll and ge=
t a sensor, we allocate a new hwmon=5Fchannel=5Finfo. Not<br>&gt; &gt; sure=
 what the best solution is here except to cast.<br>&gt; &gt; <br>&gt; <br>&=
gt; Your statement makes me quite concerned. &quot;if we poll and get a sen=
sor, we<br>&gt; allocate a new hwmon=5Fchannel=5Finfo&quot;. Are you doing =
that before or after<br>&gt; registering with the hwmon core ? Hopefully be=
fore.</tt><br><br><tt>All before registration. There is no changing of hwmo=
n attributes after we</tt><br><tt>probe the driver. But we need the first p=
oll response to allocate the</tt><br><tt>hwmon=5Fchannel=5Finfo structures =
and others to match the sensors found in the</tt><br><tt>first poll respons=
e.</tt><br><tt><br>&gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &=
gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; occ=5Fget=5Fresponse=
=5Fblocks(occ, &amp;resp);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; ++i)<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; res=
p-&gt;sensor=5Fblock=5Fid[i] =3D -1;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; /* read sensor data from occ */<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fupdate=5Fdevice(occ);<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc) {<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;cannot g=
et occ sensor data: %d\n&quot;, rc);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(rc);<br>&gt; &gt; &gt;&=
gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; i=
f (!resp-&gt;blocks)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; &gt;&gt; +<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; master=5Focc =3D resp-&gt;sensor=5F=
block=5Fid[CAPS] &gt;=3D 0;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +=
 &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=5FTYPE; i++) =
{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
id =3D resp-&gt;sensor=5Fblock=5Fid[i];<br>&gt; &gt; &gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (id &lt; 0)<br>&gt; &gt; &gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; continue;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fnum =3D resp-&gt;blocks[id].he=
ader.sensor=5Fnum;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; /* need null-termination */<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Fconfig =3D devm=5Fkzall=
oc(dev,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(u32) * (sensor=5Fnum +<br>&gt; &g=
t; &gt;&gt; 1),<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!sensor=5Fconfi=
g)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; &gt;&g=
t; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; for (j =3D 0; j &lt; sensor=5Fnum; j++)<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=
=5Fconfig[j] =3D sensor=5Fhwmon=5Fconfigs[i];<br>&gt; &gt; &gt;&gt; +<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmon-&=
gt;occ=5Fsensors[index] =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; devm=5Fkzalloc(dev, s=
izeof(struct<br>&gt; &gt; &gt;&gt; hwmon=5Fchannel=5Finfo),<br>&gt; &gt; &g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if =
(!hwmon-&gt;occ=5Fsensors[index])<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ERR=5FPT=
R(-ENOMEM);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsensors[index]-&gt;type =
=3D occ=5Fsensor=5Ftypes[i];<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsensors[index]-&gt;config =3D se=
nsor=5Fconfig;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; index++;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt=
; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; I had the impression from p=
atch 1 that the number of sensors can change<br>&gt; &gt; at<br>&gt; &gt; &=
gt; runtime.<br>&gt; &gt; &gt; If so, this doesn't really work well; the sy=
sfs attributes won't be<br>&gt; &gt; updated<br>&gt; &gt; &gt; in this<br>&=
gt; &gt; &gt; case.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Can it really happe=
n that the sensor information can change ?<br>&gt; &gt; <br>&gt; &gt; Well,=
 the number of sensors won't change while we are running. But we<br>&gt; &g=
t; don't know how many sensors we have when we start up. So this first<br>&=
gt; &gt; poll will tell us how many we need and allow the driver to initial=
ize<br>&gt; &gt; the correct number of hwmon attributes. But yes, it should=
n't change while<br>&gt; &gt; we<br>&gt; &gt; are running.<br>&gt; &gt; <br=
>&gt; I'll have to look into the other patch again. I seem to recall that i=
t does<br>&gt; handle changing number of sensors, but I may be wrong.</tt><=
br><br><tt>Yes, the core driver does handle varying sensors. But this was d=
esigned mainly</tt><br><tt>just to handle the first poll response. The core=
 doesn't know which poll</tt><br><tt>response is the first, so it made sens=
e to just handle any number of sensors</tt><br><tt>each time we poll.</tt><=
br><br><tt>Also, the OCC specification doesn't indicate that the poll</tt><=
br><tt>response *must* have the same number of sensors each time it's polle=
d... so</tt><br><tt>perhaps it may change in some conditions. But the hwmon=
 attributes won't change.</tt><br><tt>That's OK for us.</tt><br><tt><br>&gt=
; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; /* only need one of these for any number of occs */<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (master=5Focc)<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmon-&gt;occ=5Fsensor=
s[index] =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (struct hwmon=5Fchannel=5Finfo *)&am=
p;occ=5Fchip;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Why thi=
s typecast ?<br>&gt; &gt; <br>&gt; &gt; occ=5Fchip is const but my occ=5Fse=
nsors field isn't.<br>&gt; &gt; <br>&gt; Hmm .. I'll have to have a closer =
look. Maybe I need to make the core fields<br>&gt; non-const. Having to use=
 typecasts isn't really desirable and defeats the<br>&gt; purpose.</tt><br>=
<br><tt>OK, agreed, thanks.</tt><br><br><tt>Eddie</tt><br><tt><br>&gt; <br>=
&gt; Guenter<br>&gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;=
&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* search for bad chars=
 */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; strncpy(hwmon-&gt;hwmon=5F=
name, name, OCC=5FHWMON=5FNAME=5FLENGTH);<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; brk =3D strpbrk(hwmon-&gt;hwmon=5Fname, &quot;-* \t\n&quot;);<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; while (brk) {<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *brk =3D '=5F';<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; brk =
=3D strpbrk(brk, &nbsp;&quot;-* \t\n&quot;);<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; hwmon-&gt;dev =3D devm=5Fhwmon=5Fdevice=5Fregister=5Fwith=5Finfo=
(dev,<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; hwmon-&gt;hwmon=5Fname,=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwmo=
n,<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; &amp;hwmon-&gt;occ=5Finfo,=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL=
);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (IS=5FERR(hwmon-&gt;dev)=
) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; dev=5Ferr(dev, &quot;cannot register hwmon device %s: %ld\n&quot;,<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; hwmon-&gt;hwmon=5Fname, PTR=5FERR(hwmon-&gt;dev));<br>&=
gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 ERR=5FCAST(hwmon-&gt;dev);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<=
br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return=
 hwmon;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +EXPORT=5FSYMBOL(occ=
=5Fsysfs=5Fstart);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +MODULE=5F=
AUTHOR(&quot;Eddie James &lt;eajames@us.ibm.com&gt;&quot;);<br>&gt; &gt; &g=
t;&gt; +MODULE=5FDESCRIPTION(&quot;OCC sysfs driver&quot;);<br>&gt; &gt; &g=
t;&gt; +MODULE=5FLICENSE(&quot;GPL&quot;);<br>&gt; &gt; &gt;&gt; diff --git=
 a/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; b/drivers/hwmon/occ/occ=5Fs=
ysfs.h<br>&gt; &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &gt;&gt; ind=
ex 0000000..7de92e7<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt; &gt;&g=
t; +++ b/drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &gt; &gt;&gt; @@ -0,0 +1,4=
4 @@<br>&gt; &gt; &gt;&gt; +/*<br>&gt; &gt; &gt;&gt; + * occ=5Fsysfs.h - OC=
C sysfs interface<br>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This =
file contains the data structures and function prototypes for<br>&gt; &gt; =
the<br>&gt; &gt; &gt;&gt; OCC<br>&gt; &gt; &gt;&gt; + * hwmon sysfs entries=
.<br>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * Copyright 2016 IBM Co=
rp.<br>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is fre=
e software; you can redistribute it and/or modify<br>&gt; &gt; &gt;&gt; + *=
 it under the terms of the GNU General Public License as published by<br>&g=
t; &gt; &gt;&gt; + * the Free Software Foundation; either version 2 of the =
License, or<br>&gt; &gt; &gt;&gt; + * (at your option) any later version.<b=
r>&gt; &gt; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is distribu=
ted in the hope that it will be useful,<br>&gt; &gt; &gt;&gt; + * but WITHO=
UT ANY WARRANTY; without even the implied warranty of<br>&gt; &gt; &gt;&gt;=
 + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<br>&gt; &=
gt; &gt;&gt; + * GNU General Public License for more details.<br>&gt; &gt; =
&gt;&gt; + */<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#ifndef =5F=5F=
OCC=5FSYSFS=5FH=5F=5F<br>&gt; &gt; &gt;&gt; +#define =5F=5FOCC=5FSYSFS=5FH=
=5F=5F<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#include &lt;linux/hw=
mon.h&gt;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +struct occ;<br>&gt=
; &gt; &gt;&gt; +struct device;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&g=
t; +#define OCC=5FHWMON=5FNAME=5FLENGTH &nbsp;32<br>&gt; &gt; &gt;&gt; +<br=
>&gt; &gt; &gt;&gt; +struct occ=5Fsysfs {<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; struct device *dev;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; struct occ *occ;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; char hwmon=5Fname[OCC=5FHWMON=5FNAME=5FLENGTH + 1];<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; u32 *sensor=5Fhwmon=5Fconfigs;<br>&gt; &=
gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct hwmon=5Fchannel=5Finfo **occ=5Fs=
ensors;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct hwmon=5Fchip=5F=
info occ=5Finfo;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u16 user=5Fpo=
wercap;<br>&gt; &gt; &gt;&gt; +};<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&g=
t; &gt; &gt; Is this information used outside the sysfs code ? If not, it s=
hould be<br>&gt; &gt; &gt; defined<br>&gt; &gt; &gt; in the source file and=
 not be available outside of it.<br>&gt; &gt; <br>&gt; &gt; OK. It is used =
in p8=5Focc=5Fi2c.c but none of the members are accessed so<br>&gt; &gt; we=
 shouldn't need it defined there, just declared, you're right.<br>&gt; &gt;=
 <br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; +=
<br>&gt; &gt; &gt;&gt; +struct occ=5Fsysfs *occ=5Fsysfs=5Fstart(struct devi=
ce *dev, struct occ *occ,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; const u32 *sensor=5Fhwmon=5Fconfigs,<br>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const char *name);<br>&gt; &gt; &gt;&gt;=
 +#endif /* =5F=5FOCC=5FSYSFS=5FH=5F=5F */<br>&gt; &gt; &gt;&gt;<br>&gt; &g=
t; &gt;<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A22DFE8861C8f9e8a93df938690918c8FBB0A22DFE8861C--
