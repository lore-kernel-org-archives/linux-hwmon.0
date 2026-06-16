Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026553EEAD7
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592284; cv=none; b=AQhhWemyywyPUeqU3cj/93eQR2oO+FjSyFUsFq1I6E6Q/EUMKh2oYROdwC9kP8jT+Y7dWXc2/yhGcuZVQsorlUheCmTAxojeU2VhMF7cKXPFb4DujyJtPewB0OLo/UKLFhdG5nKRgW31o7AnfkCR4DBTGIVS45lWO38RcbA1Z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592284; c=relaxed/simple;
	bh=OiM5ypzR88cAhCjF875IhykGG/yce5aNhBFPrt+e9ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SywLLzPU1TsQZzVBpG8uR7/Acmw6NLuXP0nXVPIKCJ81w4qMNWvDQV0k0V/yaImXboJdGGGSwg/Pf+9l+e6tkaGfW9ZNmNSZoo6aS9O0uOCcIOiDsSQ2XfSN8+YylzXhHSsTTQBqoth4wd3/+LfqIyCCdfeRjs5D6BL3XTm05LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EN2MoOc2; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EN2MoOc2"
Date: Tue, 16 Jun 2026 09:44:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781592280; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Fcg5nDalk2ZrJbRiyt867O7Gv8WEDrhPTHHaAZn21No=;
	b=EN2MoOc23+4pteEZN8vCIazIC2eLIP5RdQ7k+eufGdtnK1AfpDRyKsPLf2s0thqZmC06UV
	SHa+DUqgwr5fA7tJWOX20sZbHPkF874MWwanBGExq8a7piE7ltn96Kwf+dIi8XexeeHCmp
	60fkSC/0hIIvbJDR00lTZqQMKBBapCY=
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
Subject: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
Message-ID: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="soKsB7Eb2LXXln6K"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--soKsB7Eb2LXXln6K
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
Originally this patch was AI-generated. I did pretty much re-write the
probe changes by hand, and also fixed some of the coefficient math
afterwards :/ But yeah, this one was AI "assisted". :)

 drivers/hwmon/pmbus/Kconfig   |  4 +--
 drivers/hwmon/pmbus/adm1275.c | 53 +++++++++++++++++++++++++++++------
 2 files changed, 47 insertions(+), 10 deletions(-)

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
index 838b8827eb76..9e21dd4083e9 100644
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
@@ -47,8 +47,8 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,=
 adm1278, adm1281,
 #define ADM1278_VOUT_EN			BIT(1)
=20
 #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1=
278_TSFILT)
-/* The BD12780 data sheets mark TSFILT bit as reserved. */
-#define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
+/* The BD127x0 data sheets mark TSFILT bit as reserved. */
+#define BD127X0_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
=20
 #define ADM1293_IRANGE_25		0
 #define ADM1293_IRANGE_50		BIT(6)
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
+ *   -> m =3D round(k / 10^(-R)), R=3D-2 for 60V/15mV, R=3D-3 for the othe=
r three
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
@@ -504,6 +528,7 @@ static const struct i2c_device_id adm1275_id[] =3D {
 	 */
 	{ "bd12780", bd12780 },
 	{ "bd12780a", /* driver data unused, see --^ */ },
+	{ "bd12790", bd12790 },
 	{ "mc09c", sq24905c },
 	{ }
 };
@@ -581,7 +606,8 @@ static int adm1275_probe(struct i2c_client *client)
 	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm1273 ||
 	    mid->driver_data =3D=3D adm1278 || mid->driver_data =3D=3D adm1281 ||
 	    mid->driver_data =3D=3D adm1293 || mid->driver_data =3D=3D adm1294 ||
-	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D sq24905c)
+	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D bd12790 ||
+	    mid->driver_data =3D=3D sq24905c)
 		config_read_fn =3D i2c_smbus_read_word_data;
 	else
 		config_read_fn =3D i2c_smbus_read_byte_data;
@@ -655,12 +681,23 @@ static int adm1275_probe(struct i2c_client *client)
 		break;
 	case adm1272:
 	case adm1273:
+	case bd12790:
+	{
+		u16 defconfig;
+
 		data->have_vout =3D true;
 		data->have_pin_max =3D true;
 		data->have_temp_max =3D true;
 		data->have_power_sampling =3D true;
=20
-		coefficients =3D adm1272_coefficients;
+		if (data->id =3D=3D bd12790) {
+			coefficients =3D bd12790_coefficients;
+			defconfig =3D BD127X0_PMON_DEFCONFIG;
+		} else {
+			coefficients =3D adm1272_coefficients;
+			defconfig =3D ADM1278_PMON_DEFCONFIG;
+		}
+
 		vindex =3D (config & ADM1275_VRANGE) ? 1 : 0;
 		cindex =3D (config & ADM1272_IRANGE) ? 3 : 2;
 		/* pindex depends on the combination of the above */
@@ -685,14 +722,14 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
=20
-		ret =3D adm1275_enable_vout_temp(data, client, config,
-					       ADM1278_PMON_DEFCONFIG);
+		ret =3D adm1275_enable_vout_temp(data, client, config, defconfig);
 		if (ret)
 			return ret;
=20
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |=3D PMBUS_HAVE_VIN;
 		break;
+	}
 	case adm1275:
 		if (device_config & ADM1275_IOUT_WARN2_SELECT)
 			data->have_oc_fault =3D true;
@@ -738,7 +775,7 @@ static int adm1275_probe(struct i2c_client *client)
 		u16 defconfig;
=20
 		if (data->id =3D=3D bd12780)
-			defconfig =3D BD12780_PMON_DEFCONFIG;
+			defconfig =3D BD127X0_PMON_DEFCONFIG;
 		else
 			defconfig =3D ADM1278_PMON_DEFCONFIG;
=20
--=20
2.54.0


--soKsB7Eb2LXXln6K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow8MwACgkQeFA3/03a
ocVGBgf7B9ClH9hO7mvvUWZP5vF1fT7ZpPAcLDkEuAEe+ydngB0eChSxxS/5+Weu
m0jJY+Gy2+O4/pwSDktTH3+M1pRyK89ltpW6bgahRZbBULWy4hD961grnaxb1j/0
76FQHSn7zVfBXSBDtNLlQDXPgOxnMLHoiMJY9G2XQDLiOflwCGkTfljtpb04HgkJ
3CrKTMxK9VJvfNNAtNX1NhDEETK1aR300lEja7ZQrkgGUDrvlaC97xBe5Iljz8dQ
js8d/P2gJ3Q4mD5DrupNy5lBh5WYcIhbJzruI1JVPGfVekEn85Vk+mTE7/idfaay
BKB5d117frZxvHdkShG1UXFNdJZ+8w==
=TSDT
-----END PGP SIGNATURE-----

--soKsB7Eb2LXXln6K--
