Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7B253F2A
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289173; cv=none; b=DTMaLF27FcgPvnMn60k6O1W3w6/Ae7SpZNEkDYFKuwgomNxy+syYS41X2swjADR7dRV5GPUgzqNJG9uh0gIwcmXIkbKCnQcUrP/3zRBWU1yQGTxn/5FO8T0WDbiRdVrHKyjXhUDuB2ggCcSEitkA7KB0o/e7FcqLg/tHDLqKuNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289173; c=relaxed/simple;
	bh=epYroza9t6c6x7Pr5NJhKYuxRgC16p4S0BGJhZ1/1jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jidGjHLYH1MTcIbGwAfi7TiIO+5MTpr3w7iUqZ4d5HfGIW2RBmu2U5ExrIYTbDGr7z6coNrCvn1JR4G2xIO5ie0ddp6iP8Q7Mv5Wo8T0PI7GrDYgSis0HSttwKEEEuR5rIH9GCWEsGDdhT8ALTbbLdNMnIUpudaNZzitw7Qqrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAne/IZK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAne/IZK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f50895565so64799425ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289170; x=1739893970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYrIJHyOGbj+ZBYaeYIwFamAdh5HNASdG8LGnoiovEM=;
        b=lAne/IZK9wyFh5rxoOJyy9/sLnrdkWYI2GXCC/LtH7H4ggqmzYsA1bJXib0XUbfiTc
         M4CheQRgMFM+H8V/ge2RJAeDNdNe42/gOefIffNK6d43+vQpV8r1BaonUQ8gxToibDLS
         dNIyIjw4Gpv9fLUjX+Tu1ajno9h8naIp7U5lJiU1UYfeUlfVUyhkIE6kMFrNYtuGSr1r
         RdXYMXTLN9zKwl5rRfZUlUmdL+c9dlhYg96uHhTcdrr+q+ZK6Ke/5L7LcbGshzqzXXiA
         1DSFSqIMKv6JYFuqzlGa+6RyurnntYBPkckMRx6k/1po72jfbwq07SWaelX8Iauh+UHe
         QPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289170; x=1739893970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYrIJHyOGbj+ZBYaeYIwFamAdh5HNASdG8LGnoiovEM=;
        b=m+xkwnGIXuVb//tb+uw2qlzu+pVFqHhmNHlVbQke2mbna8CzJ4neRmxTyKk7bvhye8
         xFAAV7k8R3mxe9bHP6AwsyXCvNn3QnfKi3PXm5dXDRN4x1t/Q/EDhxefrfHAcVeZ1Tvv
         8eXUvuq13ykaNaUmiOwvAf7jDcD1qDIGxIvtk0s5Wa4N2JUOLf0syW7ESzLRpDmWrg4e
         97piAlr7xw+aTro5u5fZ3/146ay5mOGIbLkaDfl8xV0dLXcRIM0YGruIwZcyfXAeUZAm
         loi6q2ne381W6QcaJayIDz1dEW63ABKJM7PeRFbWyh+5DPuwlF/6WlH5P2heoKP3BqOk
         Pgrg==
X-Gm-Message-State: AOJu0YwBtA/RkUQF4mt9dT7iEkBLDyZdUtHiOgAvRx8g9rBKPjwGx0bG
	tVV0UyHwQ6vsaC43ZrY9yhY32Z4ZWq8WRFrRyRfnXctKADjpB0+mKn4opA==
X-Gm-Gg: ASbGncsWL+OdGqC5gzx3UUFUf6svbz+san/cgRe9GtZOLXhCAPAe8y04bHeuTuiuxEX
	V7BhdmXSJxkbIqIkOtOJ6kEKfV9QAd9VJfOoDTuQSCIx+Q/FFJdNRX7U4zKiRh/BloEPkd2eVZy
	4prPr2znf+kFCfji8ZbugoK+b9gW6Tsp52Kf+37VXeHgLgwqwn76bhDQ+pHAfR34z83+sT81CQd
	/z9YjQ9CndthtgpNA0hnkjke4uHihJdQi2gWC5pAhkW3r2yXn1BDCx1ycQrMlEK2y+vt+rCIZOO
	EqoCxeGOawvA/kxjVLyMerUjmqmt
X-Google-Smtp-Source: AGHT+IHaLOD0ew7+A+fV+mL6cnl/TEqCRq205ruqCsWyIhQP/JIk/gvgXZKHkiVdlGnGpEqG+MPNQA==
X-Received: by 2002:a17:902:d581:b0:215:7b06:90ca with SMTP id d9443c01a7336-21fb641d55dmr64414145ad.17.1739289170021;
        Tue, 11 Feb 2025 07:52:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368db022sm98309715ad.259.2025.02.11.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 3/8] hwmon: (pmbus/core) Use the new i2c_client debugfs directory
Date: Tue, 11 Feb 2025 07:52:35 -0800
Message-ID: <20250211155240.2077464-4-linux@roeck-us.net>
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

The I2C core now manages a debugfs directory per I2C client. PMBus has
its own debugfs hierarchy. Link the two, so a user will be pointed to
the I2C domain from the PMBus domain.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

