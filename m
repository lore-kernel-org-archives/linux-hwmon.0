Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F01249F5
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jul 2024 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363666; cv=none; b=CLVRq/Mp6zDuz58h2lxY5JWsjZKQy0+Uh9pqCDjtDzaQ5nAhcSOFtGSG3xpslf1z7XzG436yTx6YL/nWsAujS8fZJKX4bS5DUVt9V1eufIYn5dq0LCxP/oOVUDM38eMdX1R49tNK12DH0StdqWzAyWn8qBNlc+VX0Ro3g7kjOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363666; c=relaxed/simple;
	bh=OxMxHKY/7EcDMXWNJgMSRcvEDpp8+Cu6kzSCm5Rnns4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZaNFNVilrsT4DUwQUpe5E1LUQGI1kh/i8MCTu3L2yF3Hq69IAy4jtMKwwYqPZQs3gKYQ5a1TK81+GOcRrD4lWrlTqwQbpQLfZStk2xp3D6p/IVTTzsFq90rgV9wO3zx0ClJ9n8sXRn0eAWWg0wUJREcYHzi7jePN+57zWnyNrbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R33hAM+E; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R33hAM+E"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7fa8ffd03aaso23544439f.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jul 2024 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363664; x=1720968464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXhLjdmO1CjATRhU5W7zEDwOJSaHfyV1bCOmj/qlkIA=;
        b=R33hAM+EwTpGBewdl9KHaUb1zh62+EkzkWl6bTg6Z68eIg78bjvVcJpWuuJaIuJbOL
         /IiWEWRNSs24nL9718yRKwjg6SkGoE1TaG4vSjwufvNeNvC0vpaiiTH0TYpPk7MJE/Mw
         uYNUhfoKdFcLVpDqe7hHxRajjnKfrrKidy6JfRkHr4lrMfPlYUNRs10Fc90V8kCfDrP4
         hYbZjs80MbilzMCcB4VrLxx2ktScbAlFL05ily0eO8A7xpWCyrf6/MwNjNinHq2/WgUP
         kg/zseoVR3RfME7fA7BxFRmUaOVQT3zFbmkHhM6WNv36F7RxGjIBOVM4L9K9Xss6vGvE
         SLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363664; x=1720968464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXhLjdmO1CjATRhU5W7zEDwOJSaHfyV1bCOmj/qlkIA=;
        b=b21TAYFFHryMVF3kVhY1jexHwbms28IDJpRfh2vYehJSWjBsmj6XBduQy4GRxj4SLw
         nTfhvI32twfOak9y30X8jwoD7ICjAlkHE/cC+4z8KX7Van5u+626z3Clc/b6fpHuLsqO
         sos1xBrkyUmLQ6NDaI2phvbvB0T6hDTRwEVzPyRMYTkrfMf0GJAFdOHgY3V9gfnplseH
         hYeKIAv/8mQ5VIxwInA6y0Xu1qTz0yBZYBEHeVXzxhUu4UoF8qP+bU51t1wRwfFscUXf
         L+wb6tiWr0ROIh5qMxzrWxcBhIFOqzBEA1ok7RJHn32d0XjjFIX+zyqH7oqJp5LE6K1+
         w0IQ==
X-Gm-Message-State: AOJu0YyBI6fKGQZ1BhMwjsJ9SuwIUYQKmXuJHIHoQK7XZ976Z5ADKenP
	n7kz3oZt15CakaCwf1L6guFeGE5r7Pwjn9XIIQWADmHV+1niClHdRPKqlA==
X-Google-Smtp-Source: AGHT+IEHqMqQxgN11Sg5yZWE1Pxj6jX0/HgIgJFoUK89ssp1Gp72THdQ//lN2OGXXIxlHANOgpfngA==
X-Received: by 2002:a05:6e02:1d04:b0:375:a6cd:dff2 with SMTP id e9e14a558f8ab-3839871068dmr130491465ab.5.1720363663697;
        Sun, 07 Jul 2024 07:47:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a9977cfsm6456774a91.34.2024.07.07.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 07:47:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (w83627ehf) Fix underflows seen when writing limit attributes
Date: Sun,  7 Jul 2024 07:47:30 -0700
Message-Id: <20240707144730.1490208-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240707144730.1490208-1-linux@roeck-us.net>
References: <20240707144730.1490208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIV_ROUND_CLOSEST() after kstrtol() results in an underflow if a large
negative number such as -9223372036854775808 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627ehf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index fe960c0a624f..7d7d70afde65 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -895,7 +895,7 @@ store_target_temp(struct device *dev, struct device_attribute *attr,
 	if (err < 0)
 		return err;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 127000), 1000);
 
 	mutex_lock(&data->update_lock);
 	data->target_temp[nr] = val;
@@ -920,7 +920,7 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	/* Limit the temp to 0C - 15C */
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 15);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 15000), 1000);
 
 	mutex_lock(&data->update_lock);
 	reg = w83627ehf_read_value(data, W83627EHF_REG_TOLERANCE[nr]);
-- 
2.39.2

