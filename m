Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87542D73B5;
	Thu, 30 Jul 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424369; cv=none; b=pTkZDFl1s72zOmxsSFjlrEpPXpvRxPjH85ziu1tZ5C1ujvuBF5qnm6jrNr3U/iDuCyqr+MomEnazYzXywUuczen6WHX6gRJV8IfYeRXyGqp6FXSmmtpzWJbfURuRArgd4UNWxOzXGLmRUDgCQbrqKd7WFde1gkmVfYc8D16M0Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424369; c=relaxed/simple;
	bh=L5XSaYOhdejSoz76IR/R5EeYVplaZBH2lJwRxX+3PgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dQz+ky/vuQryNUcNRKO0OGC3m18w3xipwimFCw/pWYO7jdw054N6QzCdY7bkt0PWHp7hxtC+Ov8o8d1rSohvwI7WnFFRbD1UAKx0/QI8WE+9++jKT8ONP9qf3MaG0zA489LgMv8pd/EU2SmcrVlcg09H+kgluxboSUbvytsylAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ioH1+3DH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ioH1+3DH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785424365;
	bh=L5XSaYOhdejSoz76IR/R5EeYVplaZBH2lJwRxX+3PgY=;
	h=From:Date:Subject:To:Cc:From;
	b=ioH1+3DHeuAALrSwooGp7Jka2TJq0Bmcwn0y+RQvIuxj8tzvrmePP5esADvrF18CC
	 4EimlMoVWrUtTuE/FryhWsY/QkzYkC4s1woabvDskP+aomi0XTDmsVMTBltjPufGxx
	 Ml3zDCOof/hinkg3woHgQaelD9hDGTaubNOP6iyA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 30 Jul 2026 17:12:26 +0200
Subject: [PATCH v3] hwmon: (cros_ec) Avoid threshold temperature conversion
 overflows
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBBFr2K6dkyZoqIr72GMkXawNUq1A0VDu
 LuAJi6Mcfkm/78/rWAKjlisJ60IFB07X/agphOh7aE8EjjTs0CJC7lQEnTwvCcNtrn4EnykUJx
 9A1Jlic7mcmUKJfryNVDh7qN4u3sx1/mJdDXY3olAt7pfrD4x67jy4TG+E5Ph+nc5JiBBGSRtF
 OWywE1Djpm1re2spEoM3ogf1xKzny6EBAymhKmRyxXmX66u6575lXVpNAEAAA==
X-Change-ID: 20260630-cros_ec-hwmon-overflow-0381c8509df3
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785424364; l=2019;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=L5XSaYOhdejSoz76IR/R5EeYVplaZBH2lJwRxX+3PgY=;
 b=29uMmMUHhfMALjXLYtMol+rBzrQILaR4/xi+bGYL4zI5+AeIu0x36ZzPIFqjvdbIXQR/wJ71I
 8m8v892Y5bGCIgy7VKToP5VlbgMqoEO3zBBVUSQxv+Zp3Pn//+wGXVK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If the EC returns non-sensical values the temperature conversions might
overflow on 32-bit systems.

As these values wouldn't make sense, clamp them to 255 degrees celsius.
The machine would die before reaching that limit anyways.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/lkml/0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Drop the overflow handling and instead clamp the value sent by the EC
- Link to v2: https://patch.msgid.link/20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net

Changes in v2:
- Drop already applied patch 1.
- Also handle overflow of u32 -> long.
- Clarify commit message wrt compiler optimizations.
- Use __always_inline over __flatten to allow the compiler to optimize
  away more unnecessary overflow checks.
- Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
---
 drivers/hwmon/cros_ec_hwmon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 1337b646e022..27af13f0941c 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -236,8 +236,13 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
 								cros_ec_hwmon_attr_to_thres(attr),
 								&threshold);
-			if (ret == 0)
-				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
+			if (ret == 0) {
+				/* Limit to sensible, non-overflowing values. */
+				if (threshold > 255 + 273)
+					*val = 255000;
+				else
+					*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
+			}
 		}
 	}
 

---
base-commit: 8a98254c65f629dcdc50a1046f58c5c87c72ef67
change-id: 20260630-cros_ec-hwmon-overflow-0381c8509df3

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

