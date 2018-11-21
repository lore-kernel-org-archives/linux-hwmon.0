Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr60134.outbound.protection.outlook.com ([40.107.6.134]:13952
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730072AbeKVCio (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 21:38:44 -0500
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 1/2] hwmon: (ntc_thermistor) sort thermistor id lists
 alphabetically
Date: Wed, 21 Nov 2018 16:03:39 +0000
Message-ID: <20181121160327.16772-2-peda@axentia.se>
References: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
 <20181121160327.16772-1-peda@axentia.se>
In-Reply-To: <20181121160327.16772-1-peda@axentia.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use an enum to index the array, so that it is possible to add sorted
entries without causing churn.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/hwmon/ntc_thermistor.c | 82 +++++++++++++++++++++++++-------------=
----
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.=
c
index e0c6b2f244a6..7747c1ed1f02 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -45,18 +45,34 @@ struct ntc_compensation {
 	unsigned int	ohm;
 };
=20
-/* Order matters, ntc_match references the entries by index */
+/*
+ * Used as index in a zero-terminated array, holes not allowed so
+ * that NTC_LAST is the first empty array entry.
+ */
+enum {
+	NTC_B57330V2103,
+	NTC_B57891S0103,
+	NTC_NCP03WB473,
+	NTC_NCP03WF104,
+	NTC_NCP15WB473,
+	NTC_NCP15WL333,
+	NTC_NCP15XH103,
+	NTC_NCP18WB473,
+	NTC_NCP21WB473,
+	NTC_LAST,
+};
+
 static const struct platform_device_id ntc_thermistor_id[] =3D {
-	{ "ncp15wb473", TYPE_NCPXXWB473 },
-	{ "ncp18wb473", TYPE_NCPXXWB473 },
-	{ "ncp21wb473", TYPE_NCPXXWB473 },
-	{ "ncp03wb473", TYPE_NCPXXWB473 },
-	{ "ncp15wl333", TYPE_NCPXXWL333 },
-	{ "b57330v2103", TYPE_B57330V2103},
-	{ "ncp03wf104", TYPE_NCPXXWF104 },
-	{ "ncp15xh103", TYPE_NCPXXXH103 },
-	{ "b57891s0103", TYPE_B57891S0103 },
-	{ },
+	[NTC_B57330V2103]     =3D { "b57330v2103",     TYPE_B57330V2103 },
+	[NTC_B57891S0103]     =3D { "b57891s0103",     TYPE_B57891S0103 },
+	[NTC_NCP03WB473]      =3D { "ncp03wb473",      TYPE_NCPXXWB473 },
+	[NTC_NCP03WF104]      =3D { "ncp03wf104",      TYPE_NCPXXWF104 },
+	[NTC_NCP15WB473]      =3D { "ncp15wb473",      TYPE_NCPXXWB473 },
+	[NTC_NCP15WL333]      =3D { "ncp15wl333",      TYPE_NCPXXWL333 },
+	[NTC_NCP15XH103]      =3D { "ncp15xh103",      TYPE_NCPXXXH103 },
+	[NTC_NCP18WB473]      =3D { "ncp18wb473",      TYPE_NCPXXWB473 },
+	[NTC_NCP21WB473]      =3D { "ncp21wb473",      TYPE_NCPXXWB473 },
+	[NTC_LAST]            =3D { },
 };
=20
 /*
@@ -327,36 +343,36 @@ static int ntc_adc_iio_read(struct ntc_thermistor_pla=
tform_data *pdata)
 }
=20
 static const struct of_device_id ntc_match[] =3D {
-	{ .compatible =3D "murata,ncp15wb473",
-		.data =3D &ntc_thermistor_id[0] },
-	{ .compatible =3D "murata,ncp18wb473",
-		.data =3D &ntc_thermistor_id[1] },
-	{ .compatible =3D "murata,ncp21wb473",
-		.data =3D &ntc_thermistor_id[2] },
-	{ .compatible =3D "murata,ncp03wb473",
-		.data =3D &ntc_thermistor_id[3] },
-	{ .compatible =3D "murata,ncp15wl333",
-		.data =3D &ntc_thermistor_id[4] },
 	{ .compatible =3D "epcos,b57330v2103",
-		.data =3D &ntc_thermistor_id[5]},
+		.data =3D &ntc_thermistor_id[NTC_B57330V2103]},
+	{ .compatible =3D "epcos,b57891s0103",
+		.data =3D &ntc_thermistor_id[NTC_B57891S0103] },
+	{ .compatible =3D "murata,ncp03wb473",
+		.data =3D &ntc_thermistor_id[NTC_NCP03WB473] },
 	{ .compatible =3D "murata,ncp03wf104",
-		.data =3D &ntc_thermistor_id[6] },
+		.data =3D &ntc_thermistor_id[NTC_NCP03WF104] },
+	{ .compatible =3D "murata,ncp15wb473",
+		.data =3D &ntc_thermistor_id[NTC_NCP15WB473] },
+	{ .compatible =3D "murata,ncp15wl333",
+		.data =3D &ntc_thermistor_id[NTC_NCP15WL333] },
 	{ .compatible =3D "murata,ncp15xh103",
-		.data =3D &ntc_thermistor_id[7] },
-	{ .compatible =3D "epcos,b57891s0103",
-		.data =3D &ntc_thermistor_id[8] },
+		.data =3D &ntc_thermistor_id[NTC_NCP15XH103] },
+	{ .compatible =3D "murata,ncp18wb473",
+		.data =3D &ntc_thermistor_id[NTC_NCP18WB473] },
+	{ .compatible =3D "murata,ncp21wb473",
+		.data =3D &ntc_thermistor_id[NTC_NCP21WB473] },
=20
 	/* Usage of vendor name "ntc" is deprecated */
+	{ .compatible =3D "ntc,ncp03wb473",
+		.data =3D &ntc_thermistor_id[NTC_NCP03WB473] },
 	{ .compatible =3D "ntc,ncp15wb473",
-		.data =3D &ntc_thermistor_id[0] },
+		.data =3D &ntc_thermistor_id[NTC_NCP15WB473] },
+	{ .compatible =3D "ntc,ncp15wl333",
+		.data =3D &ntc_thermistor_id[NTC_NCP15WL333] },
 	{ .compatible =3D "ntc,ncp18wb473",
-		.data =3D &ntc_thermistor_id[1] },
+		.data =3D &ntc_thermistor_id[NTC_NCP18WB473] },
 	{ .compatible =3D "ntc,ncp21wb473",
-		.data =3D &ntc_thermistor_id[2] },
-	{ .compatible =3D "ntc,ncp03wb473",
-		.data =3D &ntc_thermistor_id[3] },
-	{ .compatible =3D "ntc,ncp15wl333",
-		.data =3D &ntc_thermistor_id[4] },
+		.data =3D &ntc_thermistor_id[NTC_NCP21WB473] },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ntc_match);
--=20
2.11.0
