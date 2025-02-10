Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86922322E
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160032; cv=none; b=CUW+uqSOl4izzIzHTc3QNnNN7+O3rC3PrSk3LIT8rpFFBuoQJTV3vB9gw450Q7TkmgQFRS9Ljmx0JUsbf4zBewgHU8+rzFoKJg90G50BXKfq+LBHSZ9rMQA9Ah5bzK4UpkBKN360I8HdmzcZt5xVF9KoGgQ9UxpF39fb0jtUOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160032; c=relaxed/simple;
	bh=XXDZKKdxGibomr8m5VG9Dp7iB9kv4tEvXPfPcs779Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oAJnCVgXeylgMIblF1a9I9w0XgW3KNxxTIWXoNe86FrkE4P9k8dJilaWE+Sk0InzCNxssdCCM4GWu2p7sOBGjQBbpQpDDcKU8bgrUFWieFZsQBVog1kA1ZsHWXEk5OjLfZsKfIrJ4hkLPjcq2gsU8fYeOOif61NQkUPBscCTQ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSwjsNjV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSwjsNjV"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso6794999a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Feb 2025 20:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739160029; x=1739764829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=r9SUoTznOg8XesYfJ1e+CH8G495PTacnsUi+oCBI1jA=;
        b=lSwjsNjVEAMqRhVbyEmZ/nhHmRYkpghYF1KL2MfV1wKy3jfQlD9HlFEp8J9+8w2g/2
         FpYj5TvJ8DtpsFe3SQKAwH/yRepM1FS7L3J1eJIM/OSL3cxS40WCtvuUyv7Fyq7QeAXX
         dejAIRkimurUTJQgI0x+dtzl3ZkhMHfyJanD6MsH4sT6CKOFkNIXwBrljSOHnsxMoSdz
         c+Gic4QgqZxWO5Xf7r0W8x2WcZ9Anxlxe6E7ou1uUVRWG9tCFuDMAZq9zl+M4oMm/IYO
         YKTeVlg2a7+JAGsJT43PW1H4+JpZf5svNX8nploQmz6dQNZ1rblSkEpo5kkuMvPXtCWe
         HQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160029; x=1739764829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9SUoTznOg8XesYfJ1e+CH8G495PTacnsUi+oCBI1jA=;
        b=ThwOtVzHFx/Yt8wlm/rZwqvBC1XDWpvo9b7qT6EIBOIN4ngcVdj2Hvrh/pVej9kbYD
         NpYchRy3q+VJ41x3NaPG3z2OUJgbGedDSMGD+ahnJDApNC48JPmbDT5pTZfrSMHa8tm/
         kYoXwuCbAIcaoZjLL4YuqPB16XNdi9Z2KdJtKDA630u245axC3EK3xnUKHuXCWnkoSl4
         1UylgnQ2sfH0+KTpU7aW1Nd++BKoijwY+D7sVfdKMivTYBwi+8GTh/6RgC8+3LhaTjxe
         JZDkyRU6zOvfeLbG/jmRmS2C3t7W0GA6ne/G4cih//BgTkX5krCiDz4sRzyeYL96uLIT
         WinQ==
X-Gm-Message-State: AOJu0YzCKytY+7bFZqtCvO0c6pcvKWEMt2GKNVikvLKWcRkvjetfv1Bf
	GJturTpN6PIjb/ellbzCb6NNpqWPMlBesFaIOqCjZf454FcJXCjhzwvyUg==
X-Gm-Gg: ASbGnctATdI/zpSnk2+Q5IJNcECQecdPgHDCrURR6t0a8coNJtI8KOWPQj9NfIISafR
	bPUmpnlcA1jQDO+WUFcEKFqSYwQf5tTU4X/N2nNwwXReEi8HSkoi1+3ialEyT59p9LxOUq8tHIg
	nX2kz2mMJ3nze/g8VVPzcSsMOAdLaU+rtRBrhO1FG24nPOWxuGsqfecTDapMizB3NFfQcleK4Hc
	edVBl5YAHrDJ49WghVpgK1iezPb5NsXQBwOQeO+a99xcboLomUqOTwzreb/vWXZQGmXi7clLJAA
	ewQEnKVZdAvqQ8FfWIA7kWhZLPUb
X-Google-Smtp-Source: AGHT+IFo+T1bEbqZO30RXPqbqWikKCuOSgaFPfyUCPAZrV8B4ixHJ6p5pxuI4urOssRNHKIn6+s2oA==
X-Received: by 2002:a17:90b:1a8f:b0:2fa:4926:d18d with SMTP id 98e67ed59e1d1-2fa4926dd39mr11907360a91.13.1739160029017;
        Sun, 09 Feb 2025 20:00:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f7516a0cbsm28435545ad.247.2025.02.09.20.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:00:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/8] hwmon: (pmbus/core) Optimize debugfs status attribute initialization
Date: Sun,  9 Feb 2025 20:00:23 -0800
Message-ID: <20250210040024.2296208-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
 drivers/hwmon/pmbus/pmbus_core.c | 125 ++++++++-----------------------
 1 file changed, 32 insertions(+), 93 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 91dfb9ec9223..f4d4a91ff4aa 100644
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
@@ -3594,107 +3608,32 @@ static void pmbus_init_debugfs(struct i2c_client *client,
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

