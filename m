Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB48379EDA
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 04:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786336085; cv=none; b=al4EQmun5TZH6RNOu/RCrxLLF4n2fIdiu6N4t0toKPTKf0L5joJ3yk9Iv0GoygRCuP6kuO81vji41odWwK0f5T/CYg20CeGbAIroZwE1AsM3RmvPWFQZWoU0SY82HyDI7Q+lHPBKGPkK1gRfyDA40DW3H0p4NPSIh4R9EZFh90E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786336085; c=relaxed/simple;
	bh=dQPkDTMmuze2BB03YWJVGmQDQp7RRBBNNh3k1shsgcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=caqXvHSJin16FBF+14EqCilnNjI6gks7994vCKD026PVBAmM2ZuIPjEvtDmQ0OmS1cma/Adei7BXPBm7+q61S2CCIfs8VPi14S7vPo2gdkynyiwybAcc4ex156VLEUOQZkIABHk+dsUxCBZyDRcolw7iUZ85f5IyIhAoC6kTuL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cvonk9WJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cvonk9WJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d0407aedd6so15283745ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336083; x=1786940883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2+mngqpXFB/BdP3WTYNLW4HV2B5Fpn24ngCal9LsJQ=;
        b=Cvonk9WJ8EMy8mlSpxKEX/dhsCFKv2cm+8W9qq+xzAVOqd+Sz9CT7ea37/cNFRjiOE
         8i2aMXkkL2jF3V/+FsdyS7g/gBrpHXdsf/LFTDZbawmEdwjVWdj5MABBXKzn0bbvwmTn
         m3yuu85AHYx2QuzdnHkQ4qlEj5B4u+KHAfuPtTKyv2zVEgCWTJoKXmMMxrcPYnGYYIE3
         Q0W2BEwqdp0WLhQIrB6PvtsMckquX0uFI68Q6MC2nXaqrGKy4ExanLwe9tDIwGnVPmLA
         Ao0teF74S+sYHaCNjStEdbqZS0f2JK034Qvnkg7xySNECPChWwVd7iHi7+1aTXYOIYOY
         QQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336083; x=1786940883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2+mngqpXFB/BdP3WTYNLW4HV2B5Fpn24ngCal9LsJQ=;
        b=FnEmMa0Md0Uk54N99sdBqG9xsME1yf18hguLpE4CKZ5A3fs9hJxVpicJc8Bu0aDK33
         uiRzF3odX1t44rzgE0D+w2zYC3cy+CmWR3o/HeJH5xJlGb83eYHh0M+7cBTSnEcBBEbx
         spkGnf8wLkPQLnLovYatLUzR5v3ugRRVp6uQFzfqIsYQN7XEI8KXZHe7y1rQ7IL9j1mf
         yTwT/GGhtZHficjVNLTEUnuf9O93ZT0iBoJefSDlZDopbrfkVJPXTBq1g0xJbuR30FFS
         xdjIHsOtcNHtwkjoWqG/Rbke5qF9q2ej/kv42cF/w+tPdMBFKQIQwTI3RXe/7qUljj3u
         tC7w==
X-Forwarded-Encrypted: i=1; AHgh+Rp/2tWX09I+7zWz6J9IZmVtahpONEGCTDDR3wKd2N758LoEWGCHzvmLcgxva3FowLLzGBHM0/AYM0y99A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlI5BV9seu7srT3QcO7VAIBN87/knI8bcmpZLeGf1J9gAhtXg6
	Tf9ARyOIw+EXyEIgNruHb/KfFFEmzn2WKOQ8r5xhHcVNaunLcPK8eJ2XJsoBEQ==
X-Gm-Gg: AR+sD13ipQu/lbPS8GH6o8uQbIvsltbXHPo98OzNl9XT4Uz/il9rvgy6BRqq+73TJ5S
	on6uCGNUC+WTNEG/jhvVunaE0N4H0F+iWTE1XavQhTbRVqBP6ICCLRAAXByVLelC93dzNXnC03y
	RJ3y9/iW26EAJHRuAQ0KXKLo+EqHFPwjxUdG+E4n4lR6pNz5XdCLBuVKUFGv5lIpomorw/j08yO
	5dy0EJvbepuFtPRWBUB+aZjTqVnpzWtT12pMq0vmgMZfdE8kYSyFEASlJymg8zA+iZ5kSjutL7H
	HBgscXrUp9iSLL+8A4xPBAKQ0pHtYaH8SBDCPblXK0f453ZZJhkeB9zpQFWKsv4btsNqk9W3ER+
	8REptm7X+RzLGSQJWivCIMlI05pshzsl9eeyEvLyOuafgfTxeJdE3Z6e2Hg0QaDbrj1DGdO2q5e
	/9pRx5M+sHkOrYRfG05On8SewSysRcoKXeiLfcWpOczFYDBML/WEYi1BJHX2ZTSvbUOxNj4pcES
	Yjp4Q==
X-Received: by 2002:a17:903:3848:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d0ca70da11mr486962195ad.8.1786336083184;
        Sun, 09 Aug 2026 21:28:03 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm43312312eec.5.2026.08.09.21.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:28:02 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Vadim Pasternak <vadimp@mellanox.com>,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (max6621) fix temperature clamp range
Date: Mon, 10 Aug 2026 11:27:54 +0700
Message-Id: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX6621_TEMP_INPUT_MIN and MAX6621_TEMP_INPUT_MAX are used to clamp the
writable offset and critical thresholds. They are defined as -127000 and
128000.

The driver decodes the temperature through an s8 and its own comment in
max6621_read() documents an 8-bit two's complement value, whose range is
-128 to +127 degrees C. The current limits therefore reject the valid
-128 degrees C and accept +128 degrees C, which does not fit the 8-bit
range.

Correct the limits to -128000 and 127000.

Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
 - Drop the temperature input change; it was not a bug (temp_input already
   sign-extends correctly via an s8 intermediate).
 - Drop the incorrect changelog reasoning (no "+128 degC", no PECI/16-bit).
 - Split into two patches per review: this one fixes the clamp range; 2/2
   fixes the negative offset/crit reads.
 - No 1/64 degC precision change (not documented in the datasheet).

 drivers/hwmon/max6621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index a7066f3a0bb4..ee5898fbe110 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -17,8 +17,8 @@
 
 #define MAX6621_DRV_NAME		"max6621"
 #define MAX6621_TEMP_INPUT_REG_NUM	9
-#define MAX6621_TEMP_INPUT_MIN		-127000
-#define MAX6621_TEMP_INPUT_MAX		128000
+#define MAX6621_TEMP_INPUT_MIN		-128000
+#define MAX6621_TEMP_INPUT_MAX		127000
 #define MAX6621_TEMP_ALERT_CHAN_SHIFT	1
 
 #define MAX6621_TEMP_S0D0_REG		0x00
-- 
2.25.1

