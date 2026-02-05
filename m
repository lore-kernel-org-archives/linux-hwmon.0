Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4EF38F944
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287399; cv=none; b=aUCCsZGSsUiGLURG3uC/GsylQcany/vsJk06pZtKnB4Yrdp4eEmeyfzYjkOx0cIGGcZhSZ+/Ncto54nOvQOG5gpfjhGbDuefQ/Fj8UnfN5TWUJ678uun5Jz7hqnGtY2dZeZDwtCK6avhmhyCvzZ2AygTb45QkHu92HFUa/Ymxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287399; c=relaxed/simple;
	bh=9Uvgn7wB83wIdJ44vZfC1a6QsqNb41gYdz1rDR5ln50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/ADp0Q0UYUI1Cb0FNzB4oyO6OVdoePkoqQ1bCZTDmc9dEr0Q1uRVddpdKZHbbJfijki0ma1l4piPz/jgetA2mxWvO+0q3twdjgcCdVUzSG2017GQPFw5xO9MaN3izK8d3sqqoevnTFfIDjcIE3BAR4tpd6Xhv/3CoLUs0BH/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMTsEYH5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMTsEYH5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-480706554beso7890175e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770287397; x=1770892197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEdQ0xFhhqTQqO4ph+nQmO3asTf3iBjVYOgorcwP4nc=;
        b=cMTsEYH5ce5KbB+0RB09d6+9qfcxFDfrDd+2tdIIsvmxGK1Dnqm/s7JrckUVzQtOJ0
         3+ueuZmU4WDPo8Gp6yIgxJv3+4+TL4W+8QrvmY8zhGzNizakQ1tbdIETRICtVv9wf8vV
         /6pbks/1lgAPCgyPvE7BFr++Dt9RMfPmDB6YK33GUMsbDUYR9OWgTAOhOWMNpMob6x5u
         NwW1cbrENtYMWgNF9r5CO7+qRgHuWM7Oio1C6ffQ6MfHAU+z62N1dPfaLLjfH2IlQmCa
         aHvskdG7o9GD5rl8rdDE3OT4YoNGoOfQdG45aYMRjdhvfSC+Tpjw+4z0nUnPg8wNrC+V
         wlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287397; x=1770892197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEdQ0xFhhqTQqO4ph+nQmO3asTf3iBjVYOgorcwP4nc=;
        b=YANP4SF0xosU1xz5MAMQgCBB7WBeDVXd9WWmdhD05ASbFo0Oz8DrL69SwWdbXVydD3
         zR9Sg3/Y4g4Q4gJouLJy+hP2aFMHeALBSrpZWNTs0EbZ1NqoQHlIembYt/wD0Rnqxtau
         vCh13kg489lT/bolHYTovGkCN6Mmeh9qQBeKtvJzI3nSU6SZtoItvdlRhc+XKxAmdw8g
         B1D+wZ+BuptSJJtt0Xv/Q9GKeTw2yhcBiZFK5638rQNF5xYey4w18yRMdR76lwkMtfHK
         dAzT/EcmvCEm7coq6ImM00TvDkv4j1VJX3Zxa5NLJ+68V6E/6/UxmMhQA/LQTJphYZci
         rgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXxSL9gxYQQWEmCOKb8pNNN8eKt7XK+FDBJ3ehKTL+Iyn4fOAd6NIoNZBa+6wtMy5wzvGJIArd4mOHupw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrM82COmRptO4+/5KtseLVXW/r2eDuSFkjhhO8NoVLY8bok60t
	7XJEu6NQaXjmLriu/XaxR4DLoCjE3baAjK0DI03Hcfsa2b0tI0iTkXJM
X-Gm-Gg: AZuq6aLZ0b5OQS6lTzIY/Syu0JqcVK+oEkBDI0S3pGeEkSzlLHAynxV3rFSQeRH45kB
	pR6waz2e23KzFCSbx8yK3XR6sNTMXrwMgtqyRqGODPwClMeCcjVb48f00nEt0Q2G9jUgdmzNlKT
	03rzZXo8yOWwOkrXbRX/oJHW/BqJlRY+PDdhtxdCBPOLzh2kChnVeIBv/Fnle2KKaU9iXL4A5rP
	a7DTnK8RtRxUgpk3CAT8T5lZlRGMBs9Ner4byh3A19GPi+C+ADHVZKrKAdz6rComvRHUMq+RLPK
	D7N/GqiIRfMkcet0Qt+c0gFCvyTdmBaKIebIQu3UxnAhBKa08kSz4qZnvw5bpTbFco0H3UgpkN8
	HKGBQqcftA1uB84LCwX1IBX+3p5fDSdF9I7keUF2rHceYecz5FKycDveeKaZlAPD/sISrHHJw/A
	K061G7aLGkxSIMwqAm6V+5WgI3QxFA986f
X-Received: by 2002:a05:600c:6087:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-4830e977f1cmr78474795e9.26.1770287397099;
        Thu, 05 Feb 2026 02:29:57 -0800 (PST)
Received: from localhost.localdomain ([196.191.61.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec4a76esm67876655e9.1.2026.02.05.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:29:56 -0800 (PST)
From: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i2c: i801: Detect SPD Write Disable and expose as adapter quirk
Date: Thu,  5 Feb 2026 13:29:24 +0300
Message-ID: <20260205102942.28745-2-tinsaetadesse2015@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
References: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detect SPD Write Disable in SMBHSTCFG and expose it through
I2C adapter quirk. The I2C client driver may decide whether
SPD write operations are supported without implementing
device-specific policies in the SMBus controller driver.

Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 16 +++++++++++++++-
 include/linux/i2c.h           |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9e1789725edf..d771e9f5f82f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1533,6 +1533,11 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int err, i, bar = SMBBAR;
 	struct i801_priv *priv;
+	struct i2c_adapter_quirks *quirks;
+
+	quirks = devm_kzalloc(&dev->dev, sizeof(*quirks), GFP_KERNEL);
+	if (!quirks)
+		return -ENOMEM;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1600,8 +1605,17 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* Disable SMBus interrupt feature if SMBus using SMI# */
 		priv->features &= ~FEATURE_IRQ;
 	}
-	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+
+	/*
+	 * Detect the SPD Write Disabled status. Mark the adapter
+	 * as unable to perform SPD writes, which allows consuming
+	 * drivers to decide on safe operation.
+	 */
+	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD) {
 		pci_info(dev, "SPD Write Disable is set\n");
+		quirks->flags |= I2C_AQ_SPD_WRITE_DISABLED;
+	}
+	priv->adapter.quirks = quirks;
 
 	/* Clear special mode bits */
 	if (priv->features & (FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER))
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..4b89f0bf62a1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -726,6 +726,9 @@ struct i2c_adapter_quirks {
 /* adapter cannot do repeated START */
 #define I2C_AQ_NO_REP_START		BIT(7)
 
+/* SPD writes are blocked by host controller */
+#define I2C_AQ_SPD_WRITE_DISABLED	BIT(8)
+
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
-- 
2.52.0

