Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF53E8C6A
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591829; cv=none; b=o1Eo0wk+NcYpeKoVgFbtmFJQMrPxGEt/8TT0b4mueLplSRvzt79CbXvcE0iGgwNClBFrjA2r3b3JZQrYMj5cEyzwZTxJAsYoey+5lLCHNCM8gV902Ki2KZ9CbIF6PH3IBghRlhBf8ygLm0sj3gSgySx0ltMHnAH3+GUpBior8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591829; c=relaxed/simple;
	bh=Klv9D5zrHs1ScwchL3kgOipfWA5dPu29TE7Vf382BhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lq/7alVgzk99/3MEh9K0IsDQMR5oGB4O6vjr1Bs9fyQcIT8ix5jPJcv3WSR49aj1VM+Z7HEpG0UEtUrk9l65LvjRGeD1k62IrhvTECrIkcOZOgk0AsjvfpiQ2NilfZiuPXBDIokpqVEV24GvPpvsRuJ8nC4WpRyavHIN7mh5/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jUE8Th6T; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jUE8Th6T"
Date: Tue, 16 Jun 2026 09:36:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591825; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=FAh0mrqcGajTpVCBYWBFQ6vR4eBvbnImut396S8/Jz8=;
	b=jUE8Th6TxgrutecRXnPzT3XxBVsn26vr/spCbS6cyYdm9dVMMAVZm376vcUNXyjvSF9Yrj
	WXpEDYsQ86Q3BNe215Ry9Ci7LHic6OsqeyuURTAhgZ1P7w24JSMREBvFYYUvZeCLYuIj1g
	DsqoVMqDivU2Z6JmLv9X9uNukDs/tcw=
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
	Ashish Yadav <ashish.yadav@infineon.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/7] hwmon: adm1275: Support ROHM BD12780
Message-ID: <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sR6cj3Mx2fXVqVKN"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--sR6cj3Mx2fXVqVKN
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
 drivers/hwmon/pmbus/Kconfig   |  2 +-
 drivers/hwmon/pmbus/adm1275.c | 46 +++++++++++++++++++++++++++++------
 2 files changed, 39 insertions(+), 9 deletions(-)

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
index bc2a6a07dc3e..838b8827eb76 100644
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
@@ -487,6 +489,21 @@ static const struct i2c_device_id adm1275_id[] =3D {
 	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
+	/*
+	 * The BD12780a is functionally identical to BD12780(*). Even the pmbus ID
+	 * register contents are same. When instantiated from the DT, it is requi=
red
+	 * to have the bd12780 as a fall-back. We still need the bd12780a ID here,
+	 * because the i2c_device_id is created from the first compatible, not fr=
om
+	 * the fall-back entry.
+	 * (*)Until proven to differ. I prefer having own compatible for these
+	 * variants for that day. Please note that even though the probe is called
+	 * based on the 'bd12780a' -entry, the ID is picked at probe based on the
+	 * pmbus register contents and not by DT entry. Thus, if the bd12780 and
+	 * bd12780a are found to require different handling, then this needs to be
+	 * changed, or bd12780a is handled as bd12780.
+	 */
+	{ "bd12780", bd12780 },
+	{ "bd12780a", /* driver data unused, see --^ */ },
 	{ "mc09c", sq24905c },
 	{ }
 };
@@ -494,12 +511,13 @@ MODULE_DEVICE_TABLE(i2c, adm1275_id);
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
@@ -535,7 +553,8 @@ static int adm1275_probe(struct i2c_client *client)
 		return ret;
 	}
 	if ((ret !=3D 3 || strncmp(block_buffer, "ADI", 3)) &&
-	    (ret !=3D 2 || strncmp(block_buffer, "SY", 2))) {
+	    (ret !=3D 2 || strncmp(block_buffer, "SY", 2)) &&
+	    (ret !=3D 4 || strncmp(block_buffer, "ROHM", 4))) {
 		dev_err(&client->dev, "Unsupported Manufacturer ID\n");
 		return -ENODEV;
 	}
@@ -562,7 +581,7 @@ static int adm1275_probe(struct i2c_client *client)
 	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm1273 ||
 	    mid->driver_data =3D=3D adm1278 || mid->driver_data =3D=3D adm1281 ||
 	    mid->driver_data =3D=3D adm1293 || mid->driver_data =3D=3D adm1294 ||
-	    mid->driver_data =3D=3D sq24905c)
+	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D sq24905c)
 		config_read_fn =3D i2c_smbus_read_word_data;
 	else
 		config_read_fn =3D i2c_smbus_read_byte_data;
@@ -666,7 +685,8 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
=20
-		ret =3D adm1275_enable_vout_temp(data, client, config);
+		ret =3D adm1275_enable_vout_temp(data, client, config,
+					       ADM1278_PMON_DEFCONFIG);
 		if (ret)
 			return ret;
=20
@@ -712,7 +732,16 @@ static int adm1275_probe(struct i2c_client *client)
 		break;
 	case adm1278:
 	case adm1281:
+	case bd12780:
 	case sq24905c:
+	{
+		u16 defconfig;
+
+		if (data->id =3D=3D bd12780)
+			defconfig =3D BD12780_PMON_DEFCONFIG;
+		else
+			defconfig =3D ADM1278_PMON_DEFCONFIG;
+
 		data->have_vout =3D true;
 		data->have_pin_max =3D true;
 		data->have_temp_max =3D true;
@@ -728,13 +757,14 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
=20
-		ret =3D adm1275_enable_vout_temp(data, client, config);
+		ret =3D adm1275_enable_vout_temp(data, client, config, defconfig);
 		if (ret)
 			return ret;
=20
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |=3D PMBUS_HAVE_VIN;
 		break;
+	}
 	case adm1293:
 	case adm1294:
 		data->have_iout_min =3D true;
--=20
2.54.0


--sR6cj3Mx2fXVqVKN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow7wcACgkQeFA3/03a
ocWA+Qf/V3MmA+Qfler/72Y2EgFkCuXe1KZSIf86tRvl5yCxT2+beMyEQDVr0R0F
EillzrX5b1V0i4m/m5wd1LEtIQOE2T4ohH8RTBLn1i41bRvGQ6+n96NFMZctr6Pq
AXJhKzTxMpYdF2/J422l5yI7Qe+/SHNkiCl4Holr7H7A5T0M6IWMQf1qbQ4SnLFI
RTaLqvX6qcbv+Sfb51jiD2fUISjmpIWLiNemMFsNDR2hrK8d0tPTr2ow2TrfIATL
P46OJvYxoQAePgTidf/XCrK60M8tvNYBM/bWxZxbgenLOJZQ0g/DJ8u0xBTdNmxy
1dUOKnU+TXK6HlGQFwGphkDF4XlEhg==
=AiIH
-----END PGP SIGNATURE-----

--sR6cj3Mx2fXVqVKN--
