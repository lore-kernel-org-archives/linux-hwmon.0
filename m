Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1742F6577
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156923; cv=none; b=siSJuEDMC40QperYsUBteMg8pZlmmAnjnHFRX5HdUGZq45E58vy9ag23k/tDqnMOYH9c30LrBfBX2vw+u2JtD2wUTqtCAn6vPQpWOrZooTo/9KUilH1R0sPZIoPhWjkMHiU+2fe4GhDT3k4Z1/sbux3Jg5jrAX7FtlL+lsr8gs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156923; c=relaxed/simple;
	bh=L4kL5o/oz/ZwLjXTVU0YF5qcPaE7w/++rP/T3RPOGS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cmq5cRRKEZztuoGKR6oCwq2ND0nnjv7FJxwINItiqB/3slJ6ScaOI/1WdYK5ToLuArW+5IW9oWuLQ0SjEiEUay34UmjsEqPJj2aVe2QBlUMCw7zPCGjDZEd1JZfqrwzjP1LMkUg5YhFFZdKUoh5lIIGtX/5cmS2GrbjMiedt2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7f71Krv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7f71Krv"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36da8439078so6591739a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 22:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781156922; x=1781761722; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5Sa6lwamErg7RVi2/BVH5UkfKKJ9lz7Kg4ImI/QUpw=;
        b=r7f71Krvvc2Ha6XjqhgTEoBZczVjsQiIgWXwc3QIo7E407vs23QuZ0IZ5O61dDOXP2
         4awFfAZlRJIU6F4fglrgqSfKou9/wnBreD4FS0yEs+NcIj3PVyZTbvwBpS1mfdrL7j8O
         Ylb8uqMxMKuRoDusLIDAdqmntCtlTdF3Yn8YcWK7HCHwJCGxRnoSIa35qWDafB9esURi
         YfRN6Q21T/71m485PvvjmW63MP4b/k5pCP0egDsltnD7uTUdJdRLowRAgOcZRC0B3FLf
         9k9qZBZySpJxE2HpjYek5HPFuCVCkbKx51hShnScjgA4SUD52RFSUwLYW0EcUZi8i0oc
         Xn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156922; x=1781761722;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Sa6lwamErg7RVi2/BVH5UkfKKJ9lz7Kg4ImI/QUpw=;
        b=Ej5XKIpy6Pw6l3lqAn81DEs7LWkxTKCzs042vza1ysKja2ZLP0lpvhfl71gB7IfKmX
         PTt4rr8dR80z2vhBllpww56exxFPO2hQxDwIOcV2IvTbAWMH7U3VJY+33sXhBbfyDG2r
         6HpCcdEyMwTmb8Lfz3U3V1tY//VFeOXEeBAv0YnLxNq19FJtM7eAdDo5kZSG6e+dnMSg
         A/rxxj/bZz7uaiHS8Z6ilf9K2TRPgKg5SXMVy6Qo34TsEKm9ZjBM35R2nbIHB5d8hs2T
         BjGKa5D2ULzzkYEycx+apx2UfH8qX62NjbPngZcCyUBpIQQPRMWASYBmL0G89UzFeFG9
         hTMw==
X-Gm-Message-State: AOJu0Yyqrs1otaJ7unZlet3pBqBaNj+Gxn9zr1XmO/VJGm5mGznidCyQ
	H4NKNtJaqUwRcR6Mln/H3wE+Y8FPVx64ykmFvucNUaE6c95pa5mvQsi3qsQgIA==
X-Gm-Gg: Acq92OGSq9x0WJVqVWDYTi3e+xoxRMhCPOSfSS8Fhb2zpQq7byYKABK83QJZG0rfwpC
	GZNpY2ZClg6b0Onlpjg/yP4hZi8/fhmsF/Lz5EVexBz4LMcfp8AxwxDs6Fu1el8rLx6siYDVYGd
	0ivkxocsyUw12DkO5HPp9621/x5HUum1uKs9byg9A7Hf0e94epm3gUbciKTknQjCk9/ZBsY8ZKO
	rPEc7rwQwqZfRxFCo13QJ5LxAyKb3t7bFQwaTqfVAZHhKqhjYMsytCNZJLNtqyotcQ+BFeZFApS
	YcTKPumNcHtyzSUbuSiG3c92IwHsL5EshcG4mLxEY1bnmSF4NjPasxo5V3wr2HQUxSoTGWDEofP
	Kd7nGBFRmdEy8PkuxKzClTtgLgEpdutk/IEx43Y4pHGwfD2bF3V1ydAzlVjItAVUNuDxT4uOEbe
	khraQ6/7Ui56yOw2X+NImFfHCHRSVRenfl5WK7Qg76NZ80Ue45P572SW+KB6SNTgrSGDgpH2P1G
	a5R
X-Received: by 2002:a17:90b:1c85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-377a76c0b9emr1583767a91.14.1781156921995;
        Wed, 10 Jun 2026 22:48:41 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm1314733a91.11.2026.06.10.22.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:48:41 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 11 Jun 2026 13:46:18 +0800
Subject: [PATCH v3] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKlLKmoC/32NwQ7CIBAFf6XhLAao0NaT/2E8UFgUY1sFipqm/
 y7UizHG42zezkzIg7Pg0baYkINovR36BOWqQOok+yNgqxMjRpggghJ86RgnQmDtbASHjX1gCZu
 S86oyCihKj1cH6bxI94c3+7E9gwrZlBcn68Pgnks10rz7G4gUU2xM05ZNI6hkcncbZR9kuK/V0
 KHciOzTQn9aWLJwzepa0JboGr4s8zy/AKsaOk0PAQAA
X-Change-ID: 20260610-lm25066-driver-fix-ae435577fce1
To: Guenter Roeck <linux@roeck-us.net>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@qunatatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781156919; l=4147;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=L4kL5o/oz/ZwLjXTVU0YF5qcPaE7w/++rP/T3RPOGS0=;
 b=VqDOdnykBufBIuRKohSZ/VWeoW2qNpZnjw6ZOoQAIdqJI44mSFrHHOgjFBu5uOE5k03eapbiB
 g5/4B54jHMLC+jw/PVrXpzPu1RVuHjgoW34IK63LSpXyZseGX/egduD
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Swap the high setting and low setting coefficients in the lm25066_coeff
table for LM5064, LM5066, and LM5066i. The coefficients were previously
mapped incorrectly, resulting in inverted current and power scaling.

Additionally, dynamically assign the exponent (R) registers inside the
probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
exponent is applied (e.g., for LM25056, high setting power exponent
is -4, but low setting power exponent is -3).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v3:
- change signed-off consistent with email sender
- Link to v2: https://patch.msgid.link/20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com

Changes in v2:
- based on comment in v1, only swap the coefficients setting for LM5064/5066/5066i
- Link to v1: https://patch.msgid.link/20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com
---
 drivers/hwmon/pmbus/lm25066.c | 54 ++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..6e23ada64e2f 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -132,23 +132,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10742,
-			.b = 1552,
+			.m = 5456,
+			.b = 2118,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5456,
-			.b = 2118,
+			.m = 10742,
+			.b = 1552,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = 8524,
+			.m = 612,
+			.b = 11202,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 612,
-			.b = 11202,
+			.m = 1204,
+			.b = 8524,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -167,23 +167,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10753,
-			.b = -1200,
+			.m = 5405,
+			.b = -600,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5405,
-			.b = -600,
+			.m = 10753,
+			.b = -1200,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = -6000,
+			.m = 605,
+			.b = -8000,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 605,
-			.b = -8000,
+			.m = 1204,
+			.b = -6000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -202,23 +202,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 15076,
-			.b = -504,
+			.m = 7645,
+			.b = 100,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 7645,
-			.b = 100,
+			.m = 15076,
+			.b = -504,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1701,
-			.b = -4000,
+			.m = 861,
+			.b = -965,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 861,
-			.b = -965,
+			.m = 1701,
+			.b = -4000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -519,18 +519,20 @@ static int lm25066_probe(struct i2c_client *client)
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	if (config & LM25066_DEV_SETUP_CL) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER_L].R;
 	} else {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	}
 
 	/*

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260610-lm25066-driver-fix-ae435577fce1

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

