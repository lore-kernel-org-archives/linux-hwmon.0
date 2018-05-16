Return-Path: <stefan.wahren@i2se.com>
Return-path: <stefan.wahren@i2se.com>
Date: Wed, 16 May 2018 21:59:01 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>, Eric Anholt <eric@anholt.net>,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Phil Elwell <phil@raspberrypi.org>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	linux-arm-kernel@lists.infradead.org
Message-ID: <1560428919.21731.1526500741266@email.1und1.de>
In-Reply-To: <20180516182144.GB22705@roeck-us.net>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-4-git-send-email-stefan.wahren@i2se.com>
 <20180516182144.GB22705@roeck-us.net>
Subject: Re: [PATCH RFC 3/6] hwmon: Add support for RPi voltage sensor
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

> Guenter Roeck <linux@roeck-us.net> hat am 16. Mai 2018 um 20:21 geschrieb=
en:
>=20
>=20
> On Wed, May 16, 2018 at 03:37:04PM +0200, Stefan Wahren wrote:
> > Currently there is no easy way to detect under-voltage conditions on a =
remote
> > Raspberry Pi. This hwmon driver retrieves the state of the under-voltag=
e sensor
> > via mailbox interface. The handling based on Noralf's modifications to =
the
> > downstream firmware driver. In case of an under-voltage condition only =
an entry
> > is written to the kernel log.
> >=20
>=20
> My major concern is how this is displayed with the 'sensors' command.
> Can you test and report ?

I get the following output:
rpi_volt-isa-0000
Adapter: ISA adapter
in0:              N/A =20

>=20
> Of course, it would be much better if the firmware would also report
> the actual voltage, but I guess we can't have everything.

I think this isn't possible because the hardware only provide a binary valu=
e (GPIO).

>=20
> More comments inline.
>=20
> Thanks,
> Guenter
>=20
> > CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > ---
> >  drivers/hwmon/Kconfig             |  10 ++
> >  drivers/hwmon/Makefile            |   1 +
> >  drivers/hwmon/raspberrypi-hwmon.c | 207 ++++++++++++++++++++++++++++++=
++++++++
>=20
> Please also provide Documentation/hwmon/raspberrypi-hwmon.
>=20
> >  3 files changed, 218 insertions(+)
> >  create mode 100644 drivers/hwmon/raspberrypi-hwmon.c
> >=20
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 768aed5..7f935cf 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1298,6 +1298,16 @@ config SENSORS_PWM_FAN
> >  =09  This driver can also be built as a module.  If so, the module
> >  =09  will be called pwm-fan.
> > =20
> > +config SENSORS_RASPBERRYPI_HWMON
> > +=09tristate "Raspberry Pi voltage monitor"
> > +=09depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST =
&& !RASPBERRYPI_FIRMWARE)
> > +=09help
> > +=09  If you say yes here you get support for voltage sensor on the
> > +=09  Raspberry Pi.
> > +
> > +=09  This driver can also be built as a module. If so, the module
> > +=09  will be called raspberrypi-hwmon.
> > +
> >  config SENSORS_SHT15
> >  =09tristate "Sensiron humidity and temperature sensors. SHT15 and comp=
at."
> >  =09depends on GPIOLIB || COMPILE_TEST
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index e7d52a3..a929770 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -141,6 +141,7 @@ obj-$(CONFIG_SENSORS_PC87427)=09+=3D pc87427.o
> >  obj-$(CONFIG_SENSORS_PCF8591)=09+=3D pcf8591.o
> >  obj-$(CONFIG_SENSORS_POWR1220)  +=3D powr1220.o
> >  obj-$(CONFIG_SENSORS_PWM_FAN)=09+=3D pwm-fan.o
> > +obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)=09+=3D raspberrypi-hwmon.o
> >  obj-$(CONFIG_SENSORS_S3C)=09+=3D s3c-hwmon.o
> >  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
> >  obj-$(CONFIG_SENSORS_SCH5627)=09+=3D sch5627.o
> > diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberr=
ypi-hwmon.c
> > new file mode 100644
> > index 0000000..2003f6c
> > --- /dev/null
> > +++ b/drivers/hwmon/raspberrypi-hwmon.c
> > @@ -0,0 +1,207 @@
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
> > +#include <linux/hwmon-sysfs.h>
>=20
> Unnecessary include
>=20
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
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
> > +=09/* Clear sticky bits */
>=20
> Please make more explicit that this is a request/command sent to the firm=
ware.
>=20
> > +=09value =3D 0xffff;
> > +
> > +=09ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> > +=09=09=09=09    &value, sizeof(value));
> > +=09if (ret) {
> > +=09=09dev_err_once(data->hwmon_dev, "%s: Failed to get throttled (%d)\=
n",
> > +=09=09=09     __func__, ret);
>=20
> The function name seems unnecessary.
>=20
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
> > +=09=09dev_crit(data->hwmon_dev, "Under-voltage detected! (0x%08x)\n",
> > +=09=09=09 value);
> > +=09else
> > +=09=09dev_info(data->hwmon_dev, "Voltage normalised (0x%08x)\n",
> > +=09=09=09 value);
>=20
> What value do those hex values provide to the user ?

The actual definition of the bits can be found in the commit log of patch #=
1. But this isn't very helpful for an end user.

>=20
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
> > +=09if (type !=3D hwmon_in)
> > +=09=09return -EOPNOTSUPP;
> > +
> > +=09if (attr !=3D hwmon_in_lcrit_alarm)
> > +=09=09return -EOPNOTSUPP;
> > +
> > +=09if (channel)
> > +=09=09return -EOPNOTSUPP;
> > +
> There is only one channel, one attribute, and one type supported.
> As such, the checks are unnecessary.
>=20
> > +=09*val =3D !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> > +=09return 0;
> > +}
> > +
> > +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_typ=
es type,
> > +=09=09=09      u32 attr, int channel)
> > +{
> > +=09if (type !=3D hwmon_in)
> > +=09=09return 0;
> > +
> > +=09if (attr !=3D hwmon_in_lcrit_alarm)
> > +=09=09return 0;
> > +
> > +=09if (channel)
> > +=09=09return 0;
>=20
> Same as above. In the list below, there is not a single conditional attri=
bute.
> Given that, the checks should be unnecessary, and it should be sufficient=
 to
> just return 0444.
>=20
> > +
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
> > +=09struct device_node *fw_node;
> > +=09struct rpi_hwmon_data *data;
> > +=09int ret;
> > +
> > +=09data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +=09if (!data)
> > +=09=09return -ENOMEM;
> > +
> > +=09fw_node =3D of_get_parent(dev->of_node);
> > +=09if (!fw_node) {
> > +=09=09dev_err(dev, "Missing firmware node\n");
> > +=09=09return -ENOENT;
> > +=09}
> > +
> > +=09data->fw =3D rpi_firmware_get(fw_node);
> > +=09of_node_put(fw_node);
> > +=09if (!data->fw)
> > +=09=09return -EPROBE_DEFER;
> > +
> > +=09ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> > +=09=09=09=09    &data->last_throttled,
> > +=09=09=09=09    sizeof(data->last_throttled));
> > +=09if (ret) {
> > +=09=09dev_info(dev, "Firmware doesn't support GET_THROTTLED\n");
>=20
> If this is an error -> dev_err().

I wasn't sure. If the firmware is too old, we cannot provide this feature a=
nd it's a waste of resources to load this driver. On the other side i don't=
 want to confuse people this is something bad.

Stefan

>=20
> > +=09=09return -EOPNOTSUPP;
>=20
> or return -ENODEV.
>=20
> > +=09}
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
> > +static const struct of_device_id rpi_hwmon_of_match[] =3D {
> > +=09{ .compatible =3D "raspberrypi,bcm2835-hwmon", },
> > +=09{ /* sentinel */},
> > +};
> > +MODULE_DEVICE_TABLE(of, rpi_hwmon_of_match);
> > +
> > +static struct platform_driver rpi_hwmon_driver =3D {
> > +=09.probe =3D rpi_hwmon_probe,
> > +=09.remove =3D rpi_hwmon_remove,
> > +=09.driver =3D {
> > +=09=09.name =3D "raspberrypi-hwmon",
> > +=09=09.of_match_table =3D rpi_hwmon_of_match,
> > +=09},
> > +};
> > +module_platform_driver(rpi_hwmon_driver);
> > +
> > +MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
> > +MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
> > +MODULE_LICENSE("GPL v2");
> > --=20
> > 2.7.4
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
