Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2333F591
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737962; cv=none; b=ImUhKm0VkWvTBwDMTDVsXx8llkGxgznGpoleNsbqDcCUKsZOfQgU5wBcJNNK/PB2V3SgdlowuI3Nf6Z7i2rs21lsjx3LLg7ZtOx5PiytzOnGE4XaIOtRp4+7zlXB/fj73E6SgNcVBOfwwNzm4aNG/BXrO/LWmMvESZnxWTk07ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737962; c=relaxed/simple;
	bh=D+LSVPHe/dEP5bbwjvEQ6pvUnQKp6EwbmUTZleEHRWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nx0M6l+7yXxZosD42DeXcWib7cbBjD5tuMmpgpu+NKzY09/xv9RSg1AnqjKlh+kuRLvkua07Ff+eVaDCfUq3fmhJ2EuaiPWMXJa4R5nitjh2Mrbbd1UBrPddSHXmzsQ0flSl1iv7zOfpMxSrVmqfpj4I9PzMYy0/MYl8tSCjiYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=DYwesLTI; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="DYwesLTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777737943; x=1778342743;
	i=markus.stockhausen@gmx.de;
	bh=AFcGp3K4mL93augkhcub4tBLIEczHoHbINXW42o/Lt0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DYwesLTI19FcHCROzHZbg/VJLJFk7tM6ThiARkEsdhtewPyuZOx8vTiqsNUGY9f8
	 GN8+sqQz8sra9rhdOEIA9wi86zVNoAfxUP38xmAqtYt4KnVZRwRpp2CZvRIZS2DX3
	 kT7BIQYxhXpROHIoEbrWqO5Brmn2SBv3HKE7VhMW+YLJMntgd48ZqidXobxCtwJbp
	 SxTqQsc7y4lvL2ufVuxqoTpMGAedmYQxTiSWiE9FiXfOz3rCUWCi2CQZ9H5+5zRgW
	 H1UxQi4SNixVnphawe+PGqcdtA+J4tUNktOLI2dW1IOsUK77NaX60jZJ3s6UhN6IL
	 rP8G0Ws+4uqdjKPm9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1vmoev2en8-00LNBL; Sat, 02
 May 2026 18:05:43 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Date: Sat,  2 May 2026 18:05:32 +0200
Message-ID: <20260502160533.3527619-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502160533.3527619-1-markus.stockhausen@gmx.de>
References: <20260502160533.3527619-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jus/oHj3YddKVa4eIWDNRqRTZ41ValNuWjuQhWfwVFrXmkl21h0
 vpotby0dnBi+vIGbJlCxr/NMJACVR69/c+RvzInstF/6lI9R6lqkqPnPRu4Ifurg/0QJ5qo
 CcR5w1/WM1PnosmQ/EwnMDb87asr5LpvVc9oA1rPO34MFnNLCr2/+iSMPmFq3BB/W/hBpzn
 KIawYgv+vZqDkYFSQG/uQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:llMdlGAFNMY=;SX97Fk0UzHGiuFQeEKa69oXbCnT
 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
 Q9WsjYZZOw47WlA==

The initialization of the AS6200 has two shortcomings

- The device-add-commit states "Conversion mode: continuous" but the
  the lm75_params structure uses set_mask =3D 0x94c0. This activates
  single shot mode (bit 15). According to the datasheet "The device
  features a single shot measurement mode if the device is in sleep
  mode (SM=3D1)". All this is quite contradictionary.
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
index f1a1e5b888f6..724efc0e820a 100644
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
+				*val =3D !!(regval & BIT(13)) !=3D !!(regval & BIT(2));
 				break;
 			default:
 				return -EINVAL;
=2D-=20
2.54.0

