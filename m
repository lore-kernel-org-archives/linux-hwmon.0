Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80D4C4708E
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B930E611AE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhE2GlP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:35557 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhE2GlO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270361;
        bh=X2ToPIOtXkaczI5qf4Az1Ed8xVs+no/fhaGjLWiSDHA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=B/8qcA2rq9B5IKuY1jxdAYYEEuCPl4KMNUAMAALRI1JHnmBo5ZchtseePo5nt0afh
         K+1Ij4yDGzKy6KBwnvOsQ0Oi0QCPNazewJESH/N8kFEFlsIhNFRGOz7lREQS+IZDl7
         6AiNq6yW2ZvI4/Jrx67LC9HPLyHU6v+cFo0vTW8A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1l8Icg0ijP-00mJJq; Sat, 29
 May 2021 08:39:21 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 5/6] hwmon: (dell-smm-hwmon) Convert to devm_hwmon_device_register_with_info()
Date:   Sat, 29 May 2021 08:38:56 +0200
Message-Id: <20210529063857.10177-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529063857.10177-1-W_Armin@gmx.de>
References: <20210529063857.10177-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xdMpk9poznCp+km8TIyVReJd2nN0pYRD9y+4nVr193N56O60bFH
 nTLNQMsgXVhj1bzQlFp8d0fTeCfjZ44mXG4pqOegbZQs45mG4QDZ6W3naIALCvaoH/ZeSuv
 N38YsZmQPBpAoWaUMFOpSGqfJ4WxYcfVprlUSicXH3bM6zIPRfO//keq7s8CqTqeJlx2AfU
 Vgesqfkoy6Y7fEKm+3KEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mpdjqo6hS70=:NnhYS/SkMRk/raPkfP6+Yc
 /BU6/zTsvtUvpEt+NvuD7B3EyTjJwADNkZcR1vHQoNq2/PHALSUyAXug/QhqKDckslTr37BQH
 /gVO02vDDrJv2Zm9bzYYQr39oNZKpiq7RItef2JF3FRZZ+sZVLMjH3n6BkN2PEBAHhbZuXQGS
 4R8HY/bYw6KH2mJEFc5D2wOZow+toVwCOki0EAEHjsWfnxpmHiORKRMxuIC9uZgYoW1yElAmI
 NPLRyzr7vmnSQXx8La1wyUy3VKXOKa7iTQj6NUOzCdGEAJN/kwz6JiFGKKwAJ5XNzmFswDr0S
 fdJnsV7W2VM4yuOeWJvmcqWTbD5yqz12hsMY+xrF9UYvmhjuYVxQxuUiexm5+R6eypjDUZ8hd
 xeD1TrMSvj+1r2d0SKivMpRxx0PnIioAdfuovg/ygnBnf7+JBn9DzvU9XmQjG7lprK4cesa9J
 aKiOTj+nBgcNthowJRvxBK8yqWYwDFz2fmhwyDsTrJQuaOifeqRRdCwJ/+w7PdR9UFwL/JwI4
 pGKT3KRqufuf+pqPaiVY+EvnffL2c6E4WSfF12Gg8a+EbCe2wojRxUfUgLt2KQWlhCPB9WMrB
 Ta1rnmRvsf8UxykHK07lnbqvK0jcgx6rEvbneHunGxrCaLLwIn11MEa/y+47706Bd8mXRrtOj
 aJBTREWL2UtD/aYUi95EW0S52r6lYPWAP0HnPlo7h8nZAbclF9z+ZFd3ddd83M7J2a1OlV/77
 r0EJTjtwoWKgEfI0eoRfZZyGLTka7SXAk53kGZMiUnzsFuB+d12twu/MXxSAv31/XJn2QgIrp
 i4cwxBuviTAh0rhQTzHZZuLKyCweeMhUcEcNhp+M7N7366q2MSMki5RCyqETIyAWfynm8vj0I
 RIRpYYQkqGYIJaYD41CLXt93sr7f3WWazviCiwh6IMxBYgsp9rg1Vi3eD+81pDkuZmSFs4R9g
 v48ac0y3SnzGHGow+EQ4tY5dDu2UkZNnamtvPLEuWb14keUHKIyCf1KcSOwPWlGSNp+4ozb9g
 J3FtH957N3Sdy5IRwEnSmGcwf0vhccISBgoWzJpgnZl7QwJ76nE45IdCjziHCvOL2Fz0l18Ac
 mlSVoVHg3iQd74+RVQeK2fvzrWb27Xn+VJADjEoIj+rnlndW5MJfWk9o3y7AdU8IuYvUW1map
 I0vSdlmCRJxnVst85tUigOsNbLDhnU0jS3OrPXqh6plIcEQJBjUdaNYXe5O0t7Dl6eXuo=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Convert to new registration API to get rid of attribute magic
numbers and reduce module size.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 592 +++++++++++++++------------------
 1 file changed, 273 insertions(+), 319 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 420fdd2de2fb..0ef3dad74a2c 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -25,7 +25,6 @@
 #include <linux/capability.h>
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/sched.h>
@@ -60,11 +59,13 @@
 #define I8K_POWER_AC		0x05
 #define I8K_POWER_BATTERY	0x01

+#define DELL_SMM_NO_TEMP	10
+#define DELL_SMM_NO_FANS	3
+
 struct dell_smm_data {
 	struct mutex i8k_mutex; /* lock for sensors writes */
 	char bios_version[4];
 	char bios_machineid[16];
-	u32 i8k_hwmon_flags;
 	uint i8k_fan_mult;
 	uint i8k_pwm_mult;
 	uint i8k_fan_max;
@@ -72,23 +73,10 @@ struct dell_smm_data {
 	bool disallow_fan_support;
 	unsigned int manual_fan;
 	unsigned int auto_fan;
-	int types[3];
+	const char *temp_label[DELL_SMM_NO_TEMP];
+	const char *fan_label[DELL_SMM_NO_FANS];
 };

-#define I8K_HWMON_HAVE_TEMP1	(1 << 0)
-#define I8K_HWMON_HAVE_TEMP2	(1 << 1)
-#define I8K_HWMON_HAVE_TEMP3	(1 << 2)
-#define I8K_HWMON_HAVE_TEMP4	(1 << 3)
-#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
-#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
-#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
-#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
-#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
-#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
-#define I8K_HWMON_HAVE_FAN1	(1 << 10)
-#define I8K_HWMON_HAVE_FAN2	(1 << 11)
-#define I8K_HWMON_HAVE_FAN3	(1 << 12)
-
 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
 MODULE_AUTHOR("Pali Roh=C3=A1r <pali@kernel.org>");
 MODULE_DESCRIPTION("Dell laptop SMM BIOS hwmon driver");
@@ -130,6 +118,33 @@ struct smm_regs {
 	unsigned int edi __packed;
 };

+static const char * const temp_labels[] =3D {
+	"CPU",
+	"GPU",
+	"SODIMM",
+	"Other",
+	"Ambient",
+	"Other",
+};
+
+static const char * const fan_labels[] =3D {
+	"Processor Fan",
+	"Motherboard Fan",
+	"Video Fan",
+	"Power Supply Fan",
+	"Chipset Fan",
+	"Other Fan",
+};
+
+static const char * const docking_labels[] =3D {
+	"Docking Processor Fan",
+	"Docking Motherboard Fan",
+	"Docking Video Fan",
+	"Docking Power Supply Fan",
+	"Docking Chipset Fan",
+	"Docking Other Fan",
+};
+
 static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data =3D dmi_get_system_info(field);
@@ -270,7 +285,7 @@ static int i8k_get_fan_speed(const struct dell_smm_dat=
a *data, int fan)
 /*
  * Read the fan type.
  */
-static int _i8k_get_fan_type(struct dell_smm_data *data, int fan)
+static int __init i8k_get_fan_type(const struct dell_smm_data *data, int =
fan)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_FAN_TYPE, };

@@ -281,15 +296,6 @@ static int _i8k_get_fan_type(struct dell_smm_data *da=
ta, int fan)
 	return i8k_smm(&regs) ? : regs.eax & 0xff;
 }

-static int i8k_get_fan_type(struct dell_smm_data *data, int fan)
-{
-	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
-	if (data->types[fan] =3D=3D INT_MIN)
-		data->types[fan] =3D _i8k_get_fan_type(data, fan);
-
-	return data->types[fan];
-}
-
 /*
  * Read the fan nominal rpm for specific fan speed.
  */
@@ -334,7 +340,7 @@ static int i8k_set_fan(const struct dell_smm_data *dat=
a, int fan, int speed)
 	return i8k_smm(&regs) ? : i8k_get_fan_status(data, fan);
 }

-static int i8k_get_temp_type(int sensor)
+static int __init i8k_get_temp_type(int sensor)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_TEMP_TYPE, };

@@ -634,343 +640,294 @@ static void __init i8k_init_procfs(struct device *=
dev)
  * Hwmon interface
  */

-static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
-					 struct device_attribute *devattr,
-					 char *buf)
+static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor=
_types type, u32 attr,
+				   int channel)
 {
-	static const char * const labels[] =3D {
-		"CPU",
-		"GPU",
-		"SODIMM",
-		"Other",
-		"Ambient",
-		"Other",
-	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int type;
+	const struct dell_smm_data *data =3D drvdata;

-	type =3D i8k_get_temp_type(index);
-	if (type < 0)
-		return type;
-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D ARRAY_SIZE(labels) - 1;
-	return sprintf(buf, "%s\n", labels[type]);
-}
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			if (!IS_ERR(data->temp_label[channel]))
+				return 0444;

-static ssize_t i8k_hwmon_temp_show(struct device *dev,
-				   struct device_attribute *devattr,
-				   char *buf)
-{
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int temp;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		if (data->disallow_fan_support)
+			break;

-	temp =3D i8k_get_temp(index);
-	if (temp < 0)
-		return temp;
-	return sprintf(buf, "%d\n", temp * 1000);
-}
+		switch (attr) {
+		case hwmon_fan_input:
+			if (i8k_get_fan_speed(data, channel) >=3D 0)
+				return 0444;

-static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
-					struct device_attribute *devattr,
-					char *buf)
-{
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	static const char * const labels[] =3D {
-		"Processor Fan",
-		"Motherboard Fan",
-		"Video Fan",
-		"Power Supply Fan",
-		"Chipset Fan",
-		"Other Fan",
-	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	bool dock =3D false;
-	int type;
+			break;
+		case hwmon_fan_label:
+			if (!IS_ERR(data->fan_label[channel]))
+				return 0444;

-	type =3D i8k_get_fan_type(data, index);
-	if (type < 0)
-		return type;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (data->disallow_fan_support)
+			break;

-	if (type & 0x10) {
-		dock =3D true;
-		type &=3D 0x0F;
-	}
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (i8k_get_fan_status(data, channel) >=3D 0)
+				return 0644;

-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D (ARRAY_SIZE(labels) - 1);
+			break;
+		case hwmon_pwm_enable:
+			if (data->auto_fan)
+				return 0644;

-	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
 }

-static ssize_t i8k_hwmon_fan_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
+static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type=
, u32 attr, int channel,
+			 long *val)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int fan_speed;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			ret =3D i8k_get_temp(channel);
+			if (ret < 0)
+				return ret;
+
+			*val =3D ret * 1000;
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret =3D i8k_get_fan_speed(data, channel);
+			if (ret < 0)
+				return ret;
+
+			*val =3D ret;
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret =3D i8k_get_fan_status(data, channel);
+			if (ret < 0)
+				return ret;
+
+			*val =3D clamp_val(ret * data->i8k_pwm_mult, 0, 255);
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	fan_speed =3D i8k_get_fan_speed(data, index);
-	if (fan_speed < 0)
-		return fan_speed;
-	return sprintf(buf, "%d\n", fan_speed);
+	return -EOPNOTSUPP;
 }

-static ssize_t i8k_hwmon_pwm_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
+static int dell_smm_read_string(struct device *dev, enum hwmon_sensor_typ=
es type, u32 attr,
+				int channel, const char **str)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int status;

-	status =3D i8k_get_fan_status(data, index);
-	if (status < 0)
-		return -EIO;
-	return sprintf(buf, "%d\n", clamp_val(status * data->i8k_pwm_mult, 0, 25=
5));
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str =3D data->temp_label[channel];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_label:
+			*str =3D data->fan_label[channel];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
 }

-static ssize_t i8k_hwmon_pwm_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static int dell_smm_write(struct device *dev, enum hwmon_sensor_types typ=
e, u32 attr, int channel,
+			  long val)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(attr)->index;
-	unsigned long val;
+	unsigned long pwm;
+	bool enable;
 	int err;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-	val =3D clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0, data->i=
8k_fan_max);
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			pwm =3D clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0,
+					data->i8k_fan_max);

-	mutex_lock(&data->i8k_mutex);
-	err =3D i8k_set_fan(data, index, val);
-	mutex_unlock(&data->i8k_mutex);
+			mutex_lock(&data->i8k_mutex);
+			err =3D i8k_set_fan(data, channel, pwm);
+			mutex_unlock(&data->i8k_mutex);

-	return err < 0 ? -EIO : count;
-}
+			if (err < 0)
+				return err;

-static ssize_t i8k_hwmon_pwm_enable_store(struct device *dev,
-					  struct device_attribute *attr,
-					  const char *buf, size_t count)
-{
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int err;
-	bool enable;
-	unsigned long val;
+			return 0;
+		case hwmon_pwm_enable:
+			if (!val)
+				return -EINVAL;

-	if (!data->auto_fan)
-		return -ENODEV;
+			if (val =3D=3D 1)
+				enable =3D false;
+			else
+				enable =3D true;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
+			mutex_lock(&data->i8k_mutex);
+			err =3D i8k_enable_fan_auto_mode(data, enable);
+			mutex_unlock(&data->i8k_mutex);

-	if (val =3D=3D 1)
-		enable =3D false;
-	else if (val =3D=3D 2)
-		enable =3D true;
-	else
-		return -EINVAL;
+			if (err < 0)
+				return err;

-	mutex_lock(&data->i8k_mutex);
-	err =3D i8k_enable_fan_auto_mode(data, enable);
-	mutex_unlock(&data->i8k_mutex);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	return err ? err : count;
+	return -EOPNOTSUPP;
 }

-static SENSOR_DEVICE_ATTR_RO(temp1_input, i8k_hwmon_temp, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_label, i8k_hwmon_temp_label, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, i8k_hwmon_temp, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_label, i8k_hwmon_temp_label, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
-static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_input, i8k_hwmon_temp, 4);
-static SENSOR_DEVICE_ATTR_RO(temp5_label, i8k_hwmon_temp_label, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_input, i8k_hwmon_temp, 5);
-static SENSOR_DEVICE_ATTR_RO(temp6_label, i8k_hwmon_temp_label, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_input, i8k_hwmon_temp, 6);
-static SENSOR_DEVICE_ATTR_RO(temp7_label, i8k_hwmon_temp_label, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_input, i8k_hwmon_temp, 7);
-static SENSOR_DEVICE_ATTR_RO(temp8_label, i8k_hwmon_temp_label, 7);
-static SENSOR_DEVICE_ATTR_RO(temp9_input, i8k_hwmon_temp, 8);
-static SENSOR_DEVICE_ATTR_RO(temp9_label, i8k_hwmon_temp_label, 8);
-static SENSOR_DEVICE_ATTR_RO(temp10_input, i8k_hwmon_temp, 9);
-static SENSOR_DEVICE_ATTR_RO(temp10_label, i8k_hwmon_temp_label, 9);
-static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
-static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
-static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
-static SENSOR_DEVICE_ATTR_WO(pwm1_enable, i8k_hwmon_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, i8k_hwmon_fan, 1);
-static SENSOR_DEVICE_ATTR_RO(fan2_label, i8k_hwmon_fan_label, 1);
-static SENSOR_DEVICE_ATTR_RW(pwm2, i8k_hwmon_pwm, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_input, i8k_hwmon_fan, 2);
-static SENSOR_DEVICE_ATTR_RO(fan3_label, i8k_hwmon_fan_label, 2);
-static SENSOR_DEVICE_ATTR_RW(pwm3, i8k_hwmon_pwm, 2);
-
-static struct attribute *i8k_attrs[] =3D {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
-	&sensor_dev_attr_temp1_label.dev_attr.attr,	/* 1 */
-	&sensor_dev_attr_temp2_input.dev_attr.attr,	/* 2 */
-	&sensor_dev_attr_temp2_label.dev_attr.attr,	/* 3 */
-	&sensor_dev_attr_temp3_input.dev_attr.attr,	/* 4 */
-	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
-	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
-	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
-	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
-	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
-	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
-	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
-	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
-	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
-	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
-	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
-	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
-	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
-	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
-	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
-	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
-	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
-	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,	/* 23 */
-	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 24 */
-	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 25 */
-	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 26 */
-	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 27 */
-	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 28 */
-	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 29 */
+static const struct hwmon_ops dell_smm_ops =3D {
+	.is_visible =3D dell_smm_is_visible,
+	.read =3D dell_smm_read,
+	.read_string =3D dell_smm_read_string,
+	.write =3D dell_smm_write,
+};
+
+static const struct hwmon_channel_info *dell_smm_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT
+			   ),
 	NULL
 };

-static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *att=
r,
-			      int index)
-{
-	struct device *dev =3D kobj_to_dev(kobj);
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+static const struct hwmon_chip_info dell_smm_chip_info =3D {
+	.ops =3D &dell_smm_ops,
+	.info =3D dell_smm_info,
+};

-	if (data->disallow_fan_support && index >=3D 20)
-		return 0;
-	if (data->disallow_fan_type_call &&
-	    (index =3D=3D 21 || index =3D=3D 25 || index =3D=3D 28))
-		return 0;
-	if (index >=3D 0 && index <=3D 1 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
-		return 0;
-	if (index >=3D 2 && index <=3D 3 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
-		return 0;
-	if (index >=3D 4 && index <=3D 5 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
-		return 0;
-	if (index >=3D 6 && index <=3D 7 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
-		return 0;
-	if (index >=3D 8 && index <=3D 9 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
-		return 0;
-	if (index >=3D 10 && index <=3D 11 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
-		return 0;
-	if (index >=3D 12 && index <=3D 13 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
-		return 0;
-	if (index >=3D 14 && index <=3D 15 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
-		return 0;
-	if (index >=3D 16 && index <=3D 17 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
-		return 0;
-	if (index >=3D 18 && index <=3D 19 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
-		return 0;
+static const char __init *dell_smm_temp_label(int channel)
+{
+	int type =3D i8k_get_temp_type(channel);

-	if (index >=3D 20 && index <=3D 23 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
-		return 0;
-	if (index >=3D 24 && index <=3D 26 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
-		return 0;
-	if (index >=3D 27 && index <=3D 29 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
-		return 0;
+	if (type < 0)
+		return ERR_PTR(type);

-	if (index =3D=3D 23 && !data->auto_fan)
-		return 0;
+	if (type >=3D ARRAY_SIZE(temp_labels))
+		type =3D ARRAY_SIZE(temp_labels) - 1;

-	return attr->mode;
+	return temp_labels[type];
 }

-static const struct attribute_group i8k_group =3D {
-	.attrs =3D i8k_attrs,
-	.is_visible =3D i8k_is_visible,
-};
-__ATTRIBUTE_GROUPS(i8k);
+static const char __init *dell_smm_fan_label(struct dell_smm_data *data, =
int channel)
+{
+	bool dock =3D false;
+	int type =3D i8k_get_fan_type(data, channel);
+
+	if (type < 0)
+		return ERR_PTR(type);
+
+	if (type & 0x10) {
+		dock =3D true;
+		type &=3D 0x0F;
+	}
+
+	if (type >=3D ARRAY_SIZE(fan_labels))
+		type =3D ARRAY_SIZE(fan_labels) - 1;
+
+	return dock ? docking_labels[type] : fan_labels[type];
+}

 static int __init dell_smm_init_hwmon(struct device *dev)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	struct device *i8k_hwmon_dev;
-	int err;
+	struct device *dell_smm_hwmon_dev;
+	int i;
+
+	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++)
+		data->temp_label[i] =3D dell_smm_temp_label(i);
+
+	for (i =3D 0; i < DELL_SMM_NO_FANS; i++)
+		data->fan_label[i] =3D dell_smm_fan_label(data, i);
+
+	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", data,
+								  &dell_smm_chip_info, NULL);

-	/* CPU temperature attributes, if temperature type is OK */
-	err =3D i8k_get_temp_type(0);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP1;
-	/* check for additional temperature sensors */
-	err =3D i8k_get_temp_type(1);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP2;
-	err =3D i8k_get_temp_type(2);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP3;
-	err =3D i8k_get_temp_type(3);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
-	err =3D i8k_get_temp_type(4);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
-	err =3D i8k_get_temp_type(5);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
-	err =3D i8k_get_temp_type(6);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
-	err =3D i8k_get_temp_type(7);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
-	err =3D i8k_get_temp_type(8);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
-	err =3D i8k_get_temp_type(9);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;
-
-	/* First fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 0);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 0);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;
-
-	/* Second fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 1);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 1);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
-
-	/* Third fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 2);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 2);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
-
-	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_smm"=
, data, i8k_groups);
-
-	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
+	return PTR_ERR_OR_ZERO(dell_smm_hwmon_dev);
 }

 struct i8k_config_data {
@@ -1240,9 +1197,6 @@ static int __init dell_smm_probe(struct platform_dev=
ice *pdev)
 	mutex_init(&data->i8k_mutex);
 	data->i8k_fan_mult =3D I8K_FAN_MULT;
 	data->i8k_fan_max =3D I8K_FAN_HIGH;
-	data->types[0] =3D INT_MIN;
-	data->types[1] =3D INT_MIN;
-	data->types[2] =3D INT_MIN;
 	platform_set_drvdata(pdev, data);

 	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
=2D-
2.20.1

