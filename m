Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A225A350
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760269435; cv=none; b=m1zsKODc6C1pxGEcfgRcipFoGPsO/ui9aK3yi4JApiQbgNnFyUtu9OJUXU+RLyUuZ2hC/02I2CsS8vOKoi66FYegT1ORdQt7gnZ+FcXM4/FnwGLuxspD0ZnvwnEBdGQyrShGUwyENSz/VodlG5Sx27/7PYhckAEtyn4l+RfSBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760269435; c=relaxed/simple;
	bh=6y/+Ym+lfn1LpRZEISDxrN4k0+KtYrti9fdNPHotsvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uHRntX1Wu/8S2Lc0ose6x/Cx9r1d9CS7jajqMfkS8GLNSo7aDPY6lJg7vnkH9rahpLAC2l8cMzkthLVe0JbVqToASz6edL7aR7Yj+tkhAtKwdhCwnp/3SogQdSSMVU/6BqQyf86gy7NPYqtPtu9Dmi7K5LwQ3N8+nMHczTGvufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1zRWgS4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1zRWgS4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2697051902fso7019505ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760269432; x=1760874232; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USHDG0+JmOBcx0jbr24WMthkctDA2Gayuw3MyojmYCQ=;
        b=l1zRWgS4a7U4xYW+l7OhOONwUslMDXWL74ig+1Nj5YSfBKqt30ToB5nSw7dIHnKUfA
         8bGr3aGntwwmcBQ/oELp4WLqDGvL67wFgyAzr3MEVS6G6o4so+ehCWCkQY4fzfnhHml2
         wb5JERk9v4eBrypHsOm0138HGPLKKHcrGF25qzbeHd7v76hWek3oGaWtt8RO5bpD0NQv
         QDWlWMsx1Lx8/tHgq3bXLqDDoMryqnbMHCm21ipUmKmTxmc/5h3TkPVdqyvoMY5SRNor
         k242dwmcnnZswpYdMn9roxCM2DjrNuu5bFNVzR1huTemxmrJJQMbox05M+kxoKjuN4Yj
         IVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760269432; x=1760874232;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USHDG0+JmOBcx0jbr24WMthkctDA2Gayuw3MyojmYCQ=;
        b=pAYIFxmwQHcqUpSjV0z+a5vWsjVW3lppvILKe2jyAA9kzyt0xCttKZjW3+MWGieAWh
         fxIoOkURbvovXac7v776EriXRzoSNcj6Se7kdmTIlHX0cndrfykQrTqgjDlc8kzop0q/
         9VuOhjJax85z9zjxUiBb0aEko+JjVWGzuB0Rrq7JW3hLZq29gYfKuKYQAAf+Y8Eh6emC
         gsryTpr87N62KqIgolre123EaVBImWsyXkxS9KAWqkQ+IKTjcStMgOB/skovNYOZya3I
         KARX3pEBhZB7WkJt0ch67FBq6M/5p424z7jZalDcm3VqIq+Z2XbLhPpo4Lsc0f6x9PRu
         Fu/w==
X-Gm-Message-State: AOJu0YyCxBv6wqZCXIVG4TU4LriCXQBciwwVXKl6TslvVLH4k2RjrEJz
	omG5hJ8w9dubTRZSy1dgucZ57c78Mpu33KODfXaK6CWs9SsAEP2GmVdh1lFQhj74
X-Gm-Gg: ASbGnctA6ByPB8RcsvgQM8qLUeF3YTktWW7ofUHF+TktQ8iORQhAz3ScN1Rv/ZvJApE
	VW5yxdy1E9OfeFGYYkIDpCk6GzJXetM8Tky1SSkjSFZ2kTYxV+gVtPPEEyEUDb1Lje2aoHibvaz
	qPfLGLjEw+a9iZdfw4Y7p7EInu7OwN7KM51DevhsXYUfJ72oMTGVsBMllVbay+/jgrBKmz7xUNm
	V2KabuIcjMrgUj4ZcjpLdJlYxG0Vu8ga8VbCYmzt+8I20CaLX8cP6M6LKf9VXNIMbGwXwDzMe+9
	8JImWELZide1v5ue9IY3mOYHyiISdlBEY0S0hxlj9cBNv5Vd5HFW8xgctc7WXuc/G5Ci/gL1iBz
	aK9TFwxZD7uGP4ovrPZCgJPJ7qMa/3Grlg4IubcHsxESQj+k8C5x5ySvOtGaT
X-Google-Smtp-Source: AGHT+IGypspxQsTm5Mkv7DMf7X8k8qJOWGtMt9Bw/674OqX23p3nDn2lBbAGZaVVMBIMGceLwJVYEQ==
X-Received: by 2002:a17:902:c40b:b0:267:b312:9cd8 with SMTP id d9443c01a7336-290273038efmr116023985ad.8.1760269432532;
        Sun, 12 Oct 2025 04:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:98:ffd0:f64e:1796:666b:a343])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df2799esm6454765a12.29.2025.10.12.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 04:43:51 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Sun, 12 Oct 2025 17:13:27 +0530
Subject: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF6U62gC/x3M0QpAMBSA4VfRubayI2leRRJzcJLRWQ0t7265/
 C7+P4InYfLQZBGEAns+XILOM7Dr4BZSPCUDFljpQqPan34SDiT9dcim6npEtFgaMgZSdArNfP/
 DtnvfDwQrpJZgAAAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760269428; l=1589;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=6y/+Ym+lfn1LpRZEISDxrN4k0+KtYrti9fdNPHotsvE=;
 b=c32/ZK7DyB+6pjgQZVueqDLfafDQshNuAblaXCyCNg+tKBhX5RvTz3FbAK5Fih8rmsxzW5UIE
 tk3EPXRTEnGAmnat/t6dYfp9H2GaW7t6k2be6+6nAhF9POM4VyLRxCT
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

fix for the smatch errors:
drivers/hwmon/sht3x.c:606 update_interval_write() error: uninitialized symbol 'ret'.

The warning can occur when both the data->mode and mode which is
derived from get_mode_from_update_interval() are zero.
In this case, no i2c command is sent and ret remains undefined
before reaching the coman return path.

When both data->mode and mode are zero, the device remains in
single shot mode and no configuration change is required.
In such cases, it is correct to treat the operation as successful
without issuing any i2c transfer.

To address this, initialize 'ret' to 'SHT3X_CMD_LENGTH'. this makes
the no-operation path return success while keeping the existing error
to all other paths.

This change removes the smatch errors. Tested by compiling.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 drivers/hwmon/sht3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 557ad3e7752a..4b52d57eaad8 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -553,7 +553,7 @@ static int update_interval_read(struct device *dev)
 static int update_interval_write(struct device *dev, int val)
 {
 	u8 mode;
-	int ret;
+	int ret = SHT3X_CMD_LENGTH;
 	const char *command;
 	struct sht3x_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251012-my_driver_work-77b22c239e99

Best regards,
-- 
Ranganath V N <vnranganath.20@gmail.com>

