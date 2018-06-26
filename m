Return-Path: <gabriel.matni@exfo.com>
Return-path: <gabriel.matni@exfo.com>
From: Gabriel Matni <gabriel.matni@exfo.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>
Subject: [PATCH] hwmon: driver for sfp/sfp+ integrated sensors
Date: Tue, 26 Jun 2018 13:34:34 +0000
Message-ID: <3B588D51285A4A4D8D39C94212E078262A4503@SPQCMBX02.exfo.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

From: Gabriel Matni <gabriel.matni@exfo.com>

This driver supports the Small Form Factor Pluggable (SFP) Transceivers
that implement the Digital Diagnostic Monitoring Interface (DDMI) as
defined in SFF-8472. It currently supports temperature monitoring.

Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
---
 drivers/hwmon/Kconfig  |  11 ++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/sfpmon.c | 299 +++++++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 311 insertions(+)
 create mode 100644 drivers/hwmon/sfpmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f10840ad465c..52de64ccdcfa 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1357,6 +1357,17 @@ config SENSORS_S3C_RAW
 	  Say Y here if you want to include raw copies of all the ADC
 	  channels in sysfs.
=20
+config SENSORS_SFP
+	tristate "Small Form Factor Pluggable (SFP) Transceiver"
+	depends on I2C
+	help
+	  If you say yes here you get support for the integrated sensors in
+	  SFP/SFP+ modules that implement the Digital Diagnostic Monitoring
+	  Interface (DDMI) as defined in SFF-8472.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called sfpmon.
+
 config SENSORS_SIS5595
 	tristate "Silicon Integrated Systems Corp. SiS5595"
 	depends on PCI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e7d52a36e6c4..d687b6667c1c 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_SENSORS_S3C)	+=3D s3c-hwmon.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+=3D sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+=3D sch5636.o
+obj-$(CONFIG_SENSORS_SFP)       +=3D sfpmon.o
 obj-$(CONFIG_SENSORS_SHT15)	+=3D sht15.o
 obj-$(CONFIG_SENSORS_SHT21)	+=3D sht21.o
 obj-$(CONFIG_SENSORS_SHT3x)	+=3D sht3x.o
diff --git a/drivers/hwmon/sfpmon.c b/drivers/hwmon/sfpmon.c
new file mode 100644
index 000000000000..7744577348f1
--- /dev/null
+++ b/drivers/hwmon/sfpmon.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for SFP/SFP+ modules that implement the
+ * Digital Diagnostic Monitoring Interface (DDMI) as defined in SFF-8472.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/device.h>
+#include <linux/of.h>
+
+#define	DRIVER_NAME "sfpmon"
+
+/* id chip registers */
+#define SFF_8472_IDENTIFIER  0
+#define SFF_8472_DIAG_TYPE  92
+
+/* monitoring chip registers */
+#define SFF_8472_TEMP_HIGH_ALARM 0
+#define SFF_8472_TEMP_LOW_ALARM  2
+#define SFF_8472_TEMP_HIGH_WARN  4
+#define SFF_8472_TEMP_LOW_WARN   6
+#define SFF_8472_T_SLOPE        84
+#define SFF_8472_T_OFFSET       86
+#define SFF_8472_TEMP           96
+
+struct calib_info {
+	bool avail;
+	bool external;
+	u16 temp_slope;
+	s16 temp_offset;
+};
+
+struct sfp_data {
+	struct i2c_client *id_client;
+	struct i2c_client *ddmi_client;
+};
+
+static int sfp_detect(struct i2c_client *id, bool *detected)
+{
+	int ret;
+	s32 val;
+
+	val =3D i2c_smbus_read_byte_data(id, SFF_8472_IDENTIFIER);
+	if (val < 0) {
+		ret =3D val;
+		*detected =3D false;
+		goto abort;
+	}
+
+	*detected =3D (val =3D=3D 3);
+
+	ret =3D 0;
+abort:
+	return ret;
+}
+
+static int sfp_get_calib_info(struct i2c_client *id, struct i2c_client *dd=
mi,
+		struct calib_info *calib)
+{
+	int ret;
+	s32 val;
+
+	val =3D i2c_smbus_read_byte_data(id, SFF_8472_DIAG_TYPE);
+	if (val < 0) {
+		ret =3D val;
+		goto abort;
+	}
+
+	calib->avail =3D !!(val & BIT(6));
+	calib->external =3D !!(val & BIT(4));
+
+	if (calib->avail && calib->external) {
+		u16 data;
+
+		val =3D i2c_smbus_read_word_data(ddmi, SFF_8472_T_SLOPE);
+		if (unlikely(val < 0)) {
+			ret =3D val;
+			goto abort;
+		}
+		data =3D be16_to_cpu(val & 0xFFFF);
+		calib->temp_slope =3D *(s16 *)&data;
+
+		val =3D i2c_smbus_read_word_data(ddmi, SFF_8472_T_OFFSET);
+		if (unlikely(val < 0)) {
+			ret =3D val;
+			goto abort;
+		}
+		data =3D be16_to_cpu(val & 0xFFFF);
+		calib->temp_offset =3D *(s16 *)&data;
+	}
+
+	ret =3D 0;
+abort:
+	return ret;
+}
+
+static int sfp_get_temp(struct sfp_data *priv, u8 addr, long *temp_mC)
+{
+	int ret;
+	struct calib_info calib =3D {0};
+	s32 temp, val;
+	u16 data;
+	bool detected;
+
+	ret =3D sfp_detect(priv->id_client, &detected);
+	if (ret < 0)
+		goto abort;
+
+	if (!detected) {
+		ret =3D -ENODEV;
+		goto abort;
+	}
+
+	ret =3D sfp_get_calib_info(priv->id_client, priv->ddmi_client, &calib);
+	if (ret < 0)
+		goto abort;
+
+	if (!calib.avail) {
+		ret =3D -ENODEV;
+		goto abort;
+	}
+
+	val =3D i2c_smbus_read_word_data(priv->ddmi_client, addr);
+	if (unlikely(val < 0)) {
+		ret =3D val;
+		goto abort;
+	}
+
+	data =3D be16_to_cpu(val & 0xFFFF);
+	temp =3D *(s16 *)&data;
+
+	/* To get better precision we keep slope in unit of 1/256 and scale
+	 * up the offset accordingly. We also convert to mC by multiplying
+	 * by 1000. At the very end we divide by 256*256 (using >>16
+	 * operation). The first 256 is to rescale down, and the second
+	 * 256 is because the calibration result is in unit of 1/256
+	 */
+	if (calib.external)
+		*temp_mC =3D (((s64) calib.temp_slope * temp +
+				(calib.temp_offset << 8)) * 1000) >> 16;
+	else
+		*temp_mC =3D ((s64)temp*1000) >> 8;
+
+abort:
+	return ret;
+}
+
+static int sfp_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *temp)
+{
+	struct sfp_data *priv =3D dev_get_drvdata(dev);
+	int err;
+	u8 reg;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		reg =3D SFF_8472_TEMP;
+		break;
+	case hwmon_temp_crit:
+		reg =3D SFF_8472_TEMP_HIGH_ALARM;
+		break;
+	case hwmon_temp_lcrit:
+		reg =3D SFF_8472_TEMP_LOW_ALARM;
+		break;
+	case hwmon_temp_max:
+		reg =3D SFF_8472_TEMP_HIGH_WARN;
+		break;
+	case hwmon_temp_min:
+		reg =3D SFF_8472_TEMP_LOW_WARN;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	err =3D sfp_get_temp(priv, reg, temp);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static umode_t sfp_is_visible(const void *data, enum hwmon_sensor_types ty=
pe,
+				 u32 attr, int channel)
+{
+	if (type !=3D hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_crit:
+	case hwmon_temp_lcrit:
+	case hwmon_temp_max:
+	case hwmon_temp_min:
+		return S_IRUGO;
+	default:
+		return 0;
+	}
+}
+
+static u32 ddmi_temp_config[] =3D {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT
+		| HWMON_T_LCRIT,
+	0
+};
+
+static const struct hwmon_channel_info ddmi_temp =3D {
+	.type =3D hwmon_temp,
+	.config =3D ddmi_temp_config,
+};
+
+static const struct hwmon_channel_info *channel_info[] =3D {
+	&ddmi_temp,
+	NULL
+};
+
+static const struct hwmon_ops sfp_hwmon_ops =3D {
+	.is_visible =3D sfp_is_visible,
+	.read =3D sfp_read,
+};
+
+static const struct hwmon_chip_info sfp_chip_info =3D {
+	.ops =3D &sfp_hwmon_ops,
+	.info =3D channel_info,
+};
+
+static int sfp_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct device *hwmon_dev;
+	struct device_node *id_node;
+	struct sfp_data *priv;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WORD_DATA)) {
+		dev_err(dev,
+			"adapter doesn't support SMBus word transactions\n");
+		return -ENODEV;
+	}
+
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, priv);
+
+	priv->ddmi_client =3D client;
+
+	id_node =3D of_parse_phandle(client->dev.of_node, "id", 0);
+	if (id_node) {
+		priv->id_client =3D of_find_i2c_device_by_node(id_node);
+		of_node_put(id_node);
+	}
+
+	if (!priv->id_client) {
+		dev_err(dev, "ID client missing\n");
+		return -ENODEV;
+	}
+
+	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
+			priv, &sfp_chip_info, NULL);
+
+	if (IS_ERR(hwmon_dev)) {
+		dev_err(dev, "unable to register sfp hwmon device\n");
+		return PTR_ERR(hwmon_dev);
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id sfp_id[] =3D {
+	{ "sfp", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sfp_id);
+
+static const struct of_device_id sfp_of_match[] =3D {
+	{ .compatible =3D "sfp,ddmi" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sfp_of_match);
+
+static struct i2c_driver sfp_driver =3D {
+	.driver.name	=3D DRIVER_NAME,
+	.driver.of_match_table =3D of_match_ptr(sfp_of_match),
+	.probe		=3D sfp_probe,
+	.id_table	=3D sfp_id,
+};
+
+module_i2c_driver(sfp_driver);
+
+MODULE_AUTHOR("Gabriel Matni <gabriel.matni@exfo.com>");
+MODULE_DESCRIPTION("SFP/SFP+ hwmon driver");
+MODULE_LICENSE("GPL");
--=20
2.7.4
