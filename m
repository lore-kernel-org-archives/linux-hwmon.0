Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCA2FBDE9
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455537; cv=none; b=UnajyFnuvuLz1vSKb6AjNqc+bKmhyXwkJ/JB00//3aXo1SkX4VK8+ZLx8faEmhJ2vn8rUZn+kY1ovDlpRJok1YatmnqSvc1S2zS/IiOzKwe+OxTOiaCBI6ZdlqLTMUoZdtrdvETfI1LTD3oHtmlzikEoLNWQzs1Z7gk7yQ3De7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455537; c=relaxed/simple;
	bh=Qjwkq62DdzVMoa5fyyTi/MMYo4sA9NG4dvmSgs30V6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AW3O8sT7BKNCUahSjzeR33OqXXwpNpgYKNV+L4zGqQDpgkE5AnYZWPHv5FH5KvUBARLC+xRa69rc2On7koN91rfmXt47lml2nDOu10VZ3bipJX3CrOvlqCoKBBj4mb79tmiAIDLu1n81Nrm0xzCNmA82U9b9jbREGLrAJitr57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yt7EMELi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt7EMELi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-28a5b8b12a1so49264475ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455535; x=1761060335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfcopLmxOaSyDqmL7ZLFKWGhfyi69jNs3C708/u5qw8=;
        b=Yt7EMELiCRXmIvk89dQBGLgxIGx8svV36PBDqgf55IAuaW2wYr4cyIwFhRxoV7ooFt
         QvGFkxec5lrsZBh/VwgXoIrx0JyIcaceM6qAhWcpuoqIbZjxw2fC7+o153dxyHBeujcY
         jqOgjEP6gjNR/YniA73MT0/2/EeJhM2Ry9cpdHH6s/9+bVhVnXPJdmdT0RODS4CbyuXz
         yKZqZzZMgXaIEFcxHPP+zinyg2AZZogrf3dLzvNJLDKHONpbi/F+Fu1LADwv1wGPHL19
         eYnmX8cJx6ukbnl+H8D/K5QVEm6ee1QAisDT2bJfrISKaSkwXFwr9Mh51bOznHfPGBfT
         gwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455535; x=1761060335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfcopLmxOaSyDqmL7ZLFKWGhfyi69jNs3C708/u5qw8=;
        b=s6KfW4j7FKkl4cFhjlMKFbITJiPCA8PmJeyOGYPPkNCDlrGz/ptRtl1jbTiNda1O8C
         hGoy3GSVxFGVUa4nNT+BEkHpkPZrEbbiGeWj0EdTAeqXvg4frjZqQedlEpafo7U/odpt
         EaH4sDNq7aQguQRUeWTwn5QBYy1vjoj8tgd2QaUb1PZSqwD1Hbjli5pr3fS3I/illvz5
         J122+P/0k+j9XN2xhAGz8IAUSHEjuw6iazA8X6beh6iLd1PSb7OD6I+iv8TUjKNkTLF+
         Iano55YPDtB2EiCsFej5WajVnTUaM1dFh9cDMEDVVDyvhmC4QW43ieun0hxOefK3icXG
         GWyg==
X-Gm-Message-State: AOJu0YwHRYvf8XU+90bF1pkl42tw5omiCAkX18Td0hjT3Xwl3g1tyMYK
	nheD6Iw9YnbD810KFl4dVff6dGkVAzWvWoV/voF87G1KA5WAIHtHzp4XUYVALQ==
X-Gm-Gg: ASbGncurMXWhLihwNkSW45TXMPf9OkPXxhgWsHR8IA3HLj48ACMFz0EbLvjZjt8j+FN
	9O+G95SQ3Fr+yBPIaduTAWu8IRfmxK7ZEJpKx3u0gkSH2uoGulFrtWzGAGizQEKqumgu1ZBvzeE
	Xu8kxUIDu+55jMEFcTXX419bHcnUchF9mF0zSdM8+ezQzA5NjierFN+IhRAEMQeycf3v63Mi3PH
	wgRcGtya0J0Qh2oeC6BqFEc047JR+QVztA7+JQ0rM1w77H5WjjDH58yPNNFpwZMVjkRoh8YkjfI
	HUVqPRBMY2c61VkXdOzHDoGFGmJPydKPEo5d0W7+bIfUSMphEpsTIxJafC5RIsVbgUG+Q8UKMMH
	K0wuXVdt3sYJiyqw+vQ2YpBvKzPXx2zYiwwaAmPX0Fs8UzCZBRZN1WtHUYjJO/aVa
X-Google-Smtp-Source: AGHT+IFgOVKAfnqeNRlK5CN5qhxrlo/NxbLs2ija5bXTrYSIoldaaZbC0XFsksPu9ZnPLAs2vhVbvw==
X-Received: by 2002:a17:903:2ecd:b0:265:57dc:977b with SMTP id d9443c01a7336-2902741e47dmr292560325ad.61.1760455534921;
        Tue, 14 Oct 2025 08:25:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1853fsm168533315ad.41.2025.10.14.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/20] hwmon: (ltc4245) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:06 -0700
Message-ID: <20251014152515.785203-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

While at it, drop the unnecessary include of hwmon-sysfs.h.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4245.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index 14593bc81e85..e8131a48bda7 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
 #include <linux/platform_data/ltc4245.h>
 
@@ -51,7 +50,6 @@ enum ltc4245_cmd {
 struct ltc4245_data {
 	struct i2c_client *client;
 
-	struct mutex update_lock;
 	bool valid;
 	unsigned long last_updated; /* in jiffies */
 
@@ -132,10 +130,7 @@ static struct ltc4245_data *ltc4245_update_device(struct device *dev)
 	s32 val;
 	int i;
 
-	mutex_lock(&data->update_lock);
-
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-
 		/* Read control registers -- 0x00 to 0x07 */
 		for (i = 0; i < ARRAY_SIZE(data->cregs); i++) {
 			val = i2c_smbus_read_byte_data(client, i);
@@ -161,8 +156,6 @@ static struct ltc4245_data *ltc4245_update_device(struct device *dev)
 		data->valid = true;
 	}
 
-	mutex_unlock(&data->update_lock);
-
 	return data;
 }
 
@@ -454,7 +447,6 @@ static int ltc4245_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->update_lock);
 	data->use_extra_gpios = ltc4245_use_extra_gpios(client);
 
 	/* Initialize the LTC4245 chip */
-- 
2.45.2

