Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr60116.outbound.protection.outlook.com ([40.107.6.116]:6167
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730072AbeKVCja (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 21:39:30 -0500
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 2/2] hwmon: (ntc_thermistor) use a table to lookup the
 thermistor type
Date: Wed, 21 Nov 2018 16:03:46 +0000
Message-ID: <20181121160327.16772-3-peda@axentia.se>
References: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
 <20181121160327.16772-1-peda@axentia.se>
In-Reply-To: <20181121160327.16772-1-peda@axentia.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sort the entries while at it.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/hwmon/ntc_thermistor.c               | 47 +++++++++++++-----------=
----
 include/linux/platform_data/ntc_thermistor.h |  6 ++--
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.=
c
index 7747c1ed1f02..56d83b2472c8 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -315,6 +315,23 @@ static const struct ntc_compensation b57891s0103[] =3D=
 {
 	{ .temp_c	=3D 155.0, .ohm	=3D 168 },
 };
=20
+struct ntc_type {
+	const struct ntc_compensation *comp;
+	int n_comp;
+};
+
+#define NTC_TYPE(ntc, compensation) \
+[(ntc)] =3D { .comp =3D (compensation), .n_comp =3D ARRAY_SIZE(compensatio=
n) }
+
+static const struct ntc_type ntc_type[] =3D {
+	NTC_TYPE(TYPE_B57330V2103, b57330v2103),
+	NTC_TYPE(TYPE_B57891S0103, b57891s0103),
+	NTC_TYPE(TYPE_NCPXXWB473,  ncpXXwb473),
+	NTC_TYPE(TYPE_NCPXXWF104,  ncpXXwf104),
+	NTC_TYPE(TYPE_NCPXXWL333,  ncpXXwl333),
+	NTC_TYPE(TYPE_NCPXXXH103,  ncpXXxh103),
+};
+
 struct ntc_data {
 	struct ntc_thermistor_platform_data *pdata;
 	const struct ntc_compensation *comp;
@@ -671,37 +688,15 @@ static int ntc_thermistor_probe(struct platform_devic=
e *pdev)
=20
 	data->pdata =3D pdata;
=20
-	switch (pdev_id->driver_data) {
-	case TYPE_NCPXXWB473:
-		data->comp =3D ncpXXwb473;
-		data->n_comp =3D ARRAY_SIZE(ncpXXwb473);
-		break;
-	case TYPE_NCPXXWL333:
-		data->comp =3D ncpXXwl333;
-		data->n_comp =3D ARRAY_SIZE(ncpXXwl333);
-		break;
-	case TYPE_B57330V2103:
-		data->comp =3D b57330v2103;
-		data->n_comp =3D ARRAY_SIZE(b57330v2103);
-		break;
-	case TYPE_NCPXXWF104:
-		data->comp =3D ncpXXwf104;
-		data->n_comp =3D ARRAY_SIZE(ncpXXwf104);
-		break;
-	case TYPE_NCPXXXH103:
-		data->comp =3D ncpXXxh103;
-		data->n_comp =3D ARRAY_SIZE(ncpXXxh103);
-		break;
-	case TYPE_B57891S0103:
-		data->comp =3D b57891s0103;
-		data->n_comp =3D ARRAY_SIZE(b57891s0103);
-		break;
-	default:
+	if (pdev_id->driver_data >=3D ARRAY_SIZE(ntc_type)) {
 		dev_err(dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
 		return -EINVAL;
 	}
=20
+	data->comp   =3D ntc_type[pdev_id->driver_data].comp;
+	data->n_comp =3D ntc_type[pdev_id->driver_data].n_comp;
+
 	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, pdev_id->name,
 							   data, ntc_groups);
 	if (IS_ERR(hwmon_dev)) {
diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/p=
latform_data/ntc_thermistor.h
index 231a27c302ec..ee03d429742b 100644
--- a/include/linux/platform_data/ntc_thermistor.h
+++ b/include/linux/platform_data/ntc_thermistor.h
@@ -24,12 +24,12 @@
 struct iio_channel;
=20
 enum ntc_thermistor_type {
-	TYPE_NCPXXWB473,
-	TYPE_NCPXXWL333,
 	TYPE_B57330V2103,
+	TYPE_B57891S0103,
+	TYPE_NCPXXWB473,
 	TYPE_NCPXXWF104,
+	TYPE_NCPXXWL333,
 	TYPE_NCPXXXH103,
-	TYPE_B57891S0103,
 };
=20
 struct ntc_thermistor_platform_data {
--=20
2.11.0
