Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A91EEBB
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760792986; cv=none; b=HAuUaNNCKMCJ/Mzu/TevIkjqdouVEP1fJL1UPPK5DWYVFlIPNqAn8vqlrxmTXhgKW5ySOxjEPvfvrq+wGEw/fN0ZfVQVjsD2VQCMsMcknODxmMEzLrfK26XmXVFfdy67KABNd0KJrr5D04gpkVqjD5qTHjkAxpeAUt1aC8a7ask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760792986; c=relaxed/simple;
	bh=OldY5FEflXq95zzWwHztGhZEQuYehr7songapzMe3/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WcxpgpTOe3Rs+sQQ5wGTvGpozFBlkQrqScQD2NcUwgqdHKmPzLHBdCJqy7kMIWR/LbFFcre2KrHn3qfQp4IqDbKLw6WNR6fdOrWoFf0qU+eeVnB4OLRarUflKnpJ/1h+HC8Pqmupk+hZQjVjGTkdDxeBwMGyVYMN5XIpr2DCILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9uTSjfw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9uTSjfw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so2692155a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760792984; x=1761397784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WpzC6DVSRx4+aYKMy8t/CcNseASKG9X9rvfxIp2dybg=;
        b=k9uTSjfwX6H7TzvLjRvCr3DanGh8divQ9AliRDRPmPM8Gy6veQK7B68iFEcYfoQgqe
         ow88Kq83i2gYp2IxR/zMtujb45jMay4HE+prl+RmzWh/d9jBwUEm7u6CPfT6sl4ls652
         NnCjjkntDD1RJHc0Zb4W412gBqSkf0nG4wxkFhaciQ+sma4o6EmcjInI9NnlSFoOrbxG
         leh5j4cRJFQe6hiPcCRJGyDuOV24TWohmW7IFA9p3jkhyki7RI5Vzxt9iS2ZhMvRoY8h
         CWowYNe9oo+H4EebIq6LVw7VlaIhtyGGFKdCraXb+mOHQBIeDOAWwp6fLvopm0w45+Bx
         SHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760792984; x=1761397784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzC6DVSRx4+aYKMy8t/CcNseASKG9X9rvfxIp2dybg=;
        b=YWF/xdIEO1/umZpqIJ/0U6BhB/xisNBJcIBoEC943zns02BexGi3zyVwu5/MXpL/Kp
         HZNDLpJAUUpoqs8WvZhsG9v1np2NE0dLPHJX1bZ1ypo1NzfdTafJFo2m2KFkO25d2aG+
         a+kn3mCo/TYAmWA0t9gq5DDdxAbhxT/SSkJiSpADnyjl7nFETJvjLeKTnADluj1VrGs9
         +ZAg1+GGT5J96jdGAWVb8pgrfsrvC+k3xvrB+9Ca7JbC7EesaDVlKtQf9aImSDEOzujw
         A5Ovm7zKujVHz0Dgk0E6T8LF7YzzjLf0t6pSxYBK86aBUhxxJ4T3Nh6b0g0+gjNMzQbz
         2v7Q==
X-Gm-Message-State: AOJu0YzhPb6/UIIdLHoQIpjHSIrcHaPelz/e5JkACG3lTq46zuBKAPif
	7ByGpeHn34ohMoF9x90VOKig6EkaGSBwIdPIs2Ukfy6RIu+4cvedds/1Y9wgSw==
X-Gm-Gg: ASbGncu2AfkeL4BSjknzgJabeTYOUIjowE3slmSCHELkJw8zb3kHlDQTv5/ZJst8PzZ
	RLMfJvulj3GlQGb6fIRN3pZjVIcDd3WrVBPqBQxR/2WLNhXZbQ2ox5xDZuuHRXX5yWbwdC+8Flx
	GBgSS9UQAxvarSMs4JQHUVbw+E0GV4uLP44aA1JDicfondgepgoOQgHY9dSe8zr3WHq0JHwcWG9
	/L9kAf6QYpCDjWT4xBb9X6CPuluJFUFxJzg5WK0i0gO3YGfp/0yAhIg0dSrFjD46gjCJQ/UWrKZ
	cm8D8spjrFp9L0CsX3DJ1Y5Ngc4yscnzCWPVs48OMy1CpeSZEMV3AI1Hrh9o2mC5yXIlxLVEmkS
	FNzkWJvY+uHGX8eDtQCaQjK8OAJQaGkA186x5OOUfGnRst8mFHtYjs5rUbvXH8KODD3IPmhi05n
	kL/+Kw7HQTHyr/
X-Google-Smtp-Source: AGHT+IEJOyiLUnat65us/exFOCpYaIlA9ymFyTM317B2WYp/mVG/AeKgaf9wzgp7a0EcTrBaPG7L4w==
X-Received: by 2002:a17:90b:5291:b0:32e:859:c79 with SMTP id 98e67ed59e1d1-33bcec1ab25mr9197692a91.0.1760792984014;
        Sat, 18 Oct 2025 06:09:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de3295dsm2612199a91.15.2025.10.18.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:09:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	JuenKit Yip <JuenKit_Yip@hotmail.com>
Subject: [PATCH] hwmon: (sht3x) Fix error handling
Date: Sat, 18 Oct 2025 06:09:39 -0700
Message-ID: <20251018130939.884428-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handling of errors when reading status, temperature, and humidity returns
the error number as negative attribute value. Fix it up by returning
the error as return value.

Fixes: a0ac418c6007c ("hwmon: (sht3x) convert some of sysfs interface to hwmon")
Cc: JuenKit Yip <JuenKit_Yip@hotmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht3x.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 557ad3e7752a..f36c0229328f 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -291,24 +291,26 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 	return data;
 }
 
-static int temp1_input_read(struct device *dev)
+static int temp1_input_read(struct device *dev, long *temp)
 {
 	struct sht3x_data *data = sht3x_update_client(dev);
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return data->temperature;
+	*temp = data->temperature;
+	return 0;
 }
 
-static int humidity1_input_read(struct device *dev)
+static int humidity1_input_read(struct device *dev, long *humidity)
 {
 	struct sht3x_data *data = sht3x_update_client(dev);
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return data->humidity;
+	*humidity = data->humidity;
+	return 0;
 }
 
 /*
@@ -706,6 +708,7 @@ static int sht3x_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
 	enum sht3x_limits index;
+	int ret;
 
 	switch (type) {
 	case hwmon_chip:
@@ -720,10 +723,12 @@ static int sht3x_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
-			*val = temp1_input_read(dev);
-			break;
+			return temp1_input_read(dev, val);
 		case hwmon_temp_alarm:
-			*val = temp1_alarm_read(dev);
+			ret = temp1_alarm_read(dev);
+			if (ret < 0)
+				return ret;
+			*val = ret;
 			break;
 		case hwmon_temp_max:
 			index = limit_max;
@@ -748,10 +753,12 @@ static int sht3x_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_humidity:
 		switch (attr) {
 		case hwmon_humidity_input:
-			*val = humidity1_input_read(dev);
-			break;
+			return humidity1_input_read(dev, val);
 		case hwmon_humidity_alarm:
-			*val = humidity1_alarm_read(dev);
+			ret = humidity1_alarm_read(dev);
+			if (ret < 0)
+				return ret;
+			*val = ret;
 			break;
 		case hwmon_humidity_max:
 			index = limit_max;
-- 
2.45.2

