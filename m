Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8F2FFDD7
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455530; cv=none; b=giQtbNWuIp+Lkl/yTslM945MbtjT98nx9Ns+uPzrKgU9fXgGa/yOYgvo2tEG5zFyT1ANElQu0E0PQYlLml9U7D4C54tuZXOySKnV611kYYIlxpQvqrJ9ly9AjBkmAP1g+F3D0/aCqaABq8xojqvLiponAPi5BOiYmr3os429Qbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455530; c=relaxed/simple;
	bh=1t9gQ/ub5cd2WNNMu32As1gO9jnJa2SyWFQ/bFjjFy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfuGWqbJZoYMVHJjyLOO+HgBJWEDPI3rUYfJrxz11Ab82AsXcwDSuDWE30nGHcjDa8q43Isfdu/Jw7FOQaFW0F2zRY8flH2xgRpyoPUkebylWlWW9daiSG6pWU08tZxPjLzPsOMfuJnmUOPIyDvtJgfuitd83DOB4HTVkJ+x7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtb+TdFX; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtb+TdFX"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33b8a8aa73bso1334830a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455528; x=1761060328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7cdZSw0skGd3/2NIQmPBPf5wzRTeB8zqxrygdKp6P0=;
        b=Wtb+TdFXSz01PO6a494PxCkUdqvzUfOjbyCicDoftXcqh44gTyHStKt5qNzlLZ36v/
         Kmf3bsKOYMdH8nB11BeiCLqiVye7HO5cQ9wMPWO4sXqoR2hIMGQtLgj44TcwlLd+SgLI
         f6URwBKv439rUh8dyqFo7yqKFCbYoIo97sxZn7gHCOUW8RlEULeGCXx16aYtIep6KZIV
         2z7bPJX4gxvYGRsLMg990Tw6JXFyV2lUxvqegWbFWsI9ar72D3I1AzSpJoq+Mh8OD0bl
         9LMsa2QiW2kjznCSbh3g8cSWab3AnbcQ1PTzBsnhB9tZc+zUBmzE63f0SpVum6Zddl7X
         qQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455528; x=1761060328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7cdZSw0skGd3/2NIQmPBPf5wzRTeB8zqxrygdKp6P0=;
        b=eyCgIeGy3OOaPCFyM+90uadSgZu/u0r06A7mff+gUe3dodAC+qO0z42vr6XgmjhlU6
         RVsiOtH02WRmVTcwnkOvmLrfFNOurt3+uaaef1Qnvy+abUKg+WTtpB/ktSu+Wtf+VLFe
         fhDHVzXU3ZKVkmP3YRHbxLaldOliANcYGQyt76HNY9uOsyXOUhxaoPXLd2Bshv2qtZEF
         O/p6S+nklg+qiGntkWIJB0RSlFDo0zSg+KOUu788WU1/LnRrKDxMZnlu5op1qsUyWbOo
         /XjspH2ON0E/HUSKw0lDIa0ACBCRoUhXbzzuVK/ktthyA6vDFz5/gjDV7C4aFW+B9Cou
         0UZQ==
X-Gm-Message-State: AOJu0Yw7Gbg5uq0i7lSBNImZycJodnOOXDCjAuzHnQkg9kli+eKoI5k5
	nOa6AzdPKAAajLv0vY9Dt9VqaSNBFQz3ujZSzopVEr7Vwx9q6QlykNlMg2wguw==
X-Gm-Gg: ASbGncsQ+RVRJGdR416eiO7h73BGc1juMuzZti4S/fOso+M7rWAIeiIBF2QNLHOzV5T
	iMf5Rcn31YXYFFvCNm43JQ+CEXeYoBx2CQZgFQC9GFkyMhwqjKb5mGDCfTko/PE9OjgPXE2Bmii
	GNGbZQznSuKxIvGKuHgdnlSeo0+EmOW2BvJdQnjJTZeUA6nMop7a6M69gsqShrR9bBjX8qYRA4U
	dkyicrWSoT8lAzpiHTSSclkubEcfJAQ4MbcWyf00YBcbmqrAusxGM+P+9SM/Cq+dJecJHrXJYDj
	G3lXkIHbNl3MvONXZbrSiel9unnf33tmEquVjfbZWzXcbDNypDh0iGZQsai6wKF0TDQzl6ECque
	JDUVdh3GhV5xyDuLpO8KkD5ENUUqr9LIHcsRgOSdXNhBaywNoiPNP+w==
X-Google-Smtp-Source: AGHT+IERrwr4nbVKnKTb4X7oKtAM0zm+6dI9Za5PWCU9VW7/9yNjBi0G7WPCetGuetWUvifKH/Isvw==
X-Received: by 2002:a17:90b:4a87:b0:330:604a:1009 with SMTP id 98e67ed59e1d1-33b5127aba2mr37372692a91.23.1760455528160;
        Tue, 14 Oct 2025 08:25:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm16536247a91.9.2025.10.14.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/20] hwmon: (tmp421) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:01 -0700
Message-ID: <20251014152515.785203-7-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp421.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 9537727aad9a..2e43ce8408d6 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -19,7 +19,6 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/sysfs.h>
 
@@ -99,7 +98,6 @@ struct tmp421_channel {
 
 struct tmp421_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
 	u32 temp_config[MAX_CHANNELS + 1];
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[2];
@@ -130,38 +128,28 @@ static int tmp421_update_device(struct tmp421_data *data)
 	int ret = 0;
 	int i;
 
-	mutex_lock(&data->update_lock);
-
 	if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
 	    !data->valid) {
+		data->valid = false;
 		ret = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_1);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		data->config = ret;
 
 		for (i = 0; i < data->channels; i++) {
 			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_MSB[i]);
 			if (ret < 0)
-				goto exit;
+				return ret;
 			data->channel[i].temp = ret << 8;
 
 			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_LSB[i]);
 			if (ret < 0)
-				goto exit;
+				return ret;
 			data->channel[i].temp |= ret;
 		}
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
-
-exit:
-	mutex_unlock(&data->update_lock);
-
-	if (ret < 0) {
-		data->valid = false;
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -442,7 +430,6 @@ static int tmp421_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	mutex_init(&data->update_lock);
 	data->channels = (unsigned long)i2c_get_match_data(client);
 	data->client = client;
 
-- 
2.45.2

