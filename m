Return-Path: <stefan.wahren@i2se.com>
Return-path: <stefan.wahren@i2se.com>
Date: Tue, 22 May 2018 15:51:36 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Jean Delvare <jdelvare@suse.com>
Cc: Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	Phil Elwell <phil@raspberrypi.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <659923372.11518.1526997096662@email.1und1.de>
In-Reply-To: <90a768aa-ee8c-1050-cf15-60637069dbdb@roeck-us.net>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
 <1526988112-4021-3-git-send-email-stefan.wahren@i2se.com>
 <90a768aa-ee8c-1050-cf15-60637069dbdb@roeck-us.net>
Subject: Re: [PATCH RFC V2 2/6] hwmon: Add support for RPi voltage sensor
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

> Guenter Roeck <linux@roeck-us.net> hat am 22. Mai 2018 um 15:41 geschrieb=
en:
>=20
>=20
> On 05/22/2018 04:21 AM, Stefan Wahren wrote:
> > Currently there is no easy way to detect undervoltage conditions on a
> > remote Raspberry Pi. This hwmon driver retrieves the state of the
> > undervoltage sensor via mailbox interface. The handling based on
> > Noralf's modifications to the downstream firmware driver. In case of
> > an undervoltage condition only an entry is written to the kernel log.
> >=20
> > CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > ---
> >   Documentation/hwmon/raspberrypi-hwmon |  22 +++++
> >   drivers/hwmon/Kconfig                 |  10 ++
> >   drivers/hwmon/Makefile                |   1 +
> >   drivers/hwmon/raspberrypi-hwmon.c     | 168 +++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 201 insertions(+)
> >   create mode 100644 Documentation/hwmon/raspberrypi-hwmon
> >   create mode 100644 drivers/hwmon/raspberrypi-hwmon.c
> >=20
> > diff --git a/Documentation/hwmon/raspberrypi-hwmon b/Documentation/hwmo=
n/raspberrypi-hwmon
> > new file mode 100644
> > index 0000000..3c92e2c
> > --- /dev/null
> > +++ b/Documentation/hwmon/raspberrypi-hwmon
> > @@ -0,0 +1,22 @@
> > +Kernel driver raspberrypi-hwmon
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported boards:
> > +  * Raspberry Pi A+ (via GPIO on SoC)
> > +  * Raspberry Pi B+ (via GPIO on SoC)
> > +  * Raspberry Pi 2 B (via GPIO on SoC)
> > +  * Raspberry Pi 3 B (via GPIO on port expander)
> > +  * Raspberry Pi 3 B+ (via PMIC)
> > +
> > +Author: Stefan Wahren <stefan.wahren@i2se.com>
> > +
> > +Description
> > +-----------
> > +
> > +This driver periodically polls a mailbox property of the VC4 firmware =
to detect
> > +undervoltage conditions.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +in0_lcrit_alarm=09=09Undervoltage alarm
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 768aed5..9a5bdb0 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1298,6 +1298,16 @@ config SENSORS_PWM_FAN
> >   =09  This driver can also be built as a module.  If so, the module
> >   =09  will be called pwm-fan.
> >  =20
> > +config SENSORS_RASPBERRYPI_HWMON
> > +=09tristate "Raspberry Pi voltage monitor"
> > +=09depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> > +=09help
> > +=09  If you say yes here you get support for voltage sensor on the
> > +=09  Raspberry Pi.
> > +
> > +=09  This driver can also be built as a module. If so, the module
> > +=09  will be called raspberrypi-hwmon.
> > +
> >   config SENSORS_SHT15
> >   =09tristate "Sensiron humidity and temperature sensors. SHT15 and com=
pat."
> >   =09depends on GPIOLIB || COMPILE_TEST
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index e7d52a3..a929770 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -141,6 +141,7 @@ obj-$(CONFIG_SENSORS_PC87427)=09+=3D pc87427.o
> >   obj-$(CONFIG_SENSORS_PCF8591)=09+=3D pcf8591.o
> >   obj-$(CONFIG_SENSORS_POWR1220)  +=3D powr1220.o
> >   obj-$(CONFIG_SENSORS_PWM_FAN)=09+=3D pwm-fan.o
> > +obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)=09+=3D raspberrypi-hwmon.o
> >   obj-$(CONFIG_SENSORS_S3C)=09+=3D s3c-hwmon.o
> >   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
> >   obj-$(CONFIG_SENSORS_SCH5627)=09+=3D sch5627.o
> > diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberr=
ypi-hwmon.c
> > new file mode 100644
> > index 0000000..6233e84
> > --- /dev/null
> > +++ b/drivers/hwmon/raspberrypi-hwmon.c
> > @@ -0,0 +1,168 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Raspberry Pi voltage sensor driver
> > + *
> > + * Based on firmware/raspberrypi.c by Noralf Tr=C3=B8nnes
> > + *
> > + * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
> > + */
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/workqueue.h>
> > +#include <soc/bcm2835/raspberrypi-firmware.h>
> > +
> > +#define UNDERVOLTAGE_STICKY_BIT=09BIT(16)
> > +
> > +struct rpi_hwmon_data {
> > +=09struct device *hwmon_dev;
> > +=09struct rpi_firmware *fw;
> > +=09u32 last_throttled;
> > +=09struct delayed_work get_values_poll_work;
> > +};
> > +
> > +static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
> > +{
> > +=09u32 new_uv, old_uv, value;
> > +=09int ret;
> > +
> > +=09/* Request firmware to clear sticky bits */
> > +=09value =3D 0xffff;
> > +
> > +=09ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> > +=09=09=09=09    &value, sizeof(value));
> > +=09if (ret) {
> > +=09=09dev_err_once(data->hwmon_dev, "Failed to get throttled (%d)\n",
> > +=09=09=09     ret);
> > +=09=09return;
> > +=09}
> > +
> > +=09new_uv =3D value & UNDERVOLTAGE_STICKY_BIT;
> > +=09old_uv =3D data->last_throttled & UNDERVOLTAGE_STICKY_BIT;
> > +=09data->last_throttled =3D value;
> > +
> > +=09if (new_uv =3D=3D old_uv)
> > +=09=09return;
> > +
> > +=09if (new_uv)
> > +=09=09dev_crit(data->hwmon_dev, "Undervoltage detected!\n");
> > +=09else
> > +=09=09dev_info(data->hwmon_dev, "Voltage normalised\n");
> > +
> > +=09sysfs_notify(&data->hwmon_dev->kobj, NULL, "in0_lcrit_alarm");
> > +}
> > +
> > +static void get_values_poll(struct work_struct *work)
> > +{
> > +=09struct rpi_hwmon_data *data;
> > +
> > +=09data =3D container_of(work, struct rpi_hwmon_data,
> > +=09=09=09    get_values_poll_work.work);
> > +
> > +=09rpi_firmware_get_throttled(data);
> > +
> > +=09/*
> > +=09 * We can't run faster than the sticky shift (100ms) since we get
> > +=09 * flipping in the sticky bits that are cleared.
> > +=09 */
> > +=09schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
> > +}
> > +
> > +static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
> > +=09=09    u32 attr, int channel, long *val)
> > +{
> > +=09struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
> > +
> > +=09*val =3D !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> > +=09return 0;
> > +}
> > +
> > +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_typ=
es type,
> > +=09=09=09      u32 attr, int channel)
> > +{
> > +=09return 0444;
> > +}
> > +
> > +static const u32 rpi_in_config[] =3D {
> > +=09HWMON_I_LCRIT_ALARM,
> > +=090
> > +};
> > +
> > +static const struct hwmon_channel_info rpi_in =3D {
> > +=09.type =3D hwmon_in,
> > +=09.config =3D rpi_in_config,
> > +};
> > +
> > +static const struct hwmon_channel_info *rpi_info[] =3D {
> > +=09&rpi_in,
> > +=09NULL
> > +};
> > +
> > +static const struct hwmon_ops rpi_hwmon_ops =3D {
> > +=09.is_visible =3D rpi_is_visible,
> > +=09.read =3D rpi_read,
> > +};
> > +
> > +static const struct hwmon_chip_info rpi_chip_info =3D {
> > +=09.ops =3D &rpi_hwmon_ops,
> > +=09.info =3D rpi_info,
> > +};
> > +
> > +static int rpi_hwmon_probe(struct platform_device *pdev)
> > +{
> > +=09struct device *dev =3D &pdev->dev;
> > +=09struct rpi_hwmon_data *data;
> > +=09int ret;
> > +
> > +=09data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +=09if (!data)
> > +=09=09return -ENOMEM;
> > +
> > +=09data->fw =3D platform_get_drvdata(to_platform_device(dev->parent));
> > +=09if (!data->fw)
> > +=09=09return -EPROBE_DEFER;
> > +
>=20
> I am a bit at loss here (and sorry I didn't bring this up before).
> How would this ever be possible, given that the driver is registered
> from the firmware driver ?

Do you refer to the (wrong) return code, the assumption that the parent mus=
t be a platform driver or a possible race?

>=20
> > +=09ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> > +=09=09=09=09    &data->last_throttled,
> > +=09=09=09=09    sizeof(data->last_throttled));
> > +=09if (ret)
> > +=09=09return -ENODEV;
> > +
> > +=09data->hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "rpi_=
volt",
> > +=09=09=09=09=09=09=09       data,
> > +=09=09=09=09=09=09=09       &rpi_chip_info,
> > +=09=09=09=09=09=09=09       NULL);
> > +
> > +=09INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
> > +=09platform_set_drvdata(pdev, data);
> > +
> > +=09if (!PTR_ERR_OR_ZERO(data->hwmon_dev))
> > +=09=09schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
> > +
> > +=09return PTR_ERR_OR_ZERO(data->hwmon_dev);
> > +}
> > +
> > +static int rpi_hwmon_remove(struct platform_device *pdev)
> > +{
> > +=09struct rpi_hwmon_data *data =3D platform_get_drvdata(pdev);
> > +
> > +=09cancel_delayed_work_sync(&data->get_values_poll_work);
> > +
> > +=09return 0;
> > +}
> > +
> > +static struct platform_driver rpi_hwmon_driver =3D {
> > +=09.probe =3D rpi_hwmon_probe,
> > +=09.remove =3D rpi_hwmon_remove,
> > +=09.driver =3D {
> > +=09=09.name =3D "raspberrypi-hwmon",
> > +=09},
> > +};
> > +module_platform_driver(rpi_hwmon_driver);
> > +
> > +MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
> > +MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
> > +MODULE_LICENSE("GPL v2");
> >=20
>
