Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018F253F2B
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289175; cv=none; b=rl3fYYPijTXB2JP9SfLyusulVufbYpyySkdzPPmang5zajTjKP3lIQGXqYT0cCQeDhk8xOynzn9rmzQsy3Kwkrr3kGNMs577all1dWTyc/3FMw5BbAqcLSzF3ZTc+7PzHrOUUO5ewRU1noN1F3GVduP1za/CfFCrJvPUOxG9Dtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289175; c=relaxed/simple;
	bh=g8wzu0eYdr1RaOxgeeuA9TNT+mxg3KGV2OLMF/Yckbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT+hVM2g3cG9QOeNNSJneREhpuxwHioAcMs6dKOGNas0AgTDkDiD3HnEfZqK+viruK7IqDazWsZ/FHXvqxnzvDsPSrNmKtouPxhxGreG8NzXOpwWYgHI9JUgsqls5iH1MDmyPFV86A11jF/Iv+hsRulwakhmkFYUu1ofZwkSZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/Ynl74D; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/Ynl74D"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so9113282a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289172; x=1739893972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs8PeEicoW0PbsG7q1rUbmUXFYDywYudvhHCFnOE6+Q=;
        b=e/Ynl74DQxysqqa0AWrOrMghjcpSNx2k2P/riZjI/Mk1aTpCkPO9fAenVv+4DLYx3r
         rm2KiSrNF1XQ7XIHXG7EjGTPya4aie83LXECbzWMVeu5qPhuyRGAkxpd4QGEFjVwDwsy
         aRxDOiXS2FvIQnFmvUk7kHBzyqef0kFmI82O/NTQxbEmQ79SEn638WpBYVCi+z71B5BF
         mzyQK91DhLyvdxhJpv96i0geAg7LQIU5O0bWnDWEa0a0BLHJDogaitU6HO5Dn5eX3XXx
         +c6FEMzadJHig84/3XALkXQoyMlr9/TpYZrmCe50qH4ig1dB371HpXck0Jwj+2odXsSJ
         D6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289172; x=1739893972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rs8PeEicoW0PbsG7q1rUbmUXFYDywYudvhHCFnOE6+Q=;
        b=J8911WWHUyZvd5p3oV307imMGw7gs7a/MdB4LGOKDnCW8rkMfUTH4M/uxKzBb676yH
         mqkZ9VSwDdPLuBt6mnufZTGPIAjx1qog+0RlJO9ChpXjDwANlTS1J124HRSOGkOEY9J8
         /zFnPkctyWfr73Mj51SMcrKXIOF4RFG6Ub4kpzZCb3xf0SA90xLwFvYqphY15StTGHu5
         b8Sn1qaJybTXrBVJlAnFgyRuQuKAA0uIQX15DM1Ri4YNgpki4yTW0DQ726szgMTgUoCH
         ID81JhliT2vcFBnz5m5bIyQFc/KyJ7prTXRKKUwfTaRoq1/r59wp/9bmyy72JCgNXpD7
         FQCQ==
X-Gm-Message-State: AOJu0YzrBRHor5trWAJ8CjuX2Cc4LsZxO6b8q65V+oDW1LbXiOvclH99
	K01M1K0SPskNX4wAaMh4C6kdS81oMWxRoN7wDWTt3cM2uOGSFWt0JuaNNw==
X-Gm-Gg: ASbGncsLEHQPdtVWItWnYVD41ns14Cc58NyRU07D3k0C0acTfZzofsR0d/HTT1Xh9Nw
	9Z82zdlUb2KzlQTomqECjwhaQttaGjVNgEeL++GD4fJ6TsNFMG1slp0huQEdmL4Ja7ld+BGP37K
	IlO2Ej33mkoL/kotGAyWaC+WNLyZFgc/ySUAGruylpyn6sI7mj+StCkJFh99U4igNvLg5sK/ThF
	nU1ZjWrEFG+5lUxY26COqCAYrWa/psvpGLYMHoNGd3qZopxidmhAJtf79uyXOk1H6PtGRUG4U3C
	E7lap2K8sVCH78iScdOKwhqdk5+i
X-Google-Smtp-Source: AGHT+IFtX9ggC/vjwUDh1mo6GoqIbgH5UuZkFg/yhsU4tVW/QJ7yymKQGIGgxCYTsn7KhSMSjfAkDA==
X-Received: by 2002:a17:90b:1805:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2fb7e8d765fmr381074a91.33.1739289172491;
        Tue, 11 Feb 2025 07:52:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2faa30a356csm1730710a91.7.2025.02.11.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 4/8] hwmon: (pmbus/core) Make debugfs code unconditional
Date: Tue, 11 Feb 2025 07:52:36 -0800
Message-ID: <20250211155240.2077464-5-linux@roeck-us.net>
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

Drop contitionals around debugfs code to compile it unconditionally.
In practice it will be optimized away by the compiler if CONFIG_DEBUG_FS
is not enabled, so the code size is not affected by this change.

Also silently ignore errors if debugfs initialization fails.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

