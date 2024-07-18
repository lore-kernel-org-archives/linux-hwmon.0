Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157429CFB
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273984; cv=none; b=t6Bu5Q0uCRnNLbFBHydK/1WD3M5YDfLDopahz/L3nZ5fz6K5r56SbKuqcEJjBDdOhdn5RmqDg1ur7yIkmk76HF7F4pM0037fJZsumJ1wgA4MUaXX6UWl5bARVoQtnFNio9GTaeWBoj75lkibUh0/TFEdT8bOTIKOIuLTlSAGMEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273984; c=relaxed/simple;
	bh=kXuVsiUcHiRrUPXOfDzsst+Aune/F/C5lJ9RZ1R/TwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ViiIU5tATONyyfht8JEV4ISEA27jpF4uAzgmiBARZ1d1XanAz8IdkqI4Fxix74OouYYqdQhD4/iAslTGg79Tftq525tO5NNMo17hnEAtCqXGk0E3khv64NyW8hD6a3g7VeyT8yJ3irvHq81TlxaPGPFliws5gs9wrs+VxfLUb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLvnN8gG; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLvnN8gG"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5c6924f2383so134422eaf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273982; x=1721878782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfwGsHdrUqlbm7Vhok1OoEqQT4Awjff9BELZTJX76ew=;
        b=kLvnN8gGeENg1xwxlmIfgYYOXbro0ZNN5x7jCvcuFPNyH/CDnUtMNRCzAb+arJ2v9g
         oANPhLz0uEt/3Qlk5WXbi5BBWZcfQSSgYI7HgQk8MSaSpTM+KY6yCAQHnVa0GDfdCVI9
         Fy1jKuhAvP7Kjdv3zoGn/A+wujzzbj2DKAbMkiSKIdBpaBFlDmWZxvuKl+fazR0HXaFe
         VG0eonT2iR8C5w1PcdtSTGVY1vm73jX3vioOMCXA7YilDBYLC2ViIA+f66ycwId1rBGq
         6V2/1a1S8Z+EGU96EyDLIiDENCDGGuQVAu6PSQ/OA0spGEs8AVE+/8TtvUZBcIBQgZND
         sBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273982; x=1721878782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfwGsHdrUqlbm7Vhok1OoEqQT4Awjff9BELZTJX76ew=;
        b=tehQdODw/Fm5jmrp7mhin7bSVLuKbiYRWTvus/nXctwbsCK08/I/f6XeezPsRlH1XQ
         1QgnJemR7O6Q8anJ6l5pC/OgIH51J8ffmEF8LPwxgpmGAcr2qxuMqZYSn9as8CrHZtsI
         pVhqfNPQQfJLvI93XrS1278zKtE2as6+H6gC9ck3frepy+plBTdVFfAgMP0ZsC+f8MYB
         ggtUrRl0AdgBD5SdhTG9FN1rGTBL5nsu6kW+q5BIAE66PCTEYC4Xk9gTBrHFYVKpWf+h
         aYmeYsVpTRa8T2Ung/NkdisilQwrNpERRDUCmbvdfQt7LHgeEjHxnK0iQuGVZxSB7wFy
         mrDA==
X-Gm-Message-State: AOJu0YwLcvXWVvttEe6QFaw1FHD8Tif73u48y/ZjVKihlErP6jouTkHN
	PQq4jMFruDtdOWiqicFIVe/aFuupMlR2usqiQYt0yi01jamub2LoKjQxRQ==
X-Google-Smtp-Source: AGHT+IHXWXiAziHSpWbNjEtMPkVSawI31pd9klAtNwtjzycZ2zWGZ2GZQPrNfLyd9PHWDPq4JsY0Tg==
X-Received: by 2002:a4a:ee95:0:b0:5c6:5cc9:bf29 with SMTP id 006d021491bc7-5d41bd339cfmr3722450eaf.5.1721273982027;
        Wed, 17 Jul 2024 20:39:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d7b15sm6989147a12.72.2024.07.17.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (lm95234) Use find_closest to find matching update interval
Date: Wed, 17 Jul 2024 20:39:31 -0700
Message-Id: <20240718033935.205185-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use find_closest() instead of manually coding it to find best update
interval.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 0c509eed6a01..a36fa7824da8 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/sysfs.h>
+#include <linux/util_macros.h>
 
 #define DRVNAME "lm95234"
 
@@ -471,10 +472,7 @@ static ssize_t update_interval_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	for (regval = 0; regval < 3; regval++) {
-		if (val <= update_intervals[regval])
-			break;
-	}
+	regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
 
 	mutex_lock(&data->update_lock);
 	data->interval = msecs_to_jiffies(update_intervals[regval]);
-- 
2.39.2

