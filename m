Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35747 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751714AbdFGHP4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Jun 2017 03:15:56 -0400
Message-ID: <1496819744.8159.33.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        msbarth@linux.vnet.ibm.com, tpearson@raptorengineering.com,
        openbmc@lists.ozlabs.org
Date: Wed, 07 Jun 2017 16:45:44 +0930
In-Reply-To: <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
         <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-c2n+9YawNfhBZ2D0ljQ9"
Mime-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--=-c2n+9YawNfhBZ2D0ljQ9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-06-06 at 06:33 -0700, Guenter Roeck wrote:
> On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
> > Add a basic driver for the MAX31785, focusing on the fan control
> > features but ignoring the temperature and voltage monitoring
> > features of the device.
> >=20
> > This driver supports all fan control modes and tachometer / PWM
> > readback where applicable.
> >=20
> > > > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Hello,
> >=20
> > This is a rework of Timothy Pearson's original patch:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://www.mail-archive.com/linux-hwmon@=
vger.kernel.org/msg00868.html
> >=20
> > I've labelled it as v3 to differentiate from Timothy's postings.
> >=20
> > The original thread had some discussion about the MAX31785 being a PMBu=
s device
> > and that it should thus be a PMBus driver. The implementation still mak=
es use
> > of features not available in the pmbus core, so I've taken up the earli=
er
> > suggestion and ported it to the devm_hwmon_device_register_with_info()
> > interface. This gave a modest reduction in lines-of-code and at least t=
o me is
> > more aesthetically pleasing.
> >=20
> > Over and above the features of the original patch is support for a seco=
ndary
> > rotor measurement value that is provided by MAX31785 chips with a revis=
ed
> > firmware. The feature(s) of the firmware are determined at probe time a=
nd extra
> > attributes exposed accordingly. Specifically, the MFR_REVISION 0x3040 o=
f the
> > firmware supports 'slow' and 'fast' rotor reads. The feature is impleme=
nted by
> > command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (with the '=
fast'
> > measurement in the second word) rather than the 2-bytes response in the
> > original firmware (MFR_REVISION 0x3030).
> >=20
>=20
> Taking the pmbus driver question out, why would this warrant another non-=
standard
> attribute outside the ABI ? I could see the desire to replace the 'slow' =
access
> with the 'fast' one, but provide two attributes ? No, I don't see the poi=
nt, sorry,
> even more so without detailed explanation why the second attribute in add=
ition
> to the first one would add any value.

At the least I'll update the documentation in line with Matt Barth's
comment, as it was vague. Whether or not we keep the questionable
attribute I hope will be resolved down further in the thread.

>=20
> > This feature is not documented in the public datasheet[1].
> >=20
> > [1] https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> >=20
> > The need to read a 4-byte value drives the addition of a helper that is=
 a
> > cut-down version of i2c_smbus_xfer_emulated(), as 4-byte transactions a=
ren't a
> > defined transaction type in the PMBus spec. This seemed more tasteful t=
han
> > hacking the PMBus core to support the quirks of a single device.
> >=20
>=20
> That is why we have PMBus helper drivers.

Right - I meant to say SMBus in the last sentence, not PMBus, as it was
with respect to hacking i2c_smbus_xfer_emulated(). So I understand that
the device-specific PMBus drivers exist to help with quirks, just that
it's not (yet) a PMBus driver.

Thanks for the feedback,

Andrew

>=20
> Guenter
>=20
> > Also changed from Timothy's original posting is I've massaged the locki=
ng a bit
> > and removed what seemed to be a copy/paste bug around max31785_fan_set_=
pulses()
> > setting the fan_command member.
> >=20
> > Tested on an IBM Witherspoon machine.
> >=20
> > Cheers,
> >=20
> > Andrew
> >=20
> > =C2=A0 Documentation/hwmon/max31785 |=C2=A0=C2=A044 +++
> > =C2=A0 drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A010 +
> > =C2=A0 drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0 drivers/hwmon/max31785.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 824 ++++=
+++++++++++++++++++++++++++++++++++++++
> > =C2=A0 4 files changed, 879 insertions(+)
> > =C2=A0 create mode 100644 Documentation/hwmon/max31785
> > =C2=A0 create mode 100644 drivers/hwmon/max31785.c
> >=20
> > diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max3178=
5
> > new file mode 100644
> > index 000000000000..dd891c06401e
> > --- /dev/null
> > +++ b/Documentation/hwmon/max31785
> > @@ -0,0 +1,44 @@
> > +Kernel driver max31785
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +=C2=A0=C2=A0* Maxim MAX31785
> > +=C2=A0=C2=A0=C2=A0=C2=A0Prefix: 'max31785'
> > +=C2=A0=C2=A0=C2=A0=C2=A0Addresses scanned: 0x52 0x53 0x54 0x55
> > +=C2=A0=C2=A0=C2=A0=C2=A0Datasheet: http://pdfserv.maximintegrated.com/=
en/ds/MAX31785.pdf
> > +
> > > > +Author: Timothy Pearson <tpearson@raptorengineering.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver implements support for the Maxim MAX31785 chip.
> > +
> > +The MAX31785 controls the speeds of up to six fans using six independe=
nt
> > +PWM outputs. The desired fan speeds (or PWM duty cycles) are written
> > +through the I2C interface. The outputs drive "4-wire" fans directly,
> > +or can be used to modulate the fan's power terminals using an external
> > +pass transistor.
> > +
> > +Tachometer inputs monitor fan tachometer logic outputs for precise (+/=
-1%)
> > +monitoring and control of fan RPM as well as detection of fan failure.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +fan[1-6]_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0RO=C2=A0=C2=A0fan tachometer speed in RPM
> > +fan[1-6]_fault=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0RO=C2=A0=C2=A0fan experienced fault
> > +fan[1-6]_pulses=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0RW=C2=A0=C2=A0tachometer pulses per fan revolution
> > +fan[1-6]_target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0RW=C2=A0=C2=A0desired fan speed in RPM
> > +pwm[1-6]_enable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0RW=C2=A0=C2=A0pwm mode, 0=3Ddisabled, 1=3Dpwm, 2=3Drpm, 3=3Dautomatic
> > +pwm[1-6]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RW=C2=A0=C2=A0fan target duty cyc=
le (0-255)
> > +
> > +Dynamic sysfs entries
> > +--------------------
> > +
> > +Whether these entries are present depends on the firmware features det=
ected on
> > +the device during probe.
> > +
> > +fan[1-6]_input_fast=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RO=C2=A0=C2=A0f=
an tachometer speed in RPM (fast rotor measurement)
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index e80ca81577f4..c75d6072c823 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -886,6 +886,16 @@ config SENSORS_MAX6697
> > > > =C2=A0=C2=A0	=C2=A0=C2=A0This driver can also be built as a module.=
=C2=A0=C2=A0If so, the module
> > > > =C2=A0=C2=A0	=C2=A0=C2=A0will be called max6697.
> > =C2=A0=C2=A0
> > +config SENSORS_MAX31785
> > > > +	tristate "Maxim MAX31785 sensor chip"
> > > > +	depends on I2C
> > > > +	help
> > > > +	=C2=A0=C2=A0If you say yes here you get support for 6-Channel PWM=
-Output
> > > > +	=C2=A0=C2=A0Fan RPM Controller.
> > +
> > > > +	=C2=A0=C2=A0This driver can also be built as a module.=C2=A0=C2=
=A0If so, the module
> > > > +	=C2=A0=C2=A0will be called max31785.
> > +
> > =C2=A0 config SENSORS_MAX31790
> > > > =C2=A0=C2=A0	tristate "Maxim MAX31790 sensor chip"
> > > > =C2=A0=C2=A0	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index f03dd0a15933..dc55722bee88 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > > > @@ -119,6 +119,7 @@ obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_MAX6650)	+=3D max6650.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_MAX6697)	+=3D max6697.o
> > > > +obj-$(CONFIG_SENSORS_MAX31785)	+=3D max31785.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_MAX31790)	+=3D max31790.o
> > =C2=A0 obj-$(CONFIG_SENSORS_MC13783_ADC)+=3D mc13783-adc.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_MCP3021)	+=3D mcp3021.o
> > diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> > new file mode 100644
> > index 000000000000..fc03b7c8e723
> > --- /dev/null
> > +++ b/drivers/hwmon/max31785.c
> > @@ -0,0 +1,824 @@
> > +/*
> > + * max31785.c - Part of lm_sensors, Linux kernel modules for hardware
> > > > + *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0monitoring.
> > + *
> > + * (C) 2016 Raptor Engineering, LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See=
 the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +
> > +/* MAX31785 device IDs */
> > > > +#define MAX31785_MFR_ID				0x4d
> > > > +#define MAX31785_MFR_MODEL			0x53
> > +
> > +/* MAX31785 registers */
> > > > +#define MAX31785_REG_PAGE			0x00
> > > > +#define MAX31785_PAGE_FAN_CONFIG(ch)		(0x00 + (ch))
> > > > +#define MAX31785_REG_FAN_CONFIG_1_2		0x3a
> > > > +#define MAX31785_REG_FAN_COMMAND_1		0x3b
> > > > +#define MAX31785_REG_STATUS_FANS_1_2		0x81
> > > > +#define MAX31785_REG_FAN_SPEED_1		0x90
> > > > +#define MAX31785_REG_MFR_ID			0x99
> > > > +#define MAX31785_REG_MFR_MODEL			0x9a
> > > > +#define MAX31785_REG_MFR_REVISION		0x9b
> > > > +#define MAX31785_REG_MFR_FAN_CONFIG		0xf1
> > > > +#define MAX31785_REG_READ_FAN_PWM		0xf3
> > +
> > +/* Fan Config register bits */
> > > > +#define MAX31785_FAN_CFG_PWM_ENABLE		0x80
> > > > +#define MAX31785_FAN_CFG_CONTROL_MODE_RPM	0x40
> > > > +#define MAX31785_FAN_CFG_PULSE_MASK		0x30
> > > > +#define MAX31785_FAN_CFG_PULSE_SHIFT		4
> > > > +#define MAX31785_FAN_CFG_PULSE_OFFSET		1
> > +
> > +/* Fan Status register bits */
> > > > +#define MAX31785_FAN_STATUS_FAULT_MASK		0x80
> > +
> > +/* Fan Command constants */
> > > > +#define MAX31785_FAN_COMMAND_PWM_RATIO		40
> > +
> > > > +#define NR_CHANNEL				6
> > +
> > +/* Addresses to scan */
> > +static const unsigned short normal_i2c[] =3D {
> > > > +	0x52, 0x53, 0x54, 0x55,
> > > > +	I2C_CLIENT_END
> > +};
> > +
> > +#define MAX31785_CAP_FAST_ROTOR BIT(0)
> > +
> > +/*
> > + * Client data (each client gets its own)
> > + *
> > > > + * @lock:		Protects device access and access to cached values
> > > > + * @valid:		False until fields below it are valid
> > > > + * @last_updated:	Last update time in jiffies
> > + */
> > +struct max31785 {
> > > > > > +	struct i2c_client	*client;
> > > > > > +	struct mutex		lock;
> > > > > > +	bool			valid;
> > > > > > +	unsigned long		last_updated;
> > > > > > +	u32			capabilities;
> > +
> > > > +	/* Registers */
> > > > > > +	u8	fan_config[NR_CHANNEL];
> > > > > > +	u16	fan_command[NR_CHANNEL];
> > > > > > +	u8	mfr_fan_config[NR_CHANNEL];
> > > > > > +	u8	fault_status[NR_CHANNEL];
> > > > > > +	u16	pwm[NR_CHANNEL];
> > > > > > +	u16	tach_rpm[NR_CHANNEL];
> > > > > > +	u16	tach_rpm_fast[NR_CHANNEL];
> > +};
> > +
> > +static int max31785_set_page(struct i2c_client *client,
> > > > +				u8 page)
> > +{
> > > > +	return i2c_smbus_write_byte_data(client, MAX31785_REG_PAGE, page)=
;
> > +}
> > +
> > +static int read_fan_data(struct i2c_client *client, u8 fan, u8 reg,
> > > > +				=C2=A0=C2=A0s32 (*read)(const struct i2c_client *, u8))
> > +{
> > > > +	int rv;
> > +
> > > > +	rv =3D max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	return read(client, reg);
> > +}
> > +
> > +static inline int max31785_read_fan_byte(struct i2c_client *client, u8=
 fan,
> > > > +					=C2=A0u8 reg)
> > +{
> > > > +	return read_fan_data(client, fan, reg, i2c_smbus_read_byte_data);
> > +}
> > +
> > +static inline int max31785_read_fan_word(struct i2c_client *client, u8=
 fan,
> > > > +					=C2=A0u8 reg)
> > +{
> > > > +	return read_fan_data(client, fan, reg, i2c_smbus_read_word_data);
> > +}
> > +
> > +static int max31785_write_fan_byte(struct i2c_client *client, u8 fan,
> > > > +					=C2=A0u8 reg, u8 data)
> > +{
> > > > +	int err;
> > +
> > > > +	err =3D max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
> > > > +	if (err < 0)
> > > > +		return err;
> > +
> > > > +	return i2c_smbus_write_byte_data(client, reg, data);
> > +}
> > +
> > +static int max31785_write_fan_word(struct i2c_client *client, u8 fan,
> > > > +					=C2=A0u8 reg, u16 data)
> > +{
> > > > +	int err;
> > +
> > > > +	err =3D max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
> > > > +	if (err < 0)
> > > > +		return err;
> > +
> > > > +	return i2c_smbus_write_word_data(client, reg, data);
> > +}
> > +
> > +/* Cut down version of i2c_smbus_xfer_emulated(), reading 4 bytes */
> > +static s64 max31785_smbus_read_long_data(struct i2c_client *client, u8=
 command)
> > +{
> > > > +	unsigned char cmdbuf[1];
> > > > +	unsigned char rspbuf[4];
> > > > +	s64 rc;
> > +
> > > > +	struct i2c_msg msg[2] =3D {
> > > > +		{
> > > > +			.addr =3D client->addr,
> > > > +			.flags =3D 0,
> > > > +			.len =3D sizeof(cmdbuf),
> > > > +			.buf =3D cmdbuf,
> > > > +		},
> > > > +		{
> > > > +			.addr =3D client->addr,
> > > > +			.flags =3D I2C_M_RD,
> > > > +			.len =3D sizeof(rspbuf),
> > > > +			.buf =3D rspbuf,
> > > > +		},
> > > > +	};
> > +
> > > > +	cmdbuf[0] =3D command;
> > +
> > > > +	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> > > > +	if (rc < 0)
> > > > +		return rc;
> > +
> > > > +	rc =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
> > > > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(rspbuf[2] << (2 * 8)) | (rspbuf[3]=
 << (3 * 8));
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
> > +{
> > > > +	s64 rc;
> > +
> > > > +	rc =3D max31785_set_page(data->client, MAX31785_PAGE_FAN_CONFIG(f=
an));
> > > > +	if (rc)
> > > > +		return rc;
> > +
> > > > +	if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
> > > > +		rc =3D max31785_smbus_read_long_data(data->client,
> > > > +				MAX31785_REG_FAN_SPEED_1);
> > > > +		if (rc < 0)
> > > > +			return rc;
> > +
> > > > +		data->tach_rpm[fan] =3D rc & 0xffff;
> > > > +		data->tach_rpm_fast[fan] =3D (rc >> 16) & 0xffff;
> > +
> > > > +		return rc;
> > > > +	}
> > +
> > > > +	rc =3D i2c_smbus_read_word_data(data->client, MAX31785_REG_FAN_SP=
EED_1);
> > > > +	if (rc < 0)
> > > > +		return rc;
> > +
> > > > +	data->tach_rpm[fan] =3D rc;
> > +
> > > > +	return rc;
> > +}
> > +
> > +static inline bool is_automatic_control_mode(struct max31785 *data,
> > > > +			int index)
> > +{
> > > > +	return data->fan_command[index] > 0x7fff;
> > +}
> > +
> > +static struct max31785 *max31785_update_device(struct device *dev)
> > +{
> > > > +	struct max31785 *data =3D dev_get_drvdata(dev);
> > > > +	struct i2c_client *client =3D data->client;
> > > > +	struct max31785 *ret =3D data;
> > > > +	int rv;
> > > > +	int i;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	if (!time_after(jiffies, data->last_updated + HZ) && data->valid)=
 {
> > > > +		mutex_unlock(&data->lock);
> > +
> > > > +		return ret;
> > > > +	}
> > +
> > > > +	for (i =3D 0; i < NR_CHANNEL; i++) {
> > > > +		rv =3D max31785_read_fan_byte(client, i,
> > > > +				MAX31785_REG_STATUS_FANS_1_2);
> > > > +		if (rv < 0)
> > > > +			goto abort;
> > > > +		data->fault_status[i] =3D rv;
> > +
> > > > +		rv =3D max31785_update_fan_speed(data, i);
> > > > +		if (rv < 0)
> > > > +			goto abort;
> > +
> > > > +		if ((data->fan_config[i]
> > > > +					& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> > > > +				|| is_automatic_control_mode(data, i)) {
> > > > +			rv =3D max31785_read_fan_word(client, i,
> > > > +					MAX31785_REG_READ_FAN_PWM);
> > > > +			if (rv < 0)
> > > > +				goto abort;
> > > > +			data->pwm[i] =3D rv;
> > > > +		}
> > +
> > > > +		if (!is_automatic_control_mode(data, i)) {
> > > > +			/*
> > > > +			=C2=A0* Poke watchdog for manual fan control
> > > > +			=C2=A0*
> > > > +			=C2=A0* XXX (AJ): This isn't documented in the MAX31785
> > > > +			=C2=A0* datasheet, or anywhere else it seems.
> > > > +			=C2=A0*/
> > > > +			rv =3D max31785_write_fan_word(client,
> > > > +					i, MAX31785_REG_FAN_COMMAND_1,
> > > > +					data->fan_command[i]);
> > > > +			if (rv < 0)
> > > > +				goto abort;
> > > > +		}
> > > > +	}
> > +
> > > > +	data->last_updated =3D jiffies;
> > > > +	data->valid =3D true;
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return ret;
> > +
> > +abort:
> > > > +	data->valid =3D false;
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return ERR_PTR(rv);
> > +
> > +}
> > +
> > +static ssize_t max31785_fan_set_target(struct max31785 *data, int chan=
nel,
> > > > +		long rpm)
> > +{
> > > > +	int rc;
> > +
> > > > +	if (rpm > 0x7fff)
> > > > +		return -EINVAL;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	/* Write new RPM value */
> > > > +	data->fan_command[channel] =3D rpm;
> > > > +	rc =3D max31785_write_fan_word(data->client, channel,
> > > > +				MAX31785_REG_FAN_COMMAND_1,
> > > > +				data->fan_command[channel]);
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return rc;
> > +}
> > +
> > +static ssize_t max31785_fan_set_pulses(struct max31785 *data, int chan=
nel,
> > > > +		long pulses)
> > +{
> > > > +	int rc;
> > +
> > > > +	if (pulses > 4)
> > > > +		return -EINVAL;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	/* XXX (AJ): This sequence disables the fan and sets in PWM mode =
*/
> > > > +	data->fan_config[channel] &=3D MAX31785_FAN_CFG_PULSE_MASK;
> > > > +	data->fan_config[channel] |=3D ((pulses - MAX31785_FAN_CFG_PULSE_=
OFFSET)
> > > > +					<< MAX31785_FAN_CFG_PULSE_SHIFT);
> > +
> > > > +	/* Write new pulse value */
> > > > +	rc =3D max31785_write_fan_byte(data->client, channel,
> > > > +				MAX31785_REG_FAN_CONFIG_1_2,
> > > > +				data->fan_config[channel]);
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return rc;
> > +}
> > +
> > +static ssize_t max31785_pwm_set(struct max31785 *data, int channel, lo=
ng pwm)
> > +{
> > > > +	int rc;
> > +
> > > > +	if (pwm > 255)
> > > > +		return -EINVAL;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	/* Write new PWM value */
> > > > +	data->fan_command[channel] =3D pwm * MAX31785_FAN_COMMAND_PWM_RAT=
IO;
> > > > +	rc =3D max31785_write_fan_word(data->client, channel,
> > > > +				MAX31785_REG_FAN_COMMAND_1,
> > > > +				data->fan_command[channel]);
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return rc;
> > +}
> > +
> > +static ssize_t max31785_pwm_enable(struct max31785 *data, int channel,
> > > > +		long mode)
> > +{
> > > > +	struct i2c_client *client =3D data->client;
> > > > +	int rc;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	switch (mode) {
> > > > +	case 0:
> > > > +		data->fan_config[channel] =3D
> > > > +			data->fan_config[channel]
> > > > +			& ~MAX31785_FAN_CFG_PWM_ENABLE;
> > > > +		break;
> > > > +	case 1: /* fallthrough */
> > > > +	case 2: /* fallthrough */
> > > > +	case 3:
> > > > +		data->fan_config[channel] =3D
> > > > +			data->fan_config[channel]
> > > > +			=C2=A0| MAX31785_FAN_CFG_PWM_ENABLE;
> > > > +		break;
> > > > +	default:
> > > > +		rc =3D -EINVAL;
> > > > +		goto done;
> > +
> > > > +	}
> > +
> > > > +	switch (mode) {
> > > > +	case 0:
> > > > +		break;
> > > > +	case 1:
> > > > +		data->fan_config[channel] =3D
> > > > +			data->fan_config[channel]
> > > > +			& ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> > > > +		break;
> > > > +	case 2:
> > > > +		data->fan_config[channel] =3D
> > > > +			data->fan_config[channel]
> > > > +			| MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> > > > +		break;
> > > > +	case 3:
> > > > +		data->fan_command[channel] =3D 0xffff;
> > > > +		break;
> > > > +	default:
> > > > +		rc =3D -EINVAL;
> > > > +		goto done;
> > > > +	}
> > +
> > > > +	rc =3D max31785_write_fan_byte(client, channel,
> > > > +				MAX31785_REG_FAN_CONFIG_1_2,
> > > > +				data->fan_config[channel]);
> > +
> > > > +	if (!rc)
> > > > +		rc =3D max31785_write_fan_word(client, channel,
> > > > +				MAX31785_REG_FAN_COMMAND_1,
> > > > +				data->fan_command[channel]);
> > +
> > +done:
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_init_fans(struct max31785 *data)
> > +{
> > > > +	struct i2c_client *client =3D data->client;
> > > > +	int i, rv;
> > +
> > > > +	for (i =3D 0; i < NR_CHANNEL; i++) {
> > > > +		rv =3D max31785_read_fan_byte(client, i,
> > > > +				MAX31785_REG_FAN_CONFIG_1_2);
> > > > +		if (rv < 0)
> > > > +			return rv;
> > > > +		data->fan_config[i] =3D rv;
> > +
> > > > +		rv =3D max31785_read_fan_word(client, i,
> > > > +				MAX31785_REG_FAN_COMMAND_1);
> > > > +		if (rv < 0)
> > > > +			return rv;
> > > > +		data->fan_command[i] =3D rv;
> > +
> > > > +		rv =3D max31785_read_fan_byte(client, i,
> > > > +				MAX31785_REG_MFR_FAN_CONFIG);
> > > > +		if (rv < 0)
> > > > +			return rv;
> > > > +		data->mfr_fan_config[i] =3D rv;
> > +
> > > > +		if (!((data->fan_config[i]
> > > > +			& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> > > > +			|| is_automatic_control_mode(data, i))) {
> > > > +			data->pwm[i] =3D 0;
> > > > +		}
> > > > +	}
> > +
> > > > +	return rv;
> > +}
> > +
> > +/* Return 0 if detection is successful, -ENODEV otherwise */
> > +static int max31785_detect(struct i2c_client *client,
> > > > +			=C2=A0=C2=A0struct i2c_board_info *info)
> > +{
> > > > +	struct i2c_adapter *adapter =3D client->adapter;
> > > > +	int rv;
> > +
> > > > +	if (!i2c_check_functionality(adapter,
> > > > +			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> > > > +		return -ENODEV;
> > +
> > > > +	/* Probe manufacturer / model registers */
> > > > +	rv =3D i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_ID);
> > > > +	if (rv < 0)
> > > > +		return -ENODEV;
> > > > +	if (rv !=3D MAX31785_MFR_ID)
> > > > +		return -ENODEV;
> > +
> > > > +	rv =3D i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_MODEL);
> > > > +	if (rv < 0)
> > > > +		return -ENODEV;
> > > > +	if (rv !=3D MAX31785_MFR_MODEL)
> > > > +		return -ENODEV;
> > +
> > > > +	strlcpy(info->type, "max31785", I2C_NAME_SIZE);
> > +
> > > > +	return 0;
> > +}
> > +
> > +static const u32 max31785_fan_config[] =3D {
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info max31785_fan =3D {
> > > > +	.type =3D hwmon_fan,
> > > > +	.config =3D max31785_fan_config,
> > +};
> > +
> > +static const u32 max31785_pwm_config[] =3D {
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > +	0,
> > +};
> > +
> > +static const struct hwmon_channel_info max31785_pwm =3D {
> > > > +	.type =3D hwmon_pwm,
> > > > +	.config =3D max31785_pwm_config
> > +};
> > +
> > +static const struct hwmon_channel_info *max31785_info[] =3D {
> > > > +	&max31785_fan,
> > > > +	&max31785_pwm,
> > > > +	NULL,
> > +};
> > +
> > +static int max31785_read_fan(struct max31785 *data, u32 attr, int chan=
nel,
> > > > +		long *val)
> > +{
> > > > +	int rc =3D 0;
> > +
> > > > +	switch (attr) {
> > > > +	case hwmon_fan_pulses:
> > > > +	{
> > > > +		long pulses;
> > +
> > > > +		pulses =3D data->fan_config[channel];
> > > > +		pulses &=3D MAX31785_FAN_CFG_PULSE_MASK;
> > > > +		pulses >>=3D MAX31785_FAN_CFG_PULSE_SHIFT;
> > > > +		pulses +=3D MAX31785_FAN_CFG_PULSE_OFFSET;
> > +
> > > > +		*val =3D pulses;
> > > > +		break;
> > > > +	}
> > > > +	case hwmon_fan_target:
> > > > +	{
> > > > +		long target;
> > +
> > > > +		mutex_lock(&data->lock);
> > +
> > > > +		target =3D data->fan_command[channel];
> > +
> > > > +		if (!(data->fan_config[channel] &
> > > > +				MAX31785_FAN_CFG_CONTROL_MODE_RPM))
> > > > +			target /=3D MAX31785_FAN_COMMAND_PWM_RATIO;
> > +
> > > > +		*val =3D target;
> > +
> > > > +		mutex_unlock(&data->lock);
> > +
> > > > +		break;
> > > > +	}
> > > > +	case hwmon_fan_input:
> > > > +		*val =3D data->tach_rpm[channel];
> > > > +		break;
> > > > +	case hwmon_fan_fault:
> > > > +		*val =3D !!(data->fault_status[channel] &
> > > > +				MAX31785_FAN_STATUS_FAULT_MASK);
> > > > +		break;
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +		break;
> > > > +	};
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_fan_get_fast(struct device *dev,
> > > > +				struct device_attribute *attr, char *buf)
> > +{
> > > > +	struct sensor_device_attribute_2 *attr2 =3D to_sensor_dev_attr_2(=
attr);
> > > > +	struct max31785 *data =3D max31785_update_device(dev);
> > +
> > > > +	return sprintf(buf, "%d\n", data->tach_rpm_fast[attr2->index]);
> > +}
> > +
> > +static int max31785_read_pwm(struct max31785 *data, u32 attr, int chan=
nel,
> > > > +		long *val)
> > +{
> > > > +	bool is_auto;
> > > > +	bool is_rpm;
> > > > +	int rc;
> > +
> > > > +	mutex_lock(&data->lock);
> > +
> > > > +	is_rpm =3D !!(data->fan_config[channel] &
> > > > +			MAX31785_FAN_CFG_CONTROL_MODE_RPM);
> > > > +	is_auto =3D is_automatic_control_mode(data, channel);
> > +
> > > > +	switch (attr) {
> > > > +	case hwmon_pwm_enable:
> > > > +	{
> > > > +		bool pwm_enabled;
> > +
> > > > +		pwm_enabled =3D (data->fan_config[channel] &
> > > > +				MAX31785_FAN_CFG_PWM_ENABLE);
> > +
> > > > +		if (!pwm_enabled)
> > > > +			*val =3D 0;
> > > > +		else if (is_auto)
> > > > +			*val =3D 3;
> > > > +		else if (is_rpm)
> > > > +			*val =3D 2;
> > > > +		else
> > > > +			*val =3D 1;
> > > > +		break;
> > > > +	}
> > > > +	case hwmon_pwm_input:
> > > > +		if (is_rpm || is_auto)
> > > > +			*val =3D data->pwm[channel] / 100;
> > > > +		else
> > > > +			*val =3D data->fan_command[channel]
> > > > +				/ MAX31785_FAN_COMMAND_PWM_RATIO;
> > > > +		break;
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +	};
> > +
> > > > +	mutex_unlock(&data->lock);
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> > > > +		u32 attr, int channel, long *val)
> > +{
> > > > +	struct max31785 *data;
> > > > +	int rc;
> > +
> > > > +	data =3D max31785_update_device(dev);
> > +
> > > > +	if (IS_ERR(data))
> > > > +		return PTR_ERR(data);
> > +
> > > > +	switch (type) {
> > > > +	case hwmon_fan:
> > > > +		return max31785_read_fan(data, attr, channel, val);
> > > > +	case hwmon_pwm:
> > > > +		return max31785_read_pwm(data, attr, channel, val);
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +	}
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_write_fan(struct max31785 *data, u32 attr, int cha=
nnel,
> > > > +		long val)
> > +{
> > > > +	int rc;
> > +
> > > > +	switch (attr) {
> > > > +		break;
> > > > +	case hwmon_fan_pulses:
> > > > +		return max31785_fan_set_pulses(data, channel, val);
> > > > +	case hwmon_fan_target:
> > > > +		return max31785_fan_set_target(data, channel, val);
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +	};
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_write_pwm(struct max31785 *data, u32 attr, int cha=
nnel,
> > > > +		long val)
> > +{
> > > > +	int rc;
> > +
> > > > +	switch (attr) {
> > > > +	case hwmon_pwm_enable:
> > > > +		return max31785_pwm_enable(data, channel, val);
> > > > +	case hwmon_pwm_input:
> > > > +		return max31785_pwm_set(data, channel, val);
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +	};
> > +
> > > > +	return rc;
> > +}
> > +
> > +static int max31785_write(struct device *dev, enum hwmon_sensor_types =
type,
> > > > +		u32 attr, int channel, long val)
> > +{
> > > > +	struct max31785 *data;
> > > > +	int rc;
> > +
> > > > +	data =3D dev_get_drvdata(dev);
> > +
> > > > +	switch (type) {
> > > > +	case hwmon_fan:
> > > > +		return max31785_write_fan(data, attr, channel, val);
> > > > +	case hwmon_pwm:
> > > > +		return max31785_write_pwm(data, attr, channel, val);
> > > > +	default:
> > > > +		rc =3D -EOPNOTSUPP;
> > > > +	}
> > +
> > > > +	return rc;
> > +
> > +}
> > +
> > +static umode_t max31785_is_visible(const void *_data,
> > > > +		enum hwmon_sensor_types type, u32 attr, int channel)
> > +{
> > > > +	switch (type) {
> > > > +	case hwmon_fan:
> > > > +		switch (attr) {
> > > > +		case hwmon_fan_input:
> > > > +		case hwmon_fan_fault:
> > > > +			return 0444;
> > > > +		case hwmon_fan_pulses:
> > > > +		case hwmon_fan_target:
> > > > +			return 0644;
> > > > +		};
> > > > +	case hwmon_pwm:
> > > > +		return 0644;
> > > > +	default:
> > > > +		return 0;
> > > > +	};
> > +}
> > +
> > +static const struct hwmon_ops max31785_hwmon_ops =3D {
> > > > +	.is_visible =3D max31785_is_visible,
> > > > +	.read =3D max31785_read,
> > > > +	.write =3D max31785_write,
> > +};
> > +
> > +static const struct hwmon_chip_info max31785_chip_info =3D {
> > > > +	.ops =3D &max31785_hwmon_ops,
> > > > +	.info =3D max31785_info,
> > +};
> > +
> > +static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 0);
> > +static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 1);
> > +static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 2);
> > +static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 3);
> > +static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 4);
> > +static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast=
,
> > > > +		NULL, 5);
> > +
> > +static struct attribute *max31785_attrs[] =3D {
> > > > +	&sensor_dev_attr_fan1_input_fast.dev_attr.attr,
> > > > +	&sensor_dev_attr_fan2_input_fast.dev_attr.attr,
> > > > +	&sensor_dev_attr_fan3_input_fast.dev_attr.attr,
> > > > +	&sensor_dev_attr_fan4_input_fast.dev_attr.attr,
> > > > +	&sensor_dev_attr_fan5_input_fast.dev_attr.attr,
> > > > +	&sensor_dev_attr_fan6_input_fast.dev_attr.attr,
> > > > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(max31785);
> > +
> > +static int max31785_get_capabilities(struct max31785 *data)
> > +{
> > > > +	s32 rc;
> > +
> > > > +	rc =3D i2c_smbus_read_word_data(data->client, MAX31785_REG_MFR_RE=
VISION);
> > > > +	if (rc < 0)
> > > > +		return rc;
> > +
> > > > +	if (rc =3D=3D 0x3040)
> > > > +		data->capabilities |=3D MAX31785_CAP_FAST_ROTOR;
> > +
> > > > +	return 0;
> > +}
> > +
> > +static int max31785_probe(struct i2c_client *client,
> > > > +			=C2=A0=C2=A0const struct i2c_device_id *id)
> > +{
> > > > +	struct i2c_adapter *adapter =3D client->adapter;
> > > > +	const struct attribute_group **extra_groups;
> > > > +	struct device *dev =3D &client->dev;
> > > > +	struct device *hwmon_dev;
> > > > +	struct max31785 *data;
> > > > +	int rc;
> > +
> > > > +	if (!i2c_check_functionality(adapter,
> > > > +			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> > > > +		return -ENODEV;
> > +
> > > > +	data =3D devm_kzalloc(dev, sizeof(struct max31785), GFP_KERNEL);
> > > > +	if (!data)
> > > > +		return -ENOMEM;
> > +
> > > > +	data->client =3D client;
> > > > +	mutex_init(&data->lock);
> > +
> > > > +	rc =3D max31785_init_fans(data);
> > > > +	if (rc)
> > > > +		return rc;
> > +
> > > > +	rc =3D max31785_get_capabilities(data);
> > > > +	if (rc < 0)
> > > > +		return rc;
> > +
> > > > +	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
> > > > +		extra_groups =3D max31785_groups;
> > +
> > > > +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> > > > +			client->name, data, &max31785_chip_info, extra_groups);
> > +
> > > > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static const struct i2c_device_id max31785_id[] =3D {
> > > > +	{ "max31785", 0 },
> > > > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max31785_id);
> > +
> > +static struct i2c_driver max31785_driver =3D {
> > > > > > +	.class		=3D I2C_CLASS_HWMON,
> > > > > > +	.probe		=3D max31785_probe,
> > > > +	.driver =3D {
> > > > > > +		.name	=3D "max31785",
> > > > +	},
> > > > > > +	.id_table	=3D max31785_id,
> > > > > > +	.detect		=3D max31785_detect,
> > > > > > +	.address_list	=3D normal_i2c,
> > +};
> > +
> > +module_i2c_driver(max31785_driver);
> > +
> > > > +MODULE_AUTHOR("Timothy Pearson <tpearson@raptorengineering.com>");
> > +MODULE_DESCRIPTION("MAX31785 sensor driver");
> > +MODULE_LICENSE("GPL");
> >=20
>=20
>=20
--=-c2n+9YawNfhBZ2D0ljQ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZN6ggAAoJEJ0dnzgO5LT5r1gQAKlfStc4AseQRilniUNpcBQi
2N+iNcuMbLY2rr1IsitfQgluGHSQ0MEtlCoIv+mXhjo57CeMX/e+d8X0sOzNr5id
ByZmQXBviAfALbxflKxZwa4JadgEUtsRryU71Bj+3FzY7hjivYefF3QirPN0zVfu
a3S63Iq6EQcdWYEmRsyZZiUtjIWiHTxbUCBO7xGrj5StjUhRxMc4XANB99AonrLH
ng3zSHry30uf/69kBLni6gcu07xRcg3YRF1GIZI46DL04817dspGf3j/6UIKNxCw
H0RpWgTlZQCD5EU1FRRLxrq7KItWfJB6zsd8Nz3GMr8env4/GJXkzcG8Z2e4pZ7g
iHX5qJfjH9aM5QqUy1o7uglXQfgVmeDO8CfFZ2xQwjZpyeGMvzHO3/r8DNLizgnx
o+vrvyan+G23Rcey7QjvnDYOdyD6oqkP3WQWzJlKlVGKrcEHhdFWcbyo5vociBgP
bDRINjE4HU3s+zyTrxhqFzz4+ZGOb2b0QlLch3XHpfhq4lwsJk7kj46oqSBpI4ew
AJprzVoL4QXzCLX4yzMot2uttKFZSI96lHcC65pJSmBNtq1HUrAAuXdfohFKiHxk
LAQrcD99WsuWQHoXVn6V3GfoAi33pbG//SIZbanQ69kBxS0G60uFtZyVRYMlcUjf
ibrR6n8H1DL5DEhFia93
=ikjE
-----END PGP SIGNATURE-----

--=-c2n+9YawNfhBZ2D0ljQ9--

