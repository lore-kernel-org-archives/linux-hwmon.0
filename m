Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D61D2B2A
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Dec 2024 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648954; cv=none; b=kEsTWtOvvr9n5Xls1ZN5C73dxEdp9jj2vr/5E/UWHe2+5JPid78mUhMh7OraZdnarNaFTUkzLz9ULnSUwtnTX91otIVE7m7NmAWjmpGAPI7o2o+9Kd9SYFLkq9fO2wfHyhb84ugvOBbZlrdZ/HtCD2KXR6u3ydRSnciASHXrcwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648954; c=relaxed/simple;
	bh=fRaBiCoerYtSXXFqhmhM8BO1GEchg6Xp0E+QB3DJQ7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AViTQjqq0/EvPmwoFO4w0+jo6FWB2MYmJdk69JcIrkn+OfkDPcupjc8RjYBKzfN/uAFlJBmpK1Klg6BsrWU4JFN3ACFLzF8sDqvrXXVseL6oVTgVvJ1OD3uRjTKB2lH2Pj8pI5sNMdkq+1N4y65lGg9tMjI3v9gclZ6ks7yvXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MgBBkrgO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MgBBkrgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PltsfRgtPshB11QnLxkk5tBvWzyj5OepdzLg0lgkrMg=; b=MgBBkr
	gOafqD55q41NXV3mUTZ2ktb7zze4pdzooD21gDjZ2i70dsPq/AWa6RDrHy6rFLEj
	T23rchTdUAzXNpQg4lFVPlzpuSyc5G5HbuMW+Vi7G/7FNCds1NrIkk6u9+oajBqh
	T70wRmJvkAVf71G/G2EExzC/mP1Ykv/xyHsWyLYlydDr0jO598tBJN1PukT/QaVj
	8FRHUowzH//pAn5On1LtSiZl0dS8B7jm7ua24tful/qd7LkOfVps/G06U+QgSVKC
	cL2+02qMmriS+5Lkllc0gLpoZw1noRTu51DwqKiTjLmC0cFT2Vi2JAHbGvDwPM2R
	r4F+OG2pQWqxbEDw==
Received: (qmail 826593 invoked from network); 19 Dec 2024 23:55:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:48 +0100
X-UD-Smtp-Session: l3s3148p1@X1Rhbqcp+KgujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 1/5] hwmon: (lm75) simplify lm75_write_config()
Date: Thu, 19 Dec 2024 23:55:23 +0100
Message-ID: <20241219225522.3490-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous refactoring, it is now possible to make
lm75_write_config() a simple inline function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/lm75.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index b8889392d5da..b03e760cf3a1 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -340,17 +340,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 	return ((temp >> (16 - resolution)) * 1000) >> (resolution - 8);
 }
 
-static int lm75_write_config(struct lm75_data *data, u16 set_mask,
-			     u16 clr_mask)
+static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
+				    u16 clr_mask)
 {
-	int err;
-
-	err = regmap_update_bits(data->regmap, LM75_REG_CONF,
-				 clr_mask | LM75_SHUTDOWN, set_mask);
-	if (err)
-		return err;
-
-	return 0;
+	return regmap_update_bits(data->regmap, LM75_REG_CONF,
+				  clr_mask | LM75_SHUTDOWN, set_mask);
 }
 
 static irqreturn_t lm75_alarm_handler(int irq, void *private)
-- 
2.45.2

