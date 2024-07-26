Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3E7F8
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954618; cv=none; b=mRtItePmBCDMs9VgkIApQAg9DkhEETuuFAxqHtz82+2TEbx9bA3eJOpdBBvkN9TKcUw6iGLgVWDj91yDBub8lKFOMmwqGgCjb+sSgzOsJpsnNpHDJQ7rlZTXp9scE7kawKDFcExqAqz2neoAhfIYfO9Apf/gt0fYKXpH5J9QIWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954618; c=relaxed/simple;
	bh=oYH1gMvwELeH8/rKH2A6V0cP+kzRmMeuv2nYfoJ1G5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SS6/fexEuUcT9ISNTiCNxt7pmJzyWjtno2C73ELh7PqnUpFhqEyCG+8RMNkSmM6etza6RdWfsKMysEDXHoDleny/19FE+DKJhp24Mn5YLIrryBsDJVs8nwbtPA3HNRZtRtkNM1Xd+Yz8IA1vWLupXhCIXuFNrPFbo+2sCQqDcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSZuvO2r; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSZuvO2r"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc60c3ead4so1062145ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954616; x=1722559416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhmEI39jJ8nW4OsEZ3phhwIyTyjfbbsfmey5uN1ic1o=;
        b=ZSZuvO2r9RZGmvoE46bM1qgShk9lKV6USmXE4BC2mUsDBLp7mt153ESGF0kHYA7j/0
         oA7bAdxvs65/cQIgMSm2AtdJcajtuMvMqXEPhIgMOM1bK+NyPsOuDdetaRYUd+FtiwLO
         zC40pEtBpx7c+1Fq7rQbyQvXAmFy2fgxjBaaXY+TDCtOoNxr1Yy2RmZLkpIZXicDd4bJ
         KC5haQ0L9NUIVy2qOhZyszyllbwxxT+i0Jw+tHNijzG3wl52/+krp6PgYDM0S6XOd5ly
         jX6kKVjCuIzfHxJpSWCpSUXn53sjW3vBfDivir0fCk10FUTLZdFZGHQ4pUGMEr5gO7Mz
         uJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954616; x=1722559416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhmEI39jJ8nW4OsEZ3phhwIyTyjfbbsfmey5uN1ic1o=;
        b=D1WEVm/3NyEcydisL4uF63jPxhmy6cCfFTObp+h5crz2MUtpeEZZmiGtqMEm3G5cxk
         OeNTB85/jjapqVjJzK8KwV5pp/A24ZgLR1cS5WqObj4f/biKHZVT6Que1lUxkol34t1o
         QSihwpE8ew/b6vvj6YOpNOCQbqRecUINwgSh/VJ//uSH3Gp7AT2mxyS+aXd/jlk+18hN
         uSETXGjz2JAWdvf1wfcaJPoOy7EGmT1YXR3BWRh+TQ0S77jk7DypYdwSQXpcPbsdJdAJ
         Q7ll9F1rgGN4OJ88vxXAyHvhYiOWQYzdsCPJOxw0ty+GIh1eCvmzyJc6CY8P5jTzARrS
         jboA==
X-Gm-Message-State: AOJu0Yxzgis+wKL7QZzuWzkbVHcfBBtQ2pN6fWjUE7vpblsmx/VzwwS7
	C4VVJ/5Glb2Qb/fuKTbxmpZwwuWJ/r2Ox2WdVMxWJJwXtxhL2s3pANAZtg==
X-Google-Smtp-Source: AGHT+IEf+aMd5WnNvd3do9AjfOPeg5IGhU5gcTmL3r/AaSHmJQZ5ZqPauh7REOOXuGkIMPeNui5iBg==
X-Received: by 2002:a17:902:d489:b0:1fb:a1cb:cb31 with SMTP id d9443c01a7336-1fed3860384mr61743785ad.17.1721954615844;
        Thu, 25 Jul 2024 17:43:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff5fadsm20000775ad.297.2024.07.25.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon: (max1668) Use BIT macro
Date: Thu, 25 Jul 2024 17:43:26 -0700
Message-Id: <20240726004329.934763-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726004329.934763-1-linux@roeck-us.net>
References: <20240726004329.934763-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit macro to make the code easier to understand and reduce duplication.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index f5b5cc29da17..83085ed0ae7e 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -6,6 +6,7 @@
  * some credit to Christoph Scheurer, but largely a rewrite
  */
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -172,7 +173,7 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
+	return sprintf(buf, "%u\n", !!(data->alarms & BIT(index)));
 }
 
 static ssize_t show_fault(struct device *dev,
@@ -185,7 +186,7 @@ static ssize_t show_fault(struct device *dev,
 		return PTR_ERR(data);
 
 	return sprintf(buf, "%u\n",
-		       (data->alarms & (1 << 12)) && data->temp[index] == 127);
+		       (data->alarms & BIT(12)) && data->temp[index] == 127);
 }
 
 static ssize_t set_temp_max(struct device *dev,
-- 
2.39.2

