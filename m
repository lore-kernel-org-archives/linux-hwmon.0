Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771D17A922
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721995654; cv=none; b=hwYT7ma28WmLpeDnndyRhKuv819c4BMypklS/BtVorSiYudcnRQrD7h/WWBDJDiuGeGvYu4lH76N+sTG17HkuPGnj4kM2yEYUo4Sl+INIFUeaImDuhiYOfIsfDokofmqJCngvr+usTLsYLpVh7swkHyjRhJI1jAUBp3bbNextns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721995654; c=relaxed/simple;
	bh=kuQqge5toYsnzhVmeRz7AnfOcT06x8LhGKUIuvkWHiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CtYPKoGGhIrO6kA7W5yml0BV77tlf6z/hJH2dnVTgQv+BSHDxhvesuuZ9XhvrfLCO+igz+94eTshGenuwPfdPOb03aGpJ5iOEAlYewsxUxDD0c1Q/bcAdXF3QDqKF+7pXBQcqTkruJom+7LT0az8vof4o9kGvEct8hC7qxfh+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHb7IWXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHb7IWXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B029AC32782;
	Fri, 26 Jul 2024 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721995653;
	bh=kuQqge5toYsnzhVmeRz7AnfOcT06x8LhGKUIuvkWHiY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QHb7IWXZ7fUdtEr1/rc8VApIsOWnswic57p7JRQ746kUrSw8tqb1MAHHN/Ero/ofw
	 hridNllz8v37Wjrh7sUZWEIOT5uiRK8Dip3V0pl9KI63MJTsp+2TRb6439VRemqY9I
	 IHLcjkRSH9eHu3BNRqvDik4Uw762a0sN3BbsoD9MHNq1aGzFhDufs6bCa/fynYjhro
	 +Q5Rtuys8QRlEwpj/XUKAMgObyjiUF5ZUN7rMAge0xM9SX04vKPV3PrMgqFzZrGxcp
	 aSzgh+mwRCyC6dh75f4f17leyThE1heu+Pco87iQpCeWUQwBTel3LcmZPQsad9YjdT
	 mowyJl/ENBulg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B05C3DA7F;
	Fri, 26 Jul 2024 12:07:33 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 26 Jul 2024 14:07:33 +0200
Subject: [PATCH] hwmon: ltc2947: move to firmware agnostic API
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240726-dev-hwmon-ltc6947-fw-agnostic-v1-1-f7d6cab7d438@analog.com>
X-B4-Tracking: v=1; b=H4sIAISRo2YC/x3MQQqAIBAAwK/Enlso06K+Eh1C11ooDY0Kwr8nH
 ecyL0QKTBGG4oVAF0f2LqMuC9Dr7BZCNtkgKiGrTrRo6ML13r3D7dRtLzu0N86L8/FkjbqWfaO
 IlDIK8nEEsvz8/zil9AE+AsT+bwAAAA==
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721995652; l=2700;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=eHEIw/BFCLR3h2Cjnfq7/AwNP2mxs1wE4zIYao0bqAM=;
 b=h8f8UOeiF7FPrCtPK1LKztf2a9WF0sORR+X5LuPzTUw0QvrSFQ6uJ+cB5XM3XkwInxWiek9g3
 l1WRgGeUWstA9zwOceF7g4YX56cK8+JO5X8jR9fodJ24NgLxGIAx+F8
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Use the device property APIs so the driver does not depend on OF to
work.

While at it, properly include mod_devicetable for struct of_device_id
and fix some parameter alignment in the changed places.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/hwmon/ltc2947-core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index d2ff6e700770d..244839167e51c 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -11,7 +11,8 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "ltc2947.h"
@@ -1034,9 +1035,8 @@ static int ltc2947_setup(struct ltc2947_data *st)
 		/* 19.89E-6 * 10E9 */
 		st->lsb_energy = 19890;
 	}
-	ret = of_property_read_u32_array(st->dev->of_node,
-					 "adi,accumulator-ctl-pol", accum,
-					  ARRAY_SIZE(accum));
+	ret = device_property_read_u32_array(st->dev, "adi,accumulator-ctl-pol",
+					     accum, ARRAY_SIZE(accum));
 	if (!ret) {
 		u32 accum_reg = LTC2947_ACCUM_POL_1(accum[0]) |
 				LTC2947_ACCUM_POL_2(accum[1]);
@@ -1045,9 +1045,9 @@ static int ltc2947_setup(struct ltc2947_data *st)
 		if (ret)
 			return ret;
 	}
-	ret = of_property_read_u32(st->dev->of_node,
-				   "adi,accumulation-deadband-microamp",
-				   &deadband);
+	ret = device_property_read_u32(st->dev,
+				       "adi,accumulation-deadband-microamp",
+				       &deadband);
 	if (!ret) {
 		/* the LSB is the same as the current, so 3mA */
 		ret = regmap_write(st->map, LTC2947_REG_ACCUM_DEADBAND,
@@ -1056,7 +1056,7 @@ static int ltc2947_setup(struct ltc2947_data *st)
 			return ret;
 	}
 	/* check gpio cfg */
-	ret = of_property_read_u32(st->dev->of_node, "adi,gpio-out-pol", &pol);
+	ret = device_property_read_u32(st->dev, "adi,gpio-out-pol", &pol);
 	if (!ret) {
 		/* setup GPIO as output */
 		u32 gpio_ctl = LTC2947_GPIO_EN(1) | LTC2947_GPIO_FAN_EN(1) |
@@ -1067,8 +1067,8 @@ static int ltc2947_setup(struct ltc2947_data *st)
 		if (ret)
 			return ret;
 	}
-	ret = of_property_read_u32_array(st->dev->of_node, "adi,gpio-in-accum",
-					 accum, ARRAY_SIZE(accum));
+	ret = device_property_read_u32_array(st->dev, "adi,gpio-in-accum",
+					     accum, ARRAY_SIZE(accum));
 	if (!ret) {
 		/*
 		 * Setup the accum options. The gpioctl is already defined as

---
base-commit: 1ea3fd1eb9869fcdcbc9c68f9728bfc47b9503f1
change-id: 20240726-dev-hwmon-ltc6947-fw-agnostic-c14935ee55d5
--

Thanks!
- Nuno Sá


