Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73CF309F00
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894974; cv=none; b=fQcDwCuuq4FdKbe6iKZiPbXnCNuNk8VMeErJX7Lllep4VbBljXV/gADli7Zeo9U52Y8ilycXb6AFTjEQn4trfWxnGNcp9YT3/8gX+P+urTshsBk2ctrWL07Arzxgzs8Houwr4zszSA/C5dR2bPilJEmT5amr116B1tY0GQgD+Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894974; c=relaxed/simple;
	bh=29D32qBpnqYOQi+eeGuZ9IeyQ7szkSEijvwc7WkdGJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hA1a6T05ZKryPJGg4cgEx/Xoz4eJCnZCEBHE19d80dPRrR3M7IeZ+0gIZnGc/u732xu41jyXACNN7lHbes41QohnqSPfo+Due2Iy4FfIis0qChXBJk1ECE48xWctnsYzFf0lE27pzylw+787lYPaGPMjxytIEN3CzOHzq5zP6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=euIsNroo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="euIsNroo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so75201015e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779894967; x=1780499767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPX/rAxkQXzz52fOkI04CG2IknB3Ap0Go8VyLZNzT00=;
        b=euIsNroo7Gah3YuJBWGAbuwra2+RtzafZ+FUdgDUFgzXJ+53f27H18Lgc85Luv5ZRM
         GxheC71cT5dnIuojPYZm8OMpbGRJo217AxSsRMuJVsaiHE1CtcFp0gCqapTRePHRnc3q
         +4WPWAC7k3AE7//ZM7Q79fLetpW5GK2wVNxxThaVe2ZxEk5lvVswB5FHdLwN9KF5kJu0
         0BGV7xg/Z/o+tD8lfjnBdvND6R+YYcMvHoqoFNH4EKXuYbMMMicPMQD/3FikW197rtWe
         kVJyE/W1cyKKIkegKYiRMQTDS2dRybwKqrEcZMSVmy+mIkDYAptptZtJBTh6F4Y0llxo
         QB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894967; x=1780499767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPX/rAxkQXzz52fOkI04CG2IknB3Ap0Go8VyLZNzT00=;
        b=CV+Q/D2046TLOUmeWfcs2YixiH7aBD+buDx3R+wBcRxLie/KJm8g/KKaB0syC4NZZB
         fzh+/0/i+dRJud8r95+WwXM+rPHUiwI1tVs+xWWzXCkBVK0Ki51tyYOFD5oufTt3MOPi
         Z0fo4uFOWbvymdDzUjObx2VG7CkRKs0ZHWwHQBf8ULHfaylMAlIghscCl5IIHct4Mt0a
         C2tIYiUPxxtASIYTPWGyWjyTkmpbEznsvqfoQqdmUO/o6QonNSUmRy7NdmJ0r6edkURc
         yv34Qpgp1JCzTAlkB2TMj1B0JQ+PAVWfbfGmdpa19zkLU6GMbfNtN1+9LcYcHgMS9G6o
         gF1g==
X-Gm-Message-State: AOJu0YxqZejB1W9sbN1+27xR2QSC8bZQauhJyC2Ti6ZYHK0rPC8st4DW
	pnmXYCEwK+KmMXJsfigVb+7rfvDPDCciGbeCUWNJV3uy/jaECDh8T10DVa1zR7ScMfk=
X-Gm-Gg: Acq92OHHANCF1r8VBXO7Wo0duNLcquqsZdzIysF+UZRI+o23B+nJNnMR8zEQjJy6wyj
	4rQ9EJKTypRTpYN1nJU5H5wNeahqUaODUd8rXb7+BFIe5oRf8vqUSiu9JWQ0jv/Sok790FY6Q3R
	tBs4bHmBCK5TdEVH890Rpt/lwBFOakGGSuPM7UvkEQ7D0Zz+zaly5QlfZkDeimLIeI+CmWLvmUT
	gQMuKmP5nlnVBFu47CUYrgnM1JE3wrVOCnuueEZwHGzjwb6WkKfqcy3zkKYoVeNIGlX00Szi9/B
	TDIaKZeyMZf1koWnQPDAx/XWV+u1dhKD436vzsUzRzNykUKP6wDt+Tqe/pkKmSxls3cwzUmTlp4
	cCqglwItsxp3az9rR+Z58SXGXySAuKTI62N0TeFpsGrXDIIa9Ol1UuPw6/M9fcgteyxx/FU4EF1
	j/FKKkteWk1gKmwZVmM3JcSsLSbft7V0caeIgSGXYdp39rUqcT2WtlcyZURR99jEAdhoM6mci47
	jMYoA4O/J/gb8fz+FU9eMVDrp6LCSjvb56S
X-Received: by 2002:a05:600c:3f0d:b0:490:845d:652d with SMTP id 5b1f17b1804b1-490845d65b8mr40121085e9.15.1779894967414;
        Wed, 27 May 2026 08:16:07 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490809cf24csm26428925e9.6.2026.05.27.08.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:16:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] hwmon: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 17:15:53 +0200
Message-ID:  <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3958; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=29D32qBpnqYOQi+eeGuZ9IeyQ7szkSEijvwc7WkdGJ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwqt/T9yfpqY78VVZHzt93cSKOea7Vmtx+38g kWKWAR9HtOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcKrQAKCRCPgPtYfRL+ TuvRB/9Y4NJ52JLZS0zkY1IYnZsbShttDJqAfX4KWgzSlSmbx9MvHSwKCVesuB03cbWk2ayOyhq 0mzT+eKEtZtjdWpPA7zf4UU+wTjylBZKu4Q2/usHgVZgzna7Mbt+fJIfxTw+/2vJX1KZIQtG03C 2nixze7PSZydG3iIXgEiPAENUO+NaKH4j8UX3of1kBTvWCAf82Jpraiii44FhGVnbYUShv2ixnC 05WoOV+LlHpqAdnvYXgiNrju5dDbxhUqTr2IfHEsMUpg8gKpatKJlWPey/0b9iHNuq5csHF/Dq+ lGZDtIIuPVYp2S1OPe1hgY7wq6i72/o/IzZnwvN+I6CtfHu2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/max197.c         |  4 ++--
 drivers/hwmon/ntc_thermistor.c | 24 ++++++++++++------------
 drivers/hwmon/sht15.c          | 10 +++++-----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/max197.c b/drivers/hwmon/max197.c
index f0048ff37607..9b6ab050db1b 100644
--- a/drivers/hwmon/max197.c
+++ b/drivers/hwmon/max197.c
@@ -321,8 +321,8 @@ static void max197_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max197_device_ids[] = {
-	{ "max197", max197 },
-	{ "max199", max199 },
+	{ .name = "max197", .driver_data = max197 },
+	{ .name = "max199", .driver_data = max199 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max197_device_ids);
diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index d6b48178343d..6f82a6c49393 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -52,18 +52,18 @@ enum {
 };
 
 static const struct platform_device_id ntc_thermistor_id[] = {
-	[NTC_B57330V2103]     = { "b57330v2103",     TYPE_B57330V2103 },
-	[NTC_B57891S0103]     = { "b57891s0103",     TYPE_B57891S0103 },
-	[NTC_NCP03WB473]      = { "ncp03wb473",      TYPE_NCPXXWB473 },
-	[NTC_NCP03WF104]      = { "ncp03wf104",      TYPE_NCPXXWF104 },
-	[NTC_NCP15WB473]      = { "ncp15wb473",      TYPE_NCPXXWB473 },
-	[NTC_NCP15WL333]      = { "ncp15wl333",      TYPE_NCPXXWL333 },
-	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
-	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
-	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
-	[NTC_SSG1404001221]   = { "ssg1404_001221",  TYPE_NCPXXWB473 },
-	[NTC_NCP18WM474]      = { "ncp18wm474",      TYPE_NCPXXWM474 },
-	[NTC_LAST]            = { },
+	[NTC_B57330V2103]     = { .name = "b57330v2103",    .driver_data = TYPE_B57330V2103 },
+	[NTC_B57891S0103]     = { .name = "b57891s0103",    .driver_data = TYPE_B57891S0103 },
+	[NTC_NCP03WB473]      = { .name = "ncp03wb473",     .driver_data = TYPE_NCPXXWB473 },
+	[NTC_NCP03WF104]      = { .name = "ncp03wf104",     .driver_data = TYPE_NCPXXWF104 },
+	[NTC_NCP15WB473]      = { .name = "ncp15wb473",     .driver_data = TYPE_NCPXXWB473 },
+	[NTC_NCP15WL333]      = { .name = "ncp15wl333",     .driver_data = TYPE_NCPXXWL333 },
+	[NTC_NCP15XH103]      = { .name = "ncp15xh103",     .driver_data = TYPE_NCPXXXH103 },
+	[NTC_NCP18WB473]      = { .name = "ncp18wb473",     .driver_data = TYPE_NCPXXWB473 },
+	[NTC_NCP21WB473]      = { .name = "ncp21wb473",     .driver_data = TYPE_NCPXXWB473 },
+	[NTC_SSG1404001221]   = { .name = "ssg1404_001221", .driver_data = TYPE_NCPXXWB473 },
+	[NTC_NCP18WM474]      = { .name = "ncp18wm474",     .driver_data = TYPE_NCPXXWM474 },
+	[NTC_LAST]            = { }
 };
 MODULE_DEVICE_TABLE(platform, ntc_thermistor_id);
 
diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 3d55047e9baf..101cebbe68e4 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -1036,11 +1036,11 @@ static void sht15_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sht15_device_ids[] = {
-	{ "sht10", sht10 },
-	{ "sht11", sht11 },
-	{ "sht15", sht15 },
-	{ "sht71", sht71 },
-	{ "sht75", sht75 },
+	{ .name = "sht10", .driver_data = sht10 },
+	{ .name = "sht11", .driver_data = sht11 },
+	{ .name = "sht15", .driver_data = sht15 },
+	{ .name = "sht71", .driver_data = sht71 },
+	{ .name = "sht75", .driver_data = sht75 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sht15_device_ids);
-- 
2.47.3

