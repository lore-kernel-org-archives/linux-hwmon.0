Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E03DEAC0
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458781; cv=none; b=APjMWFTVcSSOy35iRi4T6L9GnCIhB2wY2WrkWVAuo2JqjjZtp5oPUAkH9C6KZOk6FtRDaX50grFxCR4J+e0YX6JiYAfMazuZEMf/mArMSMDAnUmGjuxWWECGHxjN+QXKxOwpuhOG2QrLLJ2TSBy1NbjpJtm65DApd80xhPS0Lf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458781; c=relaxed/simple;
	bh=8MbVvK9exsyOJm0cptN4/y8FCLJZzOgsGSRJFJ4Wk+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDNRpFIAqEtrf469dbIVd9/vxCyjok7WLUW3RDOA1vTlpzYm2mkRYAT6Pa6JpZdz5WIEkbI6Lct9NjCXPJc5y3wRlsa0q3vWCQ2OnApUFb+x4tnR1aJo6Frw7bEFgJ6AttHowvGYTYkgci9hbSliaK24HrX8fwtVkAGQJJ6G0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SqqX9PVL; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SqqX9PVL"
Date: Fri, 26 Jun 2026 10:26:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458777; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Z0yoAbU7hh5mG8TMAEPO39qsaj6B0aGR2OjlSM4iMQs=;
	b=SqqX9PVLaZCY4f8hgrStKOTDfqqf0KbHTmdl0SRxZqJ88rkeCeb6WJMeuhwRUlNrz5tiil
	09S/ml/2hA75Srh9XHKoGxaMhDWGcbGubFITOHsud3MFTu3yhNFjZSg5DEw2XYpYjg7K/+
	uAjXoDkGB9Q9ypG4vo2We0+w3FeqP1g=
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
Subject: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
Message-ID: <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gc4+dq5DjPBRXzEt"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--gc4+dq5DjPBRXzEt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add support for ROHM BD12790 hot-swap controller which is largely
similar to Analog Devices adm1272.

The BD12790 uses the same selectable 60V/100V voltage ranges and
15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
(bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
a dedicated coefficient table that mirrors adm1272_coefficients, with
the following differences derived from BD12790 datasheet Table 1 (p.18):
- power 60V/30mV: m=3D17560 (vs. 17561)
- power 100V/30mV: m=3D10536 (vs. 10535)
- temperature: b=3D31880 (vs. 31871, reflecting T[11:0] =3D 4.2*T + 3188)

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Assisted-by: GitHub Copilot:claude-sonnet-4.6

---
Revision history:
v1 =3D> v2: Changes mostly based on the review by Guenter:
 - Add own 'case' for the bd12790.
 - Don't use wildcard in the macro name.
 - Fix the coefficient computation comment for power to take the
   shunt-resistor scale into account.
---
 drivers/hwmon/pmbus/Kconfig   |  4 +-
 drivers/hwmon/pmbus/adm1275.c | 79 +++++++++++++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index b3c27f3b2712..6ebc01e26db3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -52,8 +52,8 @@ config SENSORS_ADM1275
 	help
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
-	  ADM1293, ADM1294, ROHM BD12780, and SQ24905C Hot-Swap Controller and
-	  Digital Power Monitors.
+	  ADM1293, ADM1294, ROHM BD12780, ROHM BD12790, and SQ24905C
+	  Hot-Swap Controller and Digital Power Monitors.
=20
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 81c50fab7687..406b44852376 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -19,7 +19,7 @@
 #include "pmbus.h"
=20
 enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
-	 adm1293, adm1294, bd12780, sq24905c };
+	 adm1293, adm1294, bd12780, bd12790, sq24905c };
=20
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -47,7 +47,7 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,=
 adm1278, adm1281,
 #define ADM1278_VOUT_EN			BIT(1)
=20
 #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1=
278_TSFILT)
-/* The BD12780 data sheets mark TSFILT bit as reserved. */
+/* The BD127[89]0 data sheets mark TSFILT bit as reserved. */
 #define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
=20
 #define ADM1293_IRANGE_25		0
@@ -136,6 +136,30 @@ static const struct coefficients adm1272_coefficients[=
] =3D {
=20
 };
=20
+/*
+ * BD12790 coefficients derived from preliminary datasheet, Table 1 (p.18)
+ * and the PMBus direct-format relationship X =3D (Y * 10^(-R) - b) / m.
+ *
+ * Voltage: V[V] =3D 14.77e-3 * code (60V) / 24.62e-3 * code (100V)
+ *   -> m =3D 6770, R=3D-2 / m =3D 4062, R=3D-2
+ * Current: code =3D I[A] * RS * 132802.1 + 2048 (15mV) / * 66401.06 + 204=
8 (30mV)
+ *   -> m =3D 1328, b =3D 2048 * 10^(-R) =3D 20480, R=3D-1 / m =3D 664, sa=
me b and R
+ * Power: code =3D k * RS * PIN, k =3D 35119.94 / 17559.97 / 21071.44 / 10=
535.72
+ *   -> m =3D round(k / 10^(-3-R)), R=3D-2 for 60V/15mV, R=3D-3 for the ot=
her three
+ * Temperature: code =3D 4.2 * T + 3188 -> m =3D 42, b =3D 3188 * 10 =3D 3=
1880, R=3D-1
+ */
+static const struct coefficients bd12790_coefficients[] =3D {
+	[0] =3D { 6770, 0, -2 },		/* voltage, vrange 60V */
+	[1] =3D { 4062, 0, -2 },		/* voltage, vrange 100V */
+	[2] =3D { 1328, 20480, -1 },	/* current, vsense range 15mV */
+	[3] =3D { 664, 20480, -1 },	/* current, vsense range 30mV */
+	[4] =3D { 3512, 0, -2 },		/* power, vrange 60V, irange 15mV */
+	[5] =3D { 21071, 0, -3 },		/* power, vrange 100V, irange 15mV */
+	[6] =3D { 17560, 0, -3 },		/* power, vrange 60V, irange 30mV */
+	[7] =3D { 10536, 0, -3 },		/* power, vrange 100V, irange 30mV */
+	[8] =3D { 42, 31880, -1 },	/* temperature */
+};
+
 static const struct coefficients adm1275_coefficients[] =3D {
 	[0] =3D { 19199, 0, -2 },		/* voltage, vrange set */
 	[1] =3D { 6720, 0, -1 },		/* voltage, vrange not set */
@@ -490,6 +514,7 @@ static const struct i2c_device_id adm1275_id[] =3D {
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ "bd12780", bd12780 },
+	{ "bd12790", bd12790 },
 	{ "mc09c", sq24905c },
 	{ }
 };
@@ -567,7 +592,8 @@ static int adm1275_probe(struct i2c_client *client)
 	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm1273 ||
 	    mid->driver_data =3D=3D adm1278 || mid->driver_data =3D=3D adm1281 ||
 	    mid->driver_data =3D=3D adm1293 || mid->driver_data =3D=3D adm1294 ||
-	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D sq24905c)
+	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D bd12790 ||
+	    mid->driver_data =3D=3D sq24905c)
 		config_read_fn =3D i2c_smbus_read_word_data;
 	else
 		config_read_fn =3D i2c_smbus_read_byte_data;
@@ -647,6 +673,7 @@ static int adm1275_probe(struct i2c_client *client)
 		data->have_power_sampling =3D true;
=20
 		coefficients =3D adm1272_coefficients;
+
 		vindex =3D (config & ADM1275_VRANGE) ? 1 : 0;
 		cindex =3D (config & ADM1272_IRANGE) ? 3 : 2;
 		/* pindex depends on the combination of the above */
@@ -679,6 +706,51 @@ static int adm1275_probe(struct i2c_client *client)
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |=3D PMBUS_HAVE_VIN;
 		break;
+
+	/*
+	 * The BD12790 is almost identical to the adm1272. Only the defconfig
+	 * and coefficients have minor differences.
+	 */
+	case bd12790:
+		data->have_vout =3D true;
+		data->have_pin_max =3D true;
+		data->have_temp_max =3D true;
+		data->have_power_sampling =3D true;
+
+		coefficients =3D bd12790_coefficients;
+
+		vindex =3D (config & ADM1275_VRANGE) ? 1 : 0;
+		cindex =3D (config & ADM1272_IRANGE) ? 3 : 2;
+		/* pindex depends on the combination of the above */
+		switch (config & (ADM1275_VRANGE | ADM1272_IRANGE)) {
+		case 0:
+		default:
+			pindex =3D 4;
+			break;
+		case ADM1275_VRANGE:
+			pindex =3D 5;
+			break;
+		case ADM1272_IRANGE:
+			pindex =3D 6;
+			break;
+		case ADM1275_VRANGE | ADM1272_IRANGE:
+			pindex =3D 7;
+			break;
+		}
+		tindex =3D 8;
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
+		break;
 	case adm1275:
 		if (device_config & ADM1275_IOUT_WARN2_SELECT)
 			data->have_oc_fault =3D true;
@@ -919,6 +991,7 @@ static const struct of_device_id adm1275_of_match[] =3D=
 {
 	{ .compatible =3D "adi,adm1293", },
 	{ .compatible =3D "adi,adm1294", },
 	{ .compatible =3D "rohm,bd12780", },
+	{ .compatible =3D "rohm,bd12790", },
 	{ .compatible =3D "silergy,mc09c", },
 	{ }
 };
--=20
2.54.0


--gc4+dq5DjPBRXzEt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KYoACgkQeFA3/03a
ocWlMwgAwsEoF8IJPhLR+cgaG9FzcTHhUDdCOR4HQqR9r/ptrsArjy/v2W+9MSN7
Ktjh9GXN4Ryar3UYMdu9cxFQoDkp1xDgWdoQeosAT1YVBhdOlk6B8hxn48/Zch3W
Fz79+gYniazPEuVuaJxkPOMHKlfCuQWQx64XSe+JduQQcd6eWrn25o/9r/Wkdy3z
jskep7uClO5BFiRKBL0xNPAqO0ckGrrOr8OZJVHjcF6Q/rTpzO+a5o3y1B2JfXF4
/IU4KiQJznWD/OTRUZWzablPx7EAq1qWE4c920ijirK/bJwX8DTr5rH+VNspwCeU
ah3Wkb1ppGlBZWCN0iTWy7VoX7aNBA==
=sg/8
-----END PGP SIGNATURE-----

--gc4+dq5DjPBRXzEt--
