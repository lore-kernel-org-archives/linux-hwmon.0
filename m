Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096102;
	b=HEPnjFbyzVp0sDraLwK27UUO8RQ7RTUzCvGWSGK/I7bKXbfGam6UWPtzJM89dex7OzCg
	 rPWaPE8c9R2hbKk6Hu6Q3Z7ci9M57+F2fWJS9/cCfimRinz1ae98rQKIJox/9Al5tjrX+
	 lBWyjdgHUyeBBNGejKNdOiXlsrsC05xJ0yoLNMcJdsxOHHYKp1SVN9Kwl0TjLQ4GIuRwk
	 5c0XozMtr2WWhEY1oWcrq3f5jXbwhX3KmyOYtyVMSHgZ+DJAzx9DfnEy1BZ0ekJXEjgKV
	 9osfWJL5LAgETbKCQcvTbeEREfXud/pOOvy8cPDo+BTp+YmcwfMyhJijrPQnidNIuAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096102;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=aZnUTpQNkFsJlXp2shkf0v0M5SyauJ+mIjnIg9OuI/w=;
	b=q6mIhA4yf2Hv10xLdF2hwGI5PGDdS6e8izvoTQQyr8dBoeIKmOZtGzDzB9TuJl56phj0
	 r9BRhm/nrOaIHr5N1X6tllGtUNi+LsN0OjD6LppSyW3kjQKnFXfGUCby+324MELbeYCLN
	 0YcvF+Ms6iz5gjUZOTnmJsY2JIPv2dM6H8sMwiRRMfql+ftaOUfwp0ipF1oez8GfU9ayk
	 XPe+5Gvp7hnPmeMb4e3Afcm/ubf4uD3H+9bWm35eB/3HMxS8PhHxiDTUHIEZ0UTImwS0v
	 +UsKxjV/kw3qlgQUZIXPNIOFkfeSTTzTZ04Q4eFDzPMST+zZpIFlbQosA1PqAkjxUyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rCWs87N1;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AB606A326
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 00:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rCWs87N1
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id POXqxgA2W4vCDPqLnxyY1C; Sun, 08 Nov 2026 00:01:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PqLmxcWTnYskhPqLmxipWZ; Sun, 08 Nov 2026 00:01:35 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6aefbbdf
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=CK3eBmDo2CHjdYaiZ6gA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=aZnUTpQNkFsJlXp2shkf0v0M5SyauJ+mIjnIg9OuI/w=; b=rCWs87N1GwPv
	BwCPPPLcIqpgMhv/xE+H6Tg4iWm0ydkSG4ICgfva740SmX1KNSgRhytCngV5ut2HsnoGrTr3jzFDx
	HWCuIXzVy5qAd1F1d104FJxDyQYGpxRqQ1NUGKjfHbKhZpte0QTTvz/dVF3ARZDDesyEmBgO4dUK0
	rjE4jCTyO7eA1NZAghKDY8uUDGk++Pk6oTjCLQu0qa06selxpUWyDqU7cWKVruFXsRcul1yJW9BTD
	In7qDEEfB70v8kipPC3phUxYIWh2xEGYx8AQRAAfAUNG7GLRw+bGnbIf3CDcV7Vh1KLVf8Jb4/Bpp
	3AljxlZg0fO2Wk/FYKPGkA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34072 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPqLm-00000004E0H-1bV2;
	Sun, 08 Nov 2026 05:31:34 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Tomasz Bojanowski <tomasz@bojanowski.me>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (msi_mystic_light) Rearrange code to simplify adding per-board read functions
Date: Sat,  7 Nov 2026 16:01:28 -0800
Message-ID: <20261108000131.1249664-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261108000131.1249664-1-linux@roeck-us.net>
References: <20261108000131.1249664-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPqLm-00000004E0H-1bV2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34072
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOn0doVECjBm0XfnBigjrwobDuLLpCCaHgnE1PQS5zur4UiRmM/Rpf24f1fZFXT1J7sdUSDmPeNHm9V/ZSBQK2IL5zj9UCfXH7IHv2mBpTGoz/3so/ou
 0gMrz9NRypn9LIXJ5ce5QV6afrq067NYhH7Ix0SjNKFrWIRa7NyAIr6uB8kyr1TT4rSojfy2eOdoX3FRCJr3bx7g1xHf3t/Ye1JwEs8g5YI9WqZnNrMbd3n8

Currently, struct msi_ml_board, the per-board channel definitions, and
msi_ml_dmi_table[] are placed at the top of the file ahead of struct
msi_ml_data and the driver's operational functions.

Upcoming support for MSI 500- and 600-series motherboards requires a
board-specific sensor read callback in struct msi_ml_board that takes a
pointer to struct msi_ml_data, as well as referencing board-specific
read functions from the per-board struct msi_ml_board initializers.

Move struct msi_ml_board below struct msi_ml_data, move the static
msi_ml_board pointer above msi_ml_probe(), and relocate the per-board
configuration data and DMI match table to the bottom of the file next
to msi_ml_table[]. This avoids forward declarations of struct
msi_ml_data and the per-board read callbacks in subsequent changes.

No functional change.

Cc: Tomasz Bojanowski <tomasz@bojanowski.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/msi_mystic_light.c | 80 ++++++++++++++++----------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
index a27bb9916588..a008999e7c06 100644
--- a/drivers/hwmon/msi_mystic_light.c
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -44,45 +44,6 @@
 #define MSI_ML_MAX_IN			3
 #define MSI_ML_CACHE_TIME		HZ
 
-struct msi_ml_board {
-	int num_in;
-	const char *const *in_label;
-	/* little endian u16 in mV, offset at most MSI_ML_SENSOR_REPORT_SIZE - 2 */
-	const u8 *in_offset;
-};
-
-/* MAG B850M MORTAR WIFI (MS-7E61) */
-static const char *const msi_ml_7e61_in_label[] = {
-	"CPU 1P8", "CHIP Core", "VDD MISC",
-};
-
-static const u8 msi_ml_7e61_in_offset[] = { 23, 17, 25 };
-
-static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) ==
-	      ARRAY_SIZE(msi_ml_7e61_in_offset));
-static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) <= MSI_ML_MAX_IN);
-
-static const struct msi_ml_board msi_ml_7e61 = {
-	.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
-	.in_label = msi_ml_7e61_in_label,
-	.in_offset = msi_ml_7e61_in_offset,
-};
-
-static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
-			DMI_MATCH(DMI_BOARD_NAME, "MS-7E61"),
-		},
-		.driver_data = (void *)&msi_ml_7e61,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, msi_ml_dmi_table);
-
-/* Board matched by DMI, set once before the HID driver is registered */
-static const struct msi_ml_board *msi_ml_board;
-
 struct msi_ml_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
@@ -93,6 +54,13 @@ struct msi_ml_data {
 	u64 updated;			/* jiffies of the last successful read */
 };
 
+struct msi_ml_board {
+	int num_in;
+	const char *const *in_label;
+	/* little endian u16 in mV, offset at most MSI_ML_SENSOR_REPORT_SIZE - 2 */
+	const u8 *in_offset;
+};
+
 /*
  * Read the sensor report. Called from probe before the hwmon device is
  * registered, and afterwards only from the hwmon read callback, which the
@@ -199,6 +167,9 @@ static const struct hwmon_chip_info msi_ml_chip_info = {
 	.info = msi_ml_info,
 };
 
+/* Board matched by DMI, set once before the HID driver is registered */
+static const struct msi_ml_board *msi_ml_board;
+
 static int msi_ml_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct msi_ml_data *priv;
@@ -285,6 +256,37 @@ static void msi_ml_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
+/* Per-board data */
+
+/* MAG B850M MORTAR WIFI (MS-7E61) */
+static const char *const msi_ml_7e61_in_label[] = {
+	"CPU 1P8", "CHIP Core", "VDD MISC",
+};
+
+static const u8 msi_ml_7e61_in_offset[] = { 23, 17, 25 };
+
+static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) ==
+	      ARRAY_SIZE(msi_ml_7e61_in_offset));
+static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) <= MSI_ML_MAX_IN);
+
+static const struct msi_ml_board msi_ml_7e61 = {
+	.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
+	.in_label = msi_ml_7e61_in_label,
+	.in_offset = msi_ml_7e61_in_offset,
+};
+
+static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-7E61"),
+		},
+		.driver_data = (void *)&msi_ml_7e61,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, msi_ml_dmi_table);
+
 static const struct hid_device_id msi_ml_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB, USB_PRODUCT_ID_MYSTIC_LIGHT) },
 	{ }
-- 
2.45.2

