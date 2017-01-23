Return-path: <eajames@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <11e7a9a0-2735-79fc-226f-e725aefa4df7@roeck-us.net>
Subject: Re: [PATCH linux v3 1/6] hwmon: Add core On-Chip Controller support for
 POWER CPUs
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com,
        joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 23 Jan 2017 13:28:52 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-2-git-send-email-eajames.ibm@gmail.com>
 <11e7a9a0-2735-79fc-226f-e725aefa4df7@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A22DFF9F1AE8f9e8a93df938690918c8FBB0A22DFF9F1AE"
Content-Disposition: inline
Message-Id: <OFFB249CF0.36530F73-ON002580B1.006A773E-862580B1.006B038A@notes.na.collabserv.com>
List-ID: <linux-hwmon@vger.kernel.org>


--0__=8FBB0A22DFF9F1AE8f9e8a93df938690918c8FBB0A22DFF9F1AE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

I still just can't get gmail to reply to this. Thanks for the review.

On Sat, Jan 21, 2017 at 11:49 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add core support for polling the OCC for it's sensor data and parsing
that
>> data into sensor-specific information.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  Documentation/hwmon/occ    |  40 ++++
>>  MAINTAINERS                |   7 +
>>  drivers/hwmon/Kconfig      |   2 +
>>  drivers/hwmon/Makefile     |   1 +
>>  drivers/hwmon/occ/Kconfig  |  15 ++
>>  drivers/hwmon/occ/Makefile |   1 +
>>  drivers/hwmon/occ/occ.c    | 522
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/hwmon/occ/occ.h    |  81 +++++++
>>  drivers/hwmon/occ/scom.h   |  47 ++++
>>  9 files changed, 716 insertions(+)
>>  create mode 100644 Documentation/hwmon/occ
>>  create mode 100644 drivers/hwmon/occ/Kconfig
>>  create mode 100644 drivers/hwmon/occ/Makefile
>>  create mode 100644 drivers/hwmon/occ/occ.c
>>  create mode 100644 drivers/hwmon/occ/occ.h
>>  create mode 100644 drivers/hwmon/occ/scom.h
>>
>> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
>> new file mode 100644
>> index 0000000..79d1642
>> --- /dev/null
>> +++ b/Documentation/hwmon/occ
>> @@ -0,0 +1,40 @@
>> +Kernel driver occ
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Supported chips:
>> + * ASPEED AST2400
>> + * ASPEED AST2500
>> +
>> +Please note that the chip must be connected to a POWER8 or POWER9
>> processor
>> +(see the BMC - Host Communications section).
>> +
>> +Author: Eddie James <eajames@us.ibm.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for the OCC (On-Chip Controller) on the
>> IBM
>> +POWER8 and POWER9 processors, from a BMC (Baseboard Management
>> Controller). The
>> +OCC is an embedded processor that provides real time power and thermal
>> +monitoring.
>> +
>> +This driver provides an interface on a BMC to poll OCC sensor data, set
>> user
>> +power caps, and perform some basic OCC error handling.
>> +
>> +Currently, all versions of the OCC support four types of sensor data:
>> power,
>> +temperature, frequency, and "caps," which indicate limits and
thresholds
>> used
>> +internally on the OCC.
>> +
>> +BMC - Host Communications
>> +-------------------------
>> +
>> +For the POWER8 application, the BMC can communicate with the P8 over
I2C
>> bus.
>> +However, to access the OCC register space, any data transfer must use a
>> SCOM
>> +operation. SCOM is a procedure to initiate a data transfer, typically
of
>> 8
>> +bytes. SCOMs consist of writing a 32-bit command register and then
>> +reading/writing two 32-bit data registers. This driver implements these
>> +SCOM operations over I2C bus in order to communicate with the OCC.
>> +
>> +For the POWER9 application, the BMC can communicate with the P9 over
FSI
>> bus
>> +and SBE engine. Once again, SCOM operations are required. This driver
>> will
>> +implement SCOM ops over FSI/SBE. This will require the FSI driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5f0420a..f5d4195 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9112,6 +9112,13 @@ T:       git git://linuxtv.org/media=5Ftree.git
>>  S:     Maintained
>>  F:     drivers/media/i2c/ov7670.c
>>
>> +ON-CHIP CONTROLLER HWMON DRIVER
>> +M:     Eddie James <eajames@us.ibm.com>
>> +L:     linux-hwmon@vger.kernel.org
>> +S:     Maintained
>> +F:     Documentation/hwmon/occ
>> +F:     drivers/hwmon/occ/
>> +
>>  ONENAND FLASH DRIVER
>>  M:     Kyungmin Park <kyungmin.park@samsung.com>
>>  L:     linux-mtd@lists.infradead.org
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 190d270..e80ca81 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1240,6 +1240,8 @@ config SENSORS=5FNSA320
>>           This driver can also be built as a module. If so, the module
>>           will be called nsa320-hwmon.
>>
>> +source drivers/hwmon/occ/Kconfig
>> +
>>  config SENSORS=5FPCF8591
>>         tristate "Philips PCF8591 ADC/DAC"
>>         depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index d2cb7e8..c7ec5d4 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -169,6 +169,7 @@ obj-$(CONFIG=5FSENSORS=5FWM831X)        +=3D
wm831x-hwmon.o
>>  obj-$(CONFIG=5FSENSORS=5FWM8350)   +=3D wm8350-hwmon.o
>>  obj-$(CONFIG=5FSENSORS=5FXGENE)    +=3D xgene-hwmon.o
>>
>> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC)  +=3D occ/
>>  obj-$(CONFIG=5FPMBUS)            +=3D pmbus/
>>
>>  ccflags-$(CONFIG=5FHWMON=5FDEBUG=5FCHIP) :=3D -DDEBUG
>> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
>> new file mode 100644
>> index 0000000..cdb64a7
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/Kconfig
>> @@ -0,0 +1,15 @@
>> +#
>> +# On Chip Controller configuration
>> +#
>> +
>> +menuconfig SENSORS=5FPPC=5FOCC
>> +       bool "PPC On-Chip Controller"
>> +       help
>> +         If you say yes here you get support to monitor Power CPU
>> +         sensors via the On-Chip Controller (OCC).
>> +
>> +         Generally this is used by management controllers such as a BMC
>> +         on an OpenPower system.
>> +
>> +         This driver can also be built as a module. If so, the module
>> +         will be called occ.
>> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
>> new file mode 100644
>> index 0000000..93cb52f
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) +=3D occ.o
>> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
>> new file mode 100644
>> index 0000000..3089762
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ.c
>> @@ -0,0 +1,522 @@
>> +/*
>> + * occ.c - OCC hwmon driver
>> + *
>> + * This file contains the methods and data structures for the OCC hwmon
>> driver.
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
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <asm/unaligned.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include "occ.h"
>> +
>> +#define OCC=5FDATA=5FMAX           4096
>> +#define OCC=5FBMC=5FTIMEOUT=5FMS     20000
>> +
>> +/* To generate attn to OCC */
>> +#define ATTN=5FDATA              0x0006B035
>> +
>> +/* For BMC to read/write SRAM */
>> +#define OCB=5FADDRESS            0x0006B070
>> +#define OCB=5FDATA               0x0006B075
>> +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072
>> +#define OCB=5FSTATUS=5FCONTROL=5FOR  0x0006B073
>> +
>> +/* To init OCB */
>> +#define OCB=5FAND=5FINIT0          0xFBFFFFFF
>> +#define OCB=5FAND=5FINIT1          0xFFFFFFFF
>> +#define OCB=5FOR=5FINIT0           0x08000000
>> +#define OCB=5FOR=5FINIT1           0x00000000
>> +
>> +/* To generate attention on OCC */
>> +#define ATTN0                  0x01010000
>> +#define ATTN1                  0x00000000
>> +
>> +/* OCC return status */
>> +#define RESP=5FRETURN=5FCMD=5FIN=5FPRG 0xFF
>> +#define RESP=5FRETURN=5FSUCCESS    0
>> +#define RESP=5FRETURN=5FCMD=5FINVAL  0x11
>> +#define RESP=5FRETURN=5FCMD=5FLEN    0x12
>> +#define RESP=5FRETURN=5FDATA=5FINVAL 0x13
>> +#define RESP=5FRETURN=5FCHKSUM     0x14
>> +#define RESP=5FRETURN=5FOCC=5FERR    0x15
>> +#define RESP=5FRETURN=5FSTATE      0x16
>> +
>> +/* time interval to retry on "command in progress" return status */
>> +#define CMD=5FIN=5FPRG=5FINT=5FMS      100
>> +#define CMD=5FIN=5FPRG=5FRETRIES     (OCC=5FBMC=5FTIMEOUT=5FMS / CMD=5F=
IN=5FPRG=5FINT=5FMS)
>> +
>> +/* OCC command definitions */
>> +#define OCC=5FPOLL               0
>> +#define OCC=5FSET=5FUSER=5FPOWR=5FCAP  0x22
>> +
>> +/* OCC poll command data */
>> +#define OCC=5FPOLL=5FSTAT=5FSENSOR   0x10
>> +
>> +/* OCC response data offsets */
>> +#define RESP=5FRETURN=5FSTATUS     2
>> +#define RESP=5FDATA=5FLENGTH       3
>> +#define RESP=5FHEADER=5FOFFSET     5
>> +#define SENSOR=5FSTR=5FOFFSET      37
>> +#define SENSOR=5FBLOCK=5FNUM=5FOFFSET        43
>> +#define SENSOR=5FBLOCK=5FOFFSET    45
>> +
>> +/* occ=5Fpoll=5Fheader
>> + * structure to match the raw occ poll response data
>> + */
>> +struct occ=5Fpoll=5Fheader {
>> +       u8 status;
>> +       u8 ext=5Fstatus;
>> +       u8 occs=5Fpresent;
>> +       u8 config;
>> +       u8 occ=5Fstate;
>> +       u8 mode;
>> +       u8 ips=5Fstatus;
>> +       u8 error=5Flog=5Fid;
>> +       u32 error=5Flog=5Faddr=5Fstart;
>> +       u16 error=5Flog=5Flength;
>> +       u8 reserved2;
>> +       u8 reserved3;
>> +       u8 occ=5Fcode=5Flevel[16];
>> +       u8 sensor=5Feye=5Fcatcher[6];
>> +       u8 sensor=5Fblock=5Fnum;
>> +       u8 sensor=5Fdata=5Fversion;
>> +} =5F=5Fattribute=5F=5F((packed, aligned(4)));
>> +
>> +struct occ=5Fresponse {
>> +       struct occ=5Fpoll=5Fheader header;
>> +       struct occ=5Fblocks data;
>> +};
>> +
>> +struct occ {
>> +       struct device *dev;
>> +       void *bus;
>> +       struct occ=5Fbus=5Fops bus=5Fops;
>> +       struct occ=5Fops ops;
>> +       struct occ=5Fconfig config;
>> +       unsigned long update=5Finterval;
>> +       unsigned long last=5Fupdated;
>> +       struct mutex update=5Flock;
>> +       struct occ=5Fresponse response;
>> +       bool valid;
>> +};
>> +
>> +static void deinit=5Focc=5Fresp=5Fbuf(struct occ=5Fresponse *resp)
>> +{
>> +       int i;
>> +
>> +       if (!resp)
>> +               return;
>> +
>
>
> This creates the impression that resp can ever be NULL, which is not the
> case.

Agreed. This might go away anyway if I follow your suggestions below
about memory management.

>
>> +       if (!resp->data.blocks)
>> +               return;
>> +
>> +       for (i =3D 0; i < resp->header.sensor=5Fblock=5Fnum; ++i)
>> +               kfree(resp->data.blocks[i].sensors);
>> +
>> +       kfree(resp->data.blocks);
>> +/sensor=5Ftype=5Fs
>>
>> +       memset(resp, 0, sizeof(struct occ=5Fresponse));
>> +
>> +       for (i =3D 0; i < MAX=5FOCC=5FSENSOR=5FTYPE; ++i)
>> +               resp->data.sensor=5Fblock=5Fid[i] =3D -1;
>> +}
>> +
>> +static void *occ=5Fget=5Fsensor=5Fby=5Ftype(struct occ=5Fresponse *resp,
>> +                                   enum sensor=5Ftype t)
>> +{
>> +       if (!resp->data.blocks)
>> +               return NULL;
>> +
>> +       if (resp->data.sensor=5Fblock=5Fid[t] =3D=3D -1)
>> +               return NULL;
>> +
>> +       return resp->data.blocks[resp->data.sensor=5Fblock=5Fid[t]].sens=
ors;
>> +}
>> +
>> +static int occ=5Fcheck=5Fsensor(struct occ *driver, u8 sensor=5Flength,
>> +                           u8 sensor=5Fnum, enum sensor=5Ftype t, int
block)
>> +{
>> +       void *sensor;
>> +       int type=5Fblock=5Fid;
>> +       struct occ=5Fresponse *resp =3D &driver->response;
>> +
>> +       sensor =3D occ=5Fget=5Fsensor=5Fby=5Ftype(resp, t);
>> +
>> +       /* empty sensor block, release older sensor data */
>> +       if (sensor=5Fnum =3D=3D 0 || sensor=5Flength =3D=3D 0) {
>> +               kfree(sensor);
>> +               dev=5Ferr(driver->dev, "no sensor blocks available\n");
>> +               return -ENODATA;
>> +       }
>> +
>> +       type=5Fblock=5Fid =3D resp->data.sensor=5Fblock=5Fid[t];
>> +       if (!sensor || sensor=5Fnum !=3D
>> +           resp->data.blocks[type=5Fblock=5Fid].header.sensor=5Fnum) {
>> +               kfree(sensor);
>> +               resp->data.blocks[block].sensors =3D
>> +                       driver->ops.alloc=5Fsensor(t, sensor=5Fnum);
>> +               if (!resp->data.blocks[block].sensors)
>> +                       return -ENOMEM;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int parse=5Focc=5Fresponse(struct occ *driver, u8 *data,
>> +                             struct occ=5Fresponse *resp)
>> +{
>> +       int b;
>> +       int s;
>> +       int rc;
>> +       int offset =3D SENSOR=5FBLOCK=5FOFFSET;
>> +       int sensor=5Ftype;
>> +       u8 sensor=5Fblock=5Fnum;
>> +       char sensor=5Ftype=5Fstring[5] =3D { 0 };
>
>
> The only purpose of this variable seems to be to zero-terminate it to be
> able
> to print it. Why not use length-limited print functions instead ?

Is there such a function to length limit to dev=5Ferr or dev=5Fdbg?
Otherwise I have to snprintf or strncpy into a string to pass anyway.
I can drop the dev=5Fdbg but I would like to print out the sensor string
if it doesn't match any of the expected ones.

>
>> +       struct sensor=5Fdata=5Fblock=5Fheader *block;
>> +       struct device *dev =3D driver->dev;
>> +
>> +       /* check if the data is valid */
>> +       if (strncmp(&data[SENSOR=5FSTR=5FOFFSET], "SENSOR", 6) !=3D 0) {
>> +               dev=5Ferr(dev, "no SENSOR string in response\n");
>
>
> Are those messages really necessary ? That can create a lot of logging
noise
> if the occ responds with bad data.

I will audit these, but I think it's limited to one error message
logged in any one function in case of error. Is that acceptable?
Otherwise it may be hard to tell where the error occurred.

>
>> +               rc =3D -ENODATA;
>> +               goto err;
>> +       }
>> +
>> +       sensor=5Fblock=5Fnum =3D data[SENSOR=5FBLOCK=5FNUM=5FOFFSET];
>
>
> There is a lot of trust in assuming that this data was actually received.
> At the same time, there is a lot of error checking. Why check if the
> information in this field is valid if you don't check if it was
> received in the first place ?

If we get to parse=5Focc=5Fresponse, we know we got some data back from
the OCC (see occ=5Fget=5Fall). Here we are really checking the response is
a valid one, which I think makes sense in the parsing function.

>
>> +       if (sensor=5Fblock=5Fnum =3D=3D 0) {
>> +               dev=5Ferr(dev, "no sensor blocks available\n");
>> +               rc =3D -ENODATA;
>> +               goto err;
>> +       }
>> +
>> +       /* if number of sensor block has changed, re-malloc */
>> +       if (sensor=5Fblock=5Fnum !=3D resp->header.sensor=5Fblock=5Fnum)=
 {
>> +               deinit=5Focc=5Fresp=5Fbuf(resp);
>> +               resp->data.blocks =3D kcalloc(sensor=5Fblock=5Fnum,
>> +                                           sizeof(struct
>> sensor=5Fdata=5Fblock),
>> +                                           GFP=5FKERNEL);
>> +               if (!resp->data.blocks)
>> +                       return -ENOMEM;
>
>
> Why not just allocate the maximum number of sensors once ? That might
waste
> a bit of memory, but it would make the code much less error prone. We
know
> that
> there will never be more sensors than the number fitting into 4k of
memory,
> so the "waste" would not really be that much.

Fair point. I'll do that.

>
>
>> +       }
>> +
>> +       memcpy(&resp->header, &data[RESP=5FHEADER=5FOFFSET],
>> +              sizeof(struct occ=5Fpoll=5Fheader));
>> +       resp->header.error=5Flog=5Faddr=5Fstart =3D
>> +               be32=5Fto=5Fcpu(resp->header.error=5Flog=5Faddr=5Fstart);
>> +       resp->header.error=5Flog=5Flength =3D
>> +               be16=5Fto=5Fcpu(resp->header.error=5Flog=5Flength);
>> +
>> +       dev=5Fdbg(dev, "Reading %d sensor blocks\n",
>> +               resp->header.sensor=5Fblock=5Fnum);
>> +       for (b =3D 0; b < sensor=5Fblock=5Fnum; b++) {
>> +               block =3D (struct sensor=5Fdata=5Fblock=5Fheader *)&data
[offset];
>> +               /* copy to a null terminated string */
>> +               strncpy(sensor=5Ftype=5Fstring, block->sensor=5Ftype, 4);
>> +               offset +=3D 8;
>> +
>> +               dev=5Fdbg(dev, "sensor block[%d]: type: %s, sensor=5Fnum:
>> %d\n", b,
>> +                       sensor=5Ftype=5Fstring, block->sensor=5Fnum);
>> +
>> +               if (strncmp(block->sensor=5Ftype, "FREQ", 4) =3D=3D 0)
>> +                       sensor=5Ftype =3D FREQ;
>> +               else if (strncmp(block->sensor=5Ftype, "TEMP", 4) =3D=3D=
 0)
>> +                       sensor=5Ftype =3D TEMP;
>> +               else if (strncmp(block->sensor=5Ftype, "POWR", 4) =3D=3D=
 0)
>> +                       sensor=5Ftype =3D POWER;
>> +               else if (strncmp(block->sensor=5Ftype, "CAPS", 4) =3D=3D=
 0)
>> +                       sensor=5Ftype =3D CAPS;
>> +               else {
>> +                       dev=5Ferr(dev, "sensor type not supported %s\n",
>> +                               sensor=5Ftype=5Fstring);
>> +                       continue;
>> +               }
>> +
>> +               rc =3D occ=5Fcheck=5Fsensor(driver, block->sensor=5Fleng=
th,
>> +                                     block->sensor=5Fnum, sensor=5Ftype,
b);
>> +               if (rc =3D=3D -ENOMEM)
>> +                       goto err;
>> +               else if (rc)
>> +                       continue;
>> +
>> +               resp->data.sensor=5Fblock=5Fid[sensor=5Ftype] =3D b;
>> +               for (s =3D 0; s < block->sensor=5Fnum; s++) {
>> +                       driver->ops.parse=5Fsensor(data,
>> +
>> resp->data.blocks[b].sensors,
>> +                                                sensor=5Ftype, offset,
s);
>> +                       offset +=3D block->sensor=5Flength;
>> +               }
>> +
>> +               /* copy block data over to response pointer */
>> +               resp->data.blocks[b].header =3D *block;
>> +       }
>> +
>> +       return 0;
>> +err:
>> +       deinit=5Focc=5Fresp=5Fbuf(resp);
>> +       return rc;
>> +}
>> +
>> +static u8 occ=5Fsend=5Fcmd(struct occ *driver, u8 seq, u8 type, u16 len=
gth,
>> +                      const u8 *data, u8 *resp)
>> +{
>> +       u32 cmd1, cmd2;
>> +       u16 checksum =3D 0;
>> +       u16 length=5Fle =3D cpu=5Fto=5Fle16(length);
>> +       bool retry =3D 0;
>> +       int i, rc, tries =3D 0;
>> +
>> +       cmd1 =3D (seq << 24) | (type << 16) | length=5Fle;
>> +       memcpy(&cmd2, data, length);
>> +       cmd2 <<=3D ((4 - length) * 8);
>> +
>> +       /* checksum: sum of every bytes of cmd1, cmd2 */
>> +       for (i =3D 0; i < 4; i++) {
>> +               checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
>> +               checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
>> +       }
>> +
>> +       cmd2 |=3D checksum << ((2 - length) * 8);
>> +
>> +       /* Init OCB */
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FSTATUS=5FCON=
TROL=5FOR,
>> +                                    OCB=5FOR=5FINIT0, OCB=5FOR=5FINIT1);
>> +       if (rc)
>> +               goto err;
>> +
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus,
OCB=5FSTATUS=5FCONTROL=5FAND,
>> +                                    OCB=5FAND=5FINIT0, OCB=5FAND=5FINIT=
1);
>> +       if (rc)
>> +               goto err;
>> +
>> +       /* Send command, 2nd half of the 64-bit addr is unused (write 0)
>> */
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
>> +                                    driver->config.command=5Faddr, 0);
>> +       if (rc)
>> +               goto err;
>> +
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FDATA, cmd1, =
cmd2);
>> +       if (rc)
>> +               goto err;
>> +
>> +       /* Trigger attention */
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus, ATTN=5FDATA, ATTN0,
>> ATTN1);
>> +       if (rc)
>> +               goto err;
>> +
>> +       /* Get response data */
>> +       rc =3D driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
>> +                                    driver->config.response=5Faddr, 0);
>> +       if (rc)
>> +               goto err;
>> +
>> +       do {
>> +               if (retry) {
>> +                       set=5Fcurrent=5Fstate(TASK=5FINTERRUPTIBLE);
>> +
>> schedule=5Ftimeout(msecs=5Fto=5Fjiffies(CMD=5FIN=5FPRG=5FINT=5FMS));
>> +               }
>> +
>
> Isn't there a better way to do this ? What exactly is interrupted ? The
> getscom function ? If so, shouldn't the timeout be handled there ?

There shouldn't be any interrupt. I set TASK=5FINTERRUPTIBLE because it
doesn't really matter if it's interrupted or not. The purpose of this
loop is to retry if we get the "command in progress" status from the
OCC. It's higher level than the getscom function, so I think the loop
is appropriate here.

>
>> +               rc =3D driver->bus=5Fops.getscom(driver->bus, OCB=5FDATA,
>> +                                            (u64 *)resp);
>> +               if (rc)
>> +                       goto err;
>> +
>> +               /* retry if we get "command in progress" return status
*/
>> +               retry =3D (resp[RESP=5FRETURN=5FSTATUS] =3D=3D
>> RESP=5FRETURN=5FCMD=5FIN=5FPRG) &&
>> +                       (tries++ < CMD=5FIN=5FPRG=5FRETRIES);
>
>
> There are some unnecessary () in this expression.
>
>
>> +       } while (retry);
>> +
>> +       switch (resp[RESP=5FRETURN=5FSTATUS]) {
>> +       case RESP=5FRETURN=5FCMD=5FIN=5FPRG:
>> +               rc =3D -EALREADY;
>> +               break;
>> +       case RESP=5FRETURN=5FSUCCESS:
>> +               rc =3D 0;
>> +               break;
>> +       case RESP=5FRETURN=5FCMD=5FINVAL:
>> +       case RESP=5FRETURN=5FCMD=5FLEN:
>> +       case RESP=5FRETURN=5FDATA=5FINVAL:
>> +       case RESP=5FRETURN=5FCHKSUM:
>> +               rc =3D -EINVAL;
>> +               break;
>> +       case RESP=5FRETURN=5FOCC=5FERR:
>> +               rc =3D -EREMOTE;
>> +               break;
>> +       default:
>> +               rc =3D -EFAULT;
>> +       }
>> +
>> +       return rc;
>> +
>> +err:
>> +       dev=5Ferr(driver->dev, "scom op failed rc:%d\n", rc);
>
>
> Some of the errors result in an error message, some don't. What is
> the guiding principle ? Even if there is an error message, it doesn't
report
> what function caused it, which makes it as good as no error message.
> Can this be dropped ?

resp[RESP=5FRETURN=5FSTATUS] is the status reported on the OCC, these
aren't necessarily errors, though most are. This is translating an OCC
status code to an error for occ=5Fget=5Fall to pick up. It cannot be
dropped, we need to know if the occ poll was successful. I'm not sure
what you mean by reporting the function? occ=5Fget=5Fall will fail out if
we report the error here. If it's the scom op that failed we will have
the dev=5Ferr message.

>
>> +       return rc;
>> +}
>> +
>> +static int occ=5Fget=5Fall(struct occ *driver)
>> +{
>> +       int i =3D 0, rc;
>> +       u8 *occ=5Fdata;
>> +       u16 num=5Fbytes;
>> +       const u8 poll=5Fcmd=5Fdata =3D OCC=5FPOLL=5FSTAT=5FSENSOR;
>> +       struct device *dev =3D driver->dev;
>> +       struct occ=5Fresponse *resp =3D &driver->response;
>> +
>> +       occ=5Fdata =3D devm=5Fkzalloc(dev, OCC=5FDATA=5FMAX, GFP=5FKERNE=
L);
>
>
> I am a bot lost here. What is the purpose of using a devm function ?
>
> Either case, you might want to allocate the memory once and just keep it
> allocated.
> Allocating a 4k buffer and freeing it each time data is read from the occ
> seems
> to be wasteful and not really worth it.

Agreed.

>
>> +       if (!occ=5Fdata)
>> +               return -ENOMEM;
>> +
>> +       rc =3D occ=5Fsend=5Fcmd(driver, 0, OCC=5FPOLL, 1, &poll=5Fcmd=5F=
data,
>> occ=5Fdata);
>> +       if (rc) {
>> +               dev=5Ferr(dev, "OCC poll failed: %d\n", rc);
>> +               goto out;
>> +       }
>> +
>> +       num=5Fbytes =3D get=5Funaligned((u16 *)&occ=5Fdata[RESP=5FDATA=
=5FLENGTH]);
>> +       num=5Fbytes =3D be16=5Fto=5Fcpu(num=5Fbytes);
>
>
> What data is in big endian, and what data is in little endian ?
>
> Looks like everything is big endian except for the length in the send
> command.
> Is that correct ? If so, an explanation would be useful, because the
logic
> isn't entirely clear.

I'll add some comments.

>
>> +       dev=5Fdbg(dev, "OCC data length: %d\n", num=5Fbytes);
>> +
>> +       if (num=5Fbytes > OCC=5FDATA=5FMAX) {
>> +               dev=5Ferr(dev, "OCC data length must be < 4KB\n");
>> +               rc =3D -EINVAL;
>> +               goto out;
>> +       }
>> +
>> +       if (num=5Fbytes <=3D 0) {
>
>
> This can never be < 0.

Good point.

>
>> +               dev=5Ferr(dev, "OCC data length is zero\n");
>> +               rc =3D -EINVAL;
>> +               goto out;
>> +       }
>> +
>> +       /* read remaining data */
>> +       for (i =3D 8; i < num=5Fbytes + 8; i +=3D 8) {
>> +               rc =3D driver->bus=5Fops.getscom(driver->bus, OCB=5FDATA,
>> +                                            (u64 *)&occ=5Fdata[i]);
>> +               if (rc) {
>> +                       dev=5Ferr(dev, "scom op failed rc:%d\n", rc);
>> +                       goto out;
>> +               }
>> +       }
>> +
>> +       /* don't need more sanity checks; buffer is alloc'd for max
>> response
>> +        * size so we just check for valid data in parse=5Focc=5Fresponse
>> +        */
>
> Yes, but as mentioned above you don't check in that function if the data
> was actually received.

If we don't receive data, the data length will be 0 or the low level
getscom will fail. So we know we have data here.

>
>> +       rc =3D parse=5Focc=5Fresponse(driver, occ=5Fdata, resp);
>> +
>> +out:
>> +       devm=5Fkfree(dev, occ=5Fdata);
>> +       return rc;
>> +}
>> +
>> +int occ=5Fupdate=5Fdevice(struct occ *driver)
>> +{
>> +       int rc =3D 0;
>> +
>> +       mutex=5Flock(&driver->update=5Flock);
>> +
>> +       if (time=5Fafter(jiffies, driver->last=5Fupdated +
>> driver->update=5Finterval)
>> +           || !driver->valid) {
>> +               driver->valid =3D 1;
>
>
> valid is bool.
>
>> +
>> +               rc =3D occ=5Fget=5Fall(driver);
>> +               if (rc)
>> +                       driver->valid =3D 0;
>
>
> valid is bool.

Good point.

>
>> +
>> +               driver->last=5Fupdated =3D jiffies;
>> +       }
>> +
>> +       mutex=5Funlock(&driver->update=5Flock);
>> +
>> +       return rc;
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fupdate=5Fdevice);
>> +
>> +void *occ=5Fget=5Fsensor(struct occ *driver, int sensor=5Ftype)
>> +{
>> +       int rc;
>> +
>> +       /* occ=5Fupdate=5Fdevice locks the update lock */
>> +       rc =3D occ=5Fupdate=5Fdevice(driver);
>> +       if (rc) {
>> +               dev=5Ferr(driver->dev, "cannot get occ sensor data: %d\n=
",
>> +                       rc);
>
>
> Have you counted the number of error messages reported if anything goes
> wrong.
> This driver is quite noisy. I won't force you to drop the messages, but
it
> seems
> to me that if anything goes wrong, the kernel log will be clogged with
> messages
> just from this driver.

I'll audit these.

>
>
>> +               return NULL;
>> +       }
>> +
>> +       return occ=5Fget=5Fsensor=5Fby=5Ftype(&driver->response, sensor=
=5Ftype);
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fget=5Fsensor);
>> +
>> +int occ=5Fget=5Fsensor=5Fvalue(struct occ *occ, int sensor=5Ftype, int
>> sensor=5Fnum,
>> +                        u32 hwmon, long *val)
>> +{
>> +       return occ->ops.get=5Fsensor(occ, sensor=5Ftype, sensor=5Fnum, h=
wmon,
>> val);
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fget=5Fsensor=5Fvalue);
>> +
>> +void occ=5Fget=5Fresponse=5Fblocks(struct occ *occ, struct occ=5Fblocks
**blocks)
>> +{
>> +       *blocks =3D &occ->response.data;
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fget=5Fresponse=5Fblocks);
>> +
>> +void occ=5Fset=5Fupdate=5Finterval(struct occ *occ, unsigned long inter=
val)
>> +{
>> +       occ->update=5Finterval =3D msecs=5Fto=5Fjiffies(interval);
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fset=5Fupdate=5Finterval);
>> +
>> +int occ=5Fset=5Fuser=5Fpowercap(struct occ *occ, u16 cap)
>> +{
>> +       u8 resp[8];
>> +
>> +       cap =3D cpu=5Fto=5Fbe16(cap);
>> +
>> +       return occ=5Fsend=5Fcmd(occ, 0, OCC=5FSET=5FUSER=5FPOWR=5FCAP, 2=
, (const u8
>> *)&cap,
>> +                           resp);
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fset=5Fuser=5Fpowercap);
>> +
>> +struct occ *occ=5Fstart(struct device *dev, void *bus,
>> +                     struct occ=5Fbus=5Fops *bus=5Fops, const struct oc=
c=5Fops
>> *ops,
>> +                     const struct occ=5Fconfig *config)
>> +{
>> +       struct occ *driver =3D devm=5Fkzalloc(dev, sizeof(struct occ),
>> GFP=5FKERNEL);
>> +
>> +       if (!driver)
>> +               return ERR=5FPTR(-ENOMEM);
>> +
>> +       driver->dev =3D dev;
>> +       driver->bus =3D bus;
>> +       driver->bus=5Fops =3D *bus=5Fops;
>> +       driver->ops =3D *ops;
>> +       driver->config =3D *config;
>> +
>> +       driver->update=5Finterval =3D HZ;
>
>
> The update interval is only supposed to be configurable if it can be
written
> into the hardware. Otherwise it is really up to user space to decide how
> often
> it wants to poll the data, not up to the kernel.
>
> I don't see a function to send the update interval to the occ. As such,
it
> should
> not be configurable but a constant.

I don't quite follow. Right now, the driver maximum polling rate is
configurable by userspace (via hwmon sysfs attribute). If you mean
that user space should control that rate just by how often users read
the attributes, I'm not sure that will work as there are a large
number of attributes that will all try and trigger an occ poll when
read. Besides, different users don't want to communicate about when
they last polled. If the rate is constant, if may be too slow or too
fast depending on the system and needs of the users. Why can't the
polling rate be configurable? To user space, the update interval works
the same if it's driver or hardware.

>
>
>> +       mutex=5Finit(&driver->update=5Flock);
>> +
>> +       return driver;
>> +}
>> +EXPORT=5FSYMBOL(occ=5Fstart);
>> +
>> +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
>> +MODULE=5FDESCRIPTION("OCC hwmon core driver");
>> +MODULE=5FLICENSE("GPL");
>> diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
>> new file mode 100644
>> index 0000000..c86b06a
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ.h
>> @@ -0,0 +1,81 @@
>> +/*
>> + * occ.h - hwmon OCC driver
>> + *
>> + * This file contains data structures and function prototypes for
common
>> access
>> + * between different bus protocols and host systems.
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
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef =5F=5FOCC=5FH=5F=5F
>> +#define =5F=5FOCC=5FH=5F=5F
>> +
>> +#include "scom.h"
>> +
>> +struct device;
>> +struct occ;
>> +
>> +/* sensor=5Fdata=5Fblock=5Fheader
>> + * structure to match the raw occ sensor block header
>> + */
>> +struct sensor=5Fdata=5Fblock=5Fheader {
>> +       u8 sensor=5Ftype[4];
>> +       u8 reserved0;
>> +       u8 sensor=5Fformat;
>> +       u8 sensor=5Flength;
>> +       u8 sensor=5Fnum;
>> +} =5F=5Fattribute=5F=5F((packed, aligned(4)));
>> +
>> +struct sensor=5Fdata=5Fblock {
>> +       struct sensor=5Fdata=5Fblock=5Fheader header;
>> +       void *sensors;
>> +};
>> +
>> +enum sensor=5Ftype {
>> +       FREQ =3D 0,
>> +       TEMP,
>> +       POWER,
>> +       CAPS,
>> +       MAX=5FOCC=5FSENSOR=5FTYPE
>> +};
>> +
>> +struct occ=5Fops {
>> +       void (*parse=5Fsensor)(u8 *data, void *sensor, int sensor=5Ftype,
int
>> off,
>> +                            int snum);
>> +       void *(*alloc=5Fsensor)(int sensor=5Ftype, int num=5Fsensors);
>> +       int (*get=5Fsensor)(struct occ *driver, int sensor=5Ftype, int
>> sensor=5Fnum,
>> +                         u32 hwmon, long *val);
>> +};
>> +
>> +struct occ=5Fconfig {
>> +       u32 command=5Faddr;
>> +       u32 response=5Faddr;
>> +};
>> +
>> +struct occ=5Fblocks {
>> +       int sensor=5Fblock=5Fid[MAX=5FOCC=5FSENSOR=5FTYPE];
>> +       struct sensor=5Fdata=5Fblock *blocks;
>> +};
>> +
>> +struct occ *occ=5Fstart(struct device *dev, void *bus,
>> +                     struct occ=5Fbus=5Fops *bus=5Fops, const struct oc=
c=5Fops
>> *ops,
>> +                     const struct occ=5Fconfig *config);
>> +void *occ=5Fget=5Fsensor(struct occ *occ, int sensor=5Ftype);
>> +int occ=5Fget=5Fsensor=5Fvalue(struct occ *occ, int sensor=5Ftype, int
>> sensor=5Fnum,
>> +                        u32 hwmon, long *val);
>> +void occ=5Fget=5Fresponse=5Fblocks(struct occ *occ, struct occ=5Fblocks
>> **blocks);
>> +int occ=5Fupdate=5Fdevice(struct occ *driver);
>> +void occ=5Fset=5Fupdate=5Finterval(struct occ *occ, unsigned long inter=
val);
>> +int occ=5Fset=5Fuser=5Fpowercap(struct occ *occ, u16 cap);
>> +
>> +#endif /* =5F=5FOCC=5FH=5F=5F */
>> diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
>> new file mode 100644
>> index 0000000..c1da645
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/scom.h
>> @@ -0,0 +1,47 @@
>> +/*
>> + * scom.h - hwmon OCC driver
>> + *
>> + * This file contains data structures for scom operations to the OCC
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
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef =5F=5FSCOM=5FH=5F=5F
>> +#define =5F=5FSCOM=5FH=5F=5F
>> +
>> +/*
>> + * occ=5Fbus=5Fops - represent the low-level transfer methods to
communicate
>> with
>> + * the OCC.
>> + *
>> + * getscom - OCC scom read
>> + * @bus: handle to slave device
>> + * @address: address
>> + * @data: where to store data read from slave; buffer size must be at
>> least
>> + * eight bytes.
>> + *
>> + * Returns 0 on success or a negative errno on error
>> + *
>> + * putscom - OCC scom write
>> + * @bus: handle to slave device
>> + * @address: address
>> + * @data0: first data byte to write
>> + * @data1: second data byte to write
>
>
> 32 bit bytes ? It might also be worthwhile to mention the expected byte
> order.

Good point.


>
>
>> + *
>> + * Returns 0 on success or a negative errno on error
>> + */
>> +struct occ=5Fbus=5Fops {
>> +       int (*getscom)(void *bus, u32 address, u64 *data);
>> +       int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
>> +};
>> +
>> +#endif /* =5F=5FSCOM=5FH=5F=5F */
>>
>

--0__=8FBB0A22DFF9F1AE8f9e8a93df938690918c8FBB0A22DFF9F1AE
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p><tt>I still just can't get gmail to reply to this. Thanks fo=
r the review.</tt><br><br><tt>On Sat, Jan 21, 2017 at 11:49 AM, Guenter Roe=
ck &lt;linux@roeck-us.net&gt; wrote:</tt><br><tt>&gt; On 01/16/2017 01:13 P=
M, eajames.ibm@gmail.com wrote:</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; F=
rom: &quot;Edward A. James&quot; &lt;eajames@us.ibm.com&gt;</tt><br><tt>&gt=
;&gt;</tt><br><tt>&gt;&gt; Add core support for polling the OCC for it's se=
nsor data and parsing that</tt><br><tt>&gt;&gt; data into sensor-specific i=
nformation.</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; Signed-off-by: Edward=
 A. James &lt;eajames@us.ibm.com&gt;</tt><br><tt>&gt;&gt; Signed-off-by: An=
drew Jeffery &lt;andrew@aj.id.au&gt;</tt><br><tt>&gt;&gt; ---</tt><br><tt>&=
gt;&gt; &nbsp;Documentation/hwmon/occ &nbsp; &nbsp;| &nbsp;40 ++++</tt><br>=
<tt>&gt;&gt; &nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 7 +</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/Kconfig &n=
bsp; &nbsp; &nbsp;| &nbsp; 2 +</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/Mak=
efile &nbsp; &nbsp; | &nbsp; 1 +</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/o=
cc/Kconfig &nbsp;| &nbsp;15 ++</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/occ=
/Makefile | &nbsp; 1 +</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/occ/occ.c &=
nbsp; &nbsp;| 522</tt><br><tt>&gt;&gt; ++++++++++++++++++++++++++++++++++++=
+++++++++</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/occ/occ.h &nbsp; &nbsp;|=
 &nbsp;81 +++++++</tt><br><tt>&gt;&gt; &nbsp;drivers/hwmon/occ/scom.h &nbsp=
; | &nbsp;47 ++++</tt><br><tt>&gt;&gt; &nbsp;9 files changed, 716 insertion=
s(+)</tt><br><tt>&gt;&gt; &nbsp;create mode 100644 Documentation/hwmon/occ<=
/tt><br><tt>&gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/Kconfig</tt=
><br><tt>&gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/Makefile</tt><=
br><tt>&gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ.c</tt><br><t=
t>&gt;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ.h</tt><br><tt>&gt=
;&gt; &nbsp;create mode 100644 drivers/hwmon/occ/scom.h</tt><br><tt>&gt;&gt=
;</tt><br><tt>&gt;&gt; diff --git a/Documentation/hwmon/occ b/Documentation=
/hwmon/occ</tt><br><tt>&gt;&gt; new file mode 100644</tt><br><tt>&gt;&gt; i=
ndex 0000000..79d1642</tt><br><tt>&gt;&gt; --- /dev/null</tt><br><tt>&gt;&g=
t; +++ b/Documentation/hwmon/occ</tt><br><tt>&gt;&gt; @@ -0,0 +1,40 @@</tt>=
<br><tt>&gt;&gt; +Kernel driver occ</tt><br><tt>&gt;&gt; +=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt=
;&gt; +Supported chips:</tt><br><tt>&gt;&gt; + * ASPEED AST2400</tt><br><tt=
>&gt;&gt; + * ASPEED AST2500</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +P=
lease note that the chip must be connected to a POWER8 or POWER9</tt><br><t=
t>&gt;&gt; processor</tt><br><tt>&gt;&gt; +(see the BMC - Host Communicatio=
ns section).</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +Author: Eddie Jam=
es &lt;eajames@us.ibm.com&gt;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +=
Description</tt><br><tt>&gt;&gt; +-----------</tt><br><tt>&gt;&gt; +</tt><b=
r><tt>&gt;&gt; +This driver implements support for the OCC (On-Chip Control=
ler) on the</tt><br><tt>&gt;&gt; IBM</tt><br><tt>&gt;&gt; +POWER8 and POWER=
9 processors, from a BMC (Baseboard Management</tt><br><tt>&gt;&gt; Control=
ler). The</tt><br><tt>&gt;&gt; +OCC is an embedded processor that provides =
real time power and thermal</tt><br><tt>&gt;&gt; +monitoring.</tt><br><tt>&=
gt;&gt; +</tt><br><tt>&gt;&gt; +This driver provides an interface on a BMC =
to poll OCC sensor data, set</tt><br><tt>&gt;&gt; user</tt><br><tt>&gt;&gt;=
 +power caps, and perform some basic OCC error handling.</tt><br><tt>&gt;&g=
t; +</tt><br><tt>&gt;&gt; +Currently, all versions of the OCC support four =
types of sensor data:</tt><br><tt>&gt;&gt; power,</tt><br><tt>&gt;&gt; +tem=
perature, frequency, and &quot;caps,&quot; which indicate limits and thresh=
olds</tt><br><tt>&gt;&gt; used</tt><br><tt>&gt;&gt; +internally on the OCC.=
</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +BMC - Host Communications</tt=
><br><tt>&gt;&gt; +-------------------------</tt><br><tt>&gt;&gt; +</tt><br=
><tt>&gt;&gt; +For the POWER8 application, the BMC can communicate with the=
 P8 over I2C</tt><br><tt>&gt;&gt; bus.</tt><br><tt>&gt;&gt; +However, to ac=
cess the OCC register space, any data transfer must use a</tt><br><tt>&gt;&=
gt; SCOM</tt><br><tt>&gt;&gt; +operation. SCOM is a procedure to initiate a=
 data transfer, typically of</tt><br><tt>&gt;&gt; 8</tt><br><tt>&gt;&gt; +b=
ytes. SCOMs consist of writing a 32-bit command register and then</tt><br><=
tt>&gt;&gt; +reading/writing two 32-bit data registers. This driver impleme=
nts these</tt><br><tt>&gt;&gt; +SCOM operations over I2C bus in order to co=
mmunicate with the OCC.</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +For th=
e POWER9 application, the BMC can communicate with the P9 over FSI</tt><br>=
<tt>&gt;&gt; bus</tt><br><tt>&gt;&gt; +and SBE engine. Once again, SCOM ope=
rations are required. This driver</tt><br><tt>&gt;&gt; will</tt><br><tt>&gt=
;&gt; +implement SCOM ops over FSI/SBE. This will require the FSI driver.</=
tt><br><tt>&gt;&gt; diff --git a/MAINTAINERS b/MAINTAINERS</tt><br><tt>&gt;=
&gt; index 5f0420a..f5d4195 100644</tt><br><tt>&gt;&gt; --- a/MAINTAINERS</=
tt><br><tt>&gt;&gt; +++ b/MAINTAINERS</tt><br><tt>&gt;&gt; @@ -9112,6 +9112=
,13 @@ T: &nbsp; &nbsp; &nbsp; git git://linuxtv.org/media=5Ftree.git</tt><=
br><tt>&gt;&gt; &nbsp;S: &nbsp; &nbsp; Maintained</tt><br><tt>&gt;&gt; &nbs=
p;F: &nbsp; &nbsp; drivers/media/i2c/ov7670.c</tt><br><tt>&gt;&gt;</tt><br>=
<tt>&gt;&gt; +ON-CHIP CONTROLLER HWMON DRIVER</tt><br><tt>&gt;&gt; +M: &nbs=
p; &nbsp; Eddie James &lt;eajames@us.ibm.com&gt;</tt><br><tt>&gt;&gt; +L: &=
nbsp; &nbsp; linux-hwmon@vger.kernel.org</tt><br><tt>&gt;&gt; +S: &nbsp; &n=
bsp; Maintained</tt><br><tt>&gt;&gt; +F: &nbsp; &nbsp; Documentation/hwmon/=
occ</tt><br><tt>&gt;&gt; +F: &nbsp; &nbsp; drivers/hwmon/occ/</tt><br><tt>&=
gt;&gt; +</tt><br><tt>&gt;&gt; &nbsp;ONENAND FLASH DRIVER</tt><br><tt>&gt;&=
gt; &nbsp;M: &nbsp; &nbsp; Kyungmin Park &lt;kyungmin.park@samsung.com&gt;<=
/tt><br><tt>&gt;&gt; &nbsp;L: &nbsp; &nbsp; linux-mtd@lists.infradead.org</=
tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kcon=
fig</tt><br><tt>&gt;&gt; index 190d270..e80ca81 100644</tt><br><tt>&gt;&gt;=
 --- a/drivers/hwmon/Kconfig</tt><br><tt>&gt;&gt; +++ b/drivers/hwmon/Kconf=
ig</tt><br><tt>&gt;&gt; @@ -1240,6 +1240,8 @@ config SENSORS=5FNSA320</tt><=
br><tt>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; This driver can also be =
built as a module. If so, the module</tt><br><tt>&gt;&gt; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; will be called nsa320-hwmon.</tt><br><tt>&gt;&gt;</tt><br=
><tt>&gt;&gt; +source drivers/hwmon/occ/Kconfig</tt><br><tt>&gt;&gt; +</tt>=
<br><tt>&gt;&gt; &nbsp;config SENSORS=5FPCF8591</tt><br><tt>&gt;&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; tristate &quot;Philips PCF8591 ADC/DAC&quot;</tt><br>=
<tt>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; depends on I2C</tt><br><tt>&gt;&gt=
; diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile</tt><br><tt>=
&gt;&gt; index d2cb7e8..c7ec5d4 100644</tt><br><tt>&gt;&gt; --- a/drivers/h=
wmon/Makefile</tt><br><tt>&gt;&gt; +++ b/drivers/hwmon/Makefile</tt><br><tt=
>&gt;&gt; @@ -169,6 +169,7 @@ obj-$(CONFIG=5FSENSORS=5FWM831X) &nbsp; &nbsp=
; &nbsp; &nbsp;+=3D wm831x-hwmon.o</tt><br><tt>&gt;&gt; &nbsp;obj-$(CONFIG=
=5FSENSORS=5FWM8350) &nbsp; +=3D wm8350-hwmon.o</tt><br><tt>&gt;&gt; &nbsp;=
obj-$(CONFIG=5FSENSORS=5FXGENE) &nbsp; &nbsp;+=3D xgene-hwmon.o</tt><br><tt=
>&gt;&gt;</tt><br><tt>&gt;&gt; +obj-$(CONFIG=5FSENSORS=5FPPC=5FOCC) &nbsp;+=
=3D occ/</tt><br><tt>&gt;&gt; &nbsp;obj-$(CONFIG=5FPMBUS) &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;+=3D pmbus/</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&g=
t; &nbsp;ccflags-$(CONFIG=5FHWMON=5FDEBUG=5FCHIP) :=3D -DDEBUG</tt><br><tt>=
&gt;&gt; diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig=
</tt><br><tt>&gt;&gt; new file mode 100644</tt><br><tt>&gt;&gt; index 00000=
00..cdb64a7</tt><br><tt>&gt;&gt; --- /dev/null</tt><br><tt>&gt;&gt; +++ b/d=
rivers/hwmon/occ/Kconfig</tt><br><tt>&gt;&gt; @@ -0,0 +1,15 @@</tt><br><tt>=
&gt;&gt; +#</tt><br><tt>&gt;&gt; +# On Chip Controller configuration</tt><b=
r><tt>&gt;&gt; +#</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +menuconfig S=
ENSORS=5FPPC=5FOCC</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; bool &quot;P=
PC On-Chip Controller&quot;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; hel=
p</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; If you say yes here yo=
u get support to monitor Power CPU</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; sensors via the On-Chip Controller (OCC).</tt><br><tt>&gt;&gt; +=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; Generally this is used =
by management controllers such as a BMC</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; on an OpenPower system.</tt><br><tt>&gt;&gt; +</tt><br><tt>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; This driver can also be built as a m=
odule. If so, the module</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 will be called occ.</tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/occ/Ma=
kefile b/drivers/hwmon/occ/Makefile</tt><br><tt>&gt;&gt; new file mode 1006=
44</tt><br><tt>&gt;&gt; index 0000000..93cb52f</tt><br><tt>&gt;&gt; --- /de=
v/null</tt><br><tt>&gt;&gt; +++ b/drivers/hwmon/occ/Makefile</tt><br><tt>&g=
t;&gt; @@ -0,0 +1 @@</tt><br><tt>&gt;&gt; +obj-$(CONFIG=5FSENSORS=5FPPC=5FO=
CC) +=3D occ.o</tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/occ/occ.c b/=
drivers/hwmon/occ/occ.c</tt><br><tt>&gt;&gt; new file mode 100644</tt><br><=
tt>&gt;&gt; index 0000000..3089762</tt><br><tt>&gt;&gt; --- /dev/null</tt><=
br><tt>&gt;&gt; +++ b/drivers/hwmon/occ/occ.c</tt><br><tt>&gt;&gt; @@ -0,0 =
+1,522 @@</tt><br><tt>&gt;&gt; +/*</tt><br><tt>&gt;&gt; + * occ.c - OCC hwm=
on driver</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This file conta=
ins the methods and data structures for the OCC hwmon</tt><br><tt>&gt;&gt; =
driver.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * Copyright 2016 IB=
M Corp.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This program is f=
ree software; you can redistribute it and/or modify</tt><br><tt>&gt;&gt; + =
* it under the terms of the GNU General Public License as published by</tt>=
<br><tt>&gt;&gt; + * the Free Software Foundation; either version 2 of the =
License, or</tt><br><tt>&gt;&gt; + * (at your option) any later version.</t=
t><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This program is distributed=
 in the hope that it will be useful,</tt><br><tt>&gt;&gt; + * but WITHOUT A=
NY WARRANTY; without even the implied warranty of</tt><br><tt>&gt;&gt; + * =
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. &nbsp;See the</tt><br>=
<tt>&gt;&gt; + * GNU General Public License for more details.</tt><br><tt>&=
gt;&gt; + */</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +#include &lt;asm/=
unaligned.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/delay.h&gt;</tt><b=
r><tt>&gt;&gt; +#include &lt;linux/device.h&gt;</tt><br><tt>&gt;&gt; +#incl=
ude &lt;linux/err.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/init.h&gt;=
</tt><br><tt>&gt;&gt; +#include &lt;linux/jiffies.h&gt;</tt><br><tt>&gt;&gt=
; +#include &lt;linux/kernel.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux=
/module.h&gt;</tt><br><tt>&gt;&gt; +#include &lt;linux/mutex.h&gt;</tt><br>=
<tt>&gt;&gt; +#include &lt;linux/slab.h&gt;</tt><br><tt>&gt;&gt; +#include =
&quot;occ.h&quot;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +#define OCC=
=5FDATA=5FMAX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4096</tt><br><tt>&gt;&gt; =
+#define OCC=5FBMC=5FTIMEOUT=5FMS &nbsp; &nbsp; 20000</tt><br><tt>&gt;&gt; =
+</tt><br><tt>&gt;&gt; +/* To generate attn to OCC */</tt><br><tt>&gt;&gt; =
+#define ATTN=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x0006=
B035</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/* For BMC to read/write =
SRAM */</tt><br><tt>&gt;&gt; +#define OCB=5FADDRESS &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;0x0006B070</tt><br><tt>&gt;&gt; +#define OCB=5FDATA &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x0006B075</tt><br><tt>&gt;&gt;=
 +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072</tt><br><tt>&gt;&gt; +#de=
fine OCB=5FSTATUS=5FCONTROL=5FOR &nbsp;0x0006B073</tt><br><tt>&gt;&gt; +</t=
t><br><tt>&gt;&gt; +/* To init OCB */</tt><br><tt>&gt;&gt; +#define OCB=5FA=
ND=5FINIT0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0xFBFFFFFF</tt><br><tt>&gt;&gt=
; +#define OCB=5FAND=5FINIT1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0xFFFFFFFF</=
tt><br><tt>&gt;&gt; +#define OCB=5FOR=5FINIT0 &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 0x08000000</tt><br><tt>&gt;&gt; +#define OCB=5FOR=5FINIT1 &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; 0x00000000</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&=
gt; +/* To generate attention on OCC */</tt><br><tt>&gt;&gt; +#define ATTN0=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x01010000</=
tt><br><tt>&gt;&gt; +#define ATTN1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;0x00000000</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt=
; +/* OCC return status */</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FCM=
D=5FIN=5FPRG 0xFF</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FSUCCESS &nb=
sp; &nbsp;0</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FCMD=5FINVAL &nbsp=
;0x11</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FCMD=5FLEN &nbsp; &nbsp;=
0x12</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FDATA=5FINVAL 0x13</tt><b=
r><tt>&gt;&gt; +#define RESP=5FRETURN=5FCHKSUM &nbsp; &nbsp; 0x14</tt><br><=
tt>&gt;&gt; +#define RESP=5FRETURN=5FOCC=5FERR &nbsp; &nbsp;0x15</tt><br><t=
t>&gt;&gt; +#define RESP=5FRETURN=5FSTATE &nbsp; &nbsp; &nbsp;0x16</tt><br>=
<tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/* time interval to retry on &quot;com=
mand in progress&quot; return status */</tt><br><tt>&gt;&gt; +#define CMD=
=5FIN=5FPRG=5FINT=5FMS &nbsp; &nbsp; &nbsp;100</tt><br><tt>&gt;&gt; +#defin=
e CMD=5FIN=5FPRG=5FRETRIES &nbsp; &nbsp; (OCC=5FBMC=5FTIMEOUT=5FMS / CMD=5F=
IN=5FPRG=5FINT=5FMS)</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/* OCC co=
mmand definitions */</tt><br><tt>&gt;&gt; +#define OCC=5FPOLL &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</tt><br><tt>&gt;&gt; +#define OCC=5FS=
ET=5FUSER=5FPOWR=5FCAP &nbsp;0x22</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&g=
t; +/* OCC poll command data */</tt><br><tt>&gt;&gt; +#define OCC=5FPOLL=5F=
STAT=5FSENSOR &nbsp; 0x10</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/* O=
CC response data offsets */</tt><br><tt>&gt;&gt; +#define RESP=5FRETURN=5FS=
TATUS &nbsp; &nbsp; 2</tt><br><tt>&gt;&gt; +#define RESP=5FDATA=5FLENGTH &n=
bsp; &nbsp; &nbsp; 3</tt><br><tt>&gt;&gt; +#define RESP=5FHEADER=5FOFFSET &=
nbsp; &nbsp; 5</tt><br><tt>&gt;&gt; +#define SENSOR=5FSTR=5FOFFSET &nbsp; &=
nbsp; &nbsp;37</tt><br><tt>&gt;&gt; +#define SENSOR=5FBLOCK=5FNUM=5FOFFSET =
&nbsp; &nbsp; &nbsp; &nbsp;43</tt><br><tt>&gt;&gt; +#define SENSOR=5FBLOCK=
=5FOFFSET &nbsp; &nbsp;45</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/* o=
cc=5Fpoll=5Fheader</tt><br><tt>&gt;&gt; + * structure to match the raw occ =
poll response data</tt><br><tt>&gt;&gt; + */</tt><br><tt>&gt;&gt; +struct o=
cc=5Fpoll=5Fheader {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 status;=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 ext=5Fstatus;</tt><br><tt>&=
gt;&gt; + &nbsp; &nbsp; &nbsp; u8 occs=5Fpresent;</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; u8 config;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u=
8 occ=5Fstate;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 mode;</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 ips=5Fstatus;</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; u8 error=5Flog=5Fid;</tt><br><tt>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; u32 error=5Flog=5Faddr=5Fstart;</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; u16 error=5Flog=5Flength;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; u8 reserved2;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 reser=
ved3;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 occ=5Fcode=5Flevel[16]=
;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Feye=5Fcatcher[6];=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Fblock=5Fnum;</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Fdata=5Fversion;</tt><br>=
<tt>&gt;&gt; +} =5F=5Fattribute=5F=5F((packed, aligned(4)));</tt><br><tt>&g=
t;&gt; +</tt><br><tt>&gt;&gt; +struct occ=5Fresponse {</tt><br><tt>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; struct occ=5Fpoll=5Fheader header;</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fblocks data;</tt><br><tt>&gt;&gt; =
+};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct occ {</tt><br><tt>&=
gt;&gt; + &nbsp; &nbsp; &nbsp; struct device *dev;</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; void *bus;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
struct occ=5Fbus=5Fops bus=5Fops;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; struct occ=5Fops ops;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct=
 occ=5Fconfig config;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; unsigned =
long update=5Finterval;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; unsigne=
d long last=5Fupdated;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct m=
utex update=5Flock;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=
=5Fresponse response;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; bool vali=
d;</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +st=
atic void deinit=5Focc=5Fresp=5Fbuf(struct occ=5Fresponse *resp)</tt><br><t=
t>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int i;</tt><br><t=
t>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (!resp)</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;</t=
t><br><tt>&gt;&gt; +</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Thi=
s creates the impression that resp can ever be NULL, which is not the</tt><=
br><tt>&gt; case.</tt><br><br><tt>Agreed. This might go away anyway if I fo=
llow your suggestions below</tt><br><tt>about memory management.</tt><br><b=
r><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (!resp-&gt;data.b=
locks)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; return;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; for (i =3D 0; i &lt; resp-&gt;header.sensor=5Fblock=5Fnum; ++i)</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(resp=
-&gt;data.blocks[i].sensors);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; kfree(resp-&gt;data.blocks);</tt><br><tt>&gt;&gt; +/s=
ensor=5Ftype=5Fs</tt><br><tt>&gt;&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; =
&nbsp; memset(resp, 0, sizeof(struct occ=5Fresponse));</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; MAX=5FO=
CC=5FSENSOR=5FTYPE; ++i)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; resp-&gt;data.sensor=5Fblock=5Fid[i] =3D -1;</tt><br>=
<tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static void *o=
cc=5Fget=5Fsensor=5Fby=5Ftype(struct occ=5Fresponse *resp,</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum sensor=5Ftype t)</t=
t><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (!resp=
-&gt;data.blocks)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; return NULL;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; if (resp-&gt;data.sensor=5Fblock=5Fid[t] =3D=3D -1)</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 NULL;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; r=
eturn resp-&gt;data.blocks[resp-&gt;data.sensor=5Fblock=5Fid[t]].sensors;</=
tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static =
int occ=5Fcheck=5Fsensor(struct occ *driver, u8 sensor=5Flength,</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; u8 sensor=5Fnum, enum sensor=5Ftype t, int blo=
ck)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; voi=
d *sensor;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int type=5Fblock=5Fi=
d;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fresponse *resp =
=3D &amp;driver-&gt;response;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; sensor =3D occ=5Fget=5Fsensor=5Fby=5Ftype(resp, t);</=
tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* empty =
sensor block, release older sensor data */</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; if (sensor=5Fnum =3D=3D 0 || sensor=5Flength =3D=3D 0) {</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(sen=
sor);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; dev=5Ferr(driver-&gt;dev, &quot;no sensor blocks available\n&quot;);</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return=
 -ENODATA;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&g=
t; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; type=5Fblock=5Fid =3D resp=
-&gt;data.sensor=5Fblock=5Fid[t];</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; if (!sensor || sensor=5Fnum !=3D</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; resp-&gt;data.blocks[type=5Fblock=5Fid].header.sensor=5F=
num) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; kfree(sensor);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; resp-&gt;data.blocks[block].sensors =3D</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; driver-&gt;ops.alloc=5Fsensor(t, sensor=5Fnum);</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!resp-&gt;data.block=
s[block].sensors)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; return 0;</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt=
; +</tt><br><tt>&gt;&gt; +static int parse=5Focc=5Fresponse(struct occ *dri=
ver, u8 *data,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct occ=5Fr=
esponse *resp)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; int b;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int s;</tt><br><=
tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int rc;</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; int offset =3D SENSOR=5FBLOCK=5FOFFSET;</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; int sensor=5Ftype;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; u8 sensor=5Fblock=5Fnum;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; char sensor=5Ftype=5Fstring[5] =3D { 0 };</tt><br><tt>&gt;</tt><br><tt>&=
gt;</tt><br><tt>&gt; The only purpose of this variable seems to be to zero-=
terminate it to be</tt><br><tt>&gt; able</tt><br><tt>&gt; to print it. Why =
not use length-limited print functions instead ?</tt><br><br><tt>Is there s=
uch a function to length limit to dev=5Ferr or dev=5Fdbg?</tt><br><tt>Other=
wise I have to snprintf or strncpy into a string to pass anyway.</tt><br><t=
t>I can drop the dev=5Fdbg but I would like to print out the sensor string<=
/tt><br><tt>if it doesn't match any of the expected ones.</tt><br><br><tt>&=
gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct sensor=5Fdata=5Fbloc=
k=5Fheader *block;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct devic=
e *dev =3D driver-&gt;dev;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; /* check if the data is valid */</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; if (strncmp(&amp;data[SENSOR=5FSTR=5FOFFSET], &quot;SE=
NSOR&quot;, 6) !=3D 0) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;no SENSOR string in response\n&q=
uot;);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Are those message=
s really necessary ? That can create a lot of logging noise</tt><br><tt>&gt=
; if the occ responds with bad data.</tt><br><br><tt>I will audit these, bu=
t I think it's limited to one error message</tt><br><tt>logged in any one f=
unction in case of error. Is that acceptable?</tt><br><tt>Otherwise it may =
be hard to tell where the error occurred.</tt><br><br><tt>&gt;</tt><br><tt>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -ENODATA=
;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g=
oto err;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; sensor=5Fblock=5Fnum =3D dat=
a[SENSOR=5FBLOCK=5FNUM=5FOFFSET];</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br=
><tt>&gt; There is a lot of trust in assuming that this data was actually r=
eceived.</tt><br><tt>&gt; At the same time, there is a lot of error checkin=
g. Why check if the</tt><br><tt>&gt; information in this field is valid if =
you don't check if it was</tt><br><tt>&gt; received in the first place ?</t=
t><br><br><tt>If we get to parse=5Focc=5Fresponse, we know we got some data=
 back from</tt><br><tt>the OCC (see occ=5Fget=5Fall). Here we are really ch=
ecking the response is</tt><br><tt>a valid one, which I think makes sense i=
n the parsing function.</tt><br><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; if (sensor=5Fblock=5Fnum =3D=3D 0) {</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;no sen=
sor blocks available\n&quot;);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; rc =3D -ENODATA;</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; /* if number of sensor block has changed, re-malloc */</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (sensor=5Fblock=5Fnum !=3D resp-&=
gt;header.sensor=5Fblock=5Fnum) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; deinit=5Focc=5Fresp=5Fbuf(resp);</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.=
blocks =3D kcalloc(sensor=5Fblock=5Fnum,</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeof(struct<=
/tt><br><tt>&gt;&gt; sensor=5Fdata=5Fblock),</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GFP=5FKERN=
EL);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; if (!resp-&gt;data.blocks)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</tt><=
br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Why not just allocate the max=
imum number of sensors once ? That might waste</tt><br><tt>&gt; a bit of me=
mory, but it would make the code much less error prone. We know</tt><br><tt=
>&gt; that</tt><br><tt>&gt; there will never be more sensors than the numbe=
r fitting into 4k of memory,</tt><br><tt>&gt; so the &quot;waste&quot; woul=
d not really be that much.</tt><br><br><tt>Fair point. I'll do that.</tt><b=
r><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; memcp=
y(&amp;resp-&gt;header, &amp;data[RESP=5FHEADER=5FOFFSET],</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(struct occ=5F=
poll=5Fheader));</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;heade=
r.error=5Flog=5Faddr=5Fstart =3D</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; be32=5Fto=5Fcpu(resp-&gt;header.error=5Flog=
=5Faddr=5Fstart);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;head=
er.error=5Flog=5Flength =3D</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; be16=5Fto=5Fcpu(resp-&gt;header.error=5Flog=5Fleng=
th);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; dev=
=5Fdbg(dev, &quot;Reading %d sensor blocks\n&quot;,</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;header.sensor=5Fb=
lock=5Fnum);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; for (b =3D 0; b &l=
t; sensor=5Fblock=5Fnum; b++) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; block =3D (struct sensor=5Fdata=5Fblock=5Fhead=
er *)&amp;data[offset];</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; /* copy to a null terminated string */</tt><br><tt>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strncpy(sensor=5Ft=
ype=5Fstring, block-&gt;sensor=5Ftype, 4);</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offset +=3D 8;</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
dev=5Fdbg(dev, &quot;sensor block[%d]: type: %s, sensor=5Fnum:</tt><br><tt>=
&gt;&gt; %d\n&quot;, b,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype=5Fstring, bl=
ock-&gt;sensor=5Fnum);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strncmp(block-&gt;sensor=5Ft=
ype, &quot;FREQ&quot;, 4) =3D=3D 0)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =
=3D FREQ;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; else if (strncmp(block-&gt;sensor=5Ftype, &quot;TEMP&quot;, 4) =3D=
=3D 0)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =3D TEMP;</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else if (strncmp(block=
-&gt;sensor=5Ftype, &quot;POWR&quot;, 4) =3D=3D 0)</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 sensor=5Ftype =3D POWER;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; else if (strncmp(block-&gt;sensor=5Ftype, &quot;CAPS=
&quot;, 4) =3D=3D 0)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype =3D CAPS;</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else {</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &quot;sensor type not supported %s\n=
&quot;,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensor=5Ftype=
=5Fstring);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D oc=
c=5Fcheck=5Fsensor(driver, block-&gt;sensor=5Flength,</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; block-&gt;sensor=5Fnum=
, sensor=5Ftype, b);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; if (rc =3D=3D -ENOMEM)</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; el=
se if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;</tt><br><tt>&gt;&gt; +</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;=
data.sensor=5Fblock=5Fid[sensor=5Ftype] =3D b;</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (s =3D 0; s &lt; block-&gt;=
sensor=5Fnum; s++) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; driver-&gt;ops.parse=5Fsensor=
(data,</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; resp-&gt;data.blocks[b].=
sensors,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sensor=5Ftype, offset, s);=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; offset +=3D block-&gt;sensor=5Flength;</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</tt><br><tt=
>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; /* copy block data over to response pointer */</tt><br><tt>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resp-&gt;data.blocks[b=
].header =3D *block;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br>=
<tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return 0;</tt><b=
r><tt>&gt;&gt; +err:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; deinit=5Fo=
cc=5Fresp=5Fbuf(resp);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return r=
c;</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +sta=
tic u8 occ=5Fsend=5Fcmd(struct occ *driver, u8 seq, u8 type, u16 length,</t=
t><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;const u8 *data, u8 *resp)</tt><br><tt>&gt;&gt; +{</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u32 cmd1, cmd2;</tt><br><tt>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; u16 checksum =3D 0;</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; u16 length=5Fle =3D cpu=5Fto=5Fle16(length);</tt><br><tt>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; bool retry =3D 0;</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; int i, rc, tries =3D 0;</tt><br><tt>&gt;&gt; +</tt><br><tt>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; cmd1 =3D (seq &lt;&lt; 24) | (type &lt;&lt;=
 16) | length=5Fle;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; memcpy(&amp=
;cmd2, data, length);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; cmd2 &lt;=
&lt;=3D ((4 - length) * 8);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; /* checksum: sum of every bytes of cmd1, cmd2 */</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; 4; i++) {</tt><b=
r><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; checksum =
+=3D (cmd1 &gt;&gt; (i * 8)) &amp; 0xFF;</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; checksum +=3D (cmd2 &gt;&gt; (i * 8))=
 &amp; 0xFF;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;=
&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; cmd2 |=3D checksum &lt;&=
lt; ((2 - length) * 8);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; /* Init OCB */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FSTATUS=5FCONTROL=
=5FOR,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;OCB=5FOR=5FINIT0, OCB=5FOR=5FINIT1);</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; goto err;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=
=5FSTATUS=5FCONTROL=5FAND,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;OCB=5FAND=5FINIT0, OCB=5FAND=5FINIT1);</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;</tt><br><tt>&gt;&gt; +</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* Send command, 2nd half of the 64=
-bit addr is unused (write 0)</tt><br><tt>&gt;&gt; */</tt><br><tt>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, =
OCB=5FADDRESS,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;driver-&gt;config.command=5Faddr, 0);</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; goto err;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=5Fops.putscom(driver-&gt;b=
us, OCB=5FDATA, cmd1, cmd2);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if=
 (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; goto err;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; /* Trigger attention */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc=
 =3D driver-&gt;bus=5Fops.putscom(driver-&gt;bus, ATTN=5FDATA, ATTN0,</tt><=
br><tt>&gt;&gt; ATTN1);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; go=
to err;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
/* Get response data */</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D =
driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FADDRESS,</tt><br><tt>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;driver-&gt;config=
.response=5Faddr, 0);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc)</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto=
 err;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; do=
 {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
if (retry) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; set=5Fcurrent=5Fstate(TASK=5FINTERRUP=
TIBLE);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; schedule=5Ftimeout(msec=
s=5Fto=5Fjiffies(CMD=5FIN=5FPRG=5FINT=5FMS));</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br=
><tt>&gt;</tt><br><tt>&gt; Isn't there a better way to do this ? What exact=
ly is interrupted ? The</tt><br><tt>&gt; getscom function ? If so, shouldn'=
t the timeout be handled there ?</tt><br><br><tt>There shouldn't be any int=
errupt. I set TASK=5FINTERRUPTIBLE because it</tt><br><tt>doesn't really ma=
tter if it's interrupted or not. The purpose of this</tt><br><tt>loop is to=
 retry if we get the &quot;command in progress&quot; status from the</tt><b=
r><tt>OCC. It's higher level than the getscom function, so I think the loop=
</tt><br><tt>is appropriate here.</tt><br><br><tt>&gt;</tt><br><tt>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D driver-&gt;bus=
=5Fops.getscom(driver-&gt;bus, OCB=5FDATA,</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(u64 *=
)resp);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;</tt><br><tt>&gt;&gt; +</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* retr=
y if we get &quot;command in progress&quot; return status */</tt><br><tt>&g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; retry =3D (resp[R=
ESP=5FRETURN=5FSTATUS] =3D=3D</tt><br><tt>&gt;&gt; RESP=5FRETURN=5FCMD=5FIN=
=5FPRG) &amp;&amp;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (tries++ &lt; CMD=5FIN=5FPRG=5F=
RETRIES);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; There are some=
 unnecessary () in this expression.</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; } while (retry);</tt><br><tt>&gt;&gt=
; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; switch (resp[RESP=5FRETURN=
=5FSTATUS]) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETUR=
N=5FCMD=5FIN=5FPRG:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rc =3D -EALREADY;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; case RESP=5FRETURN=5FSUCCESS:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0;</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt><br><tt>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; case RESP=5FRETURN=5FCMD=5FINVAL:</tt><br><tt>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FCMD=5FLEN:</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FDATA=5FINVAL:</tt><br><tt>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FCHKSUM:</tt><br><tt>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EINVAL;</tt><br=
><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</tt=
><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; case RESP=5FRETURN=5FOCC=5FERR:</t=
t><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =
=3D -EREMOTE;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; break;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; default:</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D =
-EFAULT;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt;=
 +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&=
gt; +</tt><br><tt>&gt;&gt; +err:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; dev=5Ferr(driver-&gt;dev, &quot;scom op failed rc:%d\n&quot;, rc);</tt><b=
r><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Some of the errors result in a=
n error message, some don't. What is</tt><br><tt>&gt; the guiding principle=
 ? Even if there is an error message, it doesn't report</tt><br><tt>&gt; wh=
at function caused it, which makes it as good as no error message.</tt><br>=
<tt>&gt; Can this be dropped ?</tt><br><br><tt>resp[RESP=5FRETURN=5FSTATUS]=
 is the status reported on the OCC, these</tt><br><tt>aren't necessarily er=
rors, though most are. This is translating an OCC</tt><br><tt>status code t=
o an error for occ=5Fget=5Fall to pick up. It cannot be</tt><br><tt>dropped=
, we need to know if the occ poll was successful. I'm not sure</tt><br><tt>=
what you mean by reporting the function? occ=5Fget=5Fall will fail out if</=
tt><br><tt>we report the error here. If it's the scom op that failed we wil=
l have</tt><br><tt>the dev=5Ferr message.</tt><br><br><tt>&gt;</tt><br><tt>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&gt; +}</tt><br>=
<tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +static int occ=5Fget=5Fall(struct occ =
*driver)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; int i =3D 0, rc;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 *occ=5Fda=
ta;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u16 num=5Fbytes;</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; const u8 poll=5Fcmd=5Fdata =3D OCC=5FPOLL=
=5FSTAT=5FSENSOR;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct device=
 *dev =3D driver-&gt;dev;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struc=
t occ=5Fresponse *resp =3D &amp;driver-&gt;response;</tt><br><tt>&gt;&gt; +=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; occ=5Fdata =3D devm=5Fkzalloc(=
dev, OCC=5FDATA=5FMAX, GFP=5FKERNEL);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt=
><br><tt>&gt; I am a bot lost here. What is the purpose of using a devm fun=
ction ?</tt><br><tt>&gt;</tt><br><tt>&gt; Either case, you might want to al=
locate the memory once and just keep it</tt><br><tt>&gt; allocated.</tt><br=
><tt>&gt; Allocating a 4k buffer and freeing it each time data is read from=
 the occ</tt><br><tt>&gt; seems</tt><br><tt>&gt; to be wasteful and not rea=
lly worth it.</tt><br><br><tt>Agreed.</tt><br><br><tt>&gt;</tt><br><tt>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; if (!occ=5Fdata)</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</tt><br><tt>&gt;&=
gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fsend=5Fcmd(d=
river, 0, OCC=5FPOLL, 1, &amp;poll=5Fcmd=5Fdata,</tt><br><tt>&gt;&gt; occ=
=5Fdata);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc) {</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev,=
 &quot;OCC poll failed: %d\n&quot;, rc);</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out;</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; num=5Fbytes =3D get=5Funaligned((u16 *)&amp;occ=5Fdata[RESP=5FDA=
TA=5FLENGTH]);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; num=5Fbytes =3D =
be16=5Fto=5Fcpu(num=5Fbytes);</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt=
>&gt; What data is in big endian, and what data is in little endian ?</tt><=
br><tt>&gt;</tt><br><tt>&gt; Looks like everything is big endian except for=
 the length in the send</tt><br><tt>&gt; command.</tt><br><tt>&gt; Is that =
correct ? If so, an explanation would be useful, because the logic</tt><br>=
<tt>&gt; isn't entirely clear.</tt><br><br><tt>I'll add some comments.</tt>=
<br><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; dev=5Fdbg(dev,=
 &quot;OCC data length: %d\n&quot;, num=5Fbytes);</tt><br><tt>&gt;&gt; +</t=
t><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (num=5Fbytes &gt; OCC=5FDATA=
=5FMAX) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; dev=5Ferr(dev, &quot;OCC data length must be &lt; 4KB\n&quot;);</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D =
-EINVAL;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto out;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&=
gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (num=5Fbytes &lt;=
=3D 0) {</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; This can never =
be &lt; 0.</tt><br><br><tt>Good point.</tt><br><br><tt>&gt;</tt><br><tt>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev, &qu=
ot;OCC data length is zero\n&quot;);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -EINVAL;</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out;</tt><br><tt>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; /* read remaining data */</tt><br><tt>&gt;&gt; + &nbsp;=
 &nbsp; &nbsp; for (i =3D 8; i &lt; num=5Fbytes + 8; i +=3D 8) {</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D driver=
-&gt;bus=5Fops.getscom(driver-&gt;bus, OCB=5FDATA,</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;(u64 *)&amp;occ=5Fdata[i]);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; if (rc) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(dev=
, &quot;scom op failed rc:%d\n&quot;, rc);</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto ou=
t;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt>=
<br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; /* don't need more sanity checks; b=
uffer is alloc'd for max</tt><br><tt>&gt;&gt; response</tt><br><tt>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;* size so we just check for valid data in par=
se=5Focc=5Fresponse</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*/</t=
t><br><tt>&gt;</tt><br><tt>&gt; Yes, but as mentioned above you don't check=
 in that function if the data</tt><br><tt>&gt; was actually received.</tt><=
br><br><tt>If we don't receive data, the data length will be 0 or the low l=
evel</tt><br><tt>getscom will fail. So we know we have data here.</tt><br><=
br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D parse=5Focc=
=5Fresponse(driver, occ=5Fdata, resp);</tt><br><tt>&gt;&gt; +</tt><br><tt>&=
gt;&gt; +out:</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; devm=5Fkfree(dev,=
 occ=5Fdata);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt><b=
r><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +int occ=5Fup=
date=5Fdevice(struct occ *driver)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; int rc =3D 0;</tt><br><tt>&gt;&gt; +</tt><br><tt=
>&gt;&gt; + &nbsp; &nbsp; &nbsp; mutex=5Flock(&amp;driver-&gt;update=5Flock=
);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (t=
ime=5Fafter(jiffies, driver-&gt;last=5Fupdated +</tt><br><tt>&gt;&gt; drive=
r-&gt;update=5Finterval)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; || !driver-&gt;valid) {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; driver-&gt;valid =3D 1;</tt><br><tt>&gt;</tt><=
br><tt>&gt;</tt><br><tt>&gt; valid is bool.</tt><br><tt>&gt;</tt><br><tt>&g=
t;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; rc =3D occ=5Fget=5Fall(driver);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (rc)</tt><br><tt>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; driver-=
&gt;valid =3D 0;</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; valid i=
s bool.</tt><br><br><tt>Good point.</tt><br><br><tt>&gt;</tt><br><tt>&gt;&g=
t; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; driver-&gt;last=5Fupdated =3D jiffies;</tt><br><tt>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; mutex=5Funlock(&amp;driver-&gt;update=5Flock);</tt><br><tt>&gt;&gt; +</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; return rc;</tt><br><tt>&gt;&gt; =
+}</tt><br><tt>&gt;&gt; +EXPORT=5FSYMBOL(occ=5Fupdate=5Fdevice);</tt><br><t=
t>&gt;&gt; +</tt><br><tt>&gt;&gt; +void *occ=5Fget=5Fsensor(struct occ *dri=
ver, int sensor=5Ftype)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; int rc;</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbs=
p; &nbsp; &nbsp; /* occ=5Fupdate=5Fdevice locks the update lock */</tt><br>=
<tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; rc =3D occ=5Fupdate=5Fdevice(driver);</=
tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if (rc) {</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(driver-&gt;dev,=
 &quot;cannot get occ sensor data: %d\n&quot;,</tt><br><tt>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc)=
;</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; Have you counted the n=
umber of error messages reported if anything goes</tt><br><tt>&gt; wrong.</=
tt><br><tt>&gt; This driver is quite noisy. I won't force you to drop the m=
essages, but it</tt><br><tt>&gt; seems</tt><br><tt>&gt; to me that if anyth=
ing goes wrong, the kernel log will be clogged with</tt><br><tt>&gt; messag=
es</tt><br><tt>&gt; just from this driver.</tt><br><br><tt>I'll audit these=
.</tt><br><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return NULL;</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; }</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; return occ=5Fget=5Fsensor=5Fby=5Ftype(&amp;driver-&gt;response=
, sensor=5Ftype);</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +EXPORT=5FSY=
MBOL(occ=5Fget=5Fsensor);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +int =
occ=5Fget=5Fsensor=5Fvalue(struct occ *occ, int sensor=5Ftype, int</tt><br>=
<tt>&gt;&gt; sensor=5Fnum,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 hwmon, long *=
val)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; re=
turn occ-&gt;ops.get=5Fsensor(occ, sensor=5Ftype, sensor=5Fnum, hwmon,</tt>=
<br><tt>&gt;&gt; val);</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +EXPORT=
=5FSYMBOL(occ=5Fget=5Fsensor=5Fvalue);</tt><br><tt>&gt;&gt; +</tt><br><tt>&=
gt;&gt; +void occ=5Fget=5Fresponse=5Fblocks(struct occ *occ, struct occ=5Fb=
locks **blocks)</tt><br><tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; *blocks =3D &amp;occ-&gt;response.data;</tt><br><tt>&gt;&gt; +}</t=
t><br><tt>&gt;&gt; +EXPORT=5FSYMBOL(occ=5Fget=5Fresponse=5Fblocks);</tt><br=
><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +void occ=5Fset=5Fupdate=5Finterval(st=
ruct occ *occ, unsigned long interval)</tt><br><tt>&gt;&gt; +{</tt><br><tt>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; occ-&gt;update=5Finterval =3D msecs=5Fto=5F=
jiffies(interval);</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +EXPORT=5FS=
YMBOL(occ=5Fset=5Fupdate=5Finterval);</tt><br><tt>&gt;&gt; +</tt><br><tt>&g=
t;&gt; +int occ=5Fset=5Fuser=5Fpowercap(struct occ *occ, u16 cap)</tt><br><=
tt>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 resp[8];</tt>=
<br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; cap =3D cpu=
=5Fto=5Fbe16(cap);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; return occ=5Fsend=5Fcmd(occ, 0, OCC=5FSET=5FUSER=5FPOWR=5FCAP, 2=
, (const u8</tt><br><tt>&gt;&gt; *)&amp;cap,</tt><br><tt>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; resp);</tt><br><tt>&gt;&gt; +}</tt><br><tt>&gt;&gt; +EXPORT=5FSYMB=
OL(occ=5Fset=5Fuser=5Fpowercap);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt=
; +struct occ *occ=5Fstart(struct device *dev, void *bus,</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 struct occ=5Fbus=5Fops *bus=5Fops, const struct occ=5Fops</tt><br><tt>&gt;=
&gt; *ops,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; const struct occ=5Fconfig *config)</tt><br><tt=
>&gt;&gt; +{</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct occ *driver=
 =3D devm=5Fkzalloc(dev, sizeof(struct occ),</tt><br><tt>&gt;&gt; GFP=5FKER=
NEL);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; if=
 (!driver)</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return ERR=5FPTR(-ENOMEM);</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; driver-&gt;dev =3D dev;</tt><br><tt>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; driver-&gt;bus =3D bus;</tt><br><tt>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; driver-&gt;bus=5Fops =3D *bus=5Fops;</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; driver-&gt;ops =3D *ops;</tt><br><tt>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; driver-&gt;config =3D *config;</tt><br><tt>&gt;&gt; +</tt><br>=
<tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; driver-&gt;update=5Finterval =3D HZ;</t=
t><br><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt; The update interval is onl=
y supposed to be configurable if it can be written</tt><br><tt>&gt; into th=
e hardware. Otherwise it is really up to user space to decide how</tt><br><=
tt>&gt; often</tt><br><tt>&gt; it wants to poll the data, not up to the ker=
nel.</tt><br><tt>&gt;</tt><br><tt>&gt; I don't see a function to send the u=
pdate interval to the occ. As such, it</tt><br><tt>&gt; should</tt><br><tt>=
&gt; not be configurable but a constant.</tt><br><br><tt>I don't quite foll=
ow. Right now, the driver maximum polling rate is</tt><br><tt>configurable =
by userspace (via hwmon sysfs attribute). If you mean</tt><br><tt>that user=
 space should control that rate just by how often users read</tt><br><tt>th=
e attributes, I'm not sure that will work as there are a large</tt><br><tt>=
number of attributes that will all try and trigger an occ poll when</tt><br=
><tt>read. Besides, different users don't want to communicate about when</t=
t><br><tt>they last polled. If the rate is constant, if may be too slow or =
too</tt><br><tt>fast depending on the system and needs of the users. Why ca=
n't the</tt><br><tt>polling rate be configurable? To user space, the update=
 interval works</tt><br><tt>the same if it's driver or hardware.</tt><br><b=
r><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; mut=
ex=5Finit(&amp;driver-&gt;update=5Flock);</tt><br><tt>&gt;&gt; +</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; return driver;</tt><br><tt>&gt;&gt; +}</t=
t><br><tt>&gt;&gt; +EXPORT=5FSYMBOL(occ=5Fstart);</tt><br><tt>&gt;&gt; +</t=
t><br><tt>&gt;&gt; +MODULE=5FAUTHOR(&quot;Eddie James &lt;eajames@us.ibm.co=
m&gt;&quot;);</tt><br><tt>&gt;&gt; +MODULE=5FDESCRIPTION(&quot;OCC hwmon co=
re driver&quot;);</tt><br><tt>&gt;&gt; +MODULE=5FLICENSE(&quot;GPL&quot;);<=
/tt><br><tt>&gt;&gt; diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/o=
cc/occ.h</tt><br><tt>&gt;&gt; new file mode 100644</tt><br><tt>&gt;&gt; ind=
ex 0000000..c86b06a</tt><br><tt>&gt;&gt; --- /dev/null</tt><br><tt>&gt;&gt;=
 +++ b/drivers/hwmon/occ/occ.h</tt><br><tt>&gt;&gt; @@ -0,0 +1,81 @@</tt><b=
r><tt>&gt;&gt; +/*</tt><br><tt>&gt;&gt; + * occ.h - hwmon OCC driver</tt><b=
r><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This file contains data structu=
res and function prototypes for common</tt><br><tt>&gt;&gt; access</tt><br>=
<tt>&gt;&gt; + * between different bus protocols and host systems.</tt><br>=
<tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * Copyright 2016 IBM Corp.</tt><br>=
<tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This program is free software; yo=
u can redistribute it and/or modify</tt><br><tt>&gt;&gt; + * it under the t=
erms of the GNU General Public License as published by</tt><br><tt>&gt;&gt;=
 + * the Free Software Foundation; either version 2 of the License, or</tt>=
<br><tt>&gt;&gt; + * (at your option) any later version.</tt><br><tt>&gt;&g=
t; + *</tt><br><tt>&gt;&gt; + * This program is distributed in the hope tha=
t it will be useful,</tt><br><tt>&gt;&gt; + * but WITHOUT ANY WARRANTY; wit=
hout even the implied warranty of</tt><br><tt>&gt;&gt; + * MERCHANTABILITY =
or FITNESS FOR A PARTICULAR PURPOSE. &nbsp;See the</tt><br><tt>&gt;&gt; + *=
 GNU General Public License for more details.</tt><br><tt>&gt;&gt; + */</tt=
><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +#ifndef =5F=5FOCC=5FH=5F=5F</tt><=
br><tt>&gt;&gt; +#define =5F=5FOCC=5FH=5F=5F</tt><br><tt>&gt;&gt; +</tt><br=
><tt>&gt;&gt; +#include &quot;scom.h&quot;</tt><br><tt>&gt;&gt; +</tt><br><=
tt>&gt;&gt; +struct device;</tt><br><tt>&gt;&gt; +struct occ;</tt><br><tt>&=
gt;&gt; +</tt><br><tt>&gt;&gt; +/* sensor=5Fdata=5Fblock=5Fheader</tt><br><=
tt>&gt;&gt; + * structure to match the raw occ sensor block header</tt><br>=
<tt>&gt;&gt; + */</tt><br><tt>&gt;&gt; +struct sensor=5Fdata=5Fblock=5Fhead=
er {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 sensor=5Ftype[4];</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u8 reserved0;</tt><br><tt>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; u8 sensor=5Fformat;</tt><br><tt>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; u8 sensor=5Flength;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
u8 sensor=5Fnum;</tt><br><tt>&gt;&gt; +} =5F=5Fattribute=5F=5F((packed, ali=
gned(4)));</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct sensor=5Fdat=
a=5Fblock {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; struct sensor=5Fdat=
a=5Fblock=5Fheader header;</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; void=
 *sensors;</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;=
&gt; +enum sensor=5Ftype {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; FREQ=
 =3D 0,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; TEMP,</tt><br><tt>&gt;&=
gt; + &nbsp; &nbsp; &nbsp; POWER,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; CAPS,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; MAX=5FOCC=5FSENSOR=5FT=
YPE</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +s=
truct occ=5Fops {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; void (*parse=
=5Fsensor)(u8 *data, void *sensor, int sensor=5Ftype, int</tt><br><tt>&gt;&=
gt; off,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int snum);</tt><br><t=
t>&gt;&gt; + &nbsp; &nbsp; &nbsp; void *(*alloc=5Fsensor)(int sensor=5Ftype=
, int num=5Fsensors);</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int (*get=
=5Fsensor)(struct occ *driver, int sensor=5Ftype, int</tt><br><tt>&gt;&gt; =
sensor=5Fnum,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 hwmon, long *val);</tt><b=
r><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct occ=
=5Fconfig {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u32 command=5Faddr;=
</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; u32 response=5Faddr;</tt><br><=
tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +struct occ=5Fb=
locks {</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int sensor=5Fblock=5Fid=
[MAX=5FOCC=5FSENSOR=5FTYPE];</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; st=
ruct sensor=5Fdata=5Fblock *blocks;</tt><br><tt>&gt;&gt; +};</tt><br><tt>&g=
t;&gt; +</tt><br><tt>&gt;&gt; +struct occ *occ=5Fstart(struct device *dev, =
void *bus,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; struct occ=5Fbus=5Fops *bus=5Fops, const struc=
t occ=5Fops</tt><br><tt>&gt;&gt; *ops,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct occ=
=5Fconfig *config);</tt><br><tt>&gt;&gt; +void *occ=5Fget=5Fsensor(struct o=
cc *occ, int sensor=5Ftype);</tt><br><tt>&gt;&gt; +int occ=5Fget=5Fsensor=
=5Fvalue(struct occ *occ, int sensor=5Ftype, int</tt><br><tt>&gt;&gt; senso=
r=5Fnum,</tt><br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 hwmon, long *val);</tt><br><tt>=
&gt;&gt; +void occ=5Fget=5Fresponse=5Fblocks(struct occ *occ, struct occ=5F=
blocks</tt><br><tt>&gt;&gt; **blocks);</tt><br><tt>&gt;&gt; +int occ=5Fupda=
te=5Fdevice(struct occ *driver);</tt><br><tt>&gt;&gt; +void occ=5Fset=5Fupd=
ate=5Finterval(struct occ *occ, unsigned long interval);</tt><br><tt>&gt;&g=
t; +int occ=5Fset=5Fuser=5Fpowercap(struct occ *occ, u16 cap);</tt><br><tt>=
&gt;&gt; +</tt><br><tt>&gt;&gt; +#endif /* =5F=5FOCC=5FH=5F=5F */</tt><br><=
tt>&gt;&gt; diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.=
h</tt><br><tt>&gt;&gt; new file mode 100644</tt><br><tt>&gt;&gt; index 0000=
000..c1da645</tt><br><tt>&gt;&gt; --- /dev/null</tt><br><tt>&gt;&gt; +++ b/=
drivers/hwmon/occ/scom.h</tt><br><tt>&gt;&gt; @@ -0,0 +1,47 @@</tt><br><tt>=
&gt;&gt; +/*</tt><br><tt>&gt;&gt; + * scom.h - hwmon OCC driver</tt><br><tt=
>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This file contains data structures f=
or scom operations to the OCC</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt;=
 + * Copyright 2016 IBM Corp.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt;=
 + * This program is free software; you can redistribute it and/or modify</=
tt><br><tt>&gt;&gt; + * it under the terms of the GNU General Public Licens=
e as published by</tt><br><tt>&gt;&gt; + * the Free Software Foundation; ei=
ther version 2 of the License, or</tt><br><tt>&gt;&gt; + * (at your option)=
 any later version.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * This =
program is distributed in the hope that it will be useful,</tt><br><tt>&gt;=
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of</tt=
><br><tt>&gt;&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =
&nbsp;See the</tt><br><tt>&gt;&gt; + * GNU General Public License for more =
details.</tt><br><tt>&gt;&gt; + */</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&=
gt; +#ifndef =5F=5FSCOM=5FH=5F=5F</tt><br><tt>&gt;&gt; +#define =5F=5FSCOM=
=5FH=5F=5F</tt><br><tt>&gt;&gt; +</tt><br><tt>&gt;&gt; +/*</tt><br><tt>&gt;=
&gt; + * occ=5Fbus=5Fops - represent the low-level transfer methods to comm=
unicate</tt><br><tt>&gt;&gt; with</tt><br><tt>&gt;&gt; + * the OCC.</tt><br=
><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * getscom - OCC scom read</tt><br>=
<tt>&gt;&gt; + * @bus: handle to slave device</tt><br><tt>&gt;&gt; + * @add=
ress: address</tt><br><tt>&gt;&gt; + * @data: where to store data read from=
 slave; buffer size must be at</tt><br><tt>&gt;&gt; least</tt><br><tt>&gt;&=
gt; + * eight bytes.</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + * Retu=
rns 0 on success or a negative errno on error</tt><br><tt>&gt;&gt; + *</tt>=
<br><tt>&gt;&gt; + * putscom - OCC scom write</tt><br><tt>&gt;&gt; + * @bus=
: handle to slave device</tt><br><tt>&gt;&gt; + * @address: address</tt><br=
><tt>&gt;&gt; + * @data0: first data byte to write</tt><br><tt>&gt;&gt; + *=
 @data1: second data byte to write</tt><br><tt>&gt;</tt><br><tt>&gt;</tt><b=
r><tt>&gt; 32 bit bytes ? It might also be worthwhile to mention the expect=
ed byte</tt><br><tt>&gt; order.</tt><br><br><tt>Good point.</tt><br><br><br=
><tt>&gt;</tt><br><tt>&gt;</tt><br><tt>&gt;&gt; + *</tt><br><tt>&gt;&gt; + =
* Returns 0 on success or a negative errno on error</tt><br><tt>&gt;&gt; + =
*/</tt><br><tt>&gt;&gt; +struct occ=5Fbus=5Fops {</tt><br><tt>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; int (*getscom)(void *bus, u32 address, u64 *data);</tt><=
br><tt>&gt;&gt; + &nbsp; &nbsp; &nbsp; int (*putscom)(void *bus, u32 addres=
s, u32 data0, u32 data1);</tt><br><tt>&gt;&gt; +};</tt><br><tt>&gt;&gt; +</=
tt><br><tt>&gt;&gt; +#endif /* =5F=5FSCOM=5FH=5F=5F */</tt><br><tt>&gt;&gt;=
</tt><br><tt>&gt;</tt><BR>
</body></html>

--0__=8FBB0A22DFF9F1AE8f9e8a93df938690918c8FBB0A22DFF9F1AE--
