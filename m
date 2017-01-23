Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20170123202104.GA28847@roeck-us.net>
Subject: Re: [PATCH linux v3 1/6] hwmon: Add core On-Chip Controller support for
 POWER CPUs
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 14:58:01 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-2-git-send-email-eajames.ibm@gmail.com>
 <11e7a9a0-2735-79fc-226f-e725aefa4df7@roeck-us.net>
 <OFFB249CF0.36530F73-ON002580B1.006A773E-862580B1.006B038A@notes.na.collabserv.com>
 <20170123202104.GA28847@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DFE321248f9e8a93df938690918c8FBB0A22DFE32124"
Content-Disposition: inline
Message-Id: <OF36230077.2EC0DF94-ON002580B1.0070A7B4-862580B1.00732CF4@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DFE321248f9e8a93df938690918c8FBB0A22DFE32124
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Guenter Roeck <linux@roeck-us.net> wrote on 01/23/2017 02:21:04 PM:
>
> On Mon, Jan 23, 2017 at 01:28:52PM -0600, Edward James wrote:
> > I still just can't get gmail to reply to this. Thanks for the review.
> >
> > On Sat, Jan 21, 2017 at 11:49 AM, Guenter Roeck <linux@roeck-us.net>
wrote:
> > > On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> > >>
> > >> From: "Edward A. James" <eajames@us.ibm.com>
> > >>
> > >> Add core support for polling the OCC for it's sensor data and
parsing
> > that
> > >> data into sensor-specific information.
> > >>
> > >> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >> ---
> > >>  Documentation/hwmon/occ    |  40 ++++
> > >>  MAINTAINERS                |   7 +
> > >>  drivers/hwmon/Kconfig      |   2 +
> > >>  drivers/hwmon/Makefile     |   1 +
> > >>  drivers/hwmon/occ/Kconfig  |  15 ++
> > >>  drivers/hwmon/occ/Makefile |   1 +
> > >>  drivers/hwmon/occ/occ.c    | 522
> > >> +++++++++++++++++++++++++++++++++++++++++++++
> > >>  drivers/hwmon/occ/occ.h    |  81 +++++++
> > >>  drivers/hwmon/occ/scom.h   |  47 ++++
> > >>  9 files changed, 716 insertions(+)
> > >>  create mode 100644 Documentation/hwmon/occ
> > >>  create mode 100644 drivers/hwmon/occ/Kconfig
> > >>  create mode 100644 drivers/hwmon/occ/Makefile
> > >>  create mode 100644 drivers/hwmon/occ/occ.c
> > >>  create mode 100644 drivers/hwmon/occ/occ.h
> > >>  create mode 100644 drivers/hwmon/occ/scom.h
> > >>
> > >> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> > >> new file mode 100644
> > >> index 0000000..79d1642
> > >> --- /dev/null
> > >> +++ b/Documentation/hwmon/occ
> > >> @@ -0,0 +1,40 @@
> > >> +Kernel driver occ
> > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> +
> > >> +Supported chips:
> > >> + * ASPEED AST2400
> > >> + * ASPEED AST2500
> > >> +
> > >> +Please note that the chip must be connected to a POWER8 or POWER9
> > >> processor
> > >> +(see the BMC - Host Communications section).
> > >> +
> > >> +Author: Eddie James <eajames@us.ibm.com>
> > >> +
> > >> +Description
> > >> +-----------
> > >> +
> > >> +This driver implements support for the OCC (On-Chip Controller) on
the
> > >> IBM
> > >> +POWER8 and POWER9 processors, from a BMC (Baseboard Management
> > >> Controller). The
> > >> +OCC is an embedded processor that provides real time power and
thermal
> > >> +monitoring.
> > >> +
> > >> +This driver provides an interface on a BMC to poll OCC sensor data,
set
> > >> user
> > >> +power caps, and perform some basic OCC error handling.
> > >> +
> > >> +Currently, all versions of the OCC support four types of sensor
data:
> > >> power,
> > >> +temperature, frequency, and "caps," which indicate limits and
> > thresholds
> > >> used
> > >> +internally on the OCC.
> > >> +
> > >> +BMC - Host Communications
> > >> +-------------------------
> > >> +
> > >> +For the POWER8 application, the BMC can communicate with the P8
over
> > I2C
> > >> bus.
> > >> +However, to access the OCC register space, any data transfer must
use a
> > >> SCOM
> > >> +operation. SCOM is a procedure to initiate a data transfer,
typically
> > of
> > >> 8
> > >> +bytes. SCOMs consist of writing a 32-bit command register and then
> > >> +reading/writing two 32-bit data registers. This driver implements
these
> > >> +SCOM operations over I2C bus in order to communicate with the OCC.
> > >> +
> > >> +For the POWER9 application, the BMC can communicate with the P9
over
> > FSI
> > >> bus
> > >> +and SBE engine. Once again, SCOM operations are required. This
driver
> > >> will
> > >> +implement SCOM ops over FSI/SBE. This will require the FSI driver.
> > >> diff --git a/MAINTAINERS b/MAINTAINERS
> > >> index 5f0420a..f5d4195 100644
> > >> --- a/MAINTAINERS
> > >> +++ b/MAINTAINERS
> > >> @@ -9112,6 +9112,13 @@ T:       git git://linuxtv.org/media=5Ftree.g=
it
> > >>  S:     Maintained
> > >>  F:     drivers/media/i2c/ov7670.c
> > >>
> > >> +ON-CHIP CONTROLLER HWMON DRIVER
> > >> +M:     Eddie James <eajames@us.ibm.com>
> > >> +L:     linux-hwmon@vger.kernel.org
> > >> +S:     Maintained
> > >> +F:     Documentation/hwmon/occ
> > >> +F:     drivers/hwmon/occ/
> > >> +
> > >>  ONENAND FLASH DRIVER
> > >>  M:     Kyungmin Park <kyungmin.park@samsung.com>
> > >>  L:     linux-mtd@lists.infradead.org
> > >> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > >> index 190d270..e80ca81 100644
> > >> --- a/drivers/hwmon/Kconfig
> > >> +++ b/drivers/hwmon/Kconfig
> > >> @@ -1240,6 +1240,8 @@ config SENSORS=5FNSA320
> > >>           This driver can also be built as a module. If so, the
module
> > >>           will be called nsa320-hwmon.
> > >>
> > >> +source drivers/hwmon/occ/Kconfig
> > >> +
> > >>  config SENSORS=5FPCF8591
> > >>         tristate "Philips PCF8591 ADC/DAC"
> > >>         depends on I2C
> > >> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > >> index d2cb7e8..c7ec5d4 100644
> > >> --- a/drivers/hwmon/Makefile
> > >> +++ b/drivers/hwmon/Makefile
> > >> @@ -169,6 +169,7 @@ obj-$(CONFIG=5FSENSORS=5FWM831X)        +=3D
> > wm831x-hwmon.o
> > >>  obj-$(CONFIG=5FSENSORS=5FWM8350)   +=3D wm8350-hwmon.o
> > >>  obj-$(CONFIG=5FSENSORS=5FXGENE)    +=3D xgene-hwmon.o
> > >>
> > >> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC)  +=3D occ/
> > >>  obj-$(CONFIG=5FPMBUS)            +=3D pmbus/
> > >>
> > >>  ccflags-$(CONFIG=5FHWMON=5FDEBUG=5FCHIP) :=3D -DDEBUG
> > >> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> > >> new file mode 100644
> > >> index 0000000..cdb64a7
> > >> --- /dev/null
> > >> +++ b/drivers/hwmon/occ/Kconfig
> > >> @@ -0,0 +1,15 @@
> > >> +#
> > >> +# On Chip Controller configuration
> > >> +#
> > >> +
> > >> +menuconfig SENSORS=5FPPC=5FOCC
> > >> +       bool "PPC On-Chip Controller"
> > >> +       help
> > >> +         If you say yes here you get support to monitor Power CPU
> > >> +         sensors via the On-Chip Controller (OCC).
> > >> +
> > >> +         Generally this is used by management controllers such as a
BMC
> > >> +         on an OpenPower system.
> > >> +
> > >> +         This driver can also be built as a module. If so, the
module
> > >> +         will be called occ.
> > >> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> > >> new file mode 100644
> > >> index 0000000..93cb52f
> > >> --- /dev/null
> > >> +++ b/drivers/hwmon/occ/Makefile
> > >> @@ -0,0 +1 @@
> > >> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o
> > >> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
> > >> new file mode 100644
> > >> index 0000000..3089762
> > >> --- /dev/null
> > >> +++ b/drivers/hwmon/occ/occ.c
> > >> @@ -0,0 +1,522 @@
> > >> +/*
> > >> + * occ.c - OCC hwmon driver
> > >> + *
> > >> + * This file contains the methods and data structures for the OCC
hwmon
> > >> driver.
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
> > >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > >> + * GNU General Public License for more details.
> > >> + */
> > >> +
> > >> +#include <asm/unaligned.h>
> > >> +#include <linux/delay.h>
> > >> +#include <linux/device.h>
> > >> +#include <linux/err.h>
> > >> +#include <linux/init.h>
> > >> +#include <linux/jiffies.h>
> > >> +#include <linux/kernel.h>
> > >> +#include <linux/module.h>
> > >> +#include <linux/mutex.h>
> > >> +#include <linux/slab.h>
> > >> +#include "occ.h"
> > >> +
> > >> +#define OCC=5FDATA=5FMAX           4096
> > >> +#define OCC=5FBMC=5FTIMEOUT=5FMS     20000
> > >> +
> > >> +/* To generate attn to OCC */
> > >> +#define ATTN=5FDATA              0x0006B035
> > >> +
> > >> +/* For BMC to read/write SRAM */
> > >> +#define OCB=5FADDRESS            0x0006B070
> > >> +#define OCB=5FDATA               0x0006B075
> > >> +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072
> > >> +#define OCB=5FSTATUS=5FCONTROL=5FOR  0x0006B073
> > >> +
> > >> +/* To init OCB */
> > >> +#define OCB=5FAND=5FINIT0          0xFBFFFFFF
> > >> +#define OCB=5FAND=5FINIT1          0xFFFFFFFF
> > >> +#define OCB=5FOR=5FINIT0           0x08000000
> > >> +#define OCB=5FOR=5FINIT1           0x00000000
> > >> +
> > >> +/* To generate attention on OCC */
> > >> +#define ATTN0                  0x01010000
> > >> +#define ATTN1                  0x00000000
> > >> +
> > >> +/* OCC return status */
> > >> +#define RESP=5FRETURN=5FCMD=5FIN=5FPRG 0xFF
> > >> +#define RESP=5FRETURN=5FSUCCESS    0
> > >> +#define RESP=5FRETURN=5FCMD=5FINVAL  0x11
> > >> +#define RESP=5FRETURN=5FCMD=5FLEN    0x12
> > >> +#define RESP=5FRETURN=5FDATA=5FINVAL 0x13
> > >> +#define RESP=5FRETURN=5FCHKSUM     0x14
> > >> +#define RESP=5FRETURN=5FOCC=5FERR    0x15
> > >> +#define RESP=5FRETURN=5FSTATE      0x16
> > >> +
> > >> +/* time interval to retry on "command in progress" return status */
> > >> +#define CMD=5FIN=5FPRG=5FINT=5FMS      100
> > >> +#define CMD=5FIN=5FPRG=5FRETRIES     (OCC=5FBMC=5FTIMEOUT=5FMS /
CMD=5FIN=5FPRG=5FINT=5FMS)
> > >> +
> > >> +/* OCC command definitions */
> > >> +#define OCC=5FPOLL               0
> > >> +#define OCC=5FSET=5FUSER=5FPOWR=5FCAP  0x22
> > >> +
> > >> +/* OCC poll command data */
> > >> +#define OCC=5FPOLL=5FSTAT=5FSENSOR   0x10
> > >> +
> > >> +/* OCC response data offsets */
> > >> +#define RESP=5FRETURN=5FSTATUS     2
> > >> +#define RESP=5FDATA=5FLENGTH       3
> > >> +#define RESP=5FHEADER=5FOFFSET     5
> > >> +#define SENSOR=5FSTR=5FOFFSET      37
> > >> +#define SENSOR=5FBLOCK=5FNUM=5FOFFSET        43
> > >> +#define SENSOR=5FBLOCK=5FOFFSET    45
> > >> +
> > >> +/* occ=5Fpoll=5Fheader
> > >> + * structure to match the raw occ poll response data
> > >> + */
> > >> +struct occ=5Fpoll=5Fheader {
> > >> +       u8 status;
> > >> +       u8 ext=5Fstatus;
> > >> +       u8 occs=5Fpresent;
> > >> +       u8 config;
> > >> +       u8 occ=5Fstate;
> > >> +       u8 mode;
> > >> +       u8 ips=5Fstatus;
> > >> +       u8 error=5Flog=5Fid;
> > >> +       u32 error=5Flog=5Faddr=5Fstart;
> > >> +       u16 error=5Flog=5Flength;
> > >> +       u8 reserved2;
> > >> +       u8 reserved3;
> > >> +       u8 occ=5Fcode=5Flevel[16];
> > >> +       u8 sensor=5Feye=5Fcatcher[6];
> > >> +       u8 sensor=5Fblock=5Fnum;
> > >> +       u8 sensor=5Fdata=5Fversion;
> > >> +} =5F=5Fattribute=5F=5F((packed, aligned(4)));
> > >> +
> > >> +struct occ=5Fresponse {
> > >> +       struct occ=5Fpoll=5Fheader header;
> > >> +       struct occ=5Fblocks data;
> > >> +};
> > >> +
> > >> +struct occ {
> > >> +       struct device *dev;
> > >> +       void *bus;
> > >> +       struct occ=5Fbus=5Fops bus=5Fops;
> > >> +       struct occ=5Fops ops;
> > >> +       struct occ=5Fconfig config;
> > >> +       unsigned long update=5Finterval;
> > >> +       unsigned long last=5Fupdated;
> > >> +       struct mutex update=5Flock;
> > >> +       struct occ=5Fresponse response;
> > >> +       bool valid;
> > >> +};
> > >> +
> > >> +static void deinit=5Focc=5Fresp=5Fbuf(struct occ=5Fresponse *resp)
> > >> +{
> > >> +       int i;
> > >> +
> > >> +       if (!resp)
> > >> +               return;
> > >> +
> > >
> > >
> > > This creates the impression that resp can ever be NULL, which is not
the
> > > case.
> >
> > Agreed. This might go away anyway if I follow your suggestions below
> > about memory management.
> >
> > >
> > >> +       if (!resp->data.blocks)
> > >> +               return;
> > >> +
> > >> +       for (i =3D 0; i < resp->header.sensor=5Fblock=5Fnum; ++i)
> > >> +               kfree(resp->data.blocks[i].sensors);
> > >> +
> > >> +       kfree(resp->data.blocks);
> > >> +/sensor=5Ftype=5Fs
> > >>
> > >> +       memset(resp, 0, sizeof(struct occ=5Fresponse));
> > >> +
> > >> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
> > >> +               resp->data.sensor=5Fblock=5Fid[i] =3D -1;
> > >> +}
> > >> +
> > >> +static void *occ=5Fget=5Fsensor=5Fby=5Ftype(struct occ=5Fresponse *=
resp,
> > >> +                                   enum sensor=5Ftype t)
> > >> +{
> > >> +       if (!resp->data.blocks)
> > >> +               return NULL;
> > >> +
> > >> +       if (resp->data.sensor=5Fblock=5Fid[t] =3D=3D -1)
> > >> +               return NULL;
> > >> +
> > >> +       return resp->data.blocks[resp->data.sensor=5Fblock=5Fid
[t]].sensors;
> > >> +}
> > >> +
> > >> +static int occ=5Fcheck=5Fsensor(struct occ *driver, u8 sensor=5Flen=
gth,
> > >> +                           u8 sensor=5Fnum, enum sensor=5Ftype t, i=
nt
> > block)
> > >> +{
> > >> +       void *sensor;
> > >> +       int type=5Fblock=5Fid;
> > >> +       struct occ=5Fresponse *resp =3D &driver->response;
> > >> +
> > >> +       sensor =3D occ=5Fget=5Fsensor=5Fby=5Ftype(resp, t);
> > >> +
> > >> +       /* empty sensor block, release older sensor data */
> > >> +       if (sensor=5Fnum =3D=3D 0 || sensor=5Flength =3D=3D 0) {
> > >> +               kfree(sensor);
> > >> +               dev=5Ferr(driver->dev, "no sensor blocks available
\n");
> > >> +               return -ENODATA;
> > >> +       }
> > >> +
> > >> +       type=5Fblock=5Fid =3D resp->data.sensor=5Fblock=5Fid[t];
> > >> +       if (!sensor || sensor=5Fnum !=3D
> > >> +           resp->data.blocks[type=5Fblock=5Fid].header.sensor=5Fnum=
) {
> > >> +               kfree(sensor);
> > >> +               resp->data.blocks[block].sensors =3D
> > >> +                       driver->ops.alloc=5Fsensor(t, sensor=5Fnum);
> > >> +               if (!resp->data.blocks[block].sensors)
> > >> +                       return -ENOMEM;
> > >> +       }
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static int parse=5Focc=5Fresponse(struct occ *driver, u8 *data,
> > >> +                             struct occ=5Fresponse *resp)
> > >> +{
> > >> +       int b;
> > >> +       int s;
> > >> +       int rc;
> > >> +       int offset =3D SENSOR=5FBLOCK=5FOFFSET;
> > >> +       int sensor=5Ftype;
> > >> +       u8 sensor=5Fblock=5Fnum;
> > >> +       char sensor=5Ftype=5Fstring[5] =3D { 0 };
> > >
> > >
> > > The only purpose of this variable seems to be to zero-terminate it to
be
> > > able
> > > to print it. Why not use length-limited print functions instead ?
> >
> > Is there such a function to length limit to dev=5Ferr or dev=5Fdbg?
> > Otherwise I have to snprintf or strncpy into a string to pass anyway.
> > I can drop the dev=5Fdbg but I would like to print out the sensor string
> > if it doesn't match any of the expected ones.
> >
> %*s or %-*s ?

OK, that will work, thanks.

>
> > >
> > >> +       struct sensor=5Fdata=5Fblock=5Fheader *block;
> > >> +       struct device *dev =3D driver->dev;
> > >> +
> > >> +       /* check if the data is valid */
> > >> +       if (strncmp(&data[SENSOR=5FSTR=5FOFFSET], "SENSOR", 6) !=3D =
0) {
> > >> +               dev=5Ferr(dev, "no SENSOR string in response\n");
> > >
> > >
> > > Are those messages really necessary ? That can create a lot of
logging
> > noise
> > > if the occ responds with bad data.
> >
> > I will audit these, but I think it's limited to one error message
> > logged in any one function in case of error. Is that acceptable?
> > Otherwise it may be hard to tell where the error occurred.
> >
> > >
> > >> +               rc =3D -ENODATA;
> > >> +               goto err;
> > >> +       }
> > >> +
> > >> +       sensor=5Fblock=5Fnum =3D data[SENSOR=5FBLOCK=5FNUM=5FOFFSET];
> > >
> > >
> > > There is a lot of trust in assuming that this data was actually
received.
> > > At the same time, there is a lot of error checking. Why check if the
> > > information in this field is valid if you don't check if it was
> > > received in the first place ?
> >
> > If we get to parse=5Focc=5Fresponse, we know we got some data back from
> > the OCC (see occ=5Fget=5Fall). Here we are really checking the response=
 is
> > a valid one, which I think makes sense in the parsing function.
> >
> Yes, but you don't check the length of the data vs. the length indicated
> in the header.

Well I don't know how you'd know the length of the actual data. That's why
we
do the sanity checks when we parse. We read the amount of data that the OCC
reports. If the scom ops fail to read all of it, we'll fail out. If it ends
up
invalid in some way, our sanity checks will catch it.

>
> > >
> > >> +       if (sensor=5Fblock=5Fnum =3D=3D 0) {
> > >> +               dev=5Ferr(dev, "no sensor blocks available\n");
> > >> +               rc =3D -ENODATA;
> > >> +               goto err;
> > >> +       }
> > >> +
> > >> +       /* if number of sensor block has changed, re-malloc */
> > >> +       if (sensor=5Fblock=5Fnum !=3D resp->header.sensor=5Fblock=5F=
num) {
> > >> +               deinit=5Focc=5Fresp=5Fbuf(resp);
> > >> +               resp->data.blocks =3D kcalloc(sensor=5Fblock=5Fnum,
> > >> +                                           sizeof(struct
> > >> sensor=5Fdata=5Fblock),
> > >> +                                           GFP=5FKERNEL);
> > >> +               if (!resp->data.blocks)
> > >> +                       return -ENOMEM;
> > >
> > >
> > > Why not just allocate the maximum number of sensors once ? That might
> > waste
> > > a bit of memory, but it would make the code much less error prone. We
> > know
> > > that
> > > there will never be more sensors than the number fitting into 4k of
> > memory,
> > > so the "waste" would not really be that much.
> >
> > Fair point. I'll do that.
> >
> > >
> > >
> > >> +       }
> > >> +
> > >> +       memcpy(&resp->header, &data[RESP=5FHEADER=5FOFFSET],
> > >> +              sizeof(struct occ=5Fpoll=5Fheader));
> > >> +       resp->header.error=5Flog=5Faddr=5Fstart =3D
> > >> +               be32=5Fto=5Fcpu(resp->header.error=5Flog=5Faddr=5Fst=
art);
> > >> +       resp->header.error=5Flog=5Flength =3D
> > >> +               be16=5Fto=5Fcpu(resp->header.error=5Flog=5Flength);
> > >> +
> > >> +       dev=5Fdbg(dev, "Reading %d sensor blocks\n",
> > >> +               resp->header.sensor=5Fblock=5Fnum);
> > >> +       for (b =3D 0; b < sensor=5Fblock=5Fnum; b++) {
> > >> +               block =3D (struct sensor=5Fdata=5Fblock=5Fheader *)&=
data
> > [offset];
> > >> +               /* copy to a null terminated string */
> > >> +               strncpy(sensor=5Ftype=5Fstring, block->sensor=5Ftype=
, 4);
> > >> +               offset +=3D 8;
> > >> +
> > >> +               dev=5Fdbg(dev, "sensor block[%d]: type: %s,
sensor=5Fnum:
> > >> %d\n", b,
> > >> +                       sensor=5Ftype=5Fstring, block->sensor=5Fnum);
> > >> +
> > >> +               if (strncmp(block->sensor=5Ftype, "FREQ", 4) =3D=3D =
0)
> > >> +                       sensor=5Ftype =3D FREQ;
> > >> +               else if (strncmp(block->sensor=5Ftype, "TEMP", 4) =
=3D=3D
0)
> > >> +                       sensor=5Ftype =3D TEMP;
> > >> +               else if (strncmp(block->sensor=5Ftype, "POWR", 4) =
=3D=3D
0)
> > >> +                       sensor=5Ftype =3D POWER;
> > >> +               else if (strncmp(block->sensor=5Ftype, "CAPS", 4) =
=3D=3D
0)
> > >> +                       sensor=5Ftype =3D CAPS;
> > >> +               else {
> > >> +                       dev=5Ferr(dev, "sensor type not supported %s
\n",
> > >> +                               sensor=5Ftype=5Fstring);
> > >> +                       continue;
> > >> +               }
> > >> +
> > >> +               rc =3D occ=5Fcheck=5Fsensor(driver, block->sensor=5F=
length,
> > >> +                                     block->sensor=5Fnum,
sensor=5Ftype,
> > b);
> > >> +               if (rc =3D=3D -ENOMEM)
> > >> +                       goto err;
> > >> +               else if (rc)
> > >> +                       continue;
> > >> +
> > >> +               resp->data.sensor=5Fblock=5Fid[sensor=5Ftype] =3D b;
> > >> +               for (s =3D 0; s < block->sensor=5Fnum; s++) {
> > >> +                       driver->ops.parse=5Fsensor(data,
> > >> +
> > >> resp->data.blocks[b].sensors,
> > >> +                                                sensor=5Ftype,
offset,
> > s);
> > >> +                       offset +=3D block->sensor=5Flength;
> > >> +               }
> > >> +
> > >> +               /* copy block data over to response pointer */
> > >> +               resp->data.blocks[b].header =3D *block;
> > >> +       }
> > >> +
> > >> +       return 0;
> > >> +err:
> > >> +       deinit=5Focc=5Fresp=5Fbuf(resp);
> > >> +       return rc;
> > >> +}
> > >> +
> > >> +static u8 occ=5Fsend=5Fcmd(struct occ *driver, u8 seq, u8 type, u16
length,
> > >> +                      const u8 *data, u8 *resp)
> > >> +{
> > >> +       u32 cmd1, cmd2;
> > >> +       u16 checksum =3D 0;
> > >> +       u16 length=5Fle =3D cpu=5Fto=5Fle16(length);
> > >> +       bool retry =3D 0;
> > >> +       int i, rc, tries =3D 0;
> > >> +
> > >> +       cmd1 =3D (seq << 24) | (type << 16) | length=5Fle;
> > >> +       memcpy(&cmd2, data, length);
> > >> +       cmd2 <<=3D ((4 - length) * 8);
> > >> +
> > >> +       /* checksum: sum of every bytes of cmd1, cmd2 */
> > >> +       for (i =3D 0; i < 4; i++) {
> > >> +               checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> > >> +               checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
> > >> +       }
> > >> +
> > >> +       cmd2 |=3D checksum << ((2 - length) * 8);
> > >> +
> > >> +       /* Init OCB */
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus,
OCB=5FSTATUS=5FCONTROL=5FOR,
> > >> +                                    OCB=5FOR=5FINIT0, OCB=5FOR=5FIN=
IT1);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus,
> > OCB=5FSTATUS=5FCONTROL=5FAND,
> > >> +                                    OCB=5FAND=5FINIT0, OCB=5FAND=5F=
INIT1);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       /* Send command, 2nd half of the 64-bit addr is unused
(write 0)
> > >> */
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
> > >> +                                    driver->config.command=5Faddr,
0);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FDATA, cm=
d1,
cmd2);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       /* Trigger attention */
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus, ATTN=5FDATA, A=
TTN0,
> > >> ATTN1);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       /* Get response data */
> > >> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
> > >> +                                    driver->config.response=5Faddr,
0);
> > >> +       if (rc)
> > >> +               goto err;
> > >> +
> > >> +       do {
> > >> +               if (retry) {
> > >> +                       set=5Fcurrent=5Fstate(TASK=5FINTERRUPTIBLE);
> > >> +
> > >> schedule=5Ftimeout(msecs=5Fto=5Fjiffies(CMD=5FIN=5FPRG=5FINT=5FMS));
> > >> +               }
> > >> +
> > >
> > > Isn't there a better way to do this ? What exactly is interrupted ?
The
> > > getscom function ? If so, shouldn't the timeout be handled there ?
> >
> > There shouldn't be any interrupt. I set TASK=5FINTERRUPTIBLE because it
> > doesn't really matter if it's interrupted or not. The purpose of this
> > loop is to retry if we get the "command in progress" status from the
> > OCC. It's higher level than the getscom function, so I think the loop
> > is appropriate here.
> >
> This is quite unusual. Why is this needed here but not elsewhere
> in the kernel ? Normally the called function would time out and return
> an appropriate error.

This is the response to the entire occ command, not an individual scom
operation. It's just the nature of the OCC. It can and will return the
"busy" response sometimes. The scom op will succeed, and we have no
indication
that we need to try again unless we check here. If we don't retry, we have
to
fail out, as the data certainly isn't valid.

>
> > >
> > >> +               rc =3D driver->bus=5Fops.getscom(driver->bus, OCB=5F=
DATA,
> > >> +                                            (u64 *)resp);
> > >> +               if (rc)
> > >> +                       goto err;
> > >> +
> > >> +               /* retry if we get "command in progress" return
status
> > */
> > >> +               retry =3D (resp[RESP=5FRETURN=5FSTATUS] =3D=3D
> > >> RESP=5FRETURN=5FCMD=5FIN=5FPRG) &&
> > >> +                       (tries++ < CMD=5FIN=5FPRG=5FRETRIES);
> > >
> > >
> > > There are some unnecessary () in this expression.
> > >
> > >
> > >> +       } while (retry);
> > >> +
> > >> +       switch (resp[RESP=5FRETURN=5FSTATUS]) {
> > >> +       case RESP=5FRETURN=5FCMD=5FIN=5FPRG:
> > >> +               rc =3D -EALREADY;
> > >> +               break;
> > >> +       case RESP=5FRETURN=5FSUCCESS:
> > >> +               rc =3D 0;
> > >> +               break;
> > >> +       case RESP=5FRETURN=5FCMD=5FINVAL:
> > >> +       case RESP=5FRETURN=5FCMD=5FLEN:
> > >> +       case RESP=5FRETURN=5FDATA=5FINVAL:
> > >> +       case RESP=5FRETURN=5FCHKSUM:
> > >> +               rc =3D -EINVAL;
> > >> +               break;
> > >> +       case RESP=5FRETURN=5FOCC=5FERR:
> > >> +               rc =3D -EREMOTE;
> > >> +               break;
> > >> +       default:
> > >> +               rc =3D -EFAULT;
> > >> +       }
> > >> +
> > >> +       return rc;
> > >> +
> > >> +err:
> > >> +       dev=5Ferr(driver->dev, "scom op failed rc:%d\n", rc);
> > >
> > >
> > > Some of the errors result in an error message, some don't. What is
> > > the guiding principle ? Even if there is an error message, it doesn't
> > report
> > > what function caused it, which makes it as good as no error message.
> > > Can this be dropped ?
> >
> > resp[RESP=5FRETURN=5FSTATUS] is the status reported on the OCC, these
> > aren't necessarily errors, though most are. This is translating an OCC
> > status code to an error for occ=5Fget=5Fall to pick up. It cannot be
> > dropped, we need to know if the occ poll was successful. I'm not sure
> > what you mean by reporting the function? occ=5Fget=5Fall will fail out =
if
>
> There are several function returns which all end up here. You don't know
> which one actually failed.
>
> > we report the error here. If it's the scom op that failed we will have
> > the dev=5Ferr message.
> >
> But which scom operation ? You mean it is important to report that some
> operation failed, but not which one ? Ok, I'll accept that, it just seems
> odd.

Ah, I guess I forgot I removed the dev=5Ferr calls from the actual scom op.
I'll
try and improve the error handling in this function then.

>
> > >
> > >> +       return rc;
> > >> +}
> > >> +
> > >> +static int occ=5Fget=5Fall(struct occ *driver)
> > >> +{
> > >> +       int i =3D 0, rc;
> > >> +       u8 *occ=5Fdata;
> > >> +       u16 num=5Fbytes;
> > >> +       const u8 poll=5Fcmd=5Fdata =3D OCC=5FPOLL=5FSTAT=5FSENSOR;
> > >> +       struct device *dev =3D driver->dev;
> > >> +       struct occ=5Fresponse *resp =3D &driver->response;
> > >> +
> > >> +       occ=5Fdata =3D devm=5Fkzalloc(dev, OCC=5FDATA=5FMAX, GFP=5FK=
ERNEL);
> > >
> > >
> > > I am a bot lost here. What is the purpose of using a devm function ?
> > >
> > > Either case, you might want to allocate the memory once and just keep
it
> > > allocated.
> > > Allocating a 4k buffer and freeing it each time data is read from the
occ
> > > seems
> > > to be wasteful and not really worth it.
> >
> > Agreed.
> >
> > >
> > >> +       if (!occ=5Fdata)
> > >> +               return -ENOMEM;
> > >> +
> > >> +       rc =3D occ=5Fsend=5Fcmd(driver, 0, OCC=5FPOLL, 1, &poll=5Fcm=
d=5Fdata,
> > >> occ=5Fdata);
> > >> +       if (rc) {
> > >> +               dev=5Ferr(dev, "OCC poll failed: %d\n", rc);
> > >> +               goto out;
> > >> +       }
> > >> +
> > >> +       num=5Fbytes =3D get=5Funaligned((u16 *)&occ=5Fdata
[RESP=5FDATA=5FLENGTH]);
> > >> +       num=5Fbytes =3D be16=5Fto=5Fcpu(num=5Fbytes);
> > >
> > >
> > > What data is in big endian, and what data is in little endian ?
> > >
> > > Looks like everything is big endian except for the length in the send
> > > command.
> > > Is that correct ? If so, an explanation would be useful, because the
> > logic
> > > isn't entirely clear.
> >
> > I'll add some comments.
> >
> > >
> > >> +       dev=5Fdbg(dev, "OCC data length: %d\n", num=5Fbytes);
> > >> +
> > >> +       if (num=5Fbytes > OCC=5FDATA=5FMAX) {
> > >> +               dev=5Ferr(dev, "OCC data length must be < 4KB\n");
> > >> +               rc =3D -EINVAL;
> > >> +               goto out;
> > >> +       }
> > >> +
> > >> +       if (num=5Fbytes <=3D 0) {
> > >
> > >
> > > This can never be < 0.
> >
> > Good point.
> >
> > >
> > >> +               dev=5Ferr(dev, "OCC data length is zero\n");
> > >> +               rc =3D -EINVAL;
> > >> +               goto out;
> > >> +       }
> > >> +
> > >> +       /* read remaining data */
> > >> +       for (i =3D 8; i < num=5Fbytes + 8; i +=3D 8) {
> > >> +               rc =3D driver->bus=5Fops.getscom(driver->bus, OCB=5F=
DATA,
> > >> +                                            (u64 *)&occ=5Fdata[i]);
> > >> +               if (rc) {
> > >> +                       dev=5Ferr(dev, "scom op failed rc:%d\n", rc);
> > >> +                       goto out;
> > >> +               }
> > >> +       }
> > >> +
> > >> +       /* don't need more sanity checks; buffer is alloc'd for max
> > >> response
> > >> +        * size so we just check for valid data in
parse=5Focc=5Fresponse
> > >> +        */
> > >
> > > Yes, but as mentioned above you don't check in that function if the
data
> > > was actually received.
> >
> > If we don't receive data, the data length will be 0 or the low level
> > getscom will fail. So we know we have data here.
> >
> Ok. However, since you don't pass num=5Fbytes to the parse function,
> there is no verification that num=5Fbytes actually matches what is in
> the packet.
> The rest of the header could indicate that there is 4k of data, but
num=5Fbytes
> reports, say, the minimum size. In that case, parse=5Focc=5Fresponse() wo=
uld
end
> up parsing a stale buffer.

Ah, I see your concern about parsing a stale buffer. As is, the driver
re-allocs
the buffer every time, so you won't see stale data. As soon as your run out
of
real sensor data to parse, the sanity checking will fail. But it makes
sense to
ensure we haven't gone past the amount we've read in anyway, I'll do that.

>
> > >
> > >> +       rc =3D parse=5Focc=5Fresponse(driver, occ=5Fdata, resp);
> > >> +
> > >> +out:
> > >> +       devm=5Fkfree(dev, occ=5Fdata);
> > >> +       return rc;
> > >> +}
> > >> +
> > >> +int occ=5Fupdate=5Fdevice(struct occ *driver)
> > >> +{
> > >> +       int rc =3D 0;
> > >> +
> > >> +       mutex=5Flock(&driver->update=5Flock);
> > >> +
> > >> +       if (time=5Fafter(jiffies, driver->last=5Fupdated +
> > >> driver->update=5Finterval)
> > >> +           || !driver->valid) {
> > >> +               driver->valid =3D 1;
> > >
> > >
> > > valid is bool.
> > >
> > >> +
> > >> +               rc =3D occ=5Fget=5Fall(driver);
> > >> +               if (rc)
> > >> +                       driver->valid =3D 0;
> > >
> > >
> > > valid is bool.
> >
> > Good point.
> >
> > >
> > >> +
> > >> +               driver->last=5Fupdated =3D jiffies;
> > >> +       }
> > >> +
> > >> +       mutex=5Funlock(&driver->update=5Flock);
> > >> +
> > >> +       return rc;
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fupdate=5Fdevice);
> > >> +
> > >> +void *occ=5Fget=5Fsensor(struct occ *driver, int sensor=5Ftype)
> > >> +{
> > >> +       int rc;
> > >> +
> > >> +       /* occ=5Fupdate=5Fdevice locks the update lock */
> > >> +       rc =3D occ=5Fupdate=5Fdevice(driver);
> > >> +       if (rc) {
> > >> +               dev=5Ferr(driver->dev, "cannot get occ sensor data: =
%d
\n",
> > >> +                       rc);
> > >
> > >
> > > Have you counted the number of error messages reported if anything
goes
> > > wrong.
> > > This driver is quite noisy. I won't force you to drop the messages,
but
> > it
> > > seems
> > > to me that if anything goes wrong, the kernel log will be clogged
with
> > > messages
> > > just from this driver.
> >
> > I'll audit these.
> >
> > >
> > >
> > >> +               return NULL;
> > >> +       }
> > >> +
> > >> +       return occ=5Fget=5Fsensor=5Fby=5Ftype(&driver->response,
sensor=5Ftype);
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fget=5Fsensor);
> > >> +
> > >> +int occ=5Fget=5Fsensor=5Fvalue(struct occ *occ, int sensor=5Ftype, =
int
> > >> sensor=5Fnum,
> > >> +                        u32 hwmon, long *val)
> > >> +{
> > >> +       return occ->ops.get=5Fsensor(occ, sensor=5Ftype, sensor=5Fnu=
m,
hwmon,
> > >> val);
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fget=5Fsensor=5Fvalue);
> > >> +
> > >> +void occ=5Fget=5Fresponse=5Fblocks(struct occ *occ, struct occ=5Fbl=
ocks
> > **blocks)
> > >> +{
> > >> +       *blocks =3D &occ->response.data;
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fget=5Fresponse=5Fblocks);
> > >> +
> > >> +void occ=5Fset=5Fupdate=5Finterval(struct occ *occ, unsigned long
interval)
> > >> +{
> > >> +       occ->update=5Finterval =3D msecs=5Fto=5Fjiffies(interval);
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fset=5Fupdate=5Finterval);
> > >> +
> > >> +int occ=5Fset=5Fuser=5Fpowercap(struct occ *occ, u16 cap)
> > >> +{
> > >> +       u8 resp[8];
> > >> +
> > >> +       cap =3D cpu=5Fto=5Fbe16(cap);
> > >> +
> > >> +       return occ=5Fsend=5Fcmd(occ, 0, OCC=5FSET=5FUSER=5FPOWR=5FCA=
P, 2, (const
u8
> > >> *)&cap,
> > >> +                           resp);
> > >> +}
> > >> +EXPORT=5FSYMBOL(occ=5Fset=5Fuser=5Fpowercap);
> > >> +
> > >> +struct occ *occ=5Fstart(struct device *dev, void *bus,
> > >> +                     struct occ=5Fbus=5Fops *bus=5Fops, const struct
occ=5Fops
> > >> *ops,
> > >> +                     const struct occ=5Fconfig *config)
> > >> +{
> > >> +       struct occ *driver =3D devm=5Fkzalloc(dev, sizeof(struct occ=
),
> > >> GFP=5FKERNEL);
> > >> +
> > >> +       if (!driver)
> > >> +               return ERR=5FPTR(-ENOMEM);
> > >> +
> > >> +       driver->dev =3D dev;
> > >> +       driver->bus =3D bus;
> > >> +       driver->bus=5Fops =3D *bus=5Fops;
> > >> +       driver->ops =3D *ops;
> > >> +       driver->config =3D *config;
> > >> +
> > >> +       driver->update=5Finterval =3D HZ;
> > >
> > >
> > > The update interval is only supposed to be configurable if it can be
> > written
> > > into the hardware. Otherwise it is really up to user space to decide
how
> > > often
> > > it wants to poll the data, not up to the kernel.
> > >
> > > I don't see a function to send the update interval to the occ. As
such,
> > it
> > > should
> > > not be configurable but a constant.
> >
> > I don't quite follow. Right now, the driver maximum polling rate is
> > configurable by userspace (via hwmon sysfs attribute). If you mean
> > that user space should control that rate just by how often users read
> > the attributes, I'm not sure that will work as there are a large
> > number of attributes that will all try and trigger an occ poll when
> > read. Besides, different users don't want to communicate about when
> > they last polled. If the rate is constant, if may be too slow or too
> > fast depending on the system and needs of the users. Why can't the
> > polling rate be configurable? To user space, the update interval works
> > the same if it's driver or hardware.
> >
>
> The update=5Finterval attribute is only supposed to exist if writing it
> results in writing a value into a chip register. It is supposed to set
> the =5Fchip=5F update interval, not the kernel update interval. If you wa=
nt
> to limit the rate of chip accesses, you can do it by using a constant
> in the driver, just like other drivers do it.
>
> This is similar to limit registers. If the chip does not support limit
> registers, we don't make up "soft" limits either, but don't support
> the respective attributes.

OK, we'll just use a constant then.

>
> Thanks,
> Guenter
>

--0__=8FBB0A22DFE321248f9e8a93df938690918c8FBB0A22DFE32124
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/23/=
2017 02:21:04 PM:</tt><br><tt>&gt; <br>&gt; On Mon, Jan 23, 2017 at 01:28:5=
2PM -0600, Edward James wrote:<br>&gt; &gt; I still just can't get gmail to=
 reply to this. Thanks for the review.<br>&gt; &gt; <br>&gt; &gt; On Sat, J=
an 21, 2017 at 11:49 AM, Guenter Roeck &lt;linux@roeck-us.net&gt; wrote:<br=
>&gt; &gt; &gt; On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:<br>&gt=
; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; From: &quot;Edward A. James&quot; &lt=
;eajames@us.ibm.com&gt;<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Add cor=
e support for polling the OCC for it's sensor data and parsing<br>&gt; &gt;=
 that<br>&gt; &gt; &gt;&gt; data into sensor-specific information.<br>&gt; =
&gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Edward A. James &lt;eaja=
mes@us.ibm.com&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Andrew Jeffery &lt;=
andrew@aj.id.au&gt;<br>&gt; &gt; &gt;&gt; ---<br>&gt; &gt; &gt;&gt; &nbsp;D=
ocumentation/hwmon/occ &nbsp; &nbsp;| &nbsp;40 ++++<br>&gt; &gt; &gt;&gt; &=
nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 7 +<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/Kconfig &nbsp; &nbsp; &=
nbsp;| &nbsp; 2 +<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/Makefile &nbsp;=
 &nbsp; | &nbsp; 1 +<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/Kconfig =
&nbsp;| &nbsp;15 ++<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/Makefile =
| &nbsp; 1 +<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/occ.c &nbsp; &nb=
sp;| 522<br>&gt; &gt; &gt;&gt; ++++++++++++++++++++++++++++++++++++++++++++=
+<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/occ.h &nbsp; &nbsp;| &nbsp;=
81 +++++++<br>&gt; &gt; &gt;&gt; &nbsp;drivers/hwmon/occ/scom.h &nbsp; | &n=
bsp;47 ++++<br>&gt; &gt; &gt;&gt; &nbsp;9 files changed, 716 insertions(+)<=
br>&gt; &gt; &gt;&gt; &nbsp;create mode 100644 Documentation/hwmon/occ<br>&=
gt; &gt; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/Kconfig<br>&gt=
; &gt; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/Makefile<br>&gt;=
 &gt; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ.c<br>&gt; &gt=
; &gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ.h<br>&gt; &gt; &g=
t;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/scom.h<br>&gt; &gt; &gt;&=
gt;<br>&gt; &gt; &gt;&gt; diff --git a/Documentation/hwmon/occ b/Documentat=
ion/hwmon/occ<br>&gt; &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &gt;&=
gt; index 0000000..79d1642<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt;=
 &gt;&gt; +++ b/Documentation/hwmon/occ<br>&gt; &gt; &gt;&gt; @@ -0,0 +1,40=
 @@<br>&gt; &gt; &gt;&gt; +Kernel driver occ<br>&gt; &gt; &gt;&gt; +=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; &gt; &gt;&gt; +<br>&g=
t; &gt; &gt;&gt; +Supported chips:<br>&gt; &gt; &gt;&gt; + * ASPEED AST2400=
<br>&gt; &gt; &gt;&gt; + * ASPEED AST2500<br>&gt; &gt; &gt;&gt; +<br>&gt; &=
gt; &gt;&gt; +Please note that the chip must be connected to a POWER8 or PO=
WER9<br>&gt; &gt; &gt;&gt; processor<br>&gt; &gt; &gt;&gt; +(see the BMC - =
Host Communications section).<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;=
 +Author: Eddie James &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; &gt;&gt; +<br=
>&gt; &gt; &gt;&gt; +Description<br>&gt; &gt; &gt;&gt; +-----------<br>&gt;=
 &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +This driver implements support for =
the OCC (On-Chip Controller) on the<br>&gt; &gt; &gt;&gt; IBM<br>&gt; &gt; =
&gt;&gt; +POWER8 and POWER9 processors, from a BMC (Baseboard Management<br=
>&gt; &gt; &gt;&gt; Controller). The<br>&gt; &gt; &gt;&gt; +OCC is an embed=
ded processor that provides real time power and thermal<br>&gt; &gt; &gt;&g=
t; +monitoring.<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +This driver =
provides an interface on a BMC to poll OCC sensor data, set<br>&gt; &gt; &g=
t;&gt; user<br>&gt; &gt; &gt;&gt; +power caps, and perform some basic OCC e=
rror handling.<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +Currently, al=
l versions of the OCC support four types of sensor data:<br>&gt; &gt; &gt;&=
gt; power,<br>&gt; &gt; &gt;&gt; +temperature, frequency, and &quot;caps,&q=
uot; which indicate limits and<br>&gt; &gt; thresholds<br>&gt; &gt; &gt;&gt=
; used<br>&gt; &gt; &gt;&gt; +internally on the OCC.<br>&gt; &gt; &gt;&gt; =
+<br>&gt; &gt; &gt;&gt; +BMC - Host Communications<br>&gt; &gt; &gt;&gt; +-=
------------------------<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +For=
 the POWER8 application, the BMC can communicate with the P8 over<br>&gt; &=
gt; I2C<br>&gt; &gt; &gt;&gt; bus.<br>&gt; &gt; &gt;&gt; +However, to acces=
s the OCC register space, any data transfer must use a<br>&gt; &gt; &gt;&gt=
; SCOM<br>&gt; &gt; &gt;&gt; +operation. SCOM is a procedure to initiate a =
data transfer, typically<br>&gt; &gt; of<br>&gt; &gt; &gt;&gt; 8<br>&gt; &g=
t; &gt;&gt; +bytes. SCOMs consist of writing a 32-bit command register and =
then<br>&gt; &gt; &gt;&gt; +reading/writing two 32-bit data registers. This=
 driver implements these<br>&gt; &gt; &gt;&gt; +SCOM operations over I2C bu=
s in order to communicate with the OCC.<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt=
; &gt;&gt; +For the POWER9 application, the BMC can communicate with the P9=
 over<br>&gt; &gt; FSI<br>&gt; &gt; &gt;&gt; bus<br>&gt; &gt; &gt;&gt; +and=
 SBE engine. Once again, SCOM operations are required. This driver<br>&gt; =
&gt; &gt;&gt; will<br>&gt; &gt; &gt;&gt; +implement SCOM ops over FSI/SBE. =
This will require the FSI driver.<br>&gt; &gt; &gt;&gt; diff --git a/MAINTA=
INERS b/MAINTAINERS<br>&gt; &gt; &gt;&gt; index 5f0420a..f5d4195 100644<br>=
&gt; &gt; &gt;&gt; --- a/MAINTAINERS<br>&gt; &gt; &gt;&gt; +++ b/MAINTAINER=
S<br>&gt; &gt; &gt;&gt; @@ -9112,6 +9112,13 @@ T: &nbsp; &nbsp; &nbsp; git =
git://linuxtv.org/media=5Ftree.git<br>&gt; &gt; &gt;&gt; &nbsp;S: &nbsp; &n=
bsp; Maintained<br>&gt; &gt; &gt;&gt; &nbsp;F: &nbsp; &nbsp; drivers/media/=
i2c/ov7670.c<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; +ON-CHIP CONTROLLE=
R HWMON DRIVER<br>&gt; &gt; &gt;&gt; +M: &nbsp; &nbsp; Eddie James &lt;eaja=
mes@us.ibm.com&gt;<br>&gt; &gt; &gt;&gt; +L: &nbsp; &nbsp; linux-hwmon@vger=
.kernel.org<br>&gt; &gt; &gt;&gt; +S: &nbsp; &nbsp; Maintained<br>&gt; &gt;=
 &gt;&gt; +F: &nbsp; &nbsp; Documentation/hwmon/occ<br>&gt; &gt; &gt;&gt; +=
F: &nbsp; &nbsp; drivers/hwmon/occ/<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &g=
t;&gt; &nbsp;ONENAND FLASH DRIVER<br>&gt; &gt; &gt;&gt; &nbsp;M: &nbsp; &nb=
sp; Kyungmin Park &lt;kyungmin.park@samsung.com&gt;<br>&gt; &gt; &gt;&gt; &=
nbsp;L: &nbsp; &nbsp; linux-mtd@lists.infradead.org<br>&gt; &gt; &gt;&gt; d=
iff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>&gt; &gt; &gt;=
&gt; index 190d270..e80ca81 100644<br>&gt; &gt; &gt;&gt; --- a/drivers/hwmo=
n/Kconfig<br>&gt; &gt; &gt;&gt; +++ b/drivers/hwmon/Kconfig<br>&gt; &gt; &g=
t;&gt; @@ -1240,6 +1240,8 @@ config SENSORS=5FNSA320<br>&gt; &gt; &gt;&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; This driver can also be built as a modul=
e. If so, the module<br>&gt; &gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; will be called nsa320-hwmon.<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt;=
 +source drivers/hwmon/occ/Kconfig<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt=
;&gt; &nbsp;config SENSORS=5FPCF8591<br>&gt; &gt; &gt;&gt; &nbsp; &nbsp; &n=
bsp; &nbsp; tristate &quot;Philips PCF8591 ADC/DAC&quot;<br>&gt; &gt; &gt;&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; depends on I2C<br>&gt; &gt; &gt;&gt; diff -=
-git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<br>&gt; &gt; &gt;&gt=
; index d2cb7e8..c7ec5d4 100644<br>&gt; &gt; &gt;&gt; --- a/drivers/hwmon/M=
akefile<br>&gt; &gt; &gt;&gt; +++ b/drivers/hwmon/Makefile<br>&gt; &gt; &gt=
;&gt; @@ -169,6 +169,7 @@ obj-$(CONFIG=5FSENSORS=5FWM831X) &nbsp; &nbsp; &n=
bsp; &nbsp;+=3D<br>&gt; &gt; wm831x-hwmon.o<br>&gt; &gt; &gt;&gt; &nbsp;obj=
-$(CONFIG=5FSENSORS=5FWM8350) &nbsp; +=3D wm8350-hwmon.o<br>&gt; &gt; &gt;&=
gt; &nbsp;obj-$(CONFIG=5FSENSORS=5FXGENE) &nbsp; &nbsp;+=3D xgene-hwmon.o<b=
r>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; +obj-$(CONFIG=5FSENSORS=5FPPC=5F=
OCC) &nbsp;+=3D occ/<br>&gt; &gt; &gt;&gt; &nbsp;obj-$(CONFIG=5FPMBUS) &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+=3D pmbus/<br>&gt; &gt; &gt;&gt;<br>&=
gt; &gt; &gt;&gt; &nbsp;ccflags-$(CONFIG=5FHWMON=5FDEBUG=5FCHIP) :=3D -DDEB=
UG<br>&gt; &gt; &gt;&gt; diff --git a/drivers/hwmon/occ/Kconfig b/drivers/h=
wmon/occ/Kconfig<br>&gt; &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &g=
t;&gt; index 0000000..cdb64a7<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &=
gt; &gt;&gt; +++ b/drivers/hwmon/occ/Kconfig<br>&gt; &gt; &gt;&gt; @@ -0,0 =
+1,15 @@<br>&gt; &gt; &gt;&gt; +#<br>&gt; &gt; &gt;&gt; +# On Chip Controll=
er configuration<br>&gt; &gt; &gt;&gt; +#<br>&gt; &gt; &gt;&gt; +<br>&gt; &=
gt; &gt;&gt; +menuconfig SENSORS=5FPPC=5FOCC<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; bool &quot;PPC On-Chip Controller&quot;<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; help<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; If you say yes here you get support to monitor Power CPU<br>&gt; &gt=
; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; sensors via the On-Chip Controller=
 (OCC).<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; Generally this is used by management controllers such as a BMC<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; on an OpenPower system.<br=
>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; T=
his driver can also be built as a module. If so, the module<br>&gt; &gt; &g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; will be called occ.<br>&gt; &gt; &gt;&=
gt; diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile<br=
>&gt; &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &gt;&gt; index 000000=
0..93cb52f<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt; &gt;&gt; +++ b/=
drivers/hwmon/occ/Makefile<br>&gt; &gt; &gt;&gt; @@ -0,0 +1 @@<br>&gt; &gt;=
 &gt;&gt; +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o<br>&gt; &gt; &gt;=
&gt; diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c<br>&gt;=
 &gt; &gt;&gt; new file mode 100644<br>&gt; &gt; &gt;&gt; index 0000000..30=
89762<br>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt; &gt;&gt; +++ b/drive=
rs/hwmon/occ/occ.c<br>&gt; &gt; &gt;&gt; @@ -0,0 +1,522 @@<br>&gt; &gt; &gt=
;&gt; +/*<br>&gt; &gt; &gt;&gt; + * occ.c - OCC hwmon driver<br>&gt; &gt; &=
gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This file contains the methods and da=
ta structures for the OCC hwmon<br>&gt; &gt; &gt;&gt; driver.<br>&gt; &gt; =
&gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * Copyright 2016 IBM Corp.<br>&gt; &gt=
; &gt;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is free software; you=
 can redistribute it and/or modify<br>&gt; &gt; &gt;&gt; + * it under the t=
erms of the GNU General Public License as published by<br>&gt; &gt; &gt;&gt=
; + * the Free Software Foundation; either version 2 of the License, or<br>=
&gt; &gt; &gt;&gt; + * (at your option) any later version.<br>&gt; &gt; &gt=
;&gt; + *<br>&gt; &gt; &gt;&gt; + * This program is distributed in the hope=
 that it will be useful,<br>&gt; &gt; &gt;&gt; + * but WITHOUT ANY WARRANTY=
; without even the implied warranty of<br>&gt; &gt; &gt;&gt; + * MERCHANTAB=
ILITY or FITNESS FOR A PARTICULAR PURPOSE. &nbsp;See the<br>&gt; &gt; &gt;&=
gt; + * GNU General Public License for more details.<br>&gt; &gt; &gt;&gt; =
+ */<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#include &lt;asm/unalig=
ned.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/delay.h&gt;<br>&gt; &gt=
; &gt;&gt; +#include &lt;linux/device.h&gt;<br>&gt; &gt; &gt;&gt; +#include=
 &lt;linux/err.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/init.h&gt;<b=
r>&gt; &gt; &gt;&gt; +#include &lt;linux/jiffies.h&gt;<br>&gt; &gt; &gt;&gt=
; +#include &lt;linux/kernel.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linu=
x/module.h&gt;<br>&gt; &gt; &gt;&gt; +#include &lt;linux/mutex.h&gt;<br>&gt=
; &gt; &gt;&gt; +#include &lt;linux/slab.h&gt;<br>&gt; &gt; &gt;&gt; +#incl=
ude &quot;occ.h&quot;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +#defin=
e OCC=5FDATA=5FMAX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4096<br>&gt; &gt; &gt=
;&gt; +#define OCC=5FBMC=5FTIMEOUT=5FMS &nbsp; &nbsp; 20000<br>&gt; &gt; &g=
t;&gt; +<br>&gt; &gt; &gt;&gt; +/* To generate attn to OCC */<br>&gt; &gt; =
&gt;&gt; +#define ATTN=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;0x0006B035<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +/* For BMC to =
read/write SRAM */<br>&gt; &gt; &gt;&gt; +#define OCB=5FADDRESS &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;0x0006B070<br>&gt; &gt; &gt;&gt; +#define OCB=
=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x0006B075<br>&gt;=
 &gt; &gt;&gt; +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072<br>&gt; &gt=
; &gt;&gt; +#define OCB=5FSTATUS=5FCONTROL=5FOR &nbsp;0x0006B073<br>&gt; &g=
t; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +/* To init OCB */<br>&gt; &gt; &gt;&gt=
; +#define OCB=5FAND=5FINIT0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0xFBFFFFFF<b=
r>&gt; &gt; &gt;&gt; +#define OCB=5FAND=5FINIT1 &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;0xFFFFFFFF<br>&gt; &gt; &gt;&gt; +#define OCB=5FOR=5FINIT0 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; 0x08000000<br>&gt; &gt; &gt;&gt; +#define OCB=5FO=
R=5FINIT1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x00000000<br>&gt; &gt; &gt;&g=
t; +<br>&gt; &gt; &gt;&gt; +/* To generate attention on OCC */<br>&gt; &gt;=
 &gt;&gt; +#define ATTN0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;0x01010000<br>&gt; &gt; &gt;&gt; +#define ATTN1 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x00000000<br>&gt; &gt; &gt;=
&gt; +<br>&gt; &gt; &gt;&gt; +/* OCC return status */<br>&gt; &gt; &gt;&gt;=
 +#define RESP=5FRETURN=5FCMD=5FIN=5FPRG 0xFF<br>&gt; &gt; &gt;&gt; +#defin=
e RESP=5FRETURN=5FSUCCESS &nbsp; &nbsp;0<br>&gt; &gt; &gt;&gt; +#define RES=
P=5FRETURN=5FCMD=5FINVAL &nbsp;0x11<br>&gt; &gt; &gt;&gt; +#define RESP=5FR=
ETURN=5FCMD=5FLEN &nbsp; &nbsp;0x12<br>&gt; &gt; &gt;&gt; +#define RESP=5FR=
ETURN=5FDATA=5FINVAL 0x13<br>&gt; &gt; &gt;&gt; +#define RESP=5FRETURN=5FCH=
KSUM &nbsp; &nbsp; 0x14<br>&gt; &gt; &gt;&gt; +#define RESP=5FRETURN=5FOCC=
=5FERR &nbsp; &nbsp;0x15<br>&gt; &gt; &gt;&gt; +#define RESP=5FRETURN=5FSTA=
TE &nbsp; &nbsp; &nbsp;0x16<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +=
/* time interval to retry on &quot;command in progress&quot; return status =
*/<br>&gt; &gt; &gt;&gt; +#define CMD=5FIN=5FPRG=5FINT=5FMS &nbsp; &nbsp; &=
nbsp;100<br>&gt; &gt; &gt;&gt; +#define CMD=5FIN=5FPRG=5FRETRIES &nbsp; &nb=
sp; (OCC=5FBMC=5FTIMEOUT=5FMS / CMD=5FIN=5FPRG=5FINT=5FMS)<br>&gt; &gt; &gt=
;&gt; +<br>&gt; &gt; &gt;&gt; +/* OCC command definitions */<br>&gt; &gt; &=
gt;&gt; +#define OCC=5FPOLL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; 0<br>&gt; &gt; &gt;&gt; +#define OCC=5FSET=5FUSER=5FPOWR=5FCAP &nbsp;0x22=
<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +/* OCC poll command data */=
<br>&gt; &gt; &gt;&gt; +#define OCC=5FPOLL=5FSTAT=5FSENSOR &nbsp; 0x10<br>&=
gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +/* OCC response data offsets */<=
br>&gt; &gt; &gt;&gt; +#define RESP=5FRETURN=5FSTATUS &nbsp; &nbsp; 2<br>&g=
t; &gt; &gt;&gt; +#define RESP=5FDATA=5FLENGTH &nbsp; &nbsp; &nbsp; 3<br>&g=
t; &gt; &gt;&gt; +#define RESP=5FHEADER=5FOFFSET &nbsp; &nbsp; 5<br>&gt; &g=
t; &gt;&gt; +#define SENSOR=5FSTR=5FOFFSET &nbsp; &nbsp; &nbsp;37<br>&gt; &=
gt; &gt;&gt; +#define SENSOR=5FBLOCK=5FNUM=5FOFFSET &nbsp; &nbsp; &nbsp; &n=
bsp;43<br>&gt; &gt; &gt;&gt; +#define SENSOR=5FBLOCK=5FOFFSET &nbsp; &nbsp;=
45<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +/* occ=5Fpoll=5Fheader<br=
>&gt; &gt; &gt;&gt; + * structure to match the raw occ poll response data<b=
r>&gt; &gt; &gt;&gt; + */<br>&gt; &gt; &gt;&gt; +struct occ=5Fpoll=5Fheader=
 {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 status;<br>&gt; &gt; &gt=
;&gt; + &nbsp; &nbsp; &nbsp; u8 ext=5Fstatus;<br>&gt; &gt; &gt;&gt; + &nbsp=
; &nbsp; &nbsp; u8 occs=5Fpresent;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; u8 config;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 occ=5Fstate=
;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 mode;<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; u8 ips=5Fstatus;<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; u8 error=5Flog=5Fid;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; u32 error=5Flog=5Faddr=5Fstart;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; u16 error=5Flog=5Flength;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; u8 reserved2;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 reserved3;<=
br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 occ=5Fcode=5Flevel[16];<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Feye=5Fcatcher[6];<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Fblock=5Fnum;<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Fdata=5Fversion;<br>&gt; &g=
t; &gt;&gt; +} =5F=5Fattribute=5F=5F((packed, aligned(4)));<br>&gt; &gt; &g=
t;&gt; +<br>&gt; &gt; &gt;&gt; +struct occ=5Fresponse {<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; struct occ=5Fpoll=5Fheader header;<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fblocks data;<br>&gt; &gt; &gt;&=
gt; +};<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +struct occ {<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct device *dev;<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; void *bus;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp=
; &nbsp; struct occ=5Fbus=5Fops bus=5Fops;<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; struct occ=5Fops ops;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; struct occ=5Fconfig config;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbs=
p; unsigned long update=5Finterval;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; unsigned long last=5Fupdated;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; struct mutex update=5Flock;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; struct occ=5Fresponse response;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; bool valid;<br>&gt; &gt; &gt;&gt; +};<br>&gt; &gt; &gt;&gt; +<br>&gt;=
 &gt; &gt;&gt; +static void deinit=5Focc=5Fresp=5Fbuf(struct occ=5Fresponse=
 *resp)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbs=
p; int i;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; if (!resp)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; return;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;<br>&gt; &gt;=
 &gt;<br>&gt; &gt; &gt; This creates the impression that resp can ever be N=
ULL, which is not the<br>&gt; &gt; &gt; case.<br>&gt; &gt; <br>&gt; &gt; Ag=
reed. This might go away anyway if I follow your suggestions below<br>&gt; =
&gt; about memory management.<br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; if (!resp-&gt;data.blocks)<br>&gt; &gt; &gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&gt; &g=
t; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 0; i =
&lt; resp-&gt;header.sensor=5Fblock=5Fnum; ++i)<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(resp-&gt;data.blocks[i]=
.sensors);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; kfree(resp-&gt;data.blocks);<br>&gt; &gt; &gt;&gt; +/sensor=5Ftype=5Fs=
<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; memset(=
resp, 0, sizeof(struct occ=5Fresponse));<br>&gt; &gt; &gt;&gt; +<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FOCC=5FSENSOR=
=5FTYPE; ++i)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; resp-&gt;data.sensor=5Fblock=5Fid[i] =3D -1;<br>&gt; &gt; &gt;&=
gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +static void *occ=5Fge=
t=5Fsensor=5Fby=5Ftype(struct occ=5Fresponse *resp,<br>&gt; &gt; &gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum sensor=5Ftype t)<br>&gt; =
&gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!resp-&gt=
;data.blocks)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; return NULL;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; if (resp-&gt;data.sensor=5Fblock=5Fid[t] =3D=3D -1)<br>&=
gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 NULL;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;=
 return resp-&gt;data.blocks[resp-&gt;data.sensor=5Fblock=5Fid[t]].sensors;=
<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +st=
atic int occ=5Fcheck=5Fsensor(struct occ *driver, u8 sensor=5Flength,<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u8 sensor=5Fnum, enum sensor=5Ftype t, i=
nt<br>&gt; &gt; block)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; void *sensor;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; int type=5Fblock=5Fid;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struc=
t occ=5Fresponse *resp =3D &amp;driver-&gt;response;<br>&gt; &gt; &gt;&gt; =
+<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; sensor =3D occ=5Fget=5Fsenso=
r=5Fby=5Ftype(resp, t);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; /* empty sensor block, release older sensor data */<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (sensor=5Fnum =3D=3D 0 || sensor=
=5Flength =3D=3D 0) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; kfree(sensor);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(driver-&gt;dev, &quot;no sensor =
blocks available\n&quot;);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; return -ENODATA;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp;=
 &nbsp; type=5Fblock=5Fid =3D resp-&gt;data.sensor=5Fblock=5Fid[t];<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!sensor || sensor=5Fnum !=3D<br>&=
gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.blocks=
[type=5Fblock=5Fid].header.sensor=5Fnum) {<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(sensor);<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.blocks[=
block].sensors =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; driver-&gt;ops.alloc=5Fsensor(=
t, sensor=5Fnum);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; if (!resp-&gt;data.blocks[block].sensors)<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; return -ENOMEM;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>=
&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return 0;=
<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +st=
atic int parse=5Focc=5Fresponse(struct occ *driver, u8 *data,<br>&gt; &gt; =
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct occ=5Fresponse *resp)<br>&gt; &gt;=
 &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int b;<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; int s;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; int rc;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int offset=
 =3D SENSOR=5FBLOCK=5FOFFSET;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; =
int sensor=5Ftype;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=
=5Fblock=5Fnum;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; char sensor=5F=
type=5Fstring[5] =3D { 0 };<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt=
; &gt; The only purpose of this variable seems to be to zero-terminate it t=
o be<br>&gt; &gt; &gt; able<br>&gt; &gt; &gt; to print it. Why not use leng=
th-limited print functions instead ?<br>&gt; &gt; <br>&gt; &gt; Is there su=
ch a function to length limit to dev=5Ferr or dev=5Fdbg?<br>&gt; &gt; Other=
wise I have to snprintf or strncpy into a string to pass anyway.<br>&gt; &g=
t; I can drop the dev=5Fdbg but I would like to print out the sensor string=
<br>&gt; &gt; if it doesn't match any of the expected ones.<br>&gt; &gt; <b=
r>&gt; %*s or %-*s ?</tt><br><br><tt>OK, that will work, thanks.</tt><br><t=
t><br>&gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; =
struct sensor=5Fdata=5Fblock=5Fheader *block;<br>&gt; &gt; &gt;&gt; + &nbsp=
; &nbsp; &nbsp; struct device *dev =3D driver-&gt;dev;<br>&gt; &gt; &gt;&gt=
; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* check if the data is va=
lid */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (strncmp(&amp;data[S=
ENSOR=5FSTR=5FOFFSET], &quot;SENSOR&quot;, 6) !=3D 0) {<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;=
no SENSOR string in response\n&quot;);<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<=
br>&gt; &gt; &gt; Are those messages really necessary ? That can create a l=
ot of logging<br>&gt; &gt; noise<br>&gt; &gt; &gt; if the occ responds with=
 bad data.<br>&gt; &gt; <br>&gt; &gt; I will audit these, but I think it's =
limited to one error message<br>&gt; &gt; logged in any one function in cas=
e of error. Is that acceptable?<br>&gt; &gt; Otherwise it may be hard to te=
ll where the error occurred.<br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -ENODATA;=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g=
oto err;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&g=
t; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; sensor=5Fblock=5Fnum =3D =
data[SENSOR=5FBLOCK=5FNUM=5FOFFSET];<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br=
>&gt; &gt; &gt; There is a lot of trust in assuming that this data was actu=
ally received.<br>&gt; &gt; &gt; At the same time, there is a lot of error =
checking. Why check if the<br>&gt; &gt; &gt; information in this field is v=
alid if you don't check if it was<br>&gt; &gt; &gt; received in the first p=
lace ?<br>&gt; &gt; <br>&gt; &gt; If we get to parse=5Focc=5Fresponse, we k=
now we got some data back from<br>&gt; &gt; the OCC (see occ=5Fget=5Fall). =
Here we are really checking the response is<br>&gt; &gt; a valid one, which=
 I think makes sense in the parsing function.<br>&gt; &gt; <br>&gt; Yes, bu=
t you don't check the length of the data vs. the length indicated<br>&gt; i=
n the header.</tt><br><br><tt>Well I don't know how you'd know the length o=
f the actual data. That's why we</tt><br><tt>do the sanity checks when we p=
arse. We read the amount of data that the OCC</tt><br><tt>reports. If the s=
com ops fail to read all of it, we'll fail out. If it ends up</tt><br><tt>i=
nvalid in some way, our sanity checks will catch it.</tt><br><tt><br>&gt; <=
br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (sensor=
=5Fblock=5Fnum =3D=3D 0) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;no sensor blocks available\n&=
quot;);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; rc =3D -ENODATA;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; goto err;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;=
 }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* =
if number of sensor block has changed, re-malloc */<br>&gt; &gt; &gt;&gt; +=
 &nbsp; &nbsp; &nbsp; if (sensor=5Fblock=5Fnum !=3D resp-&gt;header.sensor=
=5Fblock=5Fnum) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; deinit=5Focc=5Fresp=5Fbuf(resp);<br>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.blocks =3D kca=
lloc(sensor=5Fblock=5Fnum,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeof(struct<br>&gt; &gt; =
&gt;&gt; sensor=5Fdata=5Fblock),<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GFP=5FKERNEL);<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!res=
p-&gt;data.blocks)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;<br>&gt; &gt; &=
gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Why not just allocate the maximum n=
umber of sensors once ? That might<br>&gt; &gt; waste<br>&gt; &gt; &gt; a b=
it of memory, but it would make the code much less error prone. We<br>&gt; =
&gt; know<br>&gt; &gt; &gt; that<br>&gt; &gt; &gt; there will never be more=
 sensors than the number fitting into 4k of<br>&gt; &gt; memory,<br>&gt; &g=
t; &gt; so the &quot;waste&quot; would not really be that much.<br>&gt; &gt=
; <br>&gt; &gt; Fair point. I'll do that.<br>&gt; &gt; <br>&gt; &gt; &gt;<b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt=
; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; memcpy(&amp;resp-=
&gt;header, &amp;data[RESP=5FHEADER=5FOFFSET],<br>&gt; &gt; &gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(struct occ=5Fpoll=5Fhead=
er));<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;header.error=5F=
log=5Faddr=5Fstart =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; be32=5Fto=5Fcpu(resp-&gt;header.error=5Flog=5Faddr=5Fs=
tart);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;header.error=
=5Flog=5Flength =3D<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; be16=5Fto=5Fcpu(resp-&gt;header.error=5Flog=5Flength);<br=
>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; dev=5Fdb=
g(dev, &quot;Reading %d sensor blocks\n&quot;,<br>&gt; &gt; &gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;header.sensor=5Fblock=
=5Fnum);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; for (b =3D 0; b &lt; =
sensor=5Fblock=5Fnum; b++) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; block =3D (struct sensor=5Fdata=5Fblock=5Fheader=
 *)&amp;data<br>&gt; &gt; [offset];<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* copy to a null terminated string */<br=
>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strn=
cpy(sensor=5Ftype=5Fstring, block-&gt;sensor=5Ftype, 4);<br>&gt; &gt; &gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offset +=3D 8;<br>&g=
t; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; dev=5Fdbg(dev, &quot;sensor block[%d]: type: %s, sensor=5F=
num:<br>&gt; &gt; &gt;&gt; %d\n&quot;, b,<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=
=5Ftype=5Fstring, block-&gt;sensor=5Fnum);<br>&gt; &gt; &gt;&gt; +<br>&gt; =
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strncm=
p(block-&gt;sensor=5Ftype, &quot;FREQ&quot;, 4) =3D=3D 0)<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; sensor=5Ftype =3D FREQ;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; else if (strncmp(block-&gt;sensor=5Ftype, &q=
uot;TEMP&quot;, 4) =3D=3D 0)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =3D TE=
MP;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; else if (strncmp(block-&gt;sensor=5Ftype, &quot;POWR&quot;, 4) =3D=3D 0)<=
br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =3D POWER;<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else if (strncmp(block-&gt=
;sensor=5Ftype, &quot;CAPS&quot;, 4) =3D=3D 0)<br>&gt; &gt; &gt;&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; se=
nsor=5Ftype =3D CAPS;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; else {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;s=
ensor type not supported %s\n&quot;,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; sensor=5Ftype=5Fstring);<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue=
;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; rc =3D occ=5Fcheck=5Fsensor(driver, block-&gt;senso=
r=5Flength,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; block-&gt;sensor=5Fnum, sensor=5Ftype,<br>&gt; &gt; b);<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (rc =
=3D=3D -ENOMEM)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>&gt; &gt; &gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else if (rc)<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; continue;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.sensor=5Fblock=
=5Fid[sensor=5Ftype] =3D b;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; for (s =3D 0; s &lt; block-&gt;sensor=5Fnum; s++)=
 {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; driver-&gt;ops.parse=5Fsensor(data,<br>&gt; &g=
t; &gt;&gt; +<br>&gt; &gt; &gt;&gt; resp-&gt;data.blocks[b].sensors,<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sensor=5Ftype, offset,<br>&gt; &gt; s);<=
br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; offset +=3D block-&gt;sensor=5Flength;<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &g=
t; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; /* copy block data over to response pointer */<br>&gt; &gt; &gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.bloc=
ks[b].header =3D *block;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>=
&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return 0;=
<br>&gt; &gt; &gt;&gt; +err:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; d=
einit=5Focc=5Fresp=5Fbuf(resp);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; return rc;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; =
&gt;&gt; +static u8 occ=5Fsend=5Fcmd(struct occ *driver, u8 seq, u8 type, u=
16 length,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const u8 *data, u8 *resp)<br>&gt; &gt; =
&gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u32 cmd1, cmd2;<br=
>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u16 checksum =3D 0;<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; u16 length=5Fle =3D cpu=5Fto=5Fle16(length=
);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; bool retry =3D 0;<br>&gt; &=
gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int i, rc, tries =3D 0;<br>&gt; &gt; &g=
t;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; cmd1 =3D (seq &lt;&lt=
; 24) | (type &lt;&lt; 16) | length=5Fle;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; memcpy(&amp;cmd2, data, length);<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; cmd2 &lt;&lt;=3D ((4 - length) * 8);<br>&gt; &gt; &gt;&gt; +=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* checksum: sum of every byt=
es of cmd1, cmd2 */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D=
 0; i &lt; 4; i++) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; checksum +=3D (cmd1 &gt;&gt; (i * 8)) &amp; 0xFF;<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; checksum=
 +=3D (cmd2 &gt;&gt; (i * 8)) &amp; 0xFF;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp;=
 &nbsp; cmd2 |=3D checksum &lt;&lt; ((2 - length) * 8);<br>&gt; &gt; &gt;&g=
t; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* Init OCB */<br>&gt; &g=
t; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.putscom(driv=
er-&gt;bus, OCB=5FSTATUS=5FCONTROL=5FOR,<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OCB=5FOR=5FINIT0, OCB=5FOR=5FINIT1)=
;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>&gt; &gt;=
 &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;=
bus=5Fops.putscom(driver-&gt;bus,<br>&gt; &gt; OCB=5FSTATUS=5FCONTROL=5FAND=
,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;OCB=5FAND=5FINIT0, OCB=5FAND=5FINIT1);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbs=
p; &nbsp; if (rc)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; goto err;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &=
nbsp; &nbsp; &nbsp; /* Send command, 2nd half of the 64-bit addr is unused =
(write 0)<br>&gt; &gt; &gt;&gt; */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FADDRESS,<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;driv=
er-&gt;config.command=5Faddr, 0);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nb=
sp; if (rc)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; goto err;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; =
&nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FDAT=
A, cmd1, cmd2);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err=
;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* T=
rigger attention */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D dri=
ver-&gt;bus=5Fops.putscom(driver-&gt;bus, ATTN=5FDATA, ATTN0,<br>&gt; &gt; =
&gt;&gt; ATTN1);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)<br>&g=
t; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto er=
r;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* =
Get response data */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D dr=
iver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FADDRESS,<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;driver-&gt;config.=
response=5Faddr, 0);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; got=
o err;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;=
 do {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; if (retry) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; set=5Fcurrent=5Fstate(TASK=5FINT=
ERRUPTIBLE);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; schedule=5Ftimeo=
ut(msecs=5Fto=5Fjiffies(CMD=5FIN=5FPRG=5FINT=5FMS));<br>&gt; &gt; &gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; =
+<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Isn't there a better way to do this ?=
 What exactly is interrupted ? The<br>&gt; &gt; &gt; getscom function ? If =
so, shouldn't the timeout be handled there ?<br>&gt; &gt; <br>&gt; &gt; The=
re shouldn't be any interrupt. I set TASK=5FINTERRUPTIBLE because it<br>&gt=
; &gt; doesn't really matter if it's interrupted or not. The purpose of thi=
s<br>&gt; &gt; loop is to retry if we get the &quot;command in progress&quo=
t; status from the<br>&gt; &gt; OCC. It's higher level than the getscom fun=
ction, so I think the loop<br>&gt; &gt; is appropriate here.<br>&gt; &gt; <=
br>&gt; This is quite unusual. Why is this needed here but not elsewhere<br=
>&gt; in the kernel ? Normally the called function would time out and retur=
n<br>&gt; an appropriate error.</tt><br><br><tt>This is the response to the=
 entire occ command, not an individual scom</tt><br><tt>operation. It's jus=
t the nature of the OCC. It can and will return the</tt><br><tt>&quot;busy&=
quot; response sometimes. The scom op will succeed, and we have no indicati=
on</tt><br><tt>that we need to try again unless we check here. If we don't =
retry, we have to</tt><br><tt>fail out, as the data certainly isn't valid.<=
/tt><br><tt><br>&gt; <br>&gt; &gt; &gt;</tt><br><tt>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.=
getscom(driver-&gt;bus, OCB=5FDATA,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(u64 *)resp)=
;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
if (rc)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>&gt; &gt; &gt;&gt; +<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* retry =
if we get &quot;command in progress&quot; return status<br>&gt; &gt; */<br>=
&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; retry=
 =3D (resp[RESP=5FRETURN=5FSTATUS] =3D=3D<br>&gt; &gt; &gt;&gt; RESP=5FRETU=
RN=5FCMD=5FIN=5FPRG) &amp;&amp;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (tries++ &lt; CMD=
=5FIN=5FPRG=5FRETRIES);<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &g=
t; There are some unnecessary () in this expression.<br>&gt; &gt; &gt;<br>&=
gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; } while (retry);=
<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; switc=
h (resp[RESP=5FRETURN=5FSTATUS]) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &n=
bsp; case RESP=5FRETURN=5FCMD=5FIN=5FPRG:<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EALREADY;<br>&gt; &gt; &gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FSUCCESS:<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0;<br>&=
gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FCMD=5FIN=
VAL:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FCMD=
=5FLEN:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FD=
ATA=5FINVAL:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETUR=
N=5FCHKSUM:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; rc =3D -EINVAL;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;=
 case RESP=5FRETURN=5FOCC=5FERR:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EREMOTE;<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; &gt;&gt; =
+ &nbsp; &nbsp; &nbsp; default:<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EFAULT;<br>&gt; &gt; &gt;&gt; + &nbsp=
; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; return rc;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +err:<=
br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; dev=5Ferr(driver-&gt;dev, &quo=
t;scom op failed rc:%d\n&quot;, rc);<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br=
>&gt; &gt; &gt; Some of the errors result in an error message, some don't. =
What is<br>&gt; &gt; &gt; the guiding principle ? Even if there is an error=
 message, it doesn't<br>&gt; &gt; report<br>&gt; &gt; &gt; what function ca=
used it, which makes it as good as no error message.<br>&gt; &gt; &gt; Can =
this be dropped ?<br>&gt; &gt; <br>&gt; &gt; resp[RESP=5FRETURN=5FSTATUS] i=
s the status reported on the OCC, these<br>&gt; &gt; aren't necessarily err=
ors, though most are. This is translating an OCC<br>&gt; &gt; status code t=
o an error for occ=5Fget=5Fall to pick up. It cannot be<br>&gt; &gt; droppe=
d, we need to know if the occ poll was successful. I'm not sure<br>&gt; &gt=
; what you mean by reporting the function? occ=5Fget=5Fall will fail out if=
<br>&gt; <br>&gt; There are several function returns which all end up here.=
 You don't know<br>&gt; which one actually failed.<br>&gt; <br>&gt; &gt; we=
 report the error here. If it's the scom op that failed we will have<br>&gt=
; &gt; the dev=5Ferr message.<br>&gt; &gt; <br>&gt; But which scom operatio=
n ? You mean it is important to report that some<br>&gt; operation failed, =
but not which one ? Ok, I'll accept that, it just seems<br>&gt; odd.</tt><b=
r><br><tt>Ah, I guess I forgot I removed the dev=5Ferr calls from the actua=
l scom op. I'll</tt><br><tt>try and improve the error handling in this func=
tion then.</tt><br><tt><br>&gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; return rc;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&=
gt; +<br>&gt; &gt; &gt;&gt; +static int occ=5Fget=5Fall(struct occ *driver)=
<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int =
i =3D 0, rc;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 *occ=5Fdata;<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; u16 num=5Fbytes;<br>&gt; &gt; &=
gt;&gt; + &nbsp; &nbsp; &nbsp; const u8 poll=5Fcmd=5Fdata =3D OCC=5FPOLL=5F=
STAT=5FSENSOR;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct device *=
dev =3D driver-&gt;dev;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct=
 occ=5Fresponse *resp =3D &amp;driver-&gt;response;<br>&gt; &gt; &gt;&gt; +=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; occ=5Fdata =3D devm=5Fkzalloc=
(dev, OCC=5FDATA=5FMAX, GFP=5FKERNEL);<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<=
br>&gt; &gt; &gt; I am a bot lost here. What is the purpose of using a devm=
 function ?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Either case, you might want=
 to allocate the memory once and just keep it<br>&gt; &gt; &gt; allocated.<=
br>&gt; &gt; &gt; Allocating a 4k buffer and freeing it each time data is r=
ead from the occ<br>&gt; &gt; &gt; seems<br>&gt; &gt; &gt; to be wasteful a=
nd not really worth it.<br>&gt; &gt; <br>&gt; &gt; Agreed.<br>&gt; &gt; <br=
>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!occ=5Fdat=
a)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 return -ENOMEM;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nb=
sp; &nbsp; rc =3D occ=5Fsend=5Fcmd(driver, 0, OCC=5FPOLL, 1, &amp;poll=5Fcm=
d=5Fdata,<br>&gt; &gt; &gt;&gt; occ=5Fdata);<br>&gt; &gt; &gt;&gt; + &nbsp;=
 &nbsp; &nbsp; if (rc) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;OCC poll failed: %d\n&quot;, rc=
);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 goto out;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;=
&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; num=5Fbytes =3D get=5Fu=
naligned((u16 *)&amp;occ=5Fdata[RESP=5FDATA=5FLENGTH]);<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; num=5Fbytes =3D be16=5Fto=5Fcpu(num=5Fbytes);<br>=
&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; What data is in big endi=
an, and what data is in little endian ?<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;=
 Looks like everything is big endian except for the length in the send<br>&=
gt; &gt; &gt; command.<br>&gt; &gt; &gt; Is that correct ? If so, an explan=
ation would be useful, because the<br>&gt; &gt; logic<br>&gt; &gt; &gt; isn=
't entirely clear.<br>&gt; &gt; <br>&gt; &gt; I'll add some comments.<br>&g=
t; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; dev=
=5Fdbg(dev, &quot;OCC data length: %d\n&quot;, num=5Fbytes);<br>&gt; &gt; &=
gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (num=5Fbytes &gt;=
 OCC=5FDATA=5FMAX) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;OCC data length must be &lt; 4KB\n&=
quot;);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; rc =3D -EINVAL;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; goto out;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; =
}<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (=
num=5Fbytes &lt;=3D 0) {<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &=
gt; This can never be &lt; 0.<br>&gt; &gt; <br>&gt; &gt; Good point.<br>&gt=
; &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;OCC data length is zero\n&quot=
;);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; rc =3D -EINVAL;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; goto out;<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; }<br=
>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* read =
remaining data */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 8=
; i &lt; num=5Fbytes + 8; i +=3D 8) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.getscom(dri=
ver-&gt;bus, OCB=5FDATA,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(u64 *)&amp;occ=5Fdata[=
i]);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; if (rc) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;scom op failed =
rc:%d\n&quot;, rc);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out;<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&g=
t; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +=
 &nbsp; &nbsp; &nbsp; /* don't need more sanity checks; buffer is alloc'd f=
or max<br>&gt; &gt; &gt;&gt; response<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;* size so we just check for valid data in parse=5Focc=5Frespo=
nse<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*/<br>&gt; &gt; &gt;=
<br>&gt; &gt; &gt; Yes, but as mentioned above you don't check in that func=
tion if the data<br>&gt; &gt; &gt; was actually received.<br>&gt; &gt; <br>=
&gt; &gt; If we don't receive data, the data length will be 0 or the low le=
vel<br>&gt; &gt; getscom will fail. So we know we have data here.<br>&gt; &=
gt; <br>&gt; Ok. However, since you don't pass num=5Fbytes to the parse fun=
ction,<br>&gt; there is no verification that num=5Fbytes actually matches w=
hat is in <br>&gt; the packet.<br>&gt; The rest of the header could indicat=
e that there is 4k of data, but num=5Fbytes<br>&gt; reports, say, the minim=
um size. In that case, parse=5Focc=5Fresponse() would end<br>&gt; up parsin=
g a stale buffer.</tt><br><br><tt>Ah, I see your concern about parsing a st=
ale buffer. As is, the driver re-allocs</tt><br><tt>the buffer every time, =
so you won't see stale data. As soon as your run out of</tt><br><tt>real se=
nsor data to parse, the sanity checking will fail. But it makes sense to</t=
t><br><tt>ensure we haven't gone past the amount we've read in anyway, I'll=
 do that.</tt><br><tt><br>&gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &=
nbsp; &nbsp; &nbsp; rc =3D parse=5Focc=5Fresponse(driver, occ=5Fdata, resp)=
;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +out:<br>&gt; &gt; &gt;&gt;=
 + &nbsp; &nbsp; &nbsp; devm=5Fkfree(dev, occ=5Fdata);<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; return rc;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &=
gt;&gt; +<br>&gt; &gt; &gt;&gt; +int occ=5Fupdate=5Fdevice(struct occ *driv=
er)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; i=
nt rc =3D 0;<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; =
&nbsp; mutex=5Flock(&amp;driver-&gt;update=5Flock);<br>&gt; &gt; &gt;&gt; +=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (time=5Fafter(jiffies, dri=
ver-&gt;last=5Fupdated +<br>&gt; &gt; &gt;&gt; driver-&gt;update=5Finterval=
)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; || !driver-&gt=
;valid) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; driver-&gt;valid =3D 1;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt;=
 &gt; &gt; valid is bool.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; +<br>&gt;=
 &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D oc=
c=5Fget=5Fall(driver);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; if (rc)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; driver-&gt;valid =3D=
 0;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; valid is bool.<br=
>&gt; &gt; <br>&gt; &gt; Good point.<br>&gt; &gt; <br>&gt; &gt; &gt;<br>&gt=
; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; driver-&gt;last=5Fupdated =3D jiffies;<br>&gt; &gt; &gt;&gt=
; + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + =
&nbsp; &nbsp; &nbsp; mutex=5Funlock(&amp;driver-&gt;update=5Flock);<br>&gt;=
 &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;<br=
>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +EXPORT=5FSYMBOL(occ=5Fupdate=
=5Fdevice);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +void *occ=5Fget=
=5Fsensor(struct occ *driver, int sensor=5Ftype)<br>&gt; &gt; &gt;&gt; +{<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; int rc;<br>&gt; &gt; &gt;&gt; +=
<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; /* occ=5Fupdate=5Fdevice lock=
s the update lock */<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D oc=
c=5Fupdate=5Fdevice(driver);<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; i=
f (rc) {<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; dev=5Ferr(driver-&gt;dev, &quot;cannot get occ sensor data: %d\n&quo=
t;,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; rc);<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&=
gt; &gt; &gt; Have you counted the number of error messages reported if any=
thing goes<br>&gt; &gt; &gt; wrong.<br>&gt; &gt; &gt; This driver is quite =
noisy. I won't force you to drop the messages, but<br>&gt; &gt; it<br>&gt; =
&gt; &gt; seems<br>&gt; &gt; &gt; to me that if anything goes wrong, the ke=
rnel log will be clogged with<br>&gt; &gt; &gt; messages<br>&gt; &gt; &gt; =
just from this driver.<br>&gt; &gt; <br>&gt; &gt; I'll audit these.<br>&gt;=
 &gt; <br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return NULL;<br>&gt; &gt; &gt;&gt;=
 + &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &=
nbsp; &nbsp; &nbsp; return occ=5Fget=5Fsensor=5Fby=5Ftype(&amp;driver-&gt;r=
esponse, sensor=5Ftype);<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +EX=
PORT=5FSYMBOL(occ=5Fget=5Fsensor);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt=
;&gt; +int occ=5Fget=5Fsensor=5Fvalue(struct occ *occ, int sensor=5Ftype, i=
nt<br>&gt; &gt; &gt;&gt; sensor=5Fnum,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 =
hwmon, long *val)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; return occ-&gt;ops.get=5Fsensor(occ, sensor=5Ftype, sensor=5Fn=
um, hwmon,<br>&gt; &gt; &gt;&gt; val);<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt=
; &gt;&gt; +EXPORT=5FSYMBOL(occ=5Fget=5Fsensor=5Fvalue);<br>&gt; &gt; &gt;&=
gt; +<br>&gt; &gt; &gt;&gt; +void occ=5Fget=5Fresponse=5Fblocks(struct occ =
*occ, struct occ=5Fblocks<br>&gt; &gt; **blocks)<br>&gt; &gt; &gt;&gt; +{<b=
r>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; *blocks =3D &amp;occ-&gt;respon=
se.data;<br>&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +EXPORT=5FSYMBOL(oc=
c=5Fget=5Fresponse=5Fblocks);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;=
 +void occ=5Fset=5Fupdate=5Finterval(struct occ *occ, unsigned long interva=
l)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; oc=
c-&gt;update=5Finterval =3D msecs=5Fto=5Fjiffies(interval);<br>&gt; &gt; &g=
t;&gt; +}<br>&gt; &gt; &gt;&gt; +EXPORT=5FSYMBOL(occ=5Fset=5Fupdate=5Finter=
val);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +int occ=5Fset=5Fuser=
=5Fpowercap(struct occ *occ, u16 cap)<br>&gt; &gt; &gt;&gt; +{<br>&gt; &gt;=
 &gt;&gt; + &nbsp; &nbsp; &nbsp; u8 resp[8];<br>&gt; &gt; &gt;&gt; +<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; cap =3D cpu=5Fto=5Fbe16(cap);<br>&gt=
; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; return occ=
=5Fsend=5Fcmd(occ, 0, OCC=5FSET=5FUSER=5FPOWR=5FCAP, 2, (const u8<br>&gt; &=
gt; &gt;&gt; *)&amp;cap,<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp);<br>=
&gt; &gt; &gt;&gt; +}<br>&gt; &gt; &gt;&gt; +EXPORT=5FSYMBOL(occ=5Fset=5Fus=
er=5Fpowercap);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; +struct occ *=
occ=5Fstart(struct device *dev, void *bus,<br>&gt; &gt; &gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct occ=5F=
bus=5Fops *bus=5Fops, const struct occ=5Fops<br>&gt; &gt; &gt;&gt; *ops,<br=
>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; const struct occ=5Fconfig *config)<br>&gt; &gt; &gt;&gt; +=
{<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ *driver =3D devm=
=5Fkzalloc(dev, sizeof(struct occ),<br>&gt; &gt; &gt;&gt; GFP=5FKERNEL);<br=
>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; if (!dri=
ver)<br>&gt; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; return ERR=5FPTR(-ENOMEM);<br>&gt; &gt; &gt;&gt; +<br>&gt; &gt; &gt;&gt;=
 + &nbsp; &nbsp; &nbsp; driver-&gt;dev =3D dev;<br>&gt; &gt; &gt;&gt; + &nb=
sp; &nbsp; &nbsp; driver-&gt;bus =3D bus;<br>&gt; &gt; &gt;&gt; + &nbsp; &n=
bsp; &nbsp; driver-&gt;bus=5Fops =3D *bus=5Fops;<br>&gt; &gt; &gt;&gt; + &n=
bsp; &nbsp; &nbsp; driver-&gt;ops =3D *ops;<br>&gt; &gt; &gt;&gt; + &nbsp; =
&nbsp; &nbsp; driver-&gt;config =3D *config;<br>&gt; &gt; &gt;&gt; +<br>&gt=
; &gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; driver-&gt;update=5Finterval =3D HZ;=
<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; The update interval =
is only supposed to be configurable if it can be<br>&gt; &gt; written<br>&g=
t; &gt; &gt; into the hardware. Otherwise it is really up to user space to =
decide how<br>&gt; &gt; &gt; often<br>&gt; &gt; &gt; it wants to poll the d=
ata, not up to the kernel.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; I don't see =
a function to send the update interval to the occ. As such,<br>&gt; &gt; it=
<br>&gt; &gt; &gt; should<br>&gt; &gt; &gt; not be configurable but a const=
ant.<br>&gt; &gt; <br>&gt; &gt; I don't quite follow. Right now, the driver=
 maximum polling rate is<br>&gt; &gt; configurable by userspace (via hwmon =
sysfs attribute). If you mean<br>&gt; &gt; that user space should control t=
hat rate just by how often users read<br>&gt; &gt; the attributes, I'm not =
sure that will work as there are a large<br>&gt; &gt; number of attributes =
that will all try and trigger an occ poll when<br>&gt; &gt; read. Besides, =
different users don't want to communicate about when<br>&gt; &gt; they last=
 polled. If the rate is constant, if may be too slow or too<br>&gt; &gt; fa=
st depending on the system and needs of the users. Why can't the<br>&gt; &g=
t; polling rate be configurable? To user space, the update interval works<b=
r>&gt; &gt; the same if it's driver or hardware.<br>&gt; &gt; <br>&gt; <br>=
&gt; The update=5Finterval attribute is only supposed to exist if writing i=
t<br>&gt; results in writing a value into a chip register. It is supposed t=
o set<br>&gt; the =5Fchip=5F update interval, not the kernel update interva=
l. If you want<br>&gt; to limit the rate of chip accesses, you can do it by=
 using a constant<br>&gt; in the driver, just like other drivers do it.<br>=
&gt; <br>&gt; This is similar to limit registers. If the chip does not supp=
ort limit<br>&gt; registers, we don't make up &quot;soft&quot; limits eithe=
r, but don't support<br>&gt; the respective attributes.</tt><br><br><tt>OK,=
 we'll just use a constant then.</tt><br><tt><br>&gt; <br>&gt; Thanks,<br>&=
gt; Guenter<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A22DFE321248f9e8a93df938690918c8FBB0A22DFE32124--
