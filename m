Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AFD3D5231
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148804; cv=none; b=e7TruCMzX+BEpk9ubvFkxdhyD5P+PfflQqBeaNrOROj9jpmqsfMEXXVQTVR6LZPJvnvHYCa2CoJ1MpYUH3OtAyQkQumcO0n0u6plJTDtDT/skDeAviaOL8uJzEZlT6maxZ2fjjQDYp9CpXBU+uYe0fCpE0VytOJTk7nvzlfn+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148804; c=relaxed/simple;
	bh=k4GyIjdLbYgaUSdzQuPr/Z0UMqJ70IDsVBrK35Vp1n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYAJ5UCnI2yLMttQlIV/XUHTLGSBZ/y6NvqiyFdwYMgDjI9uYdS4CmHVKet1BEXqTfbWchPsBLeOELGRntv2b/FWaEheUq5/mneg3RarqlrbkeGeMvTJQ6DAcoXkjaoD8UKfPyrAm+YwkdvpaUouBqFbo66JNrnQYQIfONxP8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a38Q85rs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a38Q85rs"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-835399c11e0so235908b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2026 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148800; x=1778753600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy+ItK45HyR1sGSCwF/1GxRLdvnupH/Yv9vU0vjlJL0=;
        b=a38Q85rs02MMW6z2x+MSkYGyytmO2Vm95yBvUTq0H2V5z152fHixYOqnld6MLeo9mo
         PV3ROwMMKnlF0NngQSnopt18YSHKC9HsYBhYYTbBr/3I0N2vDSaD7smxrrURjhGSbD4K
         Ndvc2xwULJ76ZGx+zlTWXQ81ttiFk8yGAwSTkSuAtIGbiSUBm9OrjH90W+er+V+fPfm6
         ogTKywO7A3EcnufNSIT4DntzFNP5ft1AB07EcjT3jzaUFy4V4WyMPuBa/wxowL0ZJ2QR
         fcYgBg9smhMCKnNERMuPMXDuLcgCkfRNtI16vFMlBcLAlLZAuKSj+iWnQ/ftlPwz2rVh
         2zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148800; x=1778753600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dy+ItK45HyR1sGSCwF/1GxRLdvnupH/Yv9vU0vjlJL0=;
        b=avJbbOzqOaxhl6BZpLaIFvT8ORhF95MKLCHw1e34aaNhqGqWHY4geL22/4WCn6wX43
         tOOyHmXWpNp5jHUG7TwZb0MLiG5SPIm0e6Bj0ofs+mUsqhigcUmbPkwPh00X7rYxPrmS
         M9saJRj+QmWR5SRE3bWIlRCnLo2b1cuG/5czGQWw45GqjEsb+Xg/cn3R6NinAeTeB9pm
         h9aCLS3VKwyAmJ3dqD3ru/ODuT5xlC7ZxwP3cWCEEbinv03Yl3fiPemz6wHxHPVeKF9w
         sxRxtt/+71Y1efzB9fXOSTmca+A+ggL4TibfXZsuV07yisVz5Ah2fIWMc/omzJa8WDKD
         GCqQ==
X-Gm-Message-State: AOJu0YxfrWushNy+Hzm+2mJdvbz9Ww88mju397sgq0kTZnVfYHxLNsMh
	X7MczVKFSYpVMyE73SlR1y7y7nUSSx2vO0mg442Q8PFMCv5D7EuJGhtX
X-Gm-Gg: AeBDiesZczg5ZUa3QIAojyg6G8wcTio0GmcMUiLQCNGRKXsgkz5DJIeWVKOsnwzjLLY
	Of9X6kQEexLydLAsLOpVLDcMr5TCZF3FPW39TRn62d50WFSSTeXm6tkOoU/m3biZ9DzrgPsci0B
	O4eZWmBhQNv6jc1DQvLF3rmUlhFzXAVcWUVYam/fsm8alSFYeOjur0kr575ozpFs7tUx9VM4b39
	Si4VfccR07/y4OvqkWWzs3GUJZjdPikTxMv1AYzNOTTnAVkN796XW0/8Ca//N+DoyxSLQ0gEso8
	WcOLZPilixJpkUolpd8VTbkhe8brKhvEyoN/8A2/zjB7kCEsCqMQtjUu1XpnNgS2Hn7qw+aHLJm
	JppzqTYCfMFjiQy3vz2iq29ZXEvtPDP1nas5fyfUJItHxPGWRoJd+pxnIGUk0cn2ynGObNBFtfS
	vAwuBAeFN5sak/wImZWejmyUp4D50swx13jnFNE/qdpuxYSQRGRNWqKwD2PGmmr/13wf/AdNA+M
	QhA0y2H5BZBPK4sQKs3A5NvWCKBHA==
X-Received: by 2002:a05:6a00:4516:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83a5b2d2c8cmr6536577b3a.1.1778148799952;
        Thu, 07 May 2026 03:13:19 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:19 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 3/3] hwmon: lm93: Remove else blocks after break or return for consistency
Date: Thu,  7 May 2026 15:41:43 +0530
Message-ID: <20260507101143.559475-4-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by removing multiple else blocks after break
or return statement to follow latest kernel code style.
Compiled the file and verified the changes. No functional changes are made.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/hwmon/lm93.c | 39 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 1a3b5da924b2..ddc4c4377128 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -403,10 +403,9 @@ static u8 LM93_IN_REL_TO_REG(unsigned int val, int upper, int vid)
 	if (upper) {
 		uv_offset = clamp_val(uv_offset, 12500, 200000);
 		return (u8)((uv_offset /  12500 - 1) << 4);
-	} else {
-		uv_offset = clamp_val(uv_offset, -400000, -25000);
-		return (u8)((uv_offset / -25000 - 1) << 0);
 	}
+	uv_offset = clamp_val(uv_offset, -400000, -25000);
+	return (u8)((uv_offset / -25000 - 1) << 0);
 }
 
 /*
@@ -811,15 +810,12 @@ static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		value = i2c_smbus_read_byte_data(client, reg);
-		if (value >= 0) {
+		if (value >= 0)
 			return value;
-		} else {
-			dev_warn(&client->dev,
+		dev_warn(&client->dev,
 				 "lm93: read byte data failed, address 0x%02x.\n",
 				 reg);
-			mdelay(i + 3);
-		}
-
+		mdelay(i + 3);
 	}
 
 	/* <TODO> what to return in case of error? */
@@ -849,15 +845,12 @@ static u16 lm93_read_word(struct i2c_client *client, u8 reg)
 	/* retry in case of read errors */
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		value = i2c_smbus_read_word_data(client, reg);
-		if (value >= 0) {
+		if (value >= 0)
 			return value;
-		} else {
-			dev_warn(&client->dev,
-				 "lm93: read word data failed, address 0x%02x.\n",
-				 reg);
-			mdelay(i + 3);
-		}
-
+		dev_warn(&client->dev,
+			 "lm93: read word data failed, address 0x%02x.\n",
+			 reg);
+		mdelay(i + 3);
 	}
 
 	/* <TODO> what to return in case of error? */
@@ -895,14 +888,12 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 		result = i2c_smbus_read_block_data(client,
 			lm93_block_read_cmds[fbn].cmd, lm93_block_buffer);
 
-		if (result == lm93_block_read_cmds[fbn].len) {
+		if (result == lm93_block_read_cmds[fbn].len)
 			break;
-		} else {
-			dev_warn(&client->dev,
-				 "lm93: block read data failed, command 0x%02x.\n",
-				 lm93_block_read_cmds[fbn].cmd);
-			mdelay(i + 3);
-		}
+		dev_warn(&client->dev,
+			 "lm93: block read data failed, command 0x%02x.\n",
+			 lm93_block_read_cmds[fbn].cmd);
+		mdelay(i + 3);
 	}
 
 	if (result == lm93_block_read_cmds[fbn].len) {
-- 
2.54.0

