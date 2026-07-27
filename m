Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46413D3D12
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186302; cv=none; b=NVsq+XFHwZbZc+CCXf1PeJrSYeRYdOktEEu256+yc4d1UsH4x+rZ6Hnhucz9TlDpZcjI3Sz7jjMcGPWAdAKIFUue1wgIdVtHt9hqKZqbapmDevEB5Y3V82AhNZSKXHEqqcojYBuVsd0W9krc6zOXYdeMRbHyMduhZgGllk3RUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186302; c=relaxed/simple;
	bh=5sF7IaITESstGESmCc5t0mkfMsKpJpuCXOZ4dd8H0R4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZdKThPh1tdbAE/ZsESZG3qot4HLR8cJUl54wMpc1YIGhQLoLB3mVooJTy55cxIs1epCTi1U5cWZLMx3tPq8iaRpSUGIqIwNSc0+Wi7+MUIFi9ef/5qFehXlghNLuoKY31FGpnWeHv1YUtQuk8I8DdgL7mPB4ou3TDrI/ZavZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOMM3e5B; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOMM3e5B"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc891373e0so33015865ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785186300; x=1785791100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwQkHN8rr1w+zDHOu7u6Aq0DUSGPoAVOg0UR2uWtfcw=;
        b=sOMM3e5BdRqKh3LuwesCLZPQj78ix8fyN+O1cQ569Qxq7GiZqEfaJUsWt0llAqxktm
         c0OfFbu7gUifgVos/F0cQPntNZQwFd8v7sb0kvNFvy2Gap28KtFR4s9dPeMOAc/QEpnJ
         /PCh/kGLeh/SAQ8Lnrw+D5o8anbaVi35A3ixidtdkk/uNCXZNAKL3xZe8R0CQ/MRb6/p
         FGAUh/gJBpH2YpnkOEZMZ+FDJCLskx4iXxoq2oJFviKuD4RRiDRUjcbmt9W2QGc8A550
         Kmr4KQPYsPCx6S3o01sDZ9CjOj/HP3SFWuouuaDsLQwOclz//3s1n4na44Hism1jifuT
         zb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785186300; x=1785791100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwQkHN8rr1w+zDHOu7u6Aq0DUSGPoAVOg0UR2uWtfcw=;
        b=Ueqzh5XVVGtt+sNlC06x7EysCSitTRBWDFZwelnAwmWUM6WHn+vdpSZ3tUfEr4jryu
         xadHm+UEN/PL9Prqxp355mDfaK8j1SkJ2gDnzm7JEefH1tZVCBBuFnQnzq+Lien28U9T
         K+hZ4423rF/ED94HJy8UZZzMqx6xPF0kYqbXgc6Hua7q1q3eoiXa4M230RiqCZpLI+0i
         7umQuud+pdxPMdmUyZQqfh0MUqZX4iT7I8aVdK4NyKkYmF5/u+sNBcycv9CwGzpgFRD/
         E2HhwRJXJliaXiU27hx8PP/VzbMQzin+3PnPKfqg4DoMuRa5OuNRgy3L7abjR0aNXnQo
         nJXw==
X-Gm-Message-State: AOJu0YyJ6pD7jpj3rmd61zuEN+b5cN1kaUGxU204dYDXlOj3CZPP/wn8
	5P2bDLMSdy4dQE3zdWC1o1DoezEFIh0taCMJfac35ys6YxNdZi7Kbsyb/zP74A==
X-Gm-Gg: AR+sD10iq7hmZ/m26h5LSHgTPRm7kv+lTp7rmZSSj5DGM3+BYQQzp6jxkJB6aGEIasD
	1tF14EjwybiplxmnwcxAGUFsJZ9+2wbry67Epgpxgtb5g19178pV5HCPIfYBjHuHEG9cKzczqzY
	7pKDYHPApMAlvvrkiCrcXQXNl+V/3h4vAuuAuGvgXnN2EadG04Ot2AOhqNIFh0qated2h+gFO8d
	NUW59piMDZtGPYTKdiCDo7Xhn0Df0BJsiiDkwErAkH33eTjyTg1x+jpzMz5xq6VlnN+BZ5cKZP1
	DxFJbpj7LRf/fLxqqqRWXc17X/losPM/hIN+GxgiYUsi457bYZT7BZ4xtufmzpKuQk3e8hnkAEr
	QCXlfHowQURwN+S+eeBvcbIft6SNusaVUI5Ro4oCq2/fdHvQI2Sge59Y8dHStU/l1uzREjo2TBn
	q7VWSeQvr3fxsj1xA=
X-Received: by 2002:a17:902:e550:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d00f30976fmr8757865ad.11.1785186300227;
        Mon, 27 Jul 2026 14:05:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d4a06sm41028385ad.55.2026.07.27.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:04:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] hwmon: (lm63) Mask PWM frequency multiplier to supported bits
Date: Mon, 27 Jul 2026 14:04:57 -0700
Message-ID: <20260727210457.3720204-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko is concerned that reading a PWM frequency multiplier outside
the supported range of [1, 31] might result in bad PWM values written
to the chip. Technically, the chip should never return a value with
the upper 3 bits set, so this should never happen. However, it is
unknown if there are LM63 variants where the upper bits of the register
can be written.

Mask the register value read from the chip to only accept the lower 5 bit
when reading it from the chip to avoid the problem.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Note: The patch does not take error returns from I2C operations into
      account. This is an overall driver problem.
      Fixing it would require a separate patch or patch series.

v2: Use mask instead of clamp, assuming that the upper 3 bits, is set,
    will never report a frequency multiplier.

 drivers/hwmon/lm63.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index e2a429e579ac..da09770c05e7 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -247,8 +247,7 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 					LM63_REG_TACH_LIMIT_MSB) << 8);
 		}
 
-		data->pwm1_freq = i2c_smbus_read_byte_data(client,
-				  LM63_REG_PWM_FREQ);
+		data->pwm1_freq = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ) & 0x1f;
 		if (data->pwm1_freq == 0)
 			data->pwm1_freq = 1;
 		data->pwm1[0] = i2c_smbus_read_byte_data(client,
@@ -1187,7 +1186,7 @@ static void lm63_init_client(struct lm63_data *data)
 		data->config |= 0x04;
 
 	/* We may need pwm1_freq before ever updating the client data */
-	data->pwm1_freq = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
+	data->pwm1_freq = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ) & 0x1f;
 	if (data->pwm1_freq == 0)
 		data->pwm1_freq = 1;
 
-- 
2.45.2

