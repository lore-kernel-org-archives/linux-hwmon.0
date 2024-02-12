Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313A3B18A
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707747237; cv=none; b=Al5WFowLJatWRYJuSs6zNdH3lil0gXc6gnaHR5Qexu7zK2XtqlJhedKd8szAiqIgV9pGFiAxVeKx+xyW9ic+9mWz5JM+q7EQSgpFF8EwqyvTjw8IFeBA6IlpG7S3aEcp0C5VhQzW2bE5eaS5iuSg1VenIp7fuTRcZ/QLWpvSKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707747237; c=relaxed/simple;
	bh=mC7AcTjG9u3fFPvXI+ARhR6y86ivkbhhgJOPf3NtuYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBEUWJOkXDtP7ptBMmmrYgxJmxjL8HTavtsBHWZgOM0N74I6vDgJN8RudNUaZeZDJsvA6sJ+Swkv2tm8Ie8IQYrXfFE0mIwkOiGEj1dhwkfrYhubhx32tabEOIeseR/6Y/EwPsUHOStc5FMTLbrIzF8344D05UEPlPbq45CEFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJOcWlJW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJOcWlJW"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d0cc05abd3so14439201fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 06:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707747233; x=1708352033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xht6NvePqOJDydhmVI9TNROjw/Sto9mlclkyMKPbZxg=;
        b=nJOcWlJWbmCfQpHWFox69vZ1MqHyK0DF30KXBxZnFn38OeZmAtxGvizlB8b7vscOUB
         BTS5E3Edaz6GTOfE4XNTS+K+MKMFrophmoAwIzJbjYUkc6BM32Tksjqpo840oCbyA9AT
         EWTM+wGKDCVYhf2RE3s5lW8PDyTQ3vmtRR8THg9K/ionCeeQP6n84YuQRK1mAcwz2J0M
         ZMF8N3m9wYYJHSQr1ebRm5kNlrucglSKPY7PUOw1R8ykCPptMbH9BDwa41mETO4K92eK
         LFa0GFgf1VPKS+nZaoSIId7fDy0MRJaORlLSvX6Y1Dw0akOSsvBiQ3ylx8NAZf+DjtTY
         EAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747233; x=1708352033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xht6NvePqOJDydhmVI9TNROjw/Sto9mlclkyMKPbZxg=;
        b=Dg6fGF2Xb+Bq7L2bb7dYtgna3xl1uX5EptgQaZGsciIld/3vzZCcrNpuOaBAlmu6Mt
         Lld9bH7+B2W3Qav+TpKauNEKW56Fbnw5p1Ldjip9xz8XW6uu6Xk4uQWoGltSOiuqEpkw
         hq8bJy8ERoO4FAui3VqaB8/WmQ3oR9NOkb/+4Ki1qf5YzrflloIscXYLxBIsShzkixPZ
         r5dJekeRbvg8bpJ0E6CF0QwxtQK9nJWo5+0KgDrV4tKpciP1E9wXyBSPOCGjyM2f7gU1
         Dik5Gw9ILx/vHxqu410uyF0oyBqkW1ik8BwlS1if/Lbdav3zSWA1bttaUEyARPsWdG1i
         5Mtw==
X-Gm-Message-State: AOJu0YyFfWNtdY6EO9LKs2AkucSEZEcMv78S+z3co4q/7OPEHaSpvN26
	IgqgaeSZx5aHKFTsH8pD8QJWeAM5h+5kJLXFvRiZqa6x48JemYH8VDsymuHITEbPnw==
X-Google-Smtp-Source: AGHT+IEH2T5cLKCJV78HynuNbzq3isu3vdFEWWCktmHZ2JNlqRxWl2ggeZz4R+1+cf//h35t+Hmdpw==
X-Received: by 2002:a2e:9517:0:b0:2d0:ec2e:1ec1 with SMTP id f23-20020a2e9517000000b002d0ec2e1ec1mr2847853ljh.0.1707747233025;
        Mon, 12 Feb 2024 06:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV566aUSiySzQ8PT5uAyc3BHTI8W8QpTQwod/KiJpegoaYZ2p01QSPvXU3HPtcw0xIDBAOnB+LyO59GNTKiTNfjw4UqMdD7JmHQs2btgzYLBcR77y6Z37Qsrf3CX/h12moTpaj9vJuvcT44QV+GF9c=
Received: from amezin-laptop.home.arpa ([2a01:5a8:202:11be:42be:cbad:cbf1:a636])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a38a476fc08sm252152eja.87.2024.02.12.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:13:52 -0800 (PST)
From: Aleksandr Mezin <mezin.alexander@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Aleksandr Mezin <mezin.alexander@gmail.com>,
	Jonas Malaco <jonas@protocubo.io>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nzxt-kraken3) Remove buffer_lock
Date: Mon, 12 Feb 2024 16:12:42 +0200
Message-ID: <20240212141311.110808-1-mezin.alexander@gmail.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of pre-allocating a buffer and synchronizing the access to it,
simply allocate memory when needed.

Fewer synchronization primitives, fewer lines of code.

Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
---
 drivers/hwmon/nzxt-kraken3.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index 5806a3f32bcb..1b2aacf9f44c 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -97,7 +97,6 @@ struct kraken3_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
 	struct dentry *debugfs;
-	struct mutex buffer_lock;	/* For locking access to buffer */
 	struct mutex z53_status_request_lock;
 	struct completion fw_version_processed;
 	/*
@@ -109,7 +108,6 @@ struct kraken3_data {
 	/* For locking the above completion */
 	spinlock_t status_completion_lock;
 
-	u8 *buffer;
 	struct kraken3_channel_info channel_info[2];	/* Pump and fan */
 	bool is_device_faulty;
 
@@ -186,13 +184,15 @@ static umode_t kraken3_is_visible(const void *data, enum hwmon_sensor_types type
 static int kraken3_write_expanded(struct kraken3_data *priv, const u8 *cmd, int cmd_length)
 {
 	int ret;
+	u8 *buffer = kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
 
-	mutex_lock(&priv->buffer_lock);
+	if (buffer == NULL)
+		return -ENOMEM;
 
-	memcpy_and_pad(priv->buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
-	ret = hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT_LENGTH);
+	memcpy_and_pad(buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
+	ret = hid_hw_output_report(priv->hdev, buffer, MAX_REPORT_LENGTH);
 
-	mutex_unlock(&priv->buffer_lock);
+	kfree(buffer);
 	return ret;
 }
 
@@ -913,13 +913,6 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 		break;
 	}
 
-	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
-	if (!priv->buffer) {
-		ret = -ENOMEM;
-		goto fail_and_close;
-	}
-
-	mutex_init(&priv->buffer_lock);
 	mutex_init(&priv->z53_status_request_lock);
 	init_completion(&priv->fw_version_processed);
 	init_completion(&priv->status_report_processed);
-- 
2.43.1

