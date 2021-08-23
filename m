Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44638C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Aug 2021 17:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9C461073
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Aug 2021 17:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhHWRGr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Aug 2021 13:06:47 -0400
Received: from mout.gmx.net ([212.227.17.20]:59379 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229623AbhHWRGq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Aug 2021 13:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629738349;
        bh=1+m0lmnu0GScjU7Om/tVPOtTeGorLS3AnMqDcbkkGfw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XUo5J6Cb+mUIuacaRohJEbSbstACY6qmX6KOVHsQsfh7NNJXGwDOQS5s0CIsEESuF
         dZZ1g2Z+9HKBhgLklquA5rOMkwunARi4NUclo8W1X/Bd36OaHsdr7Np2Lklu0qYmYn
         AlASj7ekbcYNvDv5PsXlLCfyMlU+v0WICxzFK3ek=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTABT-1mTSZW1YOV-00UemO; Mon, 23 Aug 2021 19:05:49 +0200
From:   W_Armin@gmx.de
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (i5500_temp) Convert to devm_hwmon_device_register_with_info
Date:   Mon, 23 Aug 2021 19:05:43 +0200
Message-Id: <20210823170543.7451-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j2Fihm1xyV/hxLQ2xefQdfJ6448pLjbvDN6p9Fa5rtT9v55doHN
 qH9JKOF3jHypsWvCICeIfXaNrSugLDWQ8ht34MPEvsmQKei/BSkMJbU7I8lP81WdJprh7c9
 3IVUHogFtbs38L7g7b7Vej0ZCi9Jsxeumf9CTHW1S0XvOoiefxjRUgB5xFV11pZXEZ8KfnF
 JVLYEc+Gajuk+VU/2Ezfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yIWx4iHatMU=:mdyvZCpUmaZ8QGKcAPV9OW
 IYlWo4Gh48sW6B2jjBwjCwOjhKDpIcj0Ts5FRP9GaXQcC5kBnXUE718Mpci8ceOQ9cF2Gtwu8
 9OaeD8Urr78VNgIZU+yxQsG3JqtedqJNmf6yNh+Qe+RU+IdbV3asude+KgP0dd0/8Dh89jn1V
 ziD3boq8ul16O0BSeFvp2xBaVCG3zk7/kNSwmw0wqrlGXtyrmbj2uOc+shX8RhHCXnb0F1FGo
 YiJa3u4CnPNDEIvM+HEpwJJJAy/H4KJwBXgHT2SCdUfKHEn+ULkX4Tm8OPIJY/CWaqGQrzHoV
 FWw9YVGfvGEFmTXKTIx1rdoUffd0UVha+GbiOA2M1fJW2hH00NBVCYN9bFVhyYum3vohsgr26
 EjIcz4GaatvhnOlV7+hmvYfWOe0lqhXiXCJbZrEiy02HITEq0r2/nmO/5ylzpnoew8G3bCO7j
 C3iPkV6sqDUeeeaQILmnxoQjnNN4R48khp/kowpTamzRfuJnAXxxOjJFQTpYglZLAYbIVPMK8
 r2y2+S0J9r/p6ODaA56wmL0as7NyhahUnPifY8i1JcosD2A+fZGr8Azw0JEoHeOddwDu1nHOk
 yjJWbXdsIL2yUAUi4x/Y0mUNgFaLyPusCbcx+x6xFEw4y0t7LfVQEX0qu83cnSlysjc7bx7RL
 y5ZVl7igCHThVAhptxqPNN0drKjEW0jqKVF/lq/ZCq4EIGg+0J/NjLvlhjzs3+Q/1w3ciYmyz
 ZxnF7Fuqj1c7aIeo+blLCJNDU8giLMnv+PzHfRHg92Ky3Av4B1Sxp+kR5K25ZJCVRzk8S40S4
 zoQqiCqR9fYhaUvekqrrLFwfNNKv4nITTAdVYUdoyd8cSEd/C7DDdf6AvJ+iGAghiZQYunzFV
 ksaTzjfyVx0nq93YXMhREcwKOwArN22K2X+pf5bwBoV9z9Y6DBT4WNtVt7viKm/6W/HNZjuKv
 158hSOv5UjK3TwX5d8+RWl+J9z7fTq80od3gIjrfxdoickAwdQF0SL4EX2OTR6ehK1Lc3hvm6
 WXqvFDpe29kGXPd+YPU5o4P0XVrf6aP2RHnLtWCzGMDqz93MiEdm9Sc/QvAB/D/u0uhQyk5Oq
 KGDwxA8uB8P6lMF2gyC3T/goi8W4Oy0k2cL/fkvhde6BCw/dSWfpSiB2Q==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_hwmon_device_register_with_info() to simplify code
and use register defines instead of hardcoded values.
Also use the BIT() macro for the alarms.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/i5500_temp.c | 114 ++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
index 360f5aee1394..05f68e9c9477 100644
=2D-- a/drivers/hwmon/i5500_temp.c
+++ b/drivers/hwmon/i5500_temp.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2012, 2014 Jean Delvare <jdelvare@suse.de>
  */

+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -12,7 +13,6 @@
 #include <linux/device.h>
 #include <linux/pci.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>

@@ -29,69 +29,78 @@
 #define REG_CTCTRL	0xF7
 #define REG_TSTIMER	0xF8

-/*
- * Sysfs stuff
- */
-
-/* Sensor resolution : 0.5 degree C */
-static ssize_t temp1_input_show(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static umode_t i5500_is_visible(const void *drvdata, enum hwmon_sensor_ty=
pes type, u32 attr,
+				int channel)
 {
-	struct pci_dev *pdev =3D to_pci_dev(dev->parent);
-	long temp;
-	u16 tsthrhi;
-	s8 tsfsc;
-
-	pci_read_config_word(pdev, REG_TSTHRHI, &tsthrhi);
-	pci_read_config_byte(pdev, REG_TSFSC, &tsfsc);
-	temp =3D ((long)tsthrhi - tsfsc) * 500;
-
-	return sprintf(buf, "%ld\n", temp);
+	return 0444;
 }

-static ssize_t thresh_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
+static int i5500_read(struct device *dev, enum hwmon_sensor_types type, u=
32 attr, int channel,
+		      long *val)
 {
 	struct pci_dev *pdev =3D to_pci_dev(dev->parent);
-	int reg =3D to_sensor_dev_attr(devattr)->index;
-	long temp;
 	u16 tsthr;
+	s8 tsfsc;
+	u8 ctsts;

-	pci_read_config_word(pdev, reg, &tsthr);
-	temp =3D tsthr * 500;
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		/* Sensor resolution : 0.5 degree C */
+		case hwmon_temp_input:
+			pci_read_config_word(pdev, REG_TSTHRHI, &tsthr);
+			pci_read_config_byte(pdev, REG_TSFSC, &tsfsc);
+			*val =3D (tsthr - tsfsc) * 500;
+			return 0;
+		case hwmon_temp_max:
+			pci_read_config_word(pdev, REG_TSTHRHI, &tsthr);
+			*val =3D tsthr * 500;
+			return 0;
+		case hwmon_temp_max_hyst:
+			pci_read_config_word(pdev, REG_TSTHRLO, &tsthr);
+			*val =3D tsthr * 500;
+			return 0;
+		case hwmon_temp_crit:
+			pci_read_config_word(pdev, REG_TSTHRCATA, &tsthr);
+			*val =3D tsthr * 500;
+			return 0;
+		case hwmon_temp_max_alarm:
+			pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
+			*val =3D !!(ctsts & BIT(1));
+			return 0;
+		case hwmon_temp_crit_alarm:
+			pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
+			*val =3D !!(ctsts & BIT(0));
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	return sprintf(buf, "%ld\n", temp);
+	return -EOPNOTSUPP;
 }

-static ssize_t alarm_show(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
-{
-	struct pci_dev *pdev =3D to_pci_dev(dev->parent);
-	int nr =3D to_sensor_dev_attr(devattr)->index;
-	u8 ctsts;
-
-	pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
-	return sprintf(buf, "%u\n", (unsigned int)ctsts & (1 << nr));
-}
+static const struct hwmon_ops i5500_ops =3D {
+	.is_visible =3D i5500_is_visible,
+	.read =3D i5500_read,
+};

-static DEVICE_ATTR_RO(temp1_input);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit, thresh, 0xE2);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, thresh, 0xEC);
-static SENSOR_DEVICE_ATTR_RO(temp1_max, thresh, 0xEE);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
-
-static struct attribute *i5500_temp_attrs[] =3D {
-	&dev_attr_temp1_input.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
+static const struct hwmon_channel_info *i5500_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM
+			   ),
 	NULL
 };

-ATTRIBUTE_GROUPS(i5500_temp);
+static const struct hwmon_chip_info i5500_chip_info =3D {
+	.ops =3D &i5500_ops,
+	.info =3D i5500_info,
+};

 static const struct pci_device_id i5500_temp_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x3438) },
@@ -121,9 +130,8 @@ static int i5500_temp_probe(struct pci_dev *pdev,
 		return -ENODEV;
 	}

-	hwmon_dev =3D devm_hwmon_device_register_with_groups(&pdev->dev,
-							   "intel5500", NULL,
-							   i5500_temp_groups);
+	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "intel550=
0", NULL,
+							 &i5500_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }

=2D-
2.20.1

