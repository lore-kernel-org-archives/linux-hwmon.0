Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C97B672
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726237693; cv=none; b=ZBGYML9h82J33nW24uYahW7NtZI0AX4UpTUnz0H6PUVzfx04mNQpHCrS+RJGC5eaEEr6xoz7B58Guc1DLSTtFRrVPjWYJKtkpdlcERFsuit0tuOtqPeJLbfj6/+j8rHe4VDqfCL0ab/riVr2hXGKyvmpmGLi3N+ThC09uAEn4qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726237693; c=relaxed/simple;
	bh=+MABsrC9WfExhgwLUKAOtN/zq+JLhLFQoECx3CfWoEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YPYfyALR5QZyhn6uikp2S97299GcNf+feQv27kEfZR+nxxNDJUyLGAanbIPIVwrn2YSkRBsPJOxGeKtDgTD3poyxVrQlJyLU+aH7vBnMYQf1S4/zMnmPfdl/r+YHCuzyzoVH4HU/1cTM/5uZXNtrK41Gd2GOid8kiYlbQ/0dhfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVtWyxAs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVtWyxAs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718d704704aso2042622b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726237690; x=1726842490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b/bMCT0sLjRQEbfQvAeODYSG6UmjquOLOg+k5bm6LlE=;
        b=nVtWyxAsP9hzQFVYqdSFzIPu4LjvJf3C3yw4QlyaA6xhi16MqhCAUC5aRWOsGh77sp
         hUCqxU6fUtxeIf8YxYdP2gLvAekvAJtVKXY3/tIa05UX73KhCBp9OUPwjOIhR3slraDC
         A89ZvD+ZuY/ncg05GggiBHJJ1eSDNQMvHGt0U75D5BGOfWJaet/1LN3G2zg4laRIo13f
         gHjODNDo/dTc5KjoowLk5YsIn20TMrMz3kob3XMhSS46wnyDHE65QlNTQHRnjMHdTlsi
         Ktbpin1QhWawA3ya23Z5JchdXQJ6HG71yToROhlwaaCiBVdIha8QUK3NrG1i8qOe+fX7
         ejZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726237690; x=1726842490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/bMCT0sLjRQEbfQvAeODYSG6UmjquOLOg+k5bm6LlE=;
        b=CzYIYSWz/KTseNPFBra0HnvoQ971SiFr85+GII77zCWU+k17HwEMMEiNArXupGRkcs
         h5iZ5eF4+qUKFugeL3pSqulPyYKTy1U+hFbfju6088P+pn2gBR89l7dDg2nXu2+LuGeD
         nbl24dYYmm1LjQdpHdqLrT+eWGCKCxj9xx0n305UiekkQlUEF8/whR3ZwY4nxjqzO8Xk
         q0YO4Cwf9HhS1eVfkx9JZIiqPYK74NlKB++NA2iuKshragBSnro7sdETeWJlRXskZXqz
         BWb4G1YqOR9+cW7Hcx2RuPFeIXavVxIj72M+1pZRMeWitRkJvuKW9yrSMVW2SUOchEdg
         KkuA==
X-Gm-Message-State: AOJu0YwVoIfARnDVy1nTPoc/0soa7aKzhjqFePzqdUwhGFm0Xko16Gzd
	FW8QG/8QVRKHLUDSQKpHj4v8ooVkmRkqxIZafwGKWugKqfOXJX+P/LkisA==
X-Google-Smtp-Source: AGHT+IExTxk6XYkkOQkdttxxghlij7iyugb/y087ph7xxs7mI1iR+NAciv2FxTaGeC1SR4lQ4nnT4A==
X-Received: by 2002:a05:6a21:3942:b0:1c0:f5fa:cbe6 with SMTP id adf61e73a8af0-1cf75f2a407mr9652522637.22.1726237690196;
        Fri, 13 Sep 2024 07:28:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fce7e6sm6376166b3a.11.2024.09.13.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 07:28:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthew Sanders <m@ttsande.rs>
Subject: [PATCH] hwmon: Remove devm_hwmon_device_unregister() API function
Date: Fri, 13 Sep 2024 07:28:06 -0700
Message-ID: <20240913142806.888746-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_hwmon_device_unregister() has no in-tree user, and its implementation
is wrong since it does not pass the to-be-removed hardware monitoring
device as parameter. I do not envision a valid use for it; drivers needing
it should not have called devm_hwmon_device_register_with_info() in the
first place. Remove it.

Reported-by: Matthew Sanders <m@ttsande.rs>
Closes: https://lore.kernel.org/linux-hwmon/488b3bdf870ea76c4b943dbe5fd15ac8113019dc.camel@kernel.org/
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst |  7 -------
 drivers/hwmon/hwmon.c                    | 18 ------------------
 include/linux/hwmon.h                    |  1 -
 3 files changed, 26 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 6cacf7daf25c..8297acfa3a2d 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -38,8 +38,6 @@ register/unregister functions::
 
   void hwmon_device_unregister(struct device *dev);
 
-  void devm_hwmon_device_unregister(struct device *dev);
-
   char *hwmon_sanitize_name(const char *name);
 
   char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
@@ -64,11 +62,6 @@ monitoring device structure. This function must be called from the driver
 remove function if the hardware monitoring device was registered with
 hwmon_device_register_with_info.
 
-devm_hwmon_device_unregister does not normally have to be called. It is only
-needed for error handling, and only needed if the driver probe fails after
-the call to devm_hwmon_device_register_with_info and if the automatic (device
-managed) removal would be too late.
-
 All supported hwmon device registration functions only accept valid device
 names. Device names including invalid characters (whitespace, '*', or '-')
 will be rejected. The 'name' parameter is mandatory.
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index a362080d41fa..9c35c4d0369d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1188,24 +1188,6 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(devm_hwmon_device_register_with_info);
 
-static int devm_hwmon_match(struct device *dev, void *res, void *data)
-{
-	struct device **hwdev = res;
-
-	return *hwdev == data;
-}
-
-/**
- * devm_hwmon_device_unregister - removes a previously registered hwmon device
- *
- * @dev: the parent device of the device to unregister
- */
-void devm_hwmon_device_unregister(struct device *dev)
-{
-	WARN_ON(devres_release(dev, devm_hwmon_release, devm_hwmon_match, dev));
-}
-EXPORT_SYMBOL_GPL(devm_hwmon_device_unregister);
-
 static char *__hwmon_sanitize_name(struct device *dev, const char *old_name)
 {
 	char *name, *p;
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index e94314760aab..5c6a421ad580 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -481,7 +481,6 @@ devm_hwmon_device_register_with_info(struct device *dev,
 				const struct attribute_group **extra_groups);
 
 void hwmon_device_unregister(struct device *dev);
-void devm_hwmon_device_unregister(struct device *dev);
 
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel);
-- 
2.45.2

