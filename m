Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED68253F2D
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289181; cv=none; b=ACykXb6REz441w7qxivPNndtcvNJQAhhCcDg7JsQgBk1BOf2MCbreLS5ezNKaMsIGiEOT2UoCeS0yK4httKuTN8P3F0nfeyYRBfdszjLCIJw/t0Z4dU7VJKwKTAqQtwrlyu/I+wuYT1+tn4yzrgz184HtCFHW5OT1Z1faVfzadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289181; c=relaxed/simple;
	bh=LMGomRaOtH29ja3KgW4GxX3Kca+kf+2WYVroN9XtXjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEQYUQm3nsHr1fCVCBThVY8GDc4PpXazst/cIbosLXNTdUP4UrcMefb3xw3Q8jI2ZVEudN8ZOxjQSygMSmdjEzlO3ymQvKO6SXUYaM9I5smWeVuSSd/ICzO2ajnjDUoC5uD8vJ+FCplkWEUIua6flP8kOJRqGBcBBtfXOfDcDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un21d+6o; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un21d+6o"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f3e2b4eceso109459215ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289178; x=1739893978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz/KN50qJ3LMKII0WAeSZR2TOOMp+KirwyFnmg+pUzM=;
        b=Un21d+6oV5gvOfdhT4f4sqrDs8rpejZW+iLzdJqjea9pLxPmPiXdMX2Uw6Z2B5ZxKQ
         ZY0UBJkEDmp3jpQz7nOr3B0RGw52XvN1bIZmSrSKltClVl2gfH/NDA5s/o8me7YIWN3r
         nD7SHlqxfSP5kjj7hF7Pva0+njK0ElBnwsSjCqV5zjJWP8jVO+zZ3GGoTZDHP3wjsUg5
         iyC17IXu80yFRMNxLr/+ezkIE3OzGoAw4ID862526COFT/lxHdQFTLqPba3iSkqC2tht
         BAEHGtb8w4UyeaWx0X0j/Q3D/SgRE0gnBpV2MonSx6pZfskrRQg7B6HgLX9BFFpf3hCy
         n+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289178; x=1739893978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tz/KN50qJ3LMKII0WAeSZR2TOOMp+KirwyFnmg+pUzM=;
        b=jY7zYsfCpI4mQHhCR8pJhUg4BgHBREcPn6L2CsyoCfUGggi8Bj+7O5jRSWSijo1ZsB
         TmlaUqKX3jdzG32/IYCqE3fIPNwrXI777IPr/9phgelaTjfCgo4OvLIFoK2H8sacS/Xl
         dic1TZFqFmYDw7kV74+1US7W+pMgnnpTndzj8YJNsjqsYRgGvX3X4PuJTB7ytuOgest4
         esUMCbIZfrI428x5y/R6rqXcYmE9KMh30eWxnPsFLXW57eRU0s8FmhXaLUBELoaiostL
         dAFS+O3OmtF83Q9H32q7fJz//qm0/CGWuS9npIKJux7CQYkS76xicRun7rxYvGljZ0eS
         uHHg==
X-Gm-Message-State: AOJu0Yyds5g1KYuHUjgVgpjMkkldvNqMK0sOAkZLy91hJVlzy3mwELGo
	Hnns5SOrcZtWPUeTm8KV9I+FiPFcYzAfZh+Q7v5y4WOQL2SWbgwv7O3MhA==
X-Gm-Gg: ASbGnctdRcE8hUrBSebkx96gcVhvGm6uxRzs2joS28dEdwHi3a0LpF+luYmWFrhoN95
	tBF5+c3ntEOyVRnORXBxzDwGN8XLreWYmO1qll8EEz40dyL+PB6HQaSJ2FHX3HgG9GAytvLY65f
	tMg7Vb0P+9bJaSGCpCTT5BKzqd7YGSJWF90t2jFTfPb5aHoWJRbNpc0SkMwju66Z3Bl/QC3EGs1
	QcGjV5qH9xyBibUxo27GkYIUqbj9e8oYscCJTFao1FRV5tQ/Kat54Aqtf/JOTzKq2y9JwYWEsFY
	1vlL5XyytKPj2ulGCF3WvMkduxgs
X-Google-Smtp-Source: AGHT+IFfcw+wKxmUzXgyDKbGg+E0BlEOzerBQTvhshx08jGj3r3xR8B5ZaTeP2tPM+C/jIBw1TflEw==
X-Received: by 2002:a17:903:2f84:b0:216:31aa:12fc with SMTP id d9443c01a7336-21f4e6e6123mr285502405ad.24.1739289177241;
        Tue, 11 Feb 2025 07:52:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f64a67488sm68690575ad.244.2025.02.11.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 7/8] hwmon: (pmbus/core) Optimize debugfs status attribute initialization
Date: Tue, 11 Feb 2025 07:52:39 -0800
Message-ID: <20250211155240.2077464-8-linux@roeck-us.net>
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

Define debugfs attributes used to access status registers in a data
structure and loop through it instead of creating debugfs files
one by one. This reduces code size and simplifies adding additional
attributes if needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use ARRAY_SIZE() to calculate the number of debugfs files

 drivers/hwmon/pmbus/pmbus_core.c | 130 +++++++++----------------------
 1 file changed, 35 insertions(+), 95 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 25ad0a016292..f0f8b7ed5416 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3501,6 +3501,7 @@ static void pmbus_remove_symlink(void *symlink)
 
 struct pmbus_debugfs_data {
 	u8 reg;
+	u32 flag;
 	const char *name;
 };
 
@@ -3513,6 +3514,19 @@ static const struct pmbus_debugfs_data pmbus_debugfs_block_data[] = {
 	{ .reg = PMBUS_MFR_SERIAL, .name = "mfr_serial" },
 };
 
+static const struct pmbus_debugfs_data pmbus_debugfs_status_data[] = {
+	{ .reg = PMBUS_STATUS_VOUT, .flag = PMBUS_HAVE_STATUS_VOUT, .name = "status%d_vout" },
+	{ .reg = PMBUS_STATUS_IOUT, .flag = PMBUS_HAVE_STATUS_IOUT, .name = "status%d_iout" },
+	{ .reg = PMBUS_STATUS_INPUT, .flag = PMBUS_HAVE_STATUS_INPUT, .name = "status%d_input" },
+	{ .reg = PMBUS_STATUS_TEMPERATURE, .flag = PMBUS_HAVE_STATUS_TEMP,
+	  .name = "status%d_temp" },
+	{ .reg = PMBUS_STATUS_FAN_12, .flag = PMBUS_HAVE_STATUS_FAN12, .name = "status%d_fan12" },
+	{ .reg = PMBUS_STATUS_FAN_34, .flag = PMBUS_HAVE_STATUS_FAN34, .name = "status%d_fan34" },
+	{ .reg = PMBUS_STATUS_CML, .name = "status%d_cml" },
+	{ .reg = PMBUS_STATUS_OTHER, .name = "status%d_other" },
+	{ .reg = PMBUS_STATUS_MFR_SPECIFIC, .name = "status%d_mfr" },
+};
+
 static void pmbus_init_debugfs(struct i2c_client *client,
 			       struct pmbus_data *data)
 {
@@ -3520,7 +3534,7 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	struct pmbus_debugfs_entry *entries;
 	const char *pathname, *symlink;
 	char name[PMBUS_NAME_SIZE];
-	int i, idx = 0;
+	int page, i, idx = 0;
 
 	/*
 	 * client->debugfs may be NULL or an ERR_PTR(). dentry_path_raw()
@@ -3556,11 +3570,12 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	 * Allocate the max possible entries we need.
 	 * device specific:
 	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 1
-	 * 10 entries page-specific
+	 * page specific:
+	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 1
 	 */
 	entries = devm_kcalloc(data->dev,
 			       ARRAY_SIZE(pmbus_debugfs_block_data) + 1 +
-			       data->info->pages * 10,
+			       data->info->pages * (ARRAY_SIZE(pmbus_debugfs_status_data) + 1),
 			       sizeof(*entries), GFP_KERNEL);
 	if (!entries)
 		return;
@@ -3596,107 +3611,32 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	}
 
 	/* Add page specific entries */
-	for (i = 0; i < data->info->pages; ++i) {
+	for (page = 0; page < data->info->pages; ++page) {
 		/* Check accessibility of status register if it's not page 0 */
-		if (!i || pmbus_check_status_register(client, i)) {
+		if (!page || pmbus_check_status_register(client, page)) {
 			/* No need to set reg as we have special read op. */
 			entries[idx].client = client;
-			entries[idx].page = i;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d", i);
+			entries[idx].page = page;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d", page);
 			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops_status);
 		}
 
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_VOUT;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
+		for (i = 0; i < ARRAY_SIZE(pmbus_debugfs_status_data); i++) {
+			const struct pmbus_debugfs_data *d =
+					&pmbus_debugfs_status_data[i];
 
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_IOUT;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_INPUT;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_CML;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_OTHER;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (pmbus_check_byte_register(client, i,
-					      PMBUS_STATUS_MFR_SPECIFIC)) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_MFR_SPECIFIC;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_FAN_12;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
-		}
-
-		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
-			entries[idx].client = client;
-			entries[idx].page = i;
-			entries[idx].reg = PMBUS_STATUS_FAN_34;
-			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
-			debugfs_create_file(name, 0444, debugfs,
-					    &entries[idx++],
-					    &pmbus_debugfs_ops);
+			if ((data->info->func[page] & d->flag) ||
+			    (!d->flag && pmbus_check_byte_register(client, page, d->reg))) {
+				entries[idx].client = client;
+				entries[idx].page = page;
+				entries[idx].reg = d->reg;
+				scnprintf(name, PMBUS_NAME_SIZE, d->name, page);
+				debugfs_create_file(name, 0444, debugfs,
+						    &entries[idx++],
+						    &pmbus_debugfs_ops);
+			}
 		}
 	}
 }
-- 
2.45.2

