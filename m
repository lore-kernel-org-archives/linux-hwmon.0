Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D513DEFF5
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458706; cv=none; b=qqemPZcR/NHVID0VdGOlfkm1BIg7JBFcOMq1ST1LIH4B4Bvrp5Hawf8S8ESuckc53Nu3BYKhTT7jEPZ3WmXAYNb/rK4FS1l2ejnUio65Ot7wjUcG1tKqrxuJ6ySL/BBxsmt4sE1zcf45xTB/Sr3M0zSI3K26k0jnZLk7L9NIbKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458706; c=relaxed/simple;
	bh=fCpvREmHHNnO8toubZPCbr6MTgGuB0Qxm8+x24/45M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1R/wJMV2MkP2KMjJhtnzuY3M0zX75jvqj8JcTtxwKX7K/vADoebx7usyhSkfp/nOQ1vk1dtzJA2cYl3xzsSG+UD7HlAgVHzsRy2JF/EMscTLcpYi8KljptoU2XbEWMNQbeNkI9UWZ0zzwy8mkRbVsEXkW/TihdUPxsI0nW26Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uhgI4jUV; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uhgI4jUV"
Date: Fri, 26 Jun 2026 10:24:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458703; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=EyZuz/kd43aJPJYHvKtYciAAjOUIn6a09hzyrlK+72k=;
	b=uhgI4jUVfISxFE0+5ZGGn7F/X2FK4Zb3Mqn58aWWRf6UyDeR6b9LRgPIbq5h+vfoF7nUOf
	rkGwUCsOafHHmQvICRKWGa+tm2ZC7TJNtG/1llvzzchB2T5RM9HZILQBo5dJMTcFlUMAkG
	5YXltAkBjfhx+kzQkjGR+w2j3JUaZGw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 6/9] hwmon: adm1275: Support ROHM BD12780
Message-ID: <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="STCEhsKO30F9JjqO"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--STCEhsKO30F9JjqO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
similar to Analog Devices ADM1278. Besides the ID registers and some
added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
[15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.

The BD12780 has 3 pins usable for configuring the I2C address. The
BD12780A lists the ADDR3-pin as "not connect".

Support ROHM BD12780 and BD12780A controllers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---

Revision history:
v1 =3D> v2: Changes based on the review by Guenter:
 - Drop i2c_device_id for bd12780a
 - Add own 'case' for the bd12780 instead of overloading the existing
   one and still having an 'if (id =3D=3D bd12780)' inside the case.
---
 drivers/hwmon/pmbus/Kconfig   |  2 +-
 drivers/hwmon/pmbus/adm1275.c | 55 ++++++++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..b3c27f3b2712 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -52,7 +52,7 @@ config SENSORS_ADM1275
 	help
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
-	  ADM1293, ADM1294 and SQ24905C Hot-Swap Controller and
+	  ADM1293, ADM1294, ROHM BD12780, and SQ24905C Hot-Swap Controller and
 	  Digital Power Monitors.
=20
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 1ea2037711e1..81c50fab7687 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -19,7 +19,7 @@
 #include "pmbus.h"
=20
 enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
-	 adm1293, adm1294, sq24905c };
+	 adm1293, adm1294, bd12780, sq24905c };
=20
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -47,6 +47,8 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,=
 adm1278, adm1281,
 #define ADM1278_VOUT_EN			BIT(1)
=20
 #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1=
278_TSFILT)
+/* The BD12780 data sheets mark TSFILT bit as reserved. */
+#define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
=20
 #define ADM1293_IRANGE_25		0
 #define ADM1293_IRANGE_50		BIT(6)
@@ -487,6 +489,7 @@ static const struct i2c_device_id adm1275_id[] =3D {
 	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
+	{ "bd12780", bd12780 },
 	{ "mc09c", sq24905c },
 	{ }
 };
@@ -494,12 +497,13 @@ MODULE_DEVICE_TABLE(i2c, adm1275_id);
=20
 /* Enable VOUT & TEMP1 if not enabled (disabled by default) */
 static int adm1275_enable_vout_temp(struct adm1275_data *data,
-				    struct i2c_client *client, int config)
+				    struct i2c_client *client, int config,
+				    u16 defconfig)
 {
 	int ret;
=20
-	if ((config & ADM1278_PMON_DEFCONFIG) !=3D ADM1278_PMON_DEFCONFIG) {
-		config |=3D ADM1278_PMON_DEFCONFIG;
+	if ((config & defconfig) !=3D defconfig) {
+		config |=3D defconfig;
 		ret =3D adm1275_write_pmon_config(data, client, config);
 		if (ret < 0) {
 			dev_err(&client->dev, "Failed to enable VOUT/TEMP1 monitoring\n");
@@ -535,7 +539,8 @@ static int adm1275_probe(struct i2c_client *client)
 		return ret;
 	}
 	if ((ret !=3D 3 || strncmp(block_buffer, "ADI", 3)) &&
-	    (ret !=3D 2 || strncmp(block_buffer, "SY", 2))) {
+	    (ret !=3D 2 || strncmp(block_buffer, "SY", 2)) &&
+	    (ret !=3D 4 || strncmp(block_buffer, "ROHM", 4))) {
 		dev_err(&client->dev, "Unsupported Manufacturer ID\n");
 		return -ENODEV;
 	}
@@ -562,7 +567,7 @@ static int adm1275_probe(struct i2c_client *client)
 	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm1273 ||
 	    mid->driver_data =3D=3D adm1278 || mid->driver_data =3D=3D adm1281 ||
 	    mid->driver_data =3D=3D adm1293 || mid->driver_data =3D=3D adm1294 ||
-	    mid->driver_data =3D=3D sq24905c)
+	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D sq24905c)
 		config_read_fn =3D i2c_smbus_read_word_data;
 	else
 		config_read_fn =3D i2c_smbus_read_byte_data;
@@ -666,7 +671,8 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
=20
-		ret =3D adm1275_enable_vout_temp(data, client, config);
+		ret =3D adm1275_enable_vout_temp(data, client, config,
+					       ADM1278_PMON_DEFCONFIG);
 		if (ret)
 			return ret;
=20
@@ -728,13 +734,45 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
=20
-		ret =3D adm1275_enable_vout_temp(data, client, config);
+		ret =3D adm1275_enable_vout_temp(data, client, config,
+					       ADM1278_PMON_DEFCONFIG);
 		if (ret)
 			return ret;
=20
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |=3D PMBUS_HAVE_VIN;
 		break;
+
+	/*
+	 * The BD12780 is almost functionally identical with the adm1278 above.
+	 * Only differences visible to the driver are lack of TSFILT bits and
+	 * different identification register contents.
+	 */
+	case bd12780:
+		data->have_vout =3D true;
+		data->have_pin_max =3D true;
+		data->have_temp_max =3D true;
+		data->have_power_sampling =3D true;
+
+		coefficients =3D adm1278_coefficients;
+		vindex =3D 0;
+		cindex =3D 1;
+		pindex =3D 2;
+		tindex =3D 3;
+
+		info->func[0] |=3D PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+
+		ret =3D adm1275_enable_vout_temp(data, client, config,
+					       BD12780_PMON_DEFCONFIG);
+		if (ret)
+			return ret;
+
+		if (config & ADM1278_VIN_EN)
+			info->func[0] |=3D PMBUS_HAVE_VIN;
+
+		break;
 	case adm1293:
 	case adm1294:
 		data->have_iout_min =3D true;
@@ -880,6 +918,7 @@ static const struct of_device_id adm1275_of_match[] =3D=
 {
 	{ .compatible =3D "adi,adm1281", },
 	{ .compatible =3D "adi,adm1293", },
 	{ .compatible =3D "adi,adm1294", },
+	{ .compatible =3D "rohm,bd12780", },
 	{ .compatible =3D "silergy,mc09c", },
 	{ }
 };
--=20
2.54.0


--STCEhsKO30F9JjqO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KUcACgkQeFA3/03a
ocV+nwgAv767POjFsZavWyvgxbu9SJceGrvAA+TihLVTnHRmtdIhynl4/zbRmO+s
lEMPBvz7jDWsipa9S7ZkrGMsI3MQXRBDJvaw5nD0rCvJez0a/PWlxAiuSaxSSSBl
nomJzMiFdG243OE+sIovo2/BuiTa4xcGDTnNLMMNXF9yoqvjOUTltkCeIKOixO/Y
xINk49vQJg7ljtvhc3Iz57JJ651phi9ZrOzil1uxSN/abFm8arH9FAqPWUAkSnA9
1H/V4XFVogji1+wx+2tVaYGsDneBg1rmDmf5Mb/vf6WQ3pL88jUSQ2xETiVFYTrG
LBEGDEGR2qY1f5mgh+pzn+X3vmCB2Q==
=6pOD
-----END PGP SIGNATURE-----

--STCEhsKO30F9JjqO--
