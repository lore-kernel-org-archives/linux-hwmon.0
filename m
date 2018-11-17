Return-Path: <peda@axentia.se>
Return-path: <peda@axentia.se>
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: [PATCH 2/2] hwmon: (ntc_thermistor): add support for B57891S0103 from
 Epcos
Date: Sat, 17 Nov 2018 12:13:00 +0000
Message-ID: <20181117121248.32143-2-peda@axentia.se>
References: <20181117121248.32143-1-peda@axentia.se>
In-Reply-To: <20181117121248.32143-1-peda@axentia.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

More of the same...

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/hwmon/Kconfig                        |  3 +-
 drivers/hwmon/ntc_thermistor.c               | 57 ++++++++++++++++++++++++=
+++-
 include/linux/platform_data/ntc_thermistor.h |  1 +
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f10840ad465c..5438cecace22 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1206,7 +1206,8 @@ config SENSORS_NTC_THERMISTOR
=20
 	  Currently, this driver supports
 	  NCP15WB473, NCP18WB473, NCP21WB473, NCP03WB473, NCP15WL333,
-	  NCP03WF104 and NCP15XH103 from Murata and B57330V2103 from EPCOS.
+	  NCP03WF104 and NCP15XH103 from Murata and B57330V2103 and
+	  B57891S0103 from EPCOS.
=20
 	  This driver can also be built as a module.  If so, the module
 	  will be called ntc-thermistor.
diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.=
c
index c52d07c6b49f..e0c6b2f244a6 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -55,6 +55,7 @@ static const struct platform_device_id ntc_thermistor_id[=
] =3D {
 	{ "b57330v2103", TYPE_B57330V2103},
 	{ "ncp03wf104", TYPE_NCPXXWF104 },
 	{ "ncp15xh103", TYPE_NCPXXXH103 },
+	{ "b57891s0103", TYPE_B57891S0103 },
 	{ },
 };
=20
@@ -212,8 +213,8 @@ static const struct ntc_compensation ncpXXxh103[] =3D {
 };
=20
 /*
- * The following compensation table is from the specification of EPCOS NTC
- * Thermistors Datasheet
+ * The following compensation tables are from the specifications in EPCOS =
NTC
+ * Thermistors Datasheets
  */
 static const struct ntc_compensation b57330v2103[] =3D {
 	{ .temp_c	=3D -40, .ohm	=3D 190030 },
@@ -252,6 +253,52 @@ static const struct ntc_compensation b57330v2103[] =3D=
 {
 	{ .temp_c	=3D 125, .ohm	=3D 531 },
 };
=20
+static const struct ntc_compensation b57891s0103[] =3D {
+	{ .temp_c	=3D -55.0, .ohm	=3D 878900 },
+	{ .temp_c	=3D -50.0, .ohm	=3D 617590 },
+	{ .temp_c	=3D -45.0, .ohm	=3D 439340 },
+	{ .temp_c	=3D -40.0, .ohm	=3D 316180 },
+	{ .temp_c	=3D -35.0, .ohm	=3D 230060 },
+	{ .temp_c	=3D -30.0, .ohm	=3D 169150 },
+	{ .temp_c	=3D -25.0, .ohm	=3D 125550 },
+	{ .temp_c	=3D -20.0, .ohm	=3D 94143 },
+	{ .temp_c	=3D -15.0, .ohm	=3D 71172 },
+	{ .temp_c	=3D -10.0, .ohm	=3D 54308 },
+	{ .temp_c	=3D -5.0, .ohm	=3D 41505 },
+	{ .temp_c	=3D 0.0, .ohm	=3D 32014 },
+	{ .temp_c	=3D 5.0, .ohm	=3D 25011 },
+	{ .temp_c	=3D 10.0, .ohm	=3D 19691 },
+	{ .temp_c	=3D 15.0, .ohm	=3D 15618 },
+	{ .temp_c	=3D 20.0, .ohm	=3D 12474 },
+	{ .temp_c	=3D 25.0, .ohm	=3D 10000 },
+	{ .temp_c	=3D 30.0, .ohm	=3D 8080 },
+	{ .temp_c	=3D 35.0, .ohm	=3D 6569 },
+	{ .temp_c	=3D 40.0, .ohm	=3D 5372 },
+	{ .temp_c	=3D 45.0, .ohm	=3D 4424 },
+	{ .temp_c	=3D 50.0, .ohm	=3D 3661 },
+	{ .temp_c	=3D 55.0, .ohm	=3D 3039 },
+	{ .temp_c	=3D 60.0, .ohm	=3D 2536 },
+	{ .temp_c	=3D 65.0, .ohm	=3D 2128 },
+	{ .temp_c	=3D 70.0, .ohm	=3D 1794 },
+	{ .temp_c	=3D 75.0, .ohm	=3D 1518 },
+	{ .temp_c	=3D 80.0, .ohm	=3D 1290 },
+	{ .temp_c	=3D 85.0, .ohm	=3D 1100 },
+	{ .temp_c	=3D 90.0, .ohm	=3D 942 },
+	{ .temp_c	=3D 95.0, .ohm	=3D 809 },
+	{ .temp_c	=3D 100.0, .ohm	=3D 697 },
+	{ .temp_c	=3D 105.0, .ohm	=3D 604 },
+	{ .temp_c	=3D 110.0, .ohm	=3D 525 },
+	{ .temp_c	=3D 115.0, .ohm	=3D 457 },
+	{ .temp_c	=3D 120.0, .ohm	=3D 400 },
+	{ .temp_c	=3D 125.0, .ohm	=3D 351 },
+	{ .temp_c	=3D 130.0, .ohm	=3D 308 },
+	{ .temp_c	=3D 135.0, .ohm	=3D 272 },
+	{ .temp_c	=3D 140.0, .ohm	=3D 240 },
+	{ .temp_c	=3D 145.0, .ohm	=3D 213 },
+	{ .temp_c	=3D 150.0, .ohm	=3D 189 },
+	{ .temp_c	=3D 155.0, .ohm	=3D 168 },
+};
+
 struct ntc_data {
 	struct ntc_thermistor_platform_data *pdata;
 	const struct ntc_compensation *comp;
@@ -296,6 +343,8 @@ static const struct of_device_id ntc_match[] =3D {
 		.data =3D &ntc_thermistor_id[6] },
 	{ .compatible =3D "murata,ncp15xh103",
 		.data =3D &ntc_thermistor_id[7] },
+	{ .compatible =3D "epcos,b57891s0103",
+		.data =3D &ntc_thermistor_id[8] },
=20
 	/* Usage of vendor name "ntc" is deprecated */
 	{ .compatible =3D "ntc,ncp15wb473",
@@ -627,6 +676,10 @@ static int ntc_thermistor_probe(struct platform_device=
 *pdev)
 		data->comp =3D ncpXXxh103;
 		data->n_comp =3D ARRAY_SIZE(ncpXXxh103);
 		break;
+	case TYPE_B57891S0103:
+		data->comp =3D b57891s0103;
+		data->n_comp =3D ARRAY_SIZE(b57891s0103);
+		break;
 	default:
 		dev_err(dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/p=
latform_data/ntc_thermistor.h
index 698d0d59db76..231a27c302ec 100644
--- a/include/linux/platform_data/ntc_thermistor.h
+++ b/include/linux/platform_data/ntc_thermistor.h
@@ -29,6 +29,7 @@ enum ntc_thermistor_type {
 	TYPE_B57330V2103,
 	TYPE_NCPXXWF104,
 	TYPE_NCPXXXH103,
+	TYPE_B57891S0103,
 };
=20
 struct ntc_thermistor_platform_data {
--=20
2.11.0
