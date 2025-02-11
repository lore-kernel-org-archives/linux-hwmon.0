Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A4253F09
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289181; cv=none; b=PHnP0+RBb9EVGl3Hb7tFXkcEXnjSNORouVdUkGWu9sfTynWUZt0aE6Xe/srnZV/0axYx3fMZ/B18klgwyb/9lhYM/PBI+CCQWiXu5njcPsWZSKahCnlRkId6Ddf2xJJJi/NQ9cQkpWKu2vbBaOZj8lwCDHeuB+KkBrz+sLXDIaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289181; c=relaxed/simple;
	bh=9TAhblHUf19WWcrTx4thdvfqQC1xuDKGrt9h50Lplwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7Vg7tWK3fN5to00hIxWKcGAm+mPfuqxJe3GZIThlBzWFpAZ5qt8yMl/BLn8rrdHU99eBE6tZn5TZZ7NYQEiIi12zbZD02kWeSGFkhEAbwFkfAfoxc+6EaXH9+CA/IIzP6gBc5GYS8mYceFugVvp+h3K2TDqY1t/MogHI6m3Mro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcRQJHMK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcRQJHMK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21c2f1b610dso139430695ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289179; x=1739893979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4uwK3zgkOgZBJZqsrCjAZlHOEdEzMZJOcg4UjIAi6U=;
        b=IcRQJHMK58uXaqkgkQALlhgb+jGcKSykj3O0TpuAW0nmJyc6JOkbhFZeB3VdHn7FDD
         nrJTp4qdkuR0LQEsLSTXB7/7RF24T/52NfHrdtYcCbWJIA3aGE58QpxTtC4gGDR+HS7y
         4UwcUG5zASU8LlptBKuLXohycQooJL8PZMUFrh+GkYgbXbKAqJjUtaYct+PAspLRruzO
         nIdNkm31dQ/GMTYICLKnPzYHSrnOw6fn59n0upVCMJHZ53y3p4/ux7cUxxWJZyCx1T5g
         03SEUZxUsu8HOHrHpAZ1HU8M+kqiZRi11Y+7R/AsSdheypypu+2jRw2JpUdkIuSNaSyC
         igkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289179; x=1739893979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4uwK3zgkOgZBJZqsrCjAZlHOEdEzMZJOcg4UjIAi6U=;
        b=AVJbJqe03Op3DYeKvmEL6Axz0acJFs1iY8WNnMaW8UmEkzuV5DsJ8zu81ybp2NRui2
         JhZayN9xKNiQ5u+u15ubfN5C9y+MW4LDQ2FvnjaE6W0o9J456Ms+PIrBOFN0aezX82b7
         6i83MmM0SsxGfmf/9YTCMwikUZqsA7Hg8efY3r/qyqyHPfNQA4z8jLytGpkzS3jHYcHh
         Yzv/idZWUv/Zn1QXh+1JuDfSM3tdy+9vs6ai9TmTBuBTGM5z+VR2U1nIMOpOhryw0t2b
         wQG3aujGMLuFrErGcOF38vHq2z5OaxXvrGoZHWb+n+uBMOKaLokq+uIcZvf4pBG49/5n
         De+w==
X-Gm-Message-State: AOJu0Yw0AXpr7BMwGPs87BuKF5RT/nBqKE+huxq+fZxmPoboC0ZgTDXG
	W3TGCwOVAH5cj9LqocsG01xv68Q262DcqWGGbpJ47WVXdAy5bYMNYrVnDw==
X-Gm-Gg: ASbGncv29svEpp+kZczNkl4JBCB5g146sH97r1E0vheZlwzz9AA4Ds+bGqZsePrUaV/
	eQXqgolI7+yEHbsn03HNQ9tmIlH1VTx8fqTGhcFDS8GjFrhz4GwEhJ9cKp1/zvz95qaP4bSKFFC
	wx77uG0vUpIbtT7lBLBsM/Q2EWqFm67oidBBrOvMQ6YM5vE2sXUX2/c9Tj/rJk6UEh40+QcIaVy
	mZ6DaR2FntPS1zp/E/xPtfYeSNg7DVQb4RBqbqcIEOWtT+LVY4XA+PhjwvSWEfUhV/cRkxiUR7E
	HNXbmhaPlq7V+1CKM1OD6DT67lLq
X-Google-Smtp-Source: AGHT+IG7KQ3yZ6ueh84UQbdxAEhgzGltVUzJfuRxGH/4Hv86lX2wE2yoP8jAhovwP7jlmoL0+nrFig==
X-Received: by 2002:a17:902:f685:b0:21f:2cb4:963 with SMTP id d9443c01a7336-21f4e7f2369mr274943685ad.50.1739289178697;
        Tue, 11 Feb 2025 07:52:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d79a7sm97631775ad.253.2025.02.11.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 8/8] hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs
Date: Tue, 11 Feb 2025 07:52:40 -0800
Message-ID: <20250211155240.2077464-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211155240.2077464-1-linux@roeck-us.net>
References: <20250211155240.2077464-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the value of the CAPABILITY register in debugfs if supported.
Only check if the register is supported if PMBUS_NO_CAPABILITY
is not set.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fix number of debugfs files

 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f0f8b7ed5416..8625de9caff7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3569,12 +3569,12 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	/*
 	 * Allocate the max possible entries we need.
 	 * device specific:
-	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 1
+	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 2
 	 * page specific:
 	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 1
 	 */
 	entries = devm_kcalloc(data->dev,
-			       ARRAY_SIZE(pmbus_debugfs_block_data) + 1 +
+			       ARRAY_SIZE(pmbus_debugfs_block_data) + 2 +
 			       data->info->pages * (ARRAY_SIZE(pmbus_debugfs_status_data) + 1),
 			       sizeof(*entries), GFP_KERNEL);
 	if (!entries)
@@ -3588,6 +3588,15 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	 * assume that values of the following registers are the same for all
 	 * pages and report values only for page 0.
 	 */
+	if (!(data->flags & PMBUS_NO_CAPABILITY) &&
+	    pmbus_check_byte_register(client, 0, PMBUS_CAPABILITY)) {
+		entries[idx].client = client;
+		entries[idx].page = 0;
+		entries[idx].reg = PMBUS_CAPABILITY;
+		debugfs_create_file("capability", 0444, debugfs,
+				    &entries[idx++],
+				    &pmbus_debugfs_ops);
+	}
 	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
 		entries[idx].client = client;
 		entries[idx].page = 0;
-- 
2.45.2

