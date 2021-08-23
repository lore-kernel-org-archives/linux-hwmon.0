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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E26AC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Aug 2021 17:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D76060EE0
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Aug 2021 17:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhHWRIY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Aug 2021 13:08:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:39821 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230360AbhHWRIY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Aug 2021 13:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629738446;
        bh=X+XQ3kV8QU8uG+TpfCYMUzi52iRxsv90Tn71sE67y3M=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=COr++V0a32FnOH2HcmIIEtM3uTp5l9xq7+rSvdHF6aqfNhvk+7u71eSLlZVY8OOLG
         VSfCxkLo+v03A+O0NpaFWOuozJFfAdcF/i9d3bmAhPnW/K9Rnki6hltJewiryV4wR/
         fWIbJeD8iBK4vPDxNDUIHxgcDcde/19JwKiAqV0s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MyKHc-1nGUXi1BVs-00yiRV; Mon, 23 Aug 2021 19:07:26 +0200
From:   W_Armin@gmx.de
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: [PATCH RESEND] hwmon: (i5500_temp) Convert to devm_hwmon_device_register_with_info
Date:   Mon, 23 Aug 2021 19:07:24 +0200
Message-Id: <20210823170724.7662-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1jflLXkBffU0muYsm1eZ/VAPLfzd5fGhtnklhmtb9Y0TQBe+ePF
 ni/zKeKAWg1kLPgkkV59ADC0ax4F2ROiUvGuTksFPX1H7KrfOCWSg+aSOOEvMrhZMT/kkcE
 z+b1kBPMfVz5Ny148z+akpEe/oynT0djqymDoX//E8VXQHcwdHJTUV3G1rssTQXG9c6F9dz
 QUexXahcBPCRhq3RYPnNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XHOvLlArKw8=:Ybzo22GClES8sRBx6xIdTl
 FIH/4g1UAdYnPIiYfJHLNlst6eUaFqTIwshPYIDY6FL9VLl3G59TvcJN8t9FRnHmmHZfUfoOb
 pn7jHXK7YeoWAegow0ASKjvaGbYXmMnuVEizrbXhDgXiP4v2LvYMAWkVhFX0s9ZViH2ZIRKMS
 q6kjv3QKKAiDvkwH056P41sCVUDTsAlCVqCdm89vpKoO9reih8YUi2A3gk26lGCK0YtYrBlQ+
 Zron32Je9GYBl+ZUcgHy4CpK9ScsdX93mkPSS90PQZfRmwMo+mBDzg29dpfgjkoaSl5EVZv1m
 ubIqpRMg/y7CZvsYS8qlxLjRCcCiH+GCSZtZwAuA+U4uRgcpWIHBgoHLwk0uRp+LCiP3FxpMw
 0MbG98SIzn+C3pobGkim2mHuOWJFd9A1jVOMwGjYuMOw0UaEa9DKtrNAE52nkVEWEoJr6anRJ
 nqKu/ia8gskcc6cm2psE0ydKmd85D2ivqy65MH/R8HqVi1WkxhwAjcFLit7tX3BgD+TP30y5y
 eGV+xFMPkoTDNeYDzvZiJhq0iZEbpkoYwysrx32HWZV7Q2WHLgeKYsmgPX6JF0Ycst+jqHbK1
 GNZUOjL5uuI/jcOj9hV7g8nLBHq4B9JzvU3L/0CS0yptndyWEfT6mCm99iH4hOUO5Y1MAJDWf
 wtS6aGhZF1S78o9580uDi4neztrFWPD1qKvWmWnQscw9bXNKYkvMSA6B+hykoZK+uFaChUDXe
 8vg/hIE0tumei8BTAp9c4jmp7EX3KXywphVxFHoqsgba9LTuJMTLjF6hUJSxcU1M4vc1AAHcw
 jWp5pYamAejXsTe7Il46K2KVnRTyGGFXYKqTkgP0k4uiO41G4BQ4NioKF6ZJCGx9evrsdG8vY
 5efs01VoLzWkMmP02XB8PttDp1sWvgwEm1fu/42m9Il6/zMFQryuT2EK0cpIkpxBIKepPlBbc
 nXfidaTJwKa3z27Pvtb9vUexsiBrsaA1sgAeA2A0RciWMZ79JjjwMTdsZBfm+z6KSd1yIbqjg
 EojJCjD5PJwgE1QwIgWStq1s3ffP7b6R1SJ0L2zubN79xx9OxALuFN4VukuIvPeIquKvEOUg2
 Tl+P0K1XncqsZE+1UONsIUPQR4Wb+T6C1ZTjeoJ1Eb+w27fbN6FbL7Ofg==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_hwmon_device_register_with_info() to simplify code
and use register defines instead of hardcoded values.
Also use the BIT() macro for the alarms.

Only compile-tested.

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

