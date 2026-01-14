Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9C3AE6FC
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428763; cv=none; b=HaUBX2D7ZVAxWSCjMzju1TdEi4WzEjfx5EmKrxOUwdNJsuBV3FKQjR43iUxpnadEwPrZ6gvRNPlmu6OUQAtEVKOC0I9yV2V4LFRC2usTfSJ3w2aKRHAyOJ5icA3f7Xmm911v/8zmgGVqyDoThfBggJkDJTb4Q3eoCGLZki+SS+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428763; c=relaxed/simple;
	bh=HcuqsBAtZvOWyIs4Xt0uhzuCiOOW+T+QxtanzaAEL14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlbFss3nQDkfSU3Tnt4jM4zN61FhnI8CdEqIiUB+YAQE/r9k6FPGOHCg0/C7pAmeNrfgDjAyfrnQ661gNiiZINWS3BO+gtMmyGr31yxxsGicOEXlOkAZp1sLSgp2XZiryzOYQVvF1hSDQX/scVf71E7r1eD5p1IFOKKTB1duFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=JvK+Vr+B; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="JvK+Vr+B"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so1795905e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428738; x=1769033538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9JJU809fV3hatrHlPxX8QZ9hS3VlNGwjApCyrU92DA=;
        b=JvK+Vr+BbahaQVDnNmy06A3QitSf6QvFTk92pcdPV5x1VMLpV+X934MoHhJCi1HU9R
         yBL9TDz9HocPqBzBex7RkkZyqw0Zeb3hrAStbYr+JONNWRX85quTtsddiSalx3MShbES
         Aw1prFRcl9AvRGNumHe26IvI04Ch5mJHexL12NkOxeB7JLibL+ED1vcBR1ZxDrc0D5RN
         r8HDDm3BiVgQeIFxxMRP0SzeApf1HKzYt7KIPCZqUyOaXWjTaRfTepUnievVM1kcmuxO
         hTv5h7fm2s2NHNTKtIVpHyvpJwoQJBA09nrDU4XcYXIbs+fomudMhTOA4yHXOHvhvH+U
         67Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428738; x=1769033538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B9JJU809fV3hatrHlPxX8QZ9hS3VlNGwjApCyrU92DA=;
        b=aQ543oY5qgE/tgcBdWYKud5BFEDGejs7TGJdA7k7CbMZHfNcsmrGRQ3ETJmkBHSHgP
         Acv5ovdkwmDcYywriSvBzC8S3uS2FLTZ/sw6pYeUtIx5VPmNsAmas4y1W+MIq6bdsfwa
         l4wr/9FFpOa3J/2lMWd25OSB3XOdiGTHZvYuJ7keOBD7oNJgNd7aBePhqYw2YXU7Hyug
         teHisM49+nbcz9On9JEQxM4Y9jj1XNBncmFmjjld/Twg2fBD9R0pw/8bzpOhkGsjSNC+
         oMERFbOesiNu5dwhFBhB0OKMB0ufHuo7PDbkGVxW48YnnJH9y23yfKc78Aa4A/rgztN+
         DfQw==
X-Gm-Message-State: AOJu0YwK0v2TRLopGjliijfTn9b0TpgxIYLn9rV9XY4LDY2sVxQyRu8X
	wHpxE3f1Seke4akpFHy2f2IIwrc9b684XXlVStko1a1DKZvv4TgB65Zfx9sU/8e0Jw==
X-Gm-Gg: AY/fxX6ta+uJPxJ6ljSICCAc+AlfaXBub9w8AAzMSJ+OoWP+xKmJbUkBlTMOOmyLnjW
	51bid5NQMIgr8i4vFtB2/2K0BDbx+8iern3EgjP+fIDT4ZOJeuCkNK8oyWaLO7rXFG4lpifMH2v
	luMcVPElKSlG3ADEsg18kUC4PX3tlXTlLzEJTW+hd0OmR6jZuoJOGqPmsFXDuAE1WXE1N1XD7Ir
	J+PQSz38qYJNjfZSSU5ko/AIb99AerfEAIH9e9tEOuupBGTzmZ6ND4N7/jl0Jl6n2Koz+JffdlS
	55GmNF0gD5YhE459M52+MaWy3OZorI40Diyu2uUtG7oE9KbH2TnlUo9jfRvWoYWB/EstcqwPq+p
	7BCulZSrb/rZg09oKVJffjF46KvH9/PNUpqS1kH8EjK34TU0U1RkdvVZiE+qceTGwAbnl0qUrge
	V+obQxXAEd4no7ZhGB7SiFxbxbzg/+eUdDqdcu3pnZ8AoRYCxPzWWhqmZGotzNrFjozVxCyTXvO
	EbomY1fI0eMClz0SQ==
X-Received: by 2002:a05:600c:a318:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-47ee9528812mr13358225e9.2.1768428737713;
        Wed, 14 Jan 2026 14:12:17 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:17 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 4/5] hwmon: it87: add IT8613E identification
Date: Wed, 14 Jan 2026 23:12:09 +0100
Message-ID: <20260114221210.98071-5-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114221210.98071-1-yahoo@perenite.com>
References: <20260114221210.98071-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teach the Super I/O probe path to recognize IT8613E and advertise
its model name in the supported device list.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 368ae68ace15..4453bf3e8ef4 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -35,6 +35,7 @@
  *            IT8790E  Super I/O chip w/LPC interface
  *            IT8792E  Super I/O chip w/LPC interface
  *            IT87952E  Super I/O chip w/LPC interface
+ *            IT8613E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -64,7 +65,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it87952 };
+	     it8792, it8603, it8613, it8620, it8622, it8628, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -158,6 +159,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8786E_DEVID 0x8786
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
+#define IT8613E_DEVID 0x8613
 #define IT8620E_DEVID 0x8620
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
@@ -547,6 +549,10 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -2988,6 +2994,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
-- 
2.50.1 (Apple Git-155)

