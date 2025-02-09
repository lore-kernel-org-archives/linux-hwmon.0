Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21A24339B
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064984; cv=none; b=BbTFk2V2gAy+INO9gvYZT+aRd0cacdJ4uLdQzPKIpj56a6Gb+sY6bzFLVStW4V62kaC5Jx7wVrc071/xLaCaqfKSP5xeIh+8nBQKmYP4ipDCQNz9MFAs72MrMD/3hb68biXiJpfBZHu1c0P+AQux+dBxoK8/ZUQU9zee03I79Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064984; c=relaxed/simple;
	bh=x9IShF0u3RKD7RVCaXDtOa4K0qUtAQiwEelurQPR8L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBpIs7F3nKJ3tq/lPNdbjn7joQdi523u2AVY8iuknRuo+Xia2As6VeLXw6e6zPXc9ozwptkNxJDUqC25jc7F4ufSgDg6bbJj0qWDiYNEr2jVtOfbbFNhJVB90dWKjTM2geQgUS6EUCYGozEgmAY2rJkSd0GOSHxtyHOrXG7XGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0McLn38; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0McLn38"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso4773547a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064981; x=1739669781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puMIw9r4WkpGcXmJkCRd6pPHDjgprgL124aP3C3tIwM=;
        b=O0McLn38qWZeT7QI4ozsI8CAobU7rr2Wda49iQuFSj3nJSTYflULeeaPH1XLqlKTv8
         iulbGHveiqWyYh+S3EzDyAXG86zvzeajFXWJXzb5KtiEZC1WmEnn5S5enBCEbNNlmLjP
         nM6PPfgXwyMjEJT+DCSFdlewEkLn0Y4MdC+oiiH4XXsA1wVb8ddw2JkS8DaWpVKrWTnP
         CT9mIgBriqCkSC/X5OUXm5l8evVOlJxENS0oNABwMi1pCqdbS0mh5UQNp/12+s4+OYX1
         Pz9MYxsNa+qPXxFJLtdU7crm5lMfj7XZlMYP4B5ndcbNN/seWBPH8fo1r6Uuv/UtxONN
         TzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064981; x=1739669781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puMIw9r4WkpGcXmJkCRd6pPHDjgprgL124aP3C3tIwM=;
        b=rUkr8f2p4c9YWwctdsTgVAxFLdfmeC7EkP5FV06/ethS/C3S0stuFFmRtrtOe/ilGG
         3JCXBlj5QWMwlA7M9dUMqj3hg8ZK4JofiG9od8t3+JyCxsx1s8p8339+zawrQe3bJirb
         bgFrOtlt+eAobCvqCGJKkb4Pj2JGBrJXWIzrv+2QHod756zCY2OxyHRO3uz4b8WCKF7U
         B1sSQgSjN3I0GT3URODicn51W9+5AVB7wjotUpqULyB2r2g5HdRjsOn7kHoZ12a5HdsA
         aD3lZ+C0o+fBFD9b4PfIlyGmzmYAH63MRNPm/sEQi+Jz/Gw1TNmEmbMazurcGr5ljh4/
         Xi9w==
X-Gm-Message-State: AOJu0Yx71Yl7DJmG4MuBiuKF7YWIH0Dz2uFIxvRJtkMIdrKVAF6O/iDW
	c7/b5RWPv3+/CPmbBfGU6SXn7o0IBoRQzVYWeqVnaj/hRWmNPobDHvlQSw==
X-Gm-Gg: ASbGncvcG1mYbml41HuK7jAcSBa7XyaHh+bfeed0/Cv8mMbkDpLLFA4DwgM82aMS0Fi
	Z8InUfuly41quLnaRpCe4cCkaKpnt8azyetqPPAQFuhdIlbFMZxeK9bvHKNVTsSV8FAtA7jelyj
	cZryUc9NO/kVlkRnxxKWYy9Wu/TZr7lX4fNHetWptSvA7yzfdd08FZpHFret+NThO++CbtLlCJE
	wjIpiyoC0NkjLGyt3p02pY9p72z1hX8q1nAC2Zp4Kz73ETgoSgdoTgz6L98UkNlA2/+tfM3IiA0
	ZW9ZmEB8CHIO3ECxnUxxdGGW8I7W
X-Google-Smtp-Source: AGHT+IEbd+oanaUuAPfIQcFJICiViDU2qP/+iSiyBmXIKRIwMvZeht98TNTUSTqBnzncIF8q3V1O0g==
X-Received: by 2002:a05:6a00:9286:b0:725:ea30:ab15 with SMTP id d2e1a72fcca58-7305d4171f6mr12527551b3a.1.1739064981548;
        Sat, 08 Feb 2025 17:36:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307d1e80e5sm1110405b3a.15.2025.02.08.17.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/8] hwmon: (pmbus/core) Make debugfs code unconditional
Date: Sat,  8 Feb 2025 17:26:13 -0800
Message-ID: <20250209012617.944499-5-linux@roeck-us.net>
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

Drop contitionals around debugfs code to compile it unconditionally.
In practice it will be optimized away by the compiler if CONFIG_DEBUG_FS
is not enabled, so the code size is not affected by this change.

Also silently ignore errors if debugfs initialization fails.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be794ba993b8..39cdcbb96215 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3421,7 +3421,6 @@ static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
 
 static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
 
-#if IS_ENABLED(CONFIG_DEBUG_FS)
 static int pmbus_debugfs_get(void *data, u64 *val)
 {
 	int rc;
@@ -3502,8 +3501,8 @@ static void pmbus_remove_symlink(void *symlink)
 	debugfs_remove(symlink);
 }
 
-static int pmbus_init_debugfs(struct i2c_client *client,
-			      struct pmbus_data *data)
+static void pmbus_init_debugfs(struct i2c_client *client,
+			       struct pmbus_data *data)
 {
 	struct dentry *symlink_d, *debugfs = client->debugfs;
 	struct pmbus_debugfs_entry *entries;
@@ -3517,7 +3516,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * client->debugfs before using it.
 	 */
 	if (!pmbus_debugfs_dir || IS_ERR_OR_NULL(debugfs))
-		return -ENODEV;
+		return;
 
 	/*
 	 * Backwards compatibility: Create symlink from /pmbus/<hwmon_device>
@@ -3525,7 +3524,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 */
 	pathname = dentry_path_raw(debugfs, name, sizeof(name));
 	if (IS_ERR(pathname))
-		return PTR_ERR(pathname);
+		return;
 
 	/*
 	 * The path returned by dentry_path_raw() starts with '/'. Prepend it
@@ -3533,7 +3532,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 */
 	symlink = kasprintf(GFP_KERNEL, "..%s", pathname);
 	if (!symlink)
-		return -ENOMEM;
+		return;
 
 	symlink_d = debugfs_create_symlink(dev_name(data->hwmon_dev),
 					   pmbus_debugfs_dir, symlink);
@@ -3550,7 +3549,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			       7 + data->info->pages * 10, sizeof(*entries),
 			       GFP_KERNEL);
 	if (!entries)
-		return -ENOMEM;
+		return;
 
 	/*
 	 * Add device-specific entries.
@@ -3727,15 +3726,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 					    &pmbus_debugfs_ops);
 		}
 	}
-	return 0;
 }
-#else
-static int pmbus_init_debugfs(struct i2c_client *client,
-			      struct pmbus_data *data)
-{
-	return 0;
-}
-#endif	/* IS_ENABLED(CONFIG_DEBUG_FS) */
 
 int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 {
@@ -3822,9 +3813,7 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 	if (ret)
 		return ret;
 
-	ret = pmbus_init_debugfs(client, data);
-	if (ret)
-		dev_warn(dev, "Failed to register debugfs\n");
+	pmbus_init_debugfs(client, data);
 
 	return 0;
 }
-- 
2.45.2

