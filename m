Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66624338C
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064982; cv=none; b=nGHx0zRXCvTi6Pkfn+PhSuv7LaPtAuWA63XFRda+JuE+DGb35ZsJCykGzO1CwwctbjJ0DryETJf0crtPC6AJF5LL8ytOeSnJIQc1OAwQ3YMggn/z5C+gxWI3misLBjsLlsg+y68J+YSLpBLfC1SXTS4JZZ374/oeZgNUVNkDv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064982; c=relaxed/simple;
	bh=DFnVUrB8d3zUK37YUx5IVXLhWwxh0NYo1iLQ8MxH1Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwDLrA2n80dnZBJYiCFOr6j7EyLaYffLZSbei7ExswHgPJyTT7x7HKBphEYk7At1P+X0Znq1JjKOF3DEzGbKfZCuh+SZ/BaCJC1S15PukU4tVrHVsy8ApJH+FJ9NwuzU4uVcPJ11mqzW++8XDFZMvgZ7y8dkJXkmaHz4RLEER6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYcyoVFU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYcyoVFU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f42992f608so4967253a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064979; x=1739669779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxVWfoy2Kv/+WAa9e9cRlhK4WZmcNRGacdf+NmCv1+Q=;
        b=lYcyoVFUvV/ew5KMjJcTm4xnWwSNLxazRA1EP9aiFqLePUjSFA/znGpIQN47fNgwHr
         CTCbhHeKeR3TT/e+pCJMtl8rYi3Mmli/YRqiEKg7cGMsJZXZ3JfDXeJpWXbpKWIDF/kJ
         ZGsMAK85sXP58LZfkIyDMonU0KImxUNk3wz7gtWaKEw5PTjunpsaRNgqti0wQWbuG2FD
         8Q26aRtTe64gAY/dejJvf1siVJywLxOqE55DvAlPGJAW9Ln8vP/QaZSjVvTlLNSW7Slp
         aiUmvKaLvPYJQ4l2wK9RjpVY5EOrtf2EQbfSeLnhHWHMRdSk6ndWuE+2AzYPf5+JlUdZ
         CjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064979; x=1739669779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxVWfoy2Kv/+WAa9e9cRlhK4WZmcNRGacdf+NmCv1+Q=;
        b=t2psRczv73s4DHkulNsbXZUypuXRNpGcdj8LnfPEDZSqZNli1kV6vdrQIIdpcLZzUR
         0AtmrhIKCfGCw43FpSDd7nxGE+T3kUlxZqau8eGAHE/4A4p/DUi4fVOMoPmsaff/H3ZO
         c+2R9uMcQpF9DprJ4zkf7JftppUND80Lc6mlTwDlt/8uj8qxp/ohtkOR/DtoJGA5d5BQ
         m5fnnRP86RqsUfrnxLnZ/XaYp0ZQDEz6GZGN2300UIFaGMLPXO7dYb70aVWah0IyCmfX
         iJctI1tUYZTOzvnKqNWj+Sfi6syG160LYeZV6+cMRI/UFlAjN6aUAvMLek0sfRaPkSyN
         fxBQ==
X-Gm-Message-State: AOJu0YyLhkk0VSbQf/Tgcu/a3IFsZLa2LiQz0YCR05gZDuOtRaXRAFa+
	GHEh4haNNB83ZRMwJXBp6WNGukCrWH91vWKjD7yWVNN/mKNi5V5PKPSHbQ==
X-Gm-Gg: ASbGncufJ+W1xvups1gGITpesM2SdKj2o9jEIEWsibmanxJr3yZHlpyGTp35TFk85Sj
	090NvvsKfaRcFYtag1CPFNaha4E8Gbt2ziBb3hBESKZ1gcs3JVx/dwQppgw7lRlRqcdq2BSswkC
	vakmqQSBAugTZhb8k1GmC9N3UtmiwjFiafs3vW5vYFSt0nYrzFDJK1Y/9i/cO8o8r6DZuhZdJif
	HrQQdyouoiYzWXAytJTW+7/YQIW8KXjVy3MXrAe8QEWEAsB/1WVJBGhaCMTOg6t9Byd5T+GnX/z
	BeeynBcdfO+q8ZpZs5lUeO2t9KZk
X-Google-Smtp-Source: AGHT+IHFd1R5pQU8OEJ44+JBpvAfpRj+Gr+v8SJkUSQ3nXbzWd3+l+0LH4Ap4WW3M1VK57VtfovVHw==
X-Received: by 2002:a05:6a00:1393:b0:730:888a:252a with SMTP id d2e1a72fcca58-730888a2799mr421644b3a.15.1739064979497;
        Sat, 08 Feb 2025 17:36:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e20400sm5110756b3a.168.2025.02.08.17.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/8] hwmon: (pmbus/core) Use the new i2c_client debugfs directory
Date: Sat,  8 Feb 2025 17:26:12 -0800
Message-ID: <20250209012617.944499-4-linux@roeck-us.net>
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

The I2C core now manages a debugfs directory per I2C client. PMBus has
its own debugfs hierarchy. Link the two, so a user will be pointed to
the I2C domain from the PMBus domain.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 63 +++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 472375b62379..be794ba993b8 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -8,6 +8,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/dcache.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -99,7 +100,6 @@ struct pmbus_data {
 	int num_attributes;
 	struct attribute_group group;
 	const struct attribute_group **groups;
-	struct dentry *debugfs;		/* debugfs device directory */
 
 	struct pmbus_sensor *sensors;
 
@@ -3497,34 +3497,49 @@ static const struct file_operations pmbus_debugfs_ops_mfr = {
 	.open = simple_open,
 };
 
-static void pmbus_remove_debugfs(void *data)
+static void pmbus_remove_symlink(void *symlink)
 {
-	struct dentry *entry = data;
-
-	debugfs_remove_recursive(entry);
+	debugfs_remove(symlink);
 }
 
 static int pmbus_init_debugfs(struct i2c_client *client,
 			      struct pmbus_data *data)
 {
-	struct dentry *debugfs;
-	int i, idx = 0;
-	char name[PMBUS_NAME_SIZE];
+	struct dentry *symlink_d, *debugfs = client->debugfs;
 	struct pmbus_debugfs_entry *entries;
+	const char *pathname, *symlink;
+	char name[PMBUS_NAME_SIZE];
+	int i, idx = 0;
 
-	if (!pmbus_debugfs_dir)
+	/*
+	 * client->debugfs may be NULL or an ERR_PTR(). dentry_path_raw()
+	 * does not check if its parameters are valid, so validate
+	 * client->debugfs before using it.
+	 */
+	if (!pmbus_debugfs_dir || IS_ERR_OR_NULL(debugfs))
 		return -ENODEV;
 
 	/*
-	 * Create the debugfs directory for this device. Use the hwmon device
-	 * name to avoid conflicts (hwmon numbers are globally unique).
+	 * Backwards compatibility: Create symlink from /pmbus/<hwmon_device>
+	 * to i2c debugfs directory.
 	 */
-	debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
-				     pmbus_debugfs_dir);
-	if (IS_ERR_OR_NULL(debugfs))
-		return -ENODEV;
+	pathname = dentry_path_raw(debugfs, name, sizeof(name));
+	if (IS_ERR(pathname))
+		return PTR_ERR(pathname);
 
-	data->debugfs = debugfs;
+	/*
+	 * The path returned by dentry_path_raw() starts with '/'. Prepend it
+	 * with ".." to get the symlink relative to the pmbus root directory.
+	 */
+	symlink = kasprintf(GFP_KERNEL, "..%s", pathname);
+	if (!symlink)
+		return -ENOMEM;
+
+	symlink_d = debugfs_create_symlink(dev_name(data->hwmon_dev),
+					   pmbus_debugfs_dir, symlink);
+	kfree(symlink);
+
+	devm_add_action_or_reset(data->dev, pmbus_remove_symlink, symlink_d);
 
 	/*
 	 * Allocate the max possible entries we need.
@@ -3712,9 +3727,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 					    &pmbus_debugfs_ops);
 		}
 	}
-
-	return devm_add_action_or_reset(data->dev, pmbus_remove_debugfs,
-					debugfs);
+	return 0;
 }
 #else
 static int pmbus_init_debugfs(struct i2c_client *client,
@@ -3819,9 +3832,15 @@ EXPORT_SYMBOL_NS_GPL(pmbus_do_probe, "PMBUS");
 
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 {
-	struct pmbus_data *data = i2c_get_clientdata(client);
-
-	return data->debugfs;
+	/*
+	 * client->debugfs may be an ERR_PTR(). Returning that to
+	 * the calling code would potentially require additional
+	 * complexity in the calling code and otherwise add no
+	 * value. Return NULL in that case.
+	 */
+	if (IS_ERR_OR_NULL(client->debugfs))
+		return NULL;
+	return client->debugfs;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, "PMBUS");
 
-- 
2.45.2

