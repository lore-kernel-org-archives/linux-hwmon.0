Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E111732E692
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479919; cv=none; b=nSh8MSkJ7NMv6mh/voMdd52n77YBpTKJlvYb2EDQyuZM0JMcxGum87PhCzj/UCAlDOMChcxZRH/6zp2hmg/Xf6+9G2Kau/8kOntkUjIXG/RrcjqdN96EFYfRigfZEUOVrCsCTLa/9rQqEJJOxe+fU/Tg8x3KDxPnB0l9+DFCIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479919; c=relaxed/simple;
	bh=VWqeliWRKDYgrptYCxz69DGwzJopAIYL3u7Smcs5Y/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh3Vmrf1YtDl8OH7B34DVNdNnQ2oMJorlTvHq+EPNCo3j1u0Rln/hx3Nh+z/dlmaPzCbJ6k95rLATjrHQNKinSSSQYN03kvvpK5mEUyMAyRdBvHyL5wfu6O8cxkA89obp174GEsu4APapNziTtDEtQeIjsvexTmPw8ethk5GRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcrJ37Zq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcrJ37Zq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so161128a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479917; x=1784084717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QitdplAOPU/W89k9UDkY0039UmyNc4JVGp4EPHi5ZRs=;
        b=lcrJ37ZqCz8zzzDUQVsqisZGTJ1AqU2/gBYcCMKeLgGqpzSkqK02NL2ZeqggiwfqtT
         XIZ/mIMusIRdA2ZlRO5FSYY/3aC9cYCRLCgjyvlOrbAKwIN/tNsqlBcYabDJHkjPM/Sj
         kmTXeDQxNA1y1S0ZNBvrD27lVx5RjLSW3fRsYhgvM4zxAfN5cvIAeekNDQhfSL8qHMbY
         Rou1S6JuQM4OTmC8sVwe6XcYP4GLUxDj+bqOIG6R9ElGgVNClsgiJNR2q/AaIuyRa6+8
         4Th0oPS0zLiZxJ1cyiUCen6HZvumvDfZY+HBqHIHNj0ZqNQUnUJ56vXoN6x9siGIh+5/
         zC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479917; x=1784084717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QitdplAOPU/W89k9UDkY0039UmyNc4JVGp4EPHi5ZRs=;
        b=juUvZgNv0mOsRyZhLiRWK3JFOB/AD4jKG0VoUIVB029MKiJR7u1Ao8Y4EHMigm6MHd
         SgkjmxUbFZc3Gey5EX8VnRXpj3LuRRMi6BT+F5mawLpZN6nv0CssKwIg/85ESsmUDkQ8
         MZ+Eleynk8Izs4dFcNTq7MncV+o/PsjLh+108cPoM9lsB5xVHqBHYCDn9ZuInSsAQ3GR
         7hjE2BEyPkUs3HLREyKitQMS9VevdVJ70w9ebiMqhBCUDrc8Riu8f3eUONH0X6Wuxf8g
         BfOY5r/15vkljrbRSH2oYK+Y9ZUqAfE3bGt9JbQFW5R0Ae6QUfFisNO+6h7xBaKLongs
         obDg==
X-Gm-Message-State: AOJu0YycyaSHFZ/k4I//6cVXjX3qCzFDPduhR4vw+R9Ud33q4v7fJvF3
	6T9jgkyO5ygNysBcvkiAI8HLa9EfBcnnPaKE+9wnk6acnCeU1FWwI5842zxfHQ==
X-Gm-Gg: AfdE7cmRutrE7T2kB/PAM62Kqe70CgMkQ7Poh59Bhlu8KFemXRoDEquDDx1aIywPUhY
	rCi0ZBr8RjoH7OxnG0SYTGk7ZDgYO50N/GRe8kyauNNWjSOahPFPBlyXGC72VPz1Qxd4ldxshQU
	AIUA9f5FXv1iKMrerYo0YnYVO+4bi+RU+MdPZhWsWpVRLHaNWoaTCwYsFUzc823ozrY2g5eAktc
	ySMAUEly0iDTx30SNPYoNDbthsbmX3EWTX9PmRUB7hwq4+020bRYwLPFr2zxckMB18fLHg/YuTv
	GypvertfLolbPaPEsj2ynj4X+/i7mvVE8OmNCOQBjMMgXZwqpGlUeAN0MNznnySuVxw7tI+jU8r
	RN8dMxAWUl9e3nr3+pGFLfcLM/T+56/+UfevNkx3UTLNyAmNDWy55pNOJfPU7UjEeVfc9E2kqSq
	JPSp5CUNMBdH+6nI0Vw7LI8sv7BA==
X-Received: by 2002:a17:90b:2fcb:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-387d880ac25mr5700328a91.11.1783479917105;
        Tue, 07 Jul 2026 20:05:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm3721164eec.9.2026.07.07.20.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:05:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 4/4] hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 20:05:07 -0700
Message-ID: <20260708030507.227193-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708030507.227193-1-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
the driver probe function. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: f3b4b146eb107 ("hwmon: Add driver for NZXT Kraken X and Z series AIO CPU coolers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Call hid_device_io_stop() only if hid_device_io_start() has been called

 drivers/hwmon/nzxt-kraken3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index d00409bcab93..05525406c5fb 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -948,7 +948,7 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	ret = kraken3_init_device(hdev);
 	if (ret < 0) {
 		hid_err(hdev, "device init failed with %d\n", ret);
-		goto fail_and_close;
+		goto fail_and_stop_io;
 	}
 
 	ret = kraken3_get_fw_ver(hdev);
@@ -960,13 +960,15 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	if (IS_ERR(priv->hwmon_dev)) {
 		ret = PTR_ERR(priv->hwmon_dev);
 		hid_err(hdev, "hwmon registration failed with %d\n", ret);
-		goto fail_and_close;
+		goto fail_and_stop_io;
 	}
 
 	kraken3_debugfs_init(priv, device_name);
 
 	return 0;
 
+fail_and_stop_io:
+	hid_device_io_stop(hdev);
 fail_and_close:
 	hid_hw_close(hdev);
 fail_and_stop:
-- 
2.45.2

