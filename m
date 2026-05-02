Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7B22A7F0
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743141; cv=none; b=tPX4NkMNdCUVCwEQccaC06EVs8Se6ihom9YRMfNEtnlYcZHn1yGa1E08nXWyx1uo+45JBsAkT1pkEh9Hro/K+950ohI7hRPro4RCkla6JZiCcjhrJd5gbI+cUB59/ESwcfj3QV+B7pKP2SKK8Sr+7FYyddIlu+fDBuUF69xwnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743141; c=relaxed/simple;
	bh=Li/qXLt6O9qFgmdZieg19zYOZghAPlxbnxAyrciyucE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIQRnooLQOycZRA37t0hUi9pjf8aGp8Z5vxcsebV9pgBQggreHU5qdYb7+PZH5mXHXjY8dgB+bNgb+w7f8+kTRvZb+F8KmQkIVZKN+3fb3tfF2Clp2+t0wrMrltxXmpzIcFMj6AmKcQLuUjCp16GXXhjNj1QfbaGXJAZUoleKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=PGgbFB7M; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="PGgbFB7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777743137; x=1778347937;
	i=markus.stockhausen@gmx.de;
	bh=3hY0ogR0mwclCSsXGM81spPHewQGsWLdAKqGbY+jLgs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PGgbFB7M5vZxwZVzpOPGU9CNyG9TE9hgmjCUTK2V/Lm+T2oieThQjnTLkHs/EQvE
	 bzPCZv50yAWq1KSxu2z2bsXL3Kkh/6EVI9nSdm9vEYTj91VsphpMhsyi46HQtRewB
	 SbiWGUpDpesgCe0mobiAvlM871BnXDBh/EfcSAeTQ3Dry7Jwc8JLEGWLE1ZLieGu5
	 vLhIWQytq5i0Avv8rLyTM174NuiTtN/8rZ2vOJF6pR4vbQ5NyhqPAcL8D8KOBn2Vc
	 edRxWuH0z+EhdyEdLKwfNCEeErx0K8gh9dHT+wblnAfCF0jrqayMpxVZRI1Fs/pkg
	 LSA4nccHW4/FaLn92w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf0K-1vampP2Dti-00at9x; Sat, 02
 May 2026 19:32:17 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Date: Sat,  2 May 2026 19:32:06 +0200
Message-ID: <20260502173207.3567876-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
References: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WXJni6s6THGAKxlIZ2ceKPwd/rikg5NjTon/bh5jTe2yDvpYWWj
 0DTjx2vW+LNtnt/YmTyCms+oDSzOQWZA0TgBIeP9zM+hh/xNhPpah6aNtP/C6hjf6U2B3gs
 IA/LUslqzoTdVYfx39K9DrShGNakGZTX9xxgnKgPQLDp7K+gnseu0IrHNV55lPcGt9Isqlf
 WMpgIk7qynwIuvhy7Ze1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IBfgUJ7JL9s=;hFCQfeIMbLAEXYMkZmcT5Q3zurr
 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
 NP26YgqHTNTPN1g==

The initialization of the AS6200 has two shortcomings

- The device-add-commit states "Conversion mode: continuous" but the
  the lm75_params structure uses set_mask =3D 0x94c0. This activates
  single shot mode (bit 15). According to the datasheet "The device
  features a single shot measurement mode if the device is in sleep
  mode (SM=3D1)". This is quite contradictionary.
- It is the only device that activates polarity active-high (bit 10)

All this is paired with a undefined clear mask bug in function
lm75_write_config() that was introduced with a later refactoring
commit.

[as6200] =3D {
	.config_reg_16bits =3D true,
	.set_mask =3D 0x94C0,
        -> .clr_mask not defined here
	.default_resolution =3D 12,
...
static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
				    u16 clr_mask)
{
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

regmap_update_bits() requires clr_mask to be a superset of set_mask.
So basically all sensors with "wrong" masks like the AS6200 are not
initialized as intended.

Fix that by

- Change the set_mask to 0x10c0 to reflect the current active-low
  setup properly and to drive the sensor in continous mode. This
  takes into account that the config register is little endian and
  the first byte sent to the chip is the LSB.
- Adapt the alarm handling so it can report the alarm correctly
  even if it is high active. This is done by comparing config register
  bit 5 and 10 (translated to 2 and 13).

This commit does not introduce any ABI breakage as the mutliple bugs
effectly drive the AS6200 in standard active-low mode.

Fixes 4b6358e ("hwmon: (lm75) Add AMS AS6200 temperature sensor")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f1a1e5b888f6..7efcef7768cd 100644
=2D-- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -137,7 +137,7 @@ static const struct lm75_params device_params[] =3D {
 	},
 	[as6200] =3D {
 		.config_reg_16bits =3D true,
-		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
+		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */
 		.default_resolution =3D 12,
 		.default_sample_time =3D 125,
 		.num_sample_times =3D 4,
@@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_se=
nsor_types type,
 			switch (data->kind) {
 			case as6200:
 			case tmp112:
-				*val =3D (regval >> 13) & 0x1;
+				*val =3D !!(regval & BIT(13)) =3D=3D !!(regval & BIT(2));
 				break;
 			default:
 				return -EINVAL;
=2D-=20
2.54.0

