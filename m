Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F93C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 17:52:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E0BE61408
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 17:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbhENRxY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 13:53:24 -0400
Received: from mout.gmx.net ([212.227.15.18]:55443 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhENRxX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 13:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621014715;
        bh=j73rGY2JM6eaPDqn+2RixhxMhuwMkbI7bmtLYrViukg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NtwgMOmlu4QH1UWH0YzfNTt1MJTpIWn75z1RtHVhjELb4Hplb8QIVJroTtUPTkZZm
         FNRNSelfL/x43Mf4Xuube7diEQQ9a/8HvzwbEnmVHUDi2XsCFLY/vxk3J7dLigMjmk
         CsrQob5of05Q1936Dvz6DWU7wEW3KxO2OB5pCIFk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.208.18]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N3se2-1lYhze3B7Q-00zrkX; Fri, 14 May 2021 19:51:55 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH RFC] hwmon: (dell-smm-hwmon) Convert to devm_hwmon_device_register_with_info()
Date:   Fri, 14 May 2021 19:51:51 +0200
Message-Id: <20210514175151.3198-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QpdZGj/Hxx9Mq1SCp48073iGwd/gObOFrI+M1mESEW+gAWPRKKQ
 4M8A0hSaRSQLN7nY9WBjc4bvXVg6n7pUfx6TT0hTZh5tupaF9Fsm7CysgEBZVCz/kchQdKz
 bfMGeKMwAp4Yj7sQmjZWLFmd+HxgwBkFU9jNsm7Z8nPiilRQj//Z2nfAHlsAbcCeEjl0IIi
 zVyF8F7QcMVlcqLrXfTVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sGa877a4hU8=:DBJU2QwPxTwdZL2hB+bTjO
 FWYuF55I7ubdNOcFWZtzpDA72R/XBWA5WgkNcg+59WwpzsN9mmgczSU7sXAD6wTaarnEivKm2
 X8ZIo7eJF9jTM4xQ8DI4Kl0Gub9RYSUik0NLYuOqCgIgQUZLCDEK5SLBg/kzzNPilkqhxt+p7
 dfKPGwY8LAeEdG75K/rKVQ6ey1L4Yl2C6KKOPH6XUS4KLClCTd17n6jtj4oNE61VWLeWX1lrQ
 a1APb41Ey2uVfeTuA0TcEqw3AYuGsL7GSSO5pyymbiGuhhi71cf84K5Yua4Bf2riPQG4qGDCH
 MSvfLDtQ3uTkOnQeaNjjruZdx+yO+1kpzIdhhCX5oQWily9xmNcE15SxCfL4tuRFjQ04ld18u
 VyCGBnGC5m6gpXaRlrkxDtGmqGycWJD0d/BXkelv5/r13cgEyF+f1hpOa5jHVDG9chgjrrNxU
 pHZ+dgJUeh9aT5tsfe5ksG3TsICRnfeT1ZzaBPC0cyTST8Uc8+YZDMhqdQMlkU7y/5LxKWOrh
 vOO4Tb3fARi7ko4GS7Eo/Z2pBWBB041lBbnmiK6Fl7wjqqOvSBAb9/FG3qJmtmvHPC8O5e3Ev
 eONHY8m6lka4g5PbPzaDsr6U2Xyw6/TaCFzvBzyXjA6z5RvoOIlweqPuxF3kkHpyO0YdIf9zo
 dRRdPgZyeKXmSfLF4LWbaOKoxHFlWRXeXjKWAyGaCJJ5CQwmmTfBn80H86tVU9OaboxTlWVVT
 0B3MhsEEXBXgnkeqrpOGUA8NxDZ5Kyu/XfOyCpZadS/VFvmhz/moLzUGrhQTfXJpXA9G8va/o
 MsbmDN9GMhCjO3TrkHW/BPrTOm89RNweYOuNmpvtGGvf44e0rwqjLoR+TWn0AbTBJC4UVCJRr
 UgR1acKoVrnGxBmkHNi/G1h1WDwxsR49f+aP0Uu2DTrweQQOuNbBiFQNMNs7aFONsRqA93knv
 wDe23qZxCk0hVqL/6sx8DTANXHrU0G/D8IibGi5U35/wkvU+Twy1UkSddp4kgMc4iUGgVez8q
 oa8lz9Z5Q3d9dQccrhxgnW8q/or+711E0a99NKhCM9Ty7u558WyC2WNRP7XBiEQ5+xGxwRHw7
 PrNbyIKuKn7I0CLMBcLT30Tbx8vpqUR69+/4OjuCdPTToXdMpnrg7xWmwPuwP4DlvEGpAKzeG
 vmhByQvKlvvwQ9VvcxShZV8hJ03Y3V5D6pWc8/QSr1gnSOOdhfXzMVYJHZsV4GJSkRr3s=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Convert driver to devm_device_register_with_info() to drop the
error-prone magic numbers asociated with sysfs file handling.
Also register a platform device since
devm_hwmon_device_register_with_info() requieres a device struct.

Tested on a Dell Latitude C600.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
1. Is the patch to big?
2. Without the ability to read the fan speed, pwmconfig ignores
the pwm files. Should i use fanX_fault in such cases?
3. pwm1_enable likely affects all fan channels, should i create
a pwmX_enable file for every channel?
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 594 ++++++++++++++++-----------------
 1 file changed, 292 insertions(+), 302 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f2221ca0aa7b..c94acef582a8 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,9 +12,12 @@

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <linux/bitmap.h>
 #include <linux/cpu.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/proc_fs.h>
@@ -23,7 +26,6 @@
 #include <linux/capability.h>
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/sched.h>
@@ -58,11 +60,13 @@
 #define I8K_POWER_AC		0x05
 #define I8K_POWER_BATTERY	0x01

+#define DELL_SMM_NO_TEMP	10
+#define DELL_SMM_NO_FANS	3
+
 static DEFINE_MUTEX(i8k_mutex);
+static DECLARE_BITMAP(i8k_hwmon_flags, DELL_SMM_NO_TEMP);
 static char bios_version[4];
 static char bios_machineid[16];
-static struct device *i8k_hwmon_dev;
-static u32 i8k_hwmon_flags;
 static uint i8k_fan_mult =3D I8K_FAN_MULT;
 static uint i8k_pwm_mult;
 static uint i8k_fan_max =3D I8K_FAN_HIGH;
@@ -70,20 +74,7 @@ static bool disallow_fan_type_call;
 static bool disallow_fan_support;
 static unsigned int manual_fan;
 static unsigned int auto_fan;
-
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
+static long auto_fan_enable =3D 2;

 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
 MODULE_AUTHOR("Pali Roh=C3=A1r <pali@kernel.org>");
@@ -630,11 +621,131 @@ static inline void __exit i8k_exit_procfs(void)
  * Hwmon interface
  */

-static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
-					 struct device_attribute *devattr,
-					 char *buf)
+static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor=
_types type, u32 attr,
+				   int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			if (test_bit(channel, i8k_hwmon_flags))
+				return 0444;
+
+			break;
+
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		if (disallow_fan_support)
+			break;
+
+		switch (attr) {
+		case hwmon_fan_label:
+			if (i8k_get_fan_type(channel) >=3D 0)
+				return 0444;
+
+			break;
+		case hwmon_fan_input:
+			if (i8k_get_fan_speed(channel) >=3D 0)
+				return 0444;
+
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (disallow_fan_support)
+			break;
+
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (i8k_get_fan_status(channel) >=3D 0)
+				return 0644;
+
+			break;
+		case hwmon_pwm_enable:
+			if (auto_fan)
+				return 0644;
+
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
+}
+
+static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type=
, u32 attr, int channel,
+			 long *val)
 {
-	static const char * const labels[] =3D {
+	int temp;
+	int fan;
+	int pwm;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			temp =3D i8k_get_temp(channel);
+			if (temp < 0)
+				return temp;
+
+			*val =3D temp * 1000;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			fan =3D i8k_get_fan_speed(channel);
+			if (fan < 0)
+				return fan;
+
+			*val =3D fan;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			pwm =3D i8k_get_fan_status(channel);
+			if (pwm < 0)
+				return pwm;
+
+			*val =3D clamp_val(pwm * i8k_pwm_mult, 0, 255);
+			return 0;
+		case hwmon_pwm_enable:
+			if (!auto_fan)
+				break;
+
+			*val =3D auto_fan_enable;
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
+}
+
+static const char *dell_smm_temp_label(int channel)
+{
+	static const char * const temp_labels[] =3D {
 		"CPU",
 		"GPU",
 		"SODIMM",
@@ -642,35 +753,21 @@ static ssize_t i8k_hwmon_temp_label_show(struct devi=
ce *dev,
 		"Ambient",
 		"Other",
 	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
 	int type;

-	type =3D i8k_get_temp_type(index);
+	type =3D i8k_get_temp_type(channel);
 	if (type < 0)
-		return type;
-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D ARRAY_SIZE(labels) - 1;
-	return sprintf(buf, "%s\n", labels[type]);
-}
+		return ERR_PTR(type);

-static ssize_t i8k_hwmon_temp_show(struct device *dev,
-				   struct device_attribute *devattr,
-				   char *buf)
-{
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int temp;
+	if (type >=3D ARRAY_SIZE(temp_labels))
+		type =3D ARRAY_SIZE(temp_labels) - 1;

-	temp =3D i8k_get_temp(index);
-	if (temp < 0)
-		return temp;
-	return sprintf(buf, "%d\n", temp * 1000);
+	return temp_labels[type];
 }

-static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
-					struct device_attribute *devattr,
-					char *buf)
+static const char *dell_smm_fan_label(int channel)
 {
-	static const char * const labels[] =3D {
+	static const char * const fan_labels[] =3D {
 		"Processor Fan",
 		"Motherboard Fan",
 		"Video Fan",
@@ -678,293 +775,171 @@ static ssize_t i8k_hwmon_fan_label_show(struct dev=
ice *dev,
 		"Chipset Fan",
 		"Other Fan",
 	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
+	static const char * const docking_labels[] =3D {
+		"Docking Processor Fan",
+		"Docking Motherboard Fan",
+		"Docking Video Fan",
+		"Docking Power Supply Fan",
+		"Docking Chipset Fan",
+		"Docking Other Fan",
+	};
 	bool dock =3D false;
 	int type;

-	type =3D i8k_get_fan_type(index);
+	type =3D i8k_get_fan_type(channel);
 	if (type < 0)
-		return type;
+		return ERR_PTR(type);

 	if (type & 0x10) {
 		dock =3D true;
 		type &=3D 0x0F;
 	}

-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D (ARRAY_SIZE(labels) - 1);
+	if (type >=3D ARRAY_SIZE(fan_labels))
+		type =3D ARRAY_SIZE(fan_labels) - 1;

-	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
+	return dock ? docking_labels[type] : fan_labels[type];
 }

-static ssize_t i8k_hwmon_fan_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
+static int dell_smm_read_string(struct device *dev, enum hwmon_sensor_typ=
es type, u32 attr,
+				int channel, const char **str)
 {
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int fan_speed;
-
-	fan_speed =3D i8k_get_fan_speed(index);
-	if (fan_speed < 0)
-		return fan_speed;
-	return sprintf(buf, "%d\n", fan_speed);
-}
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str =3D dell_smm_temp_label(channel);
+			return PTR_ERR_OR_ZERO(*str);
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		if (disallow_fan_type_call)
+			break;

-static ssize_t i8k_hwmon_pwm_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
-{
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int status;
+		switch (attr) {
+		case hwmon_fan_label:
+			*str =3D dell_smm_fan_label(channel);
+			return PTR_ERR_OR_ZERO(*str);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	status =3D i8k_get_fan_status(index);
-	if (status < 0)
-		return -EIO;
-	return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, 255));
+	return -EOPNOTSUPP;
 }

-static ssize_t i8k_hwmon_pwm_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static int dell_smm_write(struct device *dev, enum hwmon_sensor_types typ=
e, u32 attr, int channel,
+			  long val)
 {
-	int index =3D to_sensor_dev_attr(attr)->index;
-	unsigned long val;
+	unsigned long pwm;
+	bool enable;
 	int err;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-	val =3D clamp_val(DIV_ROUND_CLOSEST(val, i8k_pwm_mult), 0, i8k_fan_max);
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			pwm =3D clamp_val(DIV_ROUND_CLOSEST(val, i8k_pwm_mult), 0, i8k_fan_max=
);

-	mutex_lock(&i8k_mutex);
-	err =3D i8k_set_fan(index, val);
-	mutex_unlock(&i8k_mutex);
+			mutex_lock(&i8k_mutex);
+			err =3D i8k_set_fan(channel, pwm);
+			mutex_unlock(&i8k_mutex);

-	return err < 0 ? -EIO : count;
-}
+			if (err < 0)
+				return err;

-static ssize_t i8k_hwmon_pwm_enable_store(struct device *dev,
-					  struct device_attribute *attr,
-					  const char *buf, size_t count)
-{
-	int err;
-	bool enable;
-	unsigned long val;
+			return 0;
+		case hwmon_pwm_enable:
+			if (!val)
+				break;

-	if (!auto_fan)
-		return -ENODEV;
+			if (val =3D=3D 1)
+				enable =3D false;
+			else
+				enable =3D true;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
+			mutex_lock(&i8k_mutex);
+			err =3D i8k_enable_fan_auto_mode(enable);
+			mutex_unlock(&i8k_mutex);

-	if (val =3D=3D 1)
-		enable =3D false;
-	else if (val =3D=3D 2)
-		enable =3D true;
-	else
-		return -EINVAL;
+			if (err < 0)
+				return err;

-	mutex_lock(&i8k_mutex);
-	err =3D i8k_enable_fan_auto_mode(enable);
-	mutex_unlock(&i8k_mutex);
+			auto_fan_enable =3D val;

-	return err ? err : count;
+			return 0;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
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
-	NULL
+static const struct hwmon_ops dell_smm_ops =3D {
+	.is_visible =3D dell_smm_is_visible,
+	.read =3D dell_smm_read,
+	.read_string =3D dell_smm_read_string,
+	.write =3D dell_smm_write,
 };

-static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *att=
r,
-			      int index)
-{
-	if (disallow_fan_support && index >=3D 20)
-		return 0;
-	if (disallow_fan_type_call &&
-	    (index =3D=3D 21 || index =3D=3D 25 || index =3D=3D 28))
-		return 0;
-	if (index >=3D 0 && index <=3D 1 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
-		return 0;
-	if (index >=3D 2 && index <=3D 3 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
-		return 0;
-	if (index >=3D 4 && index <=3D 5 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
-		return 0;
-	if (index >=3D 6 && index <=3D 7 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
-		return 0;
-	if (index >=3D 8 && index <=3D 9 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
-		return 0;
-	if (index >=3D 10 && index <=3D 11 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
-		return 0;
-	if (index >=3D 12 && index <=3D 13 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
-		return 0;
-	if (index >=3D 14 && index <=3D 15 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
-		return 0;
-	if (index >=3D 16 && index <=3D 17 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
-		return 0;
-	if (index >=3D 18 && index <=3D 19 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
-		return 0;
-
-	if (index >=3D 20 && index <=3D 23 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
-		return 0;
-	if (index >=3D 24 && index <=3D 26 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
-		return 0;
-	if (index >=3D 27 && index <=3D 29 &&
-	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
-		return 0;
-
-	if (index =3D=3D 23 && !auto_fan)
-		return 0;
-
-	return attr->mode;
-}
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
+	NULL
+};

-static const struct attribute_group i8k_group =3D {
-	.attrs =3D i8k_attrs,
-	.is_visible =3D i8k_is_visible,
+static const struct hwmon_chip_info dell_smm_chip_info =3D {
+	.ops =3D &dell_smm_ops,
+	.info =3D dell_smm_info,
 };
-__ATTRIBUTE_GROUPS(i8k);

-static int __init i8k_init_hwmon(void)
+static int __init dell_smm_init_hwmon(struct device *dev)
 {
+	struct device *dell_smm_hwmon_dev;
 	int err;
+	int i;
+
+	bitmap_zero(i8k_hwmon_flags, DELL_SMM_NO_TEMP);

-	i8k_hwmon_flags =3D 0;
-
-	/* CPU temperature attributes, if temperature type is OK */
-	err =3D i8k_get_temp_type(0);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP1;
-	/* check for additional temperature sensors */
-	err =3D i8k_get_temp_type(1);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP2;
-	err =3D i8k_get_temp_type(2);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP3;
-	err =3D i8k_get_temp_type(3);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
-	err =3D i8k_get_temp_type(4);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
-	err =3D i8k_get_temp_type(5);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
-	err =3D i8k_get_temp_type(6);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
-	err =3D i8k_get_temp_type(7);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
-	err =3D i8k_get_temp_type(8);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
-	err =3D i8k_get_temp_type(9);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;
-
-	/* First fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(0);
-	if (err < 0)
-		err =3D i8k_get_fan_type(0);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;
-
-	/* Second fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(1);
-	if (err < 0)
-		err =3D i8k_get_fan_type(1);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
-
-	/* Third fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(2);
-	if (err < 0)
-		err =3D i8k_get_fan_type(2);
-	if (err >=3D 0)
-		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
-
-	i8k_hwmon_dev =3D hwmon_device_register_with_groups(NULL, "dell_smm",
-							  NULL, i8k_groups);
-	if (IS_ERR(i8k_hwmon_dev)) {
-		err =3D PTR_ERR(i8k_hwmon_dev);
-		i8k_hwmon_dev =3D NULL;
-		pr_err("hwmon registration failed (%d)\n", err);
-		return err;
+	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++) {
+		err =3D  i8k_get_temp_type(i);
+		if (err >=3D 0)
+			__set_bit(i, i8k_hwmon_flags);
 	}
-	return 0;
+
+	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", NULL,
+								  &dell_smm_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dell_smm_hwmon_dev);
 }

 struct i8k_config_data {
@@ -1224,7 +1199,7 @@ static struct dmi_system_id i8k_whitelist_fan_contro=
l[] __initdata =3D {
 /*
  * Probe for the presence of a supported laptop.
  */
-static int __init i8k_probe(void)
+static int __init dell_smm_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *id, *fan_control;
 	int fan, ret;
@@ -1313,29 +1288,44 @@ static int __init i8k_probe(void)
 		i8k_fan_mult =3D fan_mult;
 	}

+	ret =3D dell_smm_init_hwmon(&pdev->dev);
+	if (ret)
+		return ret;
+
+	i8k_init_procfs();
+
 	return 0;
 }

-static int __init i8k_init(void)
+static int dell_smm_remove(struct platform_device *pdev)
 {
-	int err;
+	i8k_exit_procfs();

-	/* Are we running on an supported laptop? */
-	if (i8k_probe())
-		return -ENODEV;
+	return 0;
+}
+
+static struct platform_driver dell_smm_driver =3D {
+	.driver		=3D {
+		.name	=3D KBUILD_MODNAME,
+	},
+	.remove		=3D dell_smm_remove,
+};

-	err =3D i8k_init_hwmon();
-	if (err)
-		return err;
+static struct platform_device *dell_smm_device;

-	i8k_init_procfs();
-	return 0;
+static int __init i8k_init(void)
+{
+	/* Are we running on an supported laptop? */
+	dell_smm_device =3D platform_create_bundle(&dell_smm_driver, dell_smm_pr=
obe, NULL, 0, NULL,
+						 0);
+
+	return PTR_ERR_OR_ZERO(dell_smm_device);
 }

 static void __exit i8k_exit(void)
 {
-	hwmon_device_unregister(i8k_hwmon_dev);
-	i8k_exit_procfs();
+	platform_device_unregister(dell_smm_device);
+	platform_driver_unregister(&dell_smm_driver);
 }

 module_init(i8k_init);
=2D-
2.20.1

