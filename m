Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654224339B
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064988; cv=none; b=W7XBy7gwsUxNs86cP2Osq1inNVnDkbZybphX5Y/yWyrJD/U29pK2zxjbFnNLQKSyd2hDoNriSiAb605TqccyZ/9iU28cSgN5ebxF35wD8ieEvobUBoAX2p6Jytn5kQ6ph3/uVrV/zavVWyUm8UEMnRTBP19iQFLp82Qc+ojLQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064988; c=relaxed/simple;
	bh=xGX32KSxe/YZVKc3xxtf3Vbpl28poz8OIlnGaCr8jRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHLgNyouMeiIp2iGg6bAKwXRSx63EeHm4cvujPx7Ky0i1IlTRpcaLxeDCPgzIKkZp4qmNPnTsherCdNJt6wsEelTKLA5ecaddTzAcxvTXU4AQuNmZZUoteBjfjLNLk/GHEuOlu6im1djCyZA9XsDxurQ/U0MlekXsBUIxQQSsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy/zgz7H; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy/zgz7H"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f6f18b474so8836095ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064985; x=1739669785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMt4dHus8/ZF6JFhblunsnj5FOoFtOhSksCLiTPiumk=;
        b=cy/zgz7HnNbP0167j6HSxlgQSF3xxU4dlQzQ7cU8GIGG6ohhB+j4rF2xHHLxUNCA0k
         MJrkA7Xw2LggLfBk9tu6482eaLpXQaqA/MPNn33jexShLHpWnow2Mv7lhIemgsGDsSs4
         7RH8bnVsEoqq9a2Jol5V7ecc6cfkI5xtlGep5ojn+D1dCr/ocaqu9UOjnC3vfK0mOfYg
         J0yDaFWGK02Uu8cTheSGGvlF6IGcRkJo0BybOHbYKnK34kONXsajF9fE9Xe8PkAJXGdb
         +OipJEJzmg2N65u5C0b7U/NBcoSlNkCjkFrhQf3SeG39sTX7PHH2eR3V0eng4ktVRMjf
         Wlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064985; x=1739669785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMt4dHus8/ZF6JFhblunsnj5FOoFtOhSksCLiTPiumk=;
        b=gV4tiMlcV+dlVi01OEhuhdNGOS17qkTrs/9yFa0kN8NUp2DBBhXv56XA5OIDay7gc7
         AUSvwQraSe4jKBKH1u3ZBBVDwm+EYjETRSgYEDTOg3hygZoHQv2gFVHf8cLJTvnuLxEL
         +c+mwQVopy5YAEsBZWJ8sjTHujBUBRTjXTEVy9wxNQaH/OJCGyGOfo5GZrKBDl3gAQpK
         vdbuX7mqowdf2dSjjjzufw6NyZ0E0kkzivfAdbUQiAe90pcxaEh1R5xiOy2d9DEZtotn
         y6S9ZZpj6geXdMz3OTWiR1wuWlv1CIOvHrV4fgCUjBTeCkEYMy29s5NlAUbF7+Q50FKV
         1BIQ==
X-Gm-Message-State: AOJu0Yyg6wPhulu38/MJ9OWnLu+Zi9JhMurVfY0O+dlvUHtfdB3HCs+j
	MT8y6IGAc9N1zyhBh5EfKK0aKc+Q636OKcGg8e8ZJLMW/BFVMB3kveXO4g==
X-Gm-Gg: ASbGncsD9CnRSQjdGY7DFOAvjdwi/H+yIAqC2prOTYptTX9SXsUzlE1RE1EPakBlI5G
	d6nXQBDcn4N/4CauOJoMM1Np5Pe1Ycdp6+pHxUq+eRyYq+CUPEhZGtIqNXQwqAuXc4rAPeUw6bd
	Nnl19jFEf/BBke6fj4wqwmdG1ecy+PsfHWsHmrSbZ0z/UX+HeS+Jcnc0JQGOwFBdMZv62o0YwmA
	pjAU+gCGigMRwMQd0G5oy8Pu2RGcVdqnMKe8tKMPhNXEJvwvNWNzRHD5aQd5J56T6oK0PRFgqbO
	uxrBBXRCbfnTx5gETc9vwBMREiQl
X-Google-Smtp-Source: AGHT+IHr716Y3tQ/3A7WZfYCdmnZnPSNHHsAv8UnTJLvP2I1KxPJOwUszi7lzUMCrrXJNRht/qfRgw==
X-Received: by 2002:a17:902:f60d:b0:21a:8dec:e59f with SMTP id d9443c01a7336-21f4e7637d1mr118651305ad.39.1739064985136;
        Sat, 08 Feb 2025 17:36:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a1848asm5902372a91.12.2025.02.08.17.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/8] hwmon: (pmbus/core) Optimize debugfs block data attribute initialization
Date: Sat,  8 Feb 2025 17:26:15 -0800
Message-ID: <20250209012617.944499-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250209012617.944499-1-linux@roeck-us.net>
References: <20250209012617.944499-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define debugfs attributes which need block data access in a data
structure and loop through it instead of creating debugfs files
one by one. This reduces code size and simplifies adding additional
attributes if needed.

While this is currently only used for manufacturer specific attributes,
the access code is generic and also works for other block attributes,
so rename operation functions from _mfg to _block.

While at it, rename the "revison" file to "pmbus_revision" to make its
meaning more obvious and to create a clear distinction against the
"mfg_revision" file.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 85 +++++++++++---------------------
 1 file changed, 29 insertions(+), 56 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3085afc9c1ed..91dfb9ec9223 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3461,8 +3461,8 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
-static ssize_t pmbus_debugfs_mfr_read(struct file *file, char __user *buf,
-				      size_t count, loff_t *ppos)
+static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
+					size_t count, loff_t *ppos)
 {
 	int rc;
 	struct pmbus_debugfs_entry *entry = file->private_data;
@@ -3487,9 +3487,9 @@ static ssize_t pmbus_debugfs_mfr_read(struct file *file, char __user *buf,
 	return simple_read_from_buffer(buf, count, ppos, data, rc);
 }
 
-static const struct file_operations pmbus_debugfs_ops_mfr = {
+static const struct file_operations pmbus_debugfs_block_ops = {
 	.llseek = noop_llseek,
-	.read = pmbus_debugfs_mfr_read,
+	.read = pmbus_debugfs_block_read,
 	.write = NULL,
 	.open = simple_open,
 };
@@ -3499,6 +3499,20 @@ static void pmbus_remove_symlink(void *symlink)
 	debugfs_remove(symlink);
 }
 
+struct pmbus_debugfs_data {
+	u8 reg;
+	const char *name;
+};
+
+static const struct pmbus_debugfs_data pmbus_debugfs_block_data[] = {
+	{ .reg = PMBUS_MFR_ID, .name = "mfr_id" },
+	{ .reg = PMBUS_MFR_MODEL, .name = "mfr_model" },
+	{ .reg = PMBUS_MFR_REVISION, .name = "mfr_revision" },
+	{ .reg = PMBUS_MFR_LOCATION, .name = "mfr_location" },
+	{ .reg = PMBUS_MFR_DATE, .name = "mfr_date" },
+	{ .reg = PMBUS_MFR_SERIAL, .name = "mfr_serial" },
+};
+
 static void pmbus_init_debugfs(struct i2c_client *client,
 			       struct pmbus_data *data)
 {
@@ -3561,63 +3575,22 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_REVISION;
-		debugfs_create_file("revision", 0444, debugfs,
+		debugfs_create_file("pmbus_revision", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops);
 	}
 
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_ID)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_ID;
-		debugfs_create_file("mfr_id", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
-	}
+	for (i = 0; i < ARRAY_SIZE(pmbus_debugfs_block_data); i++) {
+		const struct pmbus_debugfs_data *d = &pmbus_debugfs_block_data[i];
 
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_MODEL)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_MODEL;
-		debugfs_create_file("mfr_model", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
-	}
-
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_REVISION)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_REVISION;
-		debugfs_create_file("mfr_revision", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
-	}
-
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_LOCATION)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_LOCATION;
-		debugfs_create_file("mfr_location", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
-	}
-
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_DATE)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_DATE;
-		debugfs_create_file("mfr_date", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
-	}
-
-	if (pmbus_check_block_register(client, 0, PMBUS_MFR_SERIAL)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_MFR_SERIAL;
-		debugfs_create_file("mfr_serial", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops_mfr);
+		if (pmbus_check_block_register(client, 0, d->reg)) {
+			entries[idx].client = client;
+			entries[idx].page = 0;
+			entries[idx].reg = d->reg;
+			debugfs_create_file(d->name, 0444, debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_block_ops);
+		}
 	}
 
 	/* Add page specific entries */
-- 
2.45.2

