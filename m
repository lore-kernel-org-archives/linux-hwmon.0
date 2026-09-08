Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5114550DCB
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875917; cv=none; b=MxBsIlozTd7rgTuqgFbbuuZ5it2PcX0IxOEzxyyqWmFWXSArM3GetnGXTA5eRiUVjyzZK3xN/bg3605m5wvH5z/ZUGVErubqJa6Om2KuJY3Yw4DNJobQwdZZmoTbf3D/wtt+kDvEE7eIhPATsUEqM98g1H/bs6c+d+hnSwgq3lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875917; c=relaxed/simple;
	bh=rUMjfaN93cCs8ZQ+xt7OSpjvbxySdebQJGYvu9ka0dc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVhuad4GtKXTZjvWz7wnhgaLGg/AR8Yv+INEpqudJwXAQgXX9K1ZjmcS75zxynyqXUtiVYL1Ln82oAgX0UZzmTKue+LstG6Xoxx2mxCoBEz2tfodsDNVfSXpfQTu0u3A36fAUtnH2HPz4SS/PFG9D+/S4fjWkyndRZ1oGwNJo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ko+2ETe2; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ko+2ETe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788875900; x=1789135100;
	bh=bOGG4qGx9Q7y8ZOUhfp5SECvVkFyB3LExlhZnR+E3Ow=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ko+2ETe2wACwakk39sq4gKatBxv26eyo/caCdSmjoWrJIZ0f9ER2zMBwja4ZovQPR
	 l/K5ftPRhFhdUP+rBl7DczT+yBKopIS/SbuVqoPvABWaAN7IOccK2XyMGQixkM2tZ3
	 KztkaasH4ApP3JRoP0egv2UZ5sjiHQELgDw2m+qLplUbct8/jOTAYznv0+2O10zrgD
	 Vlima6gNODyyMC6L56f2/5zQMVOiPHXyHzo3IIWZ/jz34JqC10nMkceyg2T9MCRNrO
	 L8F1uprHnMD1y0Dz3ULO4Ga5iI0Kh+EQhU9AyALMvjFeVvsk5/F6H/6JKS1jjoz+uq
	 1Uh2unnTwXQEA==
Date: Tue, 08 Sep 2026 13:58:15 +0000
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim 7x legacy sensors
Message-ID: <20260908135801.81436-2-birk.skyum@pm.me>
In-Reply-To: <20260908135801.81436-1-birk.skyum@pm.me>
References: <20260908135801.81436-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 0e8a5451c4252edfb85901c4f9e51f7b642e19a1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Yoga Slim 7x EC returns an all-zero response to the reference-board
thermal capability command. Probe fails even though its legacy RPM and
thermistor queries work and firmware controls the fan automatically.

Select a read-only path for the Lenovo compatible. Expose its first RPM
channel and thermistor through hwmon, validating the transfer length and
RPM payload count and treating the thermistor's 0xff sentinel as ENODATA.
Do not enable SCI, register manual cooling controls or send standby
commands on this path. Keep the reference-board behavior and strict
capability validation unchanged.

The transactions are documented by the Yoga's FC22 and FC29/TZ39 DSDT
methods and Maya Matuszczyk's EC protocol notes. Anvesh Jain P's pending
fan-profile series also documents the RPM query. This change does not
include its calibration, LUT programming or temperature reporting.

Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df0=
17ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html
Signed-off-by: Birk Skyum <birk.skyum@pm.me>
---
Changes in v2:
- Move the platform-driver documentation to the laptop-driver guide and
  update its index and MAINTAINERS entry, following Guenter's review.
- No driver code changes.

 Documentation/admin-guide/laptops/index.rst   |   1 +
 Documentation/admin-guide/laptops/qcom-ec.rst |  40 +++++
 MAINTAINERS                                   |   1 +
 drivers/platform/arm64/Kconfig                |   4 +-
 drivers/platform/arm64/qcom-hamoa-ec.c        | 153 +++++++++++++++++-
 5 files changed, 194 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/admin-guide/laptops/qcom-ec.rst

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/ad=
min-guide/laptops/index.rst
index c0b911d05..44c9c7c08 100644
--- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -11,6 +11,7 @@ Laptop Drivers
    asus-laptop
    disk-shock-protection
    lg-laptop
+   qcom-ec
    samsung-galaxybook
    sony-laptop
    sonypi
diff --git a/Documentation/admin-guide/laptops/qcom-ec.rst b/Documentation/=
admin-guide/laptops/qcom-ec.rst
new file mode 100644
index 000000000..11f9f2347
--- /dev/null
+++ b/Documentation/admin-guide/laptops/qcom-ec.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver qcom-hamoa-ec
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+Supported systems:
+
+  * Lenovo Yoga Slim 7x (14Q8X9)
+
+    Prefix: 'qcom_ec'
+
+    I2C address: 0x76, instantiated from the device tree. No scanning.
+
+Description
+-----------
+
+The Yoga Slim 7x embedded controller provides a fan speed channel and a
+thermistor through a legacy interface. It does not provide the thermal
+capability response used by the Qualcomm reference-board interface.
+
+On this system the driver only reads sensors. Cooling remains under firmwa=
re
+control, including when the driver is unloaded. The driver does not change
+fan curves, fan profiles, PWM settings, SCI events or EC standby state.
+The exposed RPM channel does not establish the number of physical fans.
+
+The hwmon interface is selected by the ``lenovo,yoga-slim7x-ec`` compatibl=
e.
+It is not exposed on Qualcomm reference boards by this driver.
+
+Sysfs attributes
+----------------
+
+All attributes below are read-only.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+fan1_input      Fan speed in RPM. Zero is valid when the fan is stopped.
+temp1_input     EC thermistor temperature in millidegrees Celsius.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+An unavailable thermistor reading returns ``ENODATA``. A malformed fan
+response or an incomplete bus transfer returns an error, not a zero speed.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07..c3c208602 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22440,6 +22440,7 @@ M:=09Anvesh Jain P <anvesh.p@oss.qualcomm.com>
 M:=09Sibi Sankar <sibi.sankar@oss.qualcomm.com>
 L:=09linux-arm-msm@vger.kernel.org
 S:=09Maintained
+F:=09Documentation/admin-guide/laptops/qcom-ec.rst
 F:=09Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-=
ec.yaml
 F:=09drivers/platform/arm64/qcom-hamoa-ec.c
=20
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfi=
g
index e32e01b2a..4f338c715 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -94,6 +94,7 @@ config EC_QCOM_HAMOA
 =09tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur referenc=
e devices"
 =09depends on ARCH_QCOM || COMPILE_TEST
 =09depends on I2C
+=09depends on HWMON
 =09depends on THERMAL || THERMAL=3Dn
 =09help
 =09  Say M or Y here to enable the Embedded Controller driver for Qualcomm
@@ -101,6 +102,7 @@ config EC_QCOM_HAMOA
 =09  control, temperature sensors, access to EC state changes and supports
 =09  reporting suspend entry/exit to the EC.
=20
-=09  This driver currently supports Hamoa/Purwa/Glymur reference devices.
+=09  This driver supports Hamoa/Purwa/Glymur reference devices and read-on=
ly
+=09  fan speed and temperature monitoring on the Lenovo Yoga Slim 7x.
=20
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm6=
4/qcom-hamoa-ec.c
index 4d2ad042a..3a4ca8a0d 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -16,10 +17,13 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
+#include <linux/unaligned.h>
=20
 #define EC_SCI_EVT_READ_CMD=090x05
 #define EC_FW_VERSION_CMD=090x0e
+#define EC_FAN_RPM_QUERY_CMD=090x22
 #define EC_MODERN_STANDBY_CMD=090x23
+#define EC_THERMISTOR1_CMD=090x29
 #define EC_FAN_DBG_CONTROL_CMD=090x30
 #define EC_SCI_EVT_CONTROL_CMD=090x35
 #define EC_THERMAL_CAP_CMD=090x42
@@ -76,13 +80,126 @@ struct qcom_ec_cooling_dev {
 =09u8 state;
 };
=20
+struct qcom_ec_variant {
+=09bool monitor_only;
+};
+
 struct qcom_ec {
+=09const struct qcom_ec_variant *variant;
 =09struct qcom_ec_cooling_dev *ec_cdev;
 =09struct qcom_ec_thermal_cap thermal_cap;
 =09struct qcom_ec_version version;
 =09struct i2c_client *client;
 };
=20
+/* FC22 in the Slim 7x DSDT: command, fan ID; count, little-endian RPM. */
+static int qcom_ec_read_fan_rpm(struct qcom_ec *ec, long *val)
+{
+=09struct i2c_client *client =3D ec->client;
+=09u8 request[] =3D { EC_FAN_RPM_QUERY_CMD, 1 };
+=09u8 response[3];
+=09struct i2c_msg messages[] =3D {
+=09=09{
+=09=09=09.addr =3D client->addr,
+=09=09=09.len =3D sizeof(request),
+=09=09=09.buf =3D request,
+=09=09}, {
+=09=09=09.addr =3D client->addr,
+=09=09=09.flags =3D I2C_M_RD,
+=09=09=09.len =3D sizeof(response),
+=09=09=09.buf =3D response,
+=09=09},
+=09};
+=09int ret;
+
+=09ret =3D i2c_transfer(client->adapter, messages, ARRAY_SIZE(messages));
+=09if (ret < 0)
+=09=09return ret;
+=09if (ret !=3D ARRAY_SIZE(messages))
+=09=09return -EIO;
+=09if (response[0] !=3D sizeof(response) - 1)
+=09=09return -EPROTO;
+
+=09*val =3D get_unaligned_le16(&response[1]);
+
+=09return 0;
+}
+
+static umode_t qcom_ec_hwmon_is_visible(const void *data, enum hwmon_senso=
r_types type,
+=09=09=09=09=09u32 attr, int channel)
+{
+=09if (channel)
+=09=09return 0;
+=09if ((type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input) ||
+=09    (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input))
+=09=09return 0444;
+
+=09return 0;
+}
+
+static int qcom_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types =
type,
+=09=09=09      u32 attr, int channel, long *val)
+{
+=09struct qcom_ec *ec =3D dev_get_drvdata(dev);
+=09int ret;
+
+=09if (channel)
+=09=09return -EOPNOTSUPP;
+
+=09if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input)
+=09=09return qcom_ec_read_fan_rpm(ec, val);
+
+=09if (type !=3D hwmon_temp || attr !=3D hwmon_temp_input)
+=09=09return -EOPNOTSUPP;
+
+=09/* FC29/TZ39 report degrees Celsius, or 0xff if unavailable. */
+=09ret =3D i2c_smbus_read_byte_data(ec->client, EC_THERMISTOR1_CMD);
+=09if (ret < 0)
+=09=09return ret;
+=09if (ret =3D=3D 0xff)
+=09=09return -ENODATA;
+
+=09*val =3D ret * 1000;
+
+=09return 0;
+}
+
+static const struct hwmon_ops qcom_ec_hwmon_ops =3D {
+=09.is_visible =3D qcom_ec_hwmon_is_visible,
+=09.read =3D qcom_ec_hwmon_read,
+};
+
+static const struct hwmon_channel_info * const qcom_ec_hwmon_info[] =3D {
+=09HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+=09HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+=09NULL,
+};
+
+static const struct hwmon_chip_info qcom_ec_hwmon_chip_info =3D {
+=09.ops =3D &qcom_ec_hwmon_ops,
+=09.info =3D qcom_ec_hwmon_info,
+};
+
+static int qcom_ec_hwmon_probe(struct qcom_ec *ec)
+{
+=09struct device *dev =3D &ec->client->dev;
+=09struct device *hwmon;
+=09long rpm;
+=09int ret;
+
+=09if (!i2c_check_functionality(ec->client->adapter,
+=09=09=09=09     I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA))
+=09=09return -EOPNOTSUPP;
+
+=09ret =3D qcom_ec_read_fan_rpm(ec, &rpm);
+=09if (ret)
+=09=09return dev_err_probe(dev, ret, "Failed to read fan RPM\n");
+
+=09hwmon =3D devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
+=09=09=09=09=09=09     &qcom_ec_hwmon_chip_info, NULL);
+=09return PTR_ERR_OR_ZERO(hwmon);
+}
+
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
 {
 =09int ret;
@@ -331,6 +448,10 @@ static const struct thermal_cooling_device_ops qcom_ec=
_thermal_ops =3D {
 static int qcom_ec_resume(struct device *dev)
 {
 =09struct i2c_client *client =3D to_i2c_client(dev);
+=09struct qcom_ec *ec =3D i2c_get_clientdata(client);
+
+=09if (ec->variant->monitor_only)
+=09=09return 0;
=20
 =09return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
 =09=09=09=09=09 EC_MODERN_STANDBY_EXIT);
@@ -339,6 +460,10 @@ static int qcom_ec_resume(struct device *dev)
 static int qcom_ec_suspend(struct device *dev)
 {
 =09struct i2c_client *client =3D to_i2c_client(dev);
+=09struct qcom_ec *ec =3D i2c_get_clientdata(client);
+
+=09if (ec->variant->monitor_only)
+=09=09return 0;
=20
 =09return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
 =09=09=09=09=09 EC_MODERN_STANDBY_ENTER);
@@ -356,14 +481,24 @@ static int qcom_ec_probe(struct i2c_client *client)
 =09=09return -ENOMEM;
=20
 =09ec->client =3D client;
+=09ec->variant =3D i2c_get_match_data(client);
+=09if (!ec->variant)
+=09=09return -ENODEV;
+=09i2c_set_clientdata(client, ec);
+
+=09/*
+=09 * The Slim 7x does not implement the reference-board capability comman=
d.
+=09 * Its firmware controls cooling autonomously. Only expose its legacy
+=09 * sensors; do not enable SCI, fan debug control or standby notificatio=
ns.
+=09 */
+=09if (ec->variant->monitor_only)
+=09=09return qcom_ec_hwmon_probe(ec);
=20
 =09ret =3D devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
 =09=09=09=09=09IRQF_ONESHOT, "qcom_ec", ec);
 =09if (ret < 0)
 =09=09return ret;
=20
-=09i2c_set_clientdata(client, ec);
-
 =09ret =3D qcom_ec_read_fw_version(dev);
 =09if (ret < 0)
 =09=09return dev_err_probe(dev, ret, "Failed to read EC firmware version\n=
");
@@ -410,6 +545,9 @@ static void qcom_ec_remove(struct i2c_client *client)
 =09struct device *dev =3D &client->dev;
 =09int ret;
=20
+=09if (ec->variant->monitor_only)
+=09=09return;
+
 =09ret =3D qcom_ec_sci_evt_control(dev, false);
 =09if (ret < 0)
 =09=09dev_err(dev, "Failed to disable SCI events: %d\n", ret);
@@ -421,14 +559,21 @@ static void qcom_ec_remove(struct i2c_client *client)
 =09}
 }
=20
+static const struct qcom_ec_variant qcom_ec_reference =3D {};
+
+static const struct qcom_ec_variant qcom_ec_slim7x =3D {
+=09.monitor_only =3D true,
+};
+
 static const struct of_device_id qcom_ec_of_match[] =3D {
-=09{ .compatible =3D "qcom,hamoa-crd-ec" },
+=09{ .compatible =3D "lenovo,yoga-slim7x-ec", .data =3D &qcom_ec_slim7x },
+=09{ .compatible =3D "qcom,hamoa-crd-ec", .data =3D &qcom_ec_reference },
 =09{}
 };
 MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
=20
 static const struct i2c_device_id qcom_ec_i2c_id_table[] =3D {
-=09{ "qcom-hamoa-ec", },
+=09{ "qcom-hamoa-ec", (kernel_ulong_t)&qcom_ec_reference },
 =09{}
 };
 MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
--=20
2.53.0

