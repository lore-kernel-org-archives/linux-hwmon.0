Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <4f99007f-b1bc-fdc5-fef5-f494fc3c3922@roeck-us.net>
Subject: Re: [PATCH linux v3 4/6] hwmon: occ: Add callbacks for parsing P8 OCC
 datastructures
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 17:48:26 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-5-git-send-email-eajames.ibm@gmail.com>
 <4f99007f-b1bc-fdc5-fef5-f494fc3c3922@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DF1186A78f9e8a93df938690918c8FBB0A22DF1186A7"
Content-Disposition: inline
Message-Id: <OFA61FDC59.31C025C4-ON002580B1.00820037-862580B1.0082C71B@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DF1186A78f9e8a93df938690918c8FBB0A22DF1186A7
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Guenter Roeck <linux@roeck-us.net> wrote on 01/21/2017 12:18:23 PM:
> On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> >
> > Add functions to parse the data structures that are specific to the OCC
on
> > the POWER8 processor. These are the sensor data structures, including
> > temperature, frequency, power, and "caps."
> >
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/hwmon/occ    |   9 ++
> >  drivers/hwmon/occ/occ=5Fp8.c | 247 ++++++++++++++++++++++++++++++++
> +++++++++++++
> >  drivers/hwmon/occ/occ=5Fp8.h |  30 ++++++
> >  3 files changed, 286 insertions(+)
> >  create mode 100644 drivers/hwmon/occ/occ=5Fp8.c
> >  create mode 100644 drivers/hwmon/occ/occ=5Fp8.h
> >
> > diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> > index d0bdf06..143951e 100644
> > --- a/Documentation/hwmon/occ
> > +++ b/Documentation/hwmon/occ
> > @@ -25,6 +25,15 @@ Currently, all versions of the OCC support four
> types of sensor data: power,
> >  temperature, frequency, and "caps," which indicate limits and
> thresholds used
> >  internally on the OCC.
> >
> > +The format for the POWER8 OCC sensor data can be found in the P8 OCC
> > +specification:
> >
+github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfaces=
.pdf
> > +This document provides the details of the OCC sensors: power,
frequency,
> > +temperature, and caps. These sensor formats are specific to the
> POWER8 OCC. A
> > +number of data structures, such as command format, response
> headers, and the
> > +like, are also defined in this specification, and are common to
> both POWER8 and
> > +POWER9 OCCs.
> > +
> >  sysfs Entries
> >  -------------
> >
> > diff --git a/drivers/hwmon/occ/occ=5Fp8.c b/drivers/hwmon/occ/occ=5Fp8.c
> > new file mode 100644
> > index 0000000..32215ed
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fp8.c
> > @@ -0,0 +1,247 @@
> > +/*
> > + * occ=5Fp8.c - OCC hwmon driver
> > + *
> > + * This file contains the Power8-specific methods and data structures
for
> > + * the OCC hwmon driver.
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
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <asm/unaligned.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform=5Fdevice.h>
> > +#include <linux/slab.h>
> > +#include "occ.h"
> > +#include "occ=5Fp8.h"
> > +
> > +/* P8 OCC sensor data format */
> > +struct p8=5Focc=5Fsensor {
> > +   u16 sensor=5Fid;
> > +   u16 value;
> > +};
> > +
> > +struct p8=5Fpower=5Fsensor {
> > +   u16 sensor=5Fid;
> > +   u32 update=5Ftag;
> > +   u32 accumulator;
> > +   u16 value;
> > +};
> > +
> > +struct p8=5Fcaps=5Fsensor {
> > +   u16 curr=5Fpowercap;
> > +   u16 curr=5Fpowerreading;
> > +   u16 norm=5Fpowercap;
> > +   u16 max=5Fpowercap;
> > +   u16 min=5Fpowercap;
> > +   u16 user=5Fpowerlimit;
> > +};
> > +
> > +static const u32 p8=5Fsensor=5Fhwmon=5Fconfigs[MAX=5FOCC=5FSENSOR=5FTY=
PE] =3D {
> > +   HWMON=5FI=5FINPUT | HWMON=5FI=5FLABEL,   /* freq: value | label */
> > +   HWMON=5FT=5FINPUT | HWMON=5FT=5FLABEL,   /* temp: value | label */
> > +   /* power: value | label | accumulator | update=5Ftag */
> > +   HWMON=5FP=5FINPUT | HWMON=5FP=5FLABEL | HWMON=5FP=5FAVERAGE |
> > +      HWMON=5FP=5FAVERAGE=5FINTERVAL,
> > +   /* caps: curr | max | min | norm | user */
> > +   HWMON=5FP=5FCAP | HWMON=5FP=5FCAP=5FMAX | HWMON=5FP=5FCAP=5FMIN | H=
WMON=5FP=5FMAX |
> > +      HWMON=5FP=5FALARM,
> > +};
> > +
> > +void p8=5Fparse=5Fsensor(u8 *data, void *sensor, int sensor=5Ftype, in=
t off,
> > +           int snum)
> > +{
> > +   switch (sensor=5Ftype) {
> > +   case FREQ:
> > +   case TEMP:
> > +   {
> > +      struct p8=5Focc=5Fsensor *os =3D
> > +         &(((struct p8=5Focc=5Fsensor *)sensor)[snum]);
> > +
> > +      os->sensor=5Fid =3D be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data=
[off]));
> > +      os->value =3D be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off +=
 2]));
> > +   }
> > +      break;
> > +   case POWER:
> > +   {
> > +      struct p8=5Fpower=5Fsensor *ps =3D
> > +         &(((struct p8=5Fpower=5Fsensor *)sensor)[snum]);
> > +
> > +      ps->sensor=5Fid =3D be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data=
[off]));
> > +      ps->update=5Ftag =3D
> > +         be32=5Fto=5Fcpu(get=5Funaligned((u32 *)&data[off + 2]));
> > +      ps->accumulator =3D
> > +         be32=5Fto=5Fcpu(get=5Funaligned((u32 *)&data[off + 6]));
> > +      ps->value =3D be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off +=
 10]));
> > +   }
> > +      break;
> > +   case CAPS:
> > +   {
> > +      struct p8=5Fcaps=5Fsensor *cs =3D
> > +         &(((struct p8=5Fcaps=5Fsensor *)sensor)[snum]);
> > +
> > +      cs->curr=5Fpowercap =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off]));
> > +      cs->curr=5Fpowerreading =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off + 2]));
> > +      cs->norm=5Fpowercap =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off + 4]));
> > +      cs->max=5Fpowercap =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off + 6]));
> > +      cs->min=5Fpowercap =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off + 8]));
> > +      cs->user=5Fpowerlimit =3D
> > +         be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&data[off + 10]));
> > +   }
> > +      break;
> > +   };
> > +}
> > +
> > +void *p8=5Falloc=5Fsensor(int sensor=5Ftype, int num=5Fsensors)
> > +{
> > +   switch (sensor=5Ftype) {
> > +   case FREQ:
> > +   case TEMP:
> > +      return kcalloc(num=5Fsensors, sizeof(struct p8=5Focc=5Fsensor),
> > +                GFP=5FKERNEL);
> > +   case POWER:
> > +      return kcalloc(num=5Fsensors, sizeof(struct p8=5Fpower=5Fsensor),
> > +                GFP=5FKERNEL);
> > +   case CAPS:
> > +      return kcalloc(num=5Fsensors, sizeof(struct p8=5Fcaps=5Fsensor),
> > +                GFP=5FKERNEL);
> > +   default:
> > +      return NULL;
> > +   }
> > +}
> > +
> > +int p8=5Fget=5Fsensor(struct occ *driver, int sensor=5Ftype, int senso=
r=5Fnum,
> > +        u32 hwmon, long *val)
> > +{
> > +   int rc =3D 0;
> > +   void *sensor;
> > +
> > +   if (sensor=5Ftype =3D=3D POWER) {
> > +      if (hwmon =3D=3D hwmon=5Fpower=5Fcap || hwmon =3D=3D hwmon=5Fpow=
er=5Fcap=5Fmax ||
> > +          hwmon =3D=3D hwmon=5Fpower=5Fcap=5Fmin || hwmon =3D=3D hwmon=
=5Fpower=5Fmax ||
> > +          hwmon =3D=3D hwmon=5Fpower=5Falarm)
> > +         sensor=5Ftype =3D CAPS;
> > +   }
> > +
> > +   sensor =3D occ=5Fget=5Fsensor(driver, sensor=5Ftype);
> > +   if (!sensor)
> > +      return -ENODEV;
> > +
> > +   switch (sensor=5Ftype) {
> > +   case FREQ:
> > +   case TEMP:
> > +   {
> > +      struct p8=5Focc=5Fsensor *os =3D
> > +         &(((struct p8=5Focc=5Fsensor *)sensor)[sensor=5Fnum]);
> > +
> > +      if (hwmon =3D=3D hwmon=5Fin=5Finput || hwmon =3D=3D hwmon=5Ftemp=
=5Finput)
> > +         *val =3D os->value;
> > +      else if (hwmon =3D=3D hwmon=5Fin=5Flabel || hwmon =3D=3D hwmon=
=5Ftemp=5Flabel)
> > +         *val =3D os->sensor=5Fid;
>
> Guess that explains the numeric labels I wondered about earlier. Are
> you really sure
> you want to have such numbered labels, ie temp1=5Flabel =3D "1" and so
> on ? Your call,
> really, just wondering.

Yes, that is our requirement I think. They aren't just arbitrary numbers,
the sensor=5Fid is read off the OCC. It corresponds to some identifier that
users can look up on our side with the OCC documentation. It is pretty
meaningless in the driver though, agreed. But it's system-specific, so
without a bunch of tables stored in the driver, not sure what else we
could do.

Thanks,

Eddie

>
> > +      else
> > +         rc =3D -EOPNOTSUPP;
> > +   }
> > +      break;
> > +   case POWER:
> > +   {
> > +      struct p8=5Fpower=5Fsensor *ps =3D
> > +         &(((struct p8=5Fpower=5Fsensor *)sensor)[sensor=5Fnum]);
> > +
> > +      switch (hwmon) {
> > +      case hwmon=5Fpower=5Finput:
> > +         *val =3D ps->value;
> > +         break;
> > +      case hwmon=5Fpower=5Flabel:
> > +         *val =3D ps->sensor=5Fid;
> > +         break;
> > +      case hwmon=5Fpower=5Faverage:
> > +         *val =3D ps->accumulator;
> > +         break;
> > +      case hwmon=5Fpower=5Faverage=5Finterval:
> > +         *val =3D ps->update=5Ftag;
> > +         break;
> > +      default:
> > +         rc =3D -EOPNOTSUPP;
> > +      }
> > +   }
> > +      break;
> > +   case CAPS:
> > +   {
> > +      struct p8=5Fcaps=5Fsensor *cs =3D
> > +         &(((struct p8=5Fcaps=5Fsensor *)sensor)[sensor=5Fnum]);
> > +
> > +      switch (hwmon) {
> > +      case hwmon=5Fpower=5Fcap:
> > +         *val =3D cs->curr=5Fpowercap;
> > +         break;
> > +      case hwmon=5Fpower=5Fcap=5Fmax:
> > +         *val =3D cs->max=5Fpowercap;
> > +         break;
> > +      case hwmon=5Fpower=5Fcap=5Fmin:
> > +         *val =3D cs->min=5Fpowercap;
> > +         break;
> > +      case hwmon=5Fpower=5Fmax:
> > +         *val =3D cs->norm=5Fpowercap;
> > +         break;
> > +      case hwmon=5Fpower=5Falarm:
> > +         *val =3D cs->user=5Fpowerlimit;
> > +         break;
> > +      default:
> > +         rc =3D -EOPNOTSUPP;
> > +      }
> > +   }
> > +      break;
> > +   default:
> > +      rc =3D -EINVAL;
> > +   }
> > +
> > +   return rc;
> > +}
> > +
> > +static const struct occ=5Fops p8=5Fops =3D {
> > +   .parse=5Fsensor =3D p8=5Fparse=5Fsensor,
> > +   .alloc=5Fsensor =3D p8=5Falloc=5Fsensor,
> > +   .get=5Fsensor =3D p8=5Fget=5Fsensor,
> > +};
> > +
> > +static const struct occ=5Fconfig p8=5Fconfig =3D {
> > +   .command=5Faddr =3D 0xFFFF6000,
> > +   .response=5Faddr =3D 0xFFFF7000,
> > +};
> > +
> > +const u32 *p8=5Fget=5Fsensor=5Fhwmon=5Fconfigs()
> > +{
> > +   return p8=5Fsensor=5Fhwmon=5Fconfigs;
> > +}
> > +EXPORT=5FSYMBOL(p8=5Fget=5Fsensor=5Fhwmon=5Fconfigs);
> > +
> > +struct occ *p8=5Focc=5Fstart(struct device *dev, void *bus,
> > +          struct occ=5Fbus=5Fops *bus=5Fops)
> > +{
> > +   return occ=5Fstart(dev, bus, bus=5Fops, &p8=5Fops, &p8=5Fconfig);
> > +}
> > +EXPORT=5FSYMBOL(p8=5Focc=5Fstart);
> > +
> > +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE=5FDESCRIPTION("P8 OCC sensors");
> > +MODULE=5FLICENSE("GPL");
> > diff --git a/drivers/hwmon/occ/occ=5Fp8.h b/drivers/hwmon/occ/occ=5Fp8.h
> > new file mode 100644
> > index 0000000..3fe6417
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fp8.h
> > @@ -0,0 +1,30 @@
> > +/*
> > + * occ=5Fp8.h - OCC hwmon driver
> > + *
> > + * This file contains Power8-specific function prototypes
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
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef =5F=5FOCC=5FP8=5FH=5F=5F
> > +#define =5F=5FOCC=5FP8=5FH=5F=5F
> > +
> > +#include "scom.h"
> > +
> > +struct device;
> > +
> > +const u32 *p8=5Fget=5Fsensor=5Fhwmon=5Fconfigs(void);
> > +struct occ *p8=5Focc=5Fstart(struct device *dev, void *bus,
> > +          struct occ=5Fbus=5Fops *bus=5Fops);
> > +
> > +#endif /* =5F=5FOCC=5FP8=5FH=5F=5F */
> >
>

--0__=8FBB0A22DF1186A78f9e8a93df938690918c8FBB0A22DF1186A7
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/21/=
2017 12:18:23 PM:<br>&gt; On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wro=
te:<br>&gt; &gt; From: &quot;Edward A. James&quot; &lt;eajames@us.ibm.com&g=
t;<br>&gt; &gt;<br>&gt; &gt; Add functions to parse the data structures tha=
t are specific to the OCC on<br>&gt; &gt; the POWER8 processor. These are t=
he sensor data structures, including<br>&gt; &gt; temperature, frequency, p=
ower, and &quot;caps.&quot;<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Edward=
 A. James &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; Signed-off-by: Andrew Jef=
fery &lt;andrew@aj.id.au&gt;<br>&gt; &gt; ---<br>&gt; &gt; &nbsp;Documentat=
ion/hwmon/occ &nbsp; &nbsp;| &nbsp; 9 ++<br>&gt; &gt; &nbsp;drivers/hwmon/o=
cc/occ=5Fp8.c | 247 ++++++++++++++++++++++++++++++++<br>&gt; +++++++++++++<=
br>&gt; &gt; &nbsp;drivers/hwmon/occ/occ=5Fp8.h | &nbsp;30 ++++++<br>&gt; &=
gt; &nbsp;3 files changed, 286 insertions(+)<br>&gt; &gt; &nbsp;create mode=
 100644 drivers/hwmon/occ/occ=5Fp8.c<br>&gt; &gt; &nbsp;create mode 100644 =
drivers/hwmon/occ/occ=5Fp8.h<br>&gt; &gt;<br>&gt; &gt; diff --git a/Documen=
tation/hwmon/occ b/Documentation/hwmon/occ<br>&gt; &gt; index d0bdf06..1439=
51e 100644<br>&gt; &gt; --- a/Documentation/hwmon/occ<br>&gt; &gt; +++ b/Do=
cumentation/hwmon/occ<br>&gt; &gt; @@ -25,6 +25,15 @@ Currently, all versio=
ns of the OCC support four<br>&gt; types of sensor data: power,<br>&gt; &gt=
; &nbsp;temperature, frequency, and &quot;caps,&quot; which indicate limits=
 and <br>&gt; thresholds used<br>&gt; &gt; &nbsp;internally on the OCC.<br>=
&gt; &gt;<br>&gt; &gt; +The format for the POWER8 OCC sensor data can be fo=
und in the P8 OCC<br>&gt; &gt; +specification:<br>&gt; &gt; +github.com/ope=
n-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf<br>&gt; &g=
t; +This document provides the details of the OCC sensors: power, frequency=
,<br>&gt; &gt; +temperature, and caps. These sensor formats are specific to=
 the <br>&gt; POWER8 OCC. A<br>&gt; &gt; +number of data structures, such a=
s command format, response <br>&gt; headers, and the<br>&gt; &gt; +like, ar=
e also defined in this specification, and are common to <br>&gt; both POWER=
8 and<br>&gt; &gt; +POWER9 OCCs.<br>&gt; &gt; +<br>&gt; &gt; &nbsp;sysfs En=
tries<br>&gt; &gt; &nbsp;-------------<br>&gt; &gt;<br>&gt; &gt; diff --git=
 a/drivers/hwmon/occ/occ=5Fp8.c b/drivers/hwmon/occ/occ=5Fp8.c<br>&gt; &gt;=
 new file mode 100644<br>&gt; &gt; index 0000000..32215ed<br>&gt; &gt; --- =
/dev/null<br>&gt; &gt; +++ b/drivers/hwmon/occ/occ=5Fp8.c<br>&gt; &gt; @@ -=
0,0 +1,247 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * occ=5Fp8.c - OCC hwmon driv=
er<br>&gt; &gt; + *<br>&gt; &gt; + * This file contains the Power8-specific=
 methods and data structures for<br>&gt; &gt; + * the OCC hwmon driver.<br>=
&gt; &gt; + *<br>&gt; &gt; + * Copyright 2016 IBM Corp.<br>&gt; &gt; + *<br=
>&gt; &gt; + * This program is free software; you can redistribute it and/o=
r modify<br>&gt; &gt; + * it under the terms of the GNU General Public Lice=
nse as published by<br>&gt; &gt; + * the Free Software Foundation; either v=
ersion 2 of the License, or<br>&gt; &gt; + * (at your option) any later ver=
sion.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is distributed in the =
hope that it will be useful,<br>&gt; &gt; + * but WITHOUT ANY WARRANTY; wit=
hout even the implied warranty of<br>&gt; &gt; + * MERCHANTABILITY or FITNE=
SS FOR A PARTICULAR PURPOSE. &nbsp;See the<br>&gt; &gt; + * GNU General Pub=
lic License for more details.<br>&gt; &gt; + */<br>&gt; &gt; +<br>&gt; &gt;=
 +#include &lt;asm/unaligned.h&gt;<br>&gt; &gt; +#include &lt;linux/device.=
h&gt;<br>&gt; &gt; +#include &lt;linux/err.h&gt;<br>&gt; &gt; +#include &lt=
;linux/hwmon.h&gt;<br>&gt; &gt; +#include &lt;linux/init.h&gt;<br>&gt; &gt;=
 +#include &lt;linux/kernel.h&gt;<br>&gt; &gt; +#include &lt;linux/module.h=
&gt;<br>&gt; &gt; +#include &lt;linux/of.h&gt;<br>&gt; &gt; +#include &lt;l=
inux/platform=5Fdevice.h&gt;<br>&gt; &gt; +#include &lt;linux/slab.h&gt;<br=
>&gt; &gt; +#include &quot;occ.h&quot;<br>&gt; &gt; +#include &quot;occ=5Fp=
8.h&quot;<br>&gt; &gt; +<br>&gt; &gt; +/* P8 OCC sensor data format */<br>&=
gt; &gt; +struct p8=5Focc=5Fsensor {<br>&gt; &gt; + &nbsp; u16 sensor=5Fid;=
<br>&gt; &gt; + &nbsp; u16 value;<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &=
gt; +struct p8=5Fpower=5Fsensor {<br>&gt; &gt; + &nbsp; u16 sensor=5Fid;<br=
>&gt; &gt; + &nbsp; u32 update=5Ftag;<br>&gt; &gt; + &nbsp; u32 accumulator=
;<br>&gt; &gt; + &nbsp; u16 value;<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; =
&gt; +struct p8=5Fcaps=5Fsensor {<br>&gt; &gt; + &nbsp; u16 curr=5Fpowercap=
;<br>&gt; &gt; + &nbsp; u16 curr=5Fpowerreading;<br>&gt; &gt; + &nbsp; u16 =
norm=5Fpowercap;<br>&gt; &gt; + &nbsp; u16 max=5Fpowercap;<br>&gt; &gt; + &=
nbsp; u16 min=5Fpowercap;<br>&gt; &gt; + &nbsp; u16 user=5Fpowerlimit;<br>&=
gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +static const u32 p8=5Fsensor=5Fhw=
mon=5Fconfigs[MAX=5FOCC=5FSENSOR=5FTYPE] =3D {<br>&gt; &gt; + &nbsp; HWMON=
=5FI=5FINPUT | HWMON=5FI=5FLABEL, &nbsp; /* freq: value | label */<br>&gt; =
&gt; + &nbsp; HWMON=5FT=5FINPUT | HWMON=5FT=5FLABEL, &nbsp; /* temp: value =
| label */<br>&gt; &gt; + &nbsp; /* power: value | label | accumulator | up=
date=5Ftag */<br>&gt; &gt; + &nbsp; HWMON=5FP=5FINPUT | HWMON=5FP=5FLABEL |=
 HWMON=5FP=5FAVERAGE |<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;HWMON=5FP=5FAVERA=
GE=5FINTERVAL,<br>&gt; &gt; + &nbsp; /* caps: curr | max | min | norm | use=
r */<br>&gt; &gt; + &nbsp; HWMON=5FP=5FCAP | HWMON=5FP=5FCAP=5FMAX | HWMON=
=5FP=5FCAP=5FMIN | HWMON=5FP=5FMAX |<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;HWM=
ON=5FP=5FALARM,<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +void p8=5Fpar=
se=5Fsensor(u8 *data, void *sensor, int sensor=5Ftype, int off,<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int snum)<br>&gt; &gt; +{<br>&gt; &g=
t; + &nbsp; switch (sensor=5Ftype) {<br>&gt; &gt; + &nbsp; case FREQ:<br>&g=
t; &gt; + &nbsp; case TEMP:<br>&gt; &gt; + &nbsp; {<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp;struct p8=5Focc=5Fsensor *os =3D<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &amp;(((struct p8=5Focc=5Fsensor *)sensor)[snum]);<br>&gt; &gt=
; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;os-&gt;sensor=5Fid =3D be16=5Fto=5Fc=
pu(get=5Funaligned((u16 *)&amp;data[off]));<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp;os-&gt;value =3D be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp;data[off +=
 2]));<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br=
>&gt; &gt; + &nbsp; case POWER:<br>&gt; &gt; + &nbsp; {<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp;struct p8=5Fpower=5Fsensor *ps =3D<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &amp;(((struct p8=5Fpower=5Fsensor *)sensor)[snum]);<br>=
&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;ps-&gt;sensor=5Fid =3D be16=
=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp;data[off]));<br>&gt; &gt; + &nbsp; =
&nbsp; &nbsp;ps-&gt;update=5Ftag =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; be32=5Fto=5Fcpu(get=5Funaligned((u32 *)&amp;data[off + 2]));<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp;ps-&gt;accumulator =3D<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; be32=5Fto=5Fcpu(get=5Funaligned((u32 *)&amp;data[off + 6])=
);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;ps-&gt;value =3D be16=5Fto=5Fcpu(get=
=5Funaligned((u16 *)&amp;data[off + 10]));<br>&gt; &gt; + &nbsp; }<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; case CAPS:<br>&gt; =
&gt; + &nbsp; {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;struct p8=5Fcaps=5Fsenso=
r *cs =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &amp;(((struct p8=5Fca=
ps=5Fsensor *)sensor)[snum]);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp;cs-&gt;curr=5Fpowercap =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp;data[off]));<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp;cs-&gt;curr=5Fpowerreading =3D<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp;data[off + 2]))=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;cs-&gt;norm=5Fpowercap =3D<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp=
;data[off + 4]));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;cs-&gt;max=5Fpowercap =
=3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; be16=5Fto=5Fcpu(get=5Funalig=
ned((u16 *)&amp;data[off + 6]));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;cs-&gt;=
min=5Fpowercap =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; be16=5Fto=5Fc=
pu(get=5Funaligned((u16 *)&amp;data[off + 8]));<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp;cs-&gt;user=5Fpowerlimit =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; be16=5Fto=5Fcpu(get=5Funaligned((u16 *)&amp;data[off + 10]));<br>&gt; =
&gt; + &nbsp; }<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &n=
bsp; };<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +void *p8=5Falloc=5Fsen=
sor(int sensor=5Ftype, int num=5Fsensors)<br>&gt; &gt; +{<br>&gt; &gt; + &n=
bsp; switch (sensor=5Ftype) {<br>&gt; &gt; + &nbsp; case FREQ:<br>&gt; &gt;=
 + &nbsp; case TEMP:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return kcalloc(num=
=5Fsensors, sizeof(struct p8=5Focc=5Fsensor),<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; + &nbs=
p; case POWER:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return kcalloc(num=5Fsens=
ors, sizeof(struct p8=5Fpower=5Fsensor),<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; ca=
se CAPS:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return kcalloc(num=5Fsensors, s=
izeof(struct p8=5Fcaps=5Fsensor),<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;GFP=5FKERNEL);<br>&gt; &gt; + &nbsp; default:<=
br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return NULL;<br>&gt; &gt; + &nbsp; }<br>=
&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +int p8=5Fget=5Fsensor(struct occ =
*driver, int sensor=5Ftype, int sensor=5Fnum,<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;u32 hwmon, long *val)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; in=
t rc =3D 0;<br>&gt; &gt; + &nbsp; void *sensor;<br>&gt; &gt; +<br>&gt; &gt;=
 + &nbsp; if (sensor=5Ftype =3D=3D POWER) {<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp;if (hwmon =3D=3D hwmon=5Fpower=5Fcap || hwmon =3D=3D hwmon=5Fpower=5Fca=
p=5Fmax ||<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwmon =3D=3D hw=
mon=5Fpower=5Fcap=5Fmin || hwmon =3D=3D hwmon=5Fpower=5Fmax ||<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwmon =3D=3D hwmon=5Fpower=5Falarm)<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =3D CAPS;<br>&gt; &g=
t; + &nbsp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; sensor =3D occ=5Fget=5Fs=
ensor(driver, sensor=5Ftype);<br>&gt; &gt; + &nbsp; if (!sensor)<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp;return -ENODEV;<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; switch (sensor=5Ftype) {<br>&gt; &gt; + &nbsp; case FREQ:<br>&gt; &gt; +=
 &nbsp; case TEMP:<br>&gt; &gt; + &nbsp; {<br>&gt; &gt; + &nbsp; &nbsp; &nb=
sp;struct p8=5Focc=5Fsensor *os =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &amp;(((struct p8=5Focc=5Fsensor *)sensor)[sensor=5Fnum]);<br>&gt; &gt;=
 +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;if (hwmon =3D=3D hwmon=5Fin=5Finput |=
| hwmon =3D=3D hwmon=5Ftemp=5Finput)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; *val =3D os-&gt;value;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;else if (hwm=
on =3D=3D hwmon=5Fin=5Flabel || hwmon =3D=3D hwmon=5Ftemp=5Flabel)<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D os-&gt;sensor=5Fid;<br>&gt; <br=
>&gt; Guess that explains the numeric labels I wondered about earlier. Are<=
br>&gt; you really sure<br>&gt; you want to have such numbered labels, ie t=
emp1=5Flabel =3D &quot;1&quot; and so <br>&gt; on ? Your call,<br>&gt; real=
ly, just wondering.</tt><br><br><tt>Yes, that is our requirement I think. T=
hey aren't just arbitrary numbers,</tt><br><tt>the sensor=5Fid is read off =
the OCC. It corresponds to some identifier that</tt><br><tt>users can look =
up on our side with the OCC documentation. It is pretty</tt><br><tt>meaning=
less in the driver though, agreed. But it's system-specific, so</tt><br><tt=
>without a bunch of tables stored in the driver, not sure what else we</tt>=
<br><tt>could do.</tt><br><br><tt>Thanks,</tt><br><br><tt>Eddie</tt><br><tt=
><br>&gt; <br>&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; rc =3D -EOPNOTSUPP;<br>&gt; &gt; + &nbsp; }<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; case POWER:<br>&gt; &gt=
; + &nbsp; {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;struct p8=5Fpower=5Fsensor =
*ps =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &amp;(((struct p8=5Fpowe=
r=5Fsensor *)sensor)[sensor=5Fnum]);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp;switch (hwmon) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;case hwmon=
=5Fpower=5Finput:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D ps-&g=
t;value;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp;case hwmon=5Fpower=5Flabel:<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; *val =3D ps-&gt;sensor=5Fid;<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; break;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;case hwmon=5Fpower=5F=
average:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D ps-&gt;accumul=
ator;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp;case hwmon=5Fpower=5Faverage=5Finterval:<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; *val =3D ps-&gt;update=5Ftag;<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;default:<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EOPNOTSUPP;<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; + &nbsp; }<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp;break;<br>&gt; &gt; + &nbsp; case CAPS:<br>&gt; &gt; + &nbsp; {<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;struct p8=5Fcaps=5Fsensor *cs =3D<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &amp;(((struct p8=5Fcaps=5Fsensor *)senso=
r)[sensor=5Fnum]);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;switch=
 (hwmon) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;case hwmon=5Fpower=5Fcap:<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D cs-&gt;curr=5Fpowercap;<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp;case hwmon=5Fpower=5Fcap=5Fmax:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; *val =3D cs-&gt;max=5Fpowercap;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; break;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;case hwmon=5Fpower=5Fcap=
=5Fmin:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D cs-&gt;min=5Fpo=
wercap;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp;case hwmon=5Fpower=5Fmax:<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; *val =3D cs-&gt;norm=5Fpowercap;<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; break;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;case hwmon=5Fpower=
=5Falarm:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *val =3D cs-&gt;user=
=5Fpowerlimit;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp;default:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; rc =3D -EOPNOTSUPP;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; + &=
nbsp; }<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; + &nbsp; def=
ault:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rc =3D -EINVAL;<br>&gt; &gt; + &nb=
sp; }<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return rc;<br>&gt; &gt; +}<br>&g=
t; &gt; +<br>&gt; &gt; +static const struct occ=5Fops p8=5Fops =3D {<br>&gt=
; &gt; + &nbsp; .parse=5Fsensor =3D p8=5Fparse=5Fsensor,<br>&gt; &gt; + &nb=
sp; .alloc=5Fsensor =3D p8=5Falloc=5Fsensor,<br>&gt; &gt; + &nbsp; .get=5Fs=
ensor =3D p8=5Fget=5Fsensor,<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +=
static const struct occ=5Fconfig p8=5Fconfig =3D {<br>&gt; &gt; + &nbsp; .c=
ommand=5Faddr =3D 0xFFFF6000,<br>&gt; &gt; + &nbsp; .response=5Faddr =3D 0x=
FFFF7000,<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +const u32 *p8=5Fget=
=5Fsensor=5Fhwmon=5Fconfigs()<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; return =
p8=5Fsensor=5Fhwmon=5Fconfigs;<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FSYMBO=
L(p8=5Fget=5Fsensor=5Fhwmon=5Fconfigs);<br>&gt; &gt; +<br>&gt; &gt; +struct=
 occ *p8=5Focc=5Fstart(struct device *dev, void *bus,<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;struct occ=5Fbus=5Fops *bus=5Fops)<br>&gt; &gt;=
 +{<br>&gt; &gt; + &nbsp; return occ=5Fstart(dev, bus, bus=5Fops, &amp;p8=
=5Fops, &amp;p8=5Fconfig);<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FSYMBOL(p8=
=5Focc=5Fstart);<br>&gt; &gt; +<br>&gt; &gt; +MODULE=5FAUTHOR(&quot;Eddie J=
ames &lt;eajames@us.ibm.com&gt;&quot;);<br>&gt; &gt; +MODULE=5FDESCRIPTION(=
&quot;P8 OCC sensors&quot;);<br>&gt; &gt; +MODULE=5FLICENSE(&quot;GPL&quot;=
);<br>&gt; &gt; diff --git a/drivers/hwmon/occ/occ=5Fp8.h b/drivers/hwmon/o=
cc/occ=5Fp8.h<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000.=
.3fe6417<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/drivers/hwmon/occ/oc=
c=5Fp8.h<br>&gt; &gt; @@ -0,0 +1,30 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * oc=
c=5Fp8.h - OCC hwmon driver<br>&gt; &gt; + *<br>&gt; &gt; + * This file con=
tains Power8-specific function prototypes<br>&gt; &gt; + *<br>&gt; &gt; + *=
 Copyright 2016 IBM Corp.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is=
 free software; you can redistribute it and/or modify<br>&gt; &gt; + * it u=
nder the terms of the GNU General Public License as published by<br>&gt; &g=
t; + * the Free Software Foundation; either version 2 of the License, or<br=
>&gt; &gt; + * (at your option) any later version.<br>&gt; &gt; + *<br>&gt;=
 &gt; + * This program is distributed in the hope that it will be useful,<b=
r>&gt; &gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>&gt; &gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. &=
nbsp;See the<br>&gt; &gt; + * GNU General Public License for more details.<=
br>&gt; &gt; + */<br>&gt; &gt; +<br>&gt; &gt; +#ifndef =5F=5FOCC=5FP8=5FH=
=5F=5F<br>&gt; &gt; +#define =5F=5FOCC=5FP8=5FH=5F=5F<br>&gt; &gt; +<br>&gt=
; &gt; +#include &quot;scom.h&quot;<br>&gt; &gt; +<br>&gt; &gt; +struct dev=
ice;<br>&gt; &gt; +<br>&gt; &gt; +const u32 *p8=5Fget=5Fsensor=5Fhwmon=5Fco=
nfigs(void);<br>&gt; &gt; +struct occ *p8=5Focc=5Fstart(struct device *dev,=
 void *bus,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct occ=5Fb=
us=5Fops *bus=5Fops);<br>&gt; &gt; +<br>&gt; &gt; +#endif /* =5F=5FOCC=5FP8=
=5FH=5F=5F */<br>&gt; &gt;<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A22DF1186A78f9e8a93df938690918c8FBB0A22DF1186A7--
