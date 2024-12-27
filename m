Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3EF1369AE;
	Fri, 27 Dec 2024 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297230; cv=none; b=NK7ABfLVNRpXZjy+WJa4MCBf6knsgf5nE6Ta8uLopCUIW8PwZWPD4pj+Y87jlI23xnNqeJ4/zjXXoLsxdveJOy/rJ4FmDaBt6QLj3PBi1ijQ1YlYuKT3NJblWNayBW2H8oDR7lETHgij6jkRkP3MSY33G18ODsphGV4vUais2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297230; c=relaxed/simple;
	bh=cdinh+20E4sIUzt67T3KK2sfE27uUiRLgwjhBRt3keU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E06V1jHOx19avLmv373jB4UDZyQROunptPUDBgZXPBqqcDnNbVJbVMNNGi3RUxTSOB2asRcVbOhp8kc2flNGcYN5MXh+L24SqmXwLY579lCH6LtlARokVwtcgcMuWBdNVRPXbAH0w1FIa/Bvi1CHHslYCeWwcW/1So8BBsBFlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyxfNjWg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyxfNjWg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so7135644e87.1;
        Fri, 27 Dec 2024 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735297226; x=1735902026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHTliNIJdNSjUebG2NRsHMGWZrnV+kyy7VmlAkngDQs=;
        b=SyxfNjWgz7ATmJS75+LmIA9n7/XSaZd1pB0oR26/UA0mVhspfGK6zEce+j3zUkUXNB
         gs1vbEdNifK4xETIYNfNMm4YmpOGh9y6ssbc6cxzq22H+rgTFd0EabbFfMA+HhlAK385
         +8Q+AsY9w2T8c4wxgK3+u74231Ly5Sl8v2V/k7v3VM6DttU6YWLLFmpHgpcsBvS3hf07
         pdfuDm2Dl7oOTq+CmvhkMmjS20sj9HMfQBo7iOHzzhwjj7jRJgLYjvF6+rFmjL1KfRsh
         SpVjnHCQsNdKtuxFGwXHmb6I1lRm9NIMPsl1SyuYv27KAhNknKkxtT+0beQSdLY6+mnB
         R2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735297226; x=1735902026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHTliNIJdNSjUebG2NRsHMGWZrnV+kyy7VmlAkngDQs=;
        b=g/KTAaBtl4C8psR+XNEyUvphZ3DDOfrA18rUf6BVi99Dmis68sSzyHyacFoQEiyq1g
         hs08nRjb4N0Bliqpj2sEpJHMpnUBNMd9KUvOT+8oBWBzZ4VTC4wzrBKB9ECfMeNLfGVK
         nAPcbLi4k/iPYZD0R2ovOUZDIu/b0nV41AScGex0ddmA5jTEv1CUm9gsZjZU+bJT3Zna
         Kxa8IUF08hvuo2egMjIDsBhYFDlE7isexge6bC7fVWYQbAa7ERj1o8egn0Q/AjK/GCcX
         wECKgZ+L+s2yizptdC01k7yMs1aKMYTOXNzmwRo1s5OBkPuB4YJJeWRPtc9Q7/8xtr2Y
         D9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV7R52n8JUC86NRMduJE4z0v8V8P0hbtIH5TnPi/cngB6Qg8u7QHzpyLWVCagCJDq3a5GduxGetu1mpHeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZpAbHyFCfNnnNUTHkxb1jvLOJGtSXRsEIATzhGGR6/f0yoUl
	EGhb5E5H7ScdXjKs86POPQZSLBBGqTKtmSaYqWqgoCGiXSN7wD0t
X-Gm-Gg: ASbGnctUIHLxGiefJyONc/SljjjEXwL4vbo7yM+Xs8FPpfrAXDdXfpIIgqGeW5i7csi
	XIwlXor/f8FXpFmT7b4EzT/93BwW6P3yoFMcyZgLIyVVDnCpG57RDxFJ8GckgySjtcRVDMGsLzL
	4S5GDWD2qEt10ipKN0/wAL9QOURAPcREFBCC4htnwer0rxINZfmtl2VovEbW46Fpa2lqGYOktiG
	T11t4/mM+0rIUaWktLJlzWJY/8IMdh77rXbaov5T5LIUTMSPOsVY4mt
X-Google-Smtp-Source: AGHT+IGijpVSoaufsNtQWsE0501GBSxkta9auek82/+WncC2+xlC4ImApv2v0h4pCWgre0o5ay7gZQ==
X-Received: by 2002:a05:6512:6cc:b0:542:28af:814 with SMTP id 2adb3069b0e04-54228af083cmr8161974e87.19.1735297226195;
        Fri, 27 Dec 2024 03:00:26 -0800 (PST)
Received: from X220-Tablet.. ([83.217.202.104])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223831fdesm2395481e87.241.2024.12.27.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:00:24 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: robert.marko@sartura.hr,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH v2] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
Date: Fri, 27 Dec 2024 13:59:55 +0300
Message-ID: <20241227105955.6660-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently I have an x86-based system with a Delta PSU
attched to it thought the i2c bus and OF is disabled.
That means that in the configuration above I can't instantiate
an i2c driver since the driver doesn't have the i2c match table.

Let's add the ability to match the driver with i2c like the
following command:

echo "dps920ab" 0x58 > /sys/bus/i2c/devices/i2c-0/new_device
...
[616189.076211] i2c i2c-0: new_device: Instantiated device dps920ab at 0x58

v2: add more verbose changelog

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index cc5aac9dfdb3..c002ed41f517 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dps920ab_of_match);
 
+static struct i2c_device_id dps920ab_i2c_match[] = {
+	{ "dps920ab" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dps920ab_i2c_match);
+
 static struct i2c_driver dps920ab_driver = {
 	.driver = {
 		   .name = "dps920ab",
 		   .of_match_table = of_match_ptr(dps920ab_of_match),
 	},
 	.probe = dps920ab_probe,
+	.id_table = dps920ab_device_id,
 };
 
 module_i2c_driver(dps920ab_driver);
-- 
2.43.0

