Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F105253F09
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289179; cv=none; b=ukgGN0MELY0c1qQWqF/Uu190wAyXb+et0oeBFTLwJfomj9LLZ0cIdBrlQUUOBQDx8v6cfJ9p2EZ+myyMOXL1sbrux70sfvmGizLlM5dHCywPmX5yQYf6uTnIZm2+3mLKMSnJSIa1SCWCpQ1DD/rRnzFnRqjUsfno6W3Y7PEF67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289179; c=relaxed/simple;
	bh=ZCxdGeHtPZl67RoBhM5PUAd7I1GtBCo7Tu4i5Kk1xxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnFnjtu5Mvsu/GUXBw4ejnVelIuePRsdvqkti4grvvvNxF6fAsp47pxbbhL3PGBAv+BBek9LO+ko+Siz0zFsooA5FG5pHUTK9Mq0JLLDASoWjPehyo7JKjawl0O7ztpOlIqByhaJVRhOxWSnK3ntXn4DVaP5PgOzdstlktnZekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg6WAVwB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg6WAVwB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f3c119fe6so130068675ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289176; x=1739893976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9kai2uPOeBbYEdDxMaB3KxsGUE10PIaDaK+dtPaYwU=;
        b=Dg6WAVwBggdv/KvVkPOkEBR+TSfVBEbTDeVULxUKcM5imjMZ/P09zITeyMCKvg4RR5
         VvupMxoZ682t5sIOXer56lj46OBEW+ne+fiXgcQNHUB07vBp8C3odwXmdCnlWj3X4Xqt
         PvDZD/mcs78OWFwqiRiGneC3I4qPteRmxPcdXAC1wBrFgmFA6m7vXMpuI8Wlt/5sQ0aJ
         plenljs+wjj4U8+iP/h5ItGcf0Kfpq8xGkUsFuEdGTRRKU9NbtB27RtpH+0JBFcnG4zS
         D/r1/HvPf3raNja/DVc7YtV9dudma4InE+CunlrMA1xI62XERBAlSvKsS55lVJALGvUI
         eUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289176; x=1739893976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9kai2uPOeBbYEdDxMaB3KxsGUE10PIaDaK+dtPaYwU=;
        b=EL5PATKCgZfSqDOqa+HIL61WsoXlH+3ZYKkNf3ABOJgubGSNLEXlvBqF8raQF9nZau
         ndU5SBVsjphaEy5KJEhGrrAZQLxRjh+KYdPVGS3hVkIE+Bu/0YX6/FpmqUgSSx3i7wgi
         XFjKV7E0J2ZBv/Qt4qvwc2ywUdvTvmaw6JZ803zHcHXGy2DhMrDTVOdR62dARVDc9orb
         fjc9EhR2KbqDA/Yt+EwkymuyBw5gNnPKjSdBol4L+gxojtA+GEjlyw00sJcg+ZPZRAoC
         o4DXme/WEpGrGqevgRzd5nrg2bTwuBVzEc2utsRITYL7dAg+UdLJy11mnGOs5XNIchT9
         r23Q==
X-Gm-Message-State: AOJu0YyxSQ1jZh80ZusCb4KcbOoxqoMIdFEi23bIXy3LL9uM53tyB5OZ
	sBwG6K1MySgKojvOpi5pF46UbKS+B5aKXKMTuwaP/K7ARDEutVByznqm6Q==
X-Gm-Gg: ASbGnctsjN3go38DStAHJ/0qhJ6LISMFSRKAV3K9PYM7Gqpp5MrlAy3gOycnogVHcBn
	KKjYRqPTZ6AaSKgkC6QulPOl0IGY7rnel82Zm2SLfNLPoGAGvmSBAGGBMfL9NRs5B3uSwJvaR4Z
	31FpptfeFK86er9Dx2Rz1wYXgdVg/OdJlH2/go4MEu1CiPTJ3DxGNuWtmMnWiAr+iUcPpQjYK49
	PeXoUVnNAr7aTipCHpkf55MLnSz74NrTObUmmRxYFVREGSkzCgc2736ObjDkqa+J9sNhd85V82u
	eestlleXp5TLk2hLTA8aPDjkrZXQ
X-Google-Smtp-Source: AGHT+IGQV2K8bjfY2vLuY4G14xV3WuNGzgp4qKt+jT6fbSu0CrVVYFqoV8X3xJ4jaJvZs7trnfk7Vw==
X-Received: by 2002:a05:6a21:9211:b0:1ed:a4ae:31d6 with SMTP id adf61e73a8af0-1ee03a9adf2mr33174228637.18.1739289175794;
        Tue, 11 Feb 2025 07:52:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307b136aa6sm5925799b3a.57.2025.02.11.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 6/8] hwmon: (pmbus/core) Optimize debugfs block data attribute initialization
Date: Tue, 11 Feb 2025 07:52:38 -0800
Message-ID: <20250211155240.2077464-7-linux@roeck-us.net>
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
v2: Use ARRAY_SIZE() to calculate the number of debugfs files

 drivers/hwmon/pmbus/pmbus_core.c | 93 ++++++++++++--------------------
 1 file changed, 34 insertions(+), 59 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3085afc9c1ed..25ad0a016292 100644
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
@@ -3540,12 +3554,14 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 
 	/*
 	 * Allocate the max possible entries we need.
-	 * 7 entries device-specific
+	 * device specific:
+	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 1
 	 * 10 entries page-specific
 	 */
 	entries = devm_kcalloc(data->dev,
-			       7 + data->info->pages * 10, sizeof(*entries),
-			       GFP_KERNEL);
+			       ARRAY_SIZE(pmbus_debugfs_block_data) + 1 +
+			       data->info->pages * 10,
+			       sizeof(*entries), GFP_KERNEL);
 	if (!entries)
 		return;
 
@@ -3561,63 +3577,22 @@ static void pmbus_init_debugfs(struct i2c_client *client,
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

