Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AA17E8F0
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091110; cv=none; b=GSyS1v1PuncdAh7s4ij13LsaVhSJse5J0KFsqfeeEpWdVHmD0TBwimN0/3Zq8BGuQvfPEc7NaIWQ4FU9/0xtjrkcZvzsZNxYHNV7CSc3tfjvtGPQrFIF1tSq2zD9TMYSFmPBm4gZcc7Gd+z0uWe+Xuf37CluYo6PJwHTJLgTUqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091110; c=relaxed/simple;
	bh=1GderYZUYa1fLCggFyIitxpPq2weN1rhRHUmWaHAO4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yk9bjOfLHu5ySYeSKYyVps53cFAOawQG3oTfikuU3GXEc8GnO4HuqUBev3NxXXDkrcj16vX26ruFs12s1+6/0uapKrk0B36mcM+mk3RB+BO31VXcF9+XgjIR6ye/CP7ytFhl/ZTG3W5mET/qAso7wlk2hYLj7D/hqTvVsD+oHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg+9AclF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg+9AclF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb5787b4a5so1263235a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091107; x=1722695907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zVshvsVtHrjbqy8l31EBw8xCXGzitW1cD53mRc0Lcw=;
        b=Sg+9AclF7j7Z9p/ZkxUZX67u/37Q2cAZjeVloDAYW1UPVZbqU0sCZKvAQARq2pK8Tg
         ardpcACGlsc66tKTVey2ixm9jO4xgFbsCtCvNn4S1rmSr+a1JZ/Il08XONpYHQhFPcAF
         qLcHjx6hQiVUQMfC8Gt87ROQEm4QYN+Cq/vwXQ/QvCs/U0gofzUrGQAZhU1orVXNe2r1
         XuP9OOcNr4+mxG9z0N3b3S4BABPyWPsAhOOtoWxjGiWU2sNcUuZBMk47XlYcXvyhVSDy
         2qYnyOLqeeliSsL4V0WHiXWdqY5Zy3Btr2ISXoKN3NcGMOJSbTPvTRnbb4CCcPPCgOLF
         7Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091107; x=1722695907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zVshvsVtHrjbqy8l31EBw8xCXGzitW1cD53mRc0Lcw=;
        b=Ia3vXvRxml4uufb5j6uegHlhtFzp0tYPIIL8puWnniNXs6r5wVA1XP5M1hwbdvvpVb
         SgOfzYgeSq8J3sEOTY8vGGYCSSzIcaKhOZDCNH6ej0Sm53cP4J5VW6em2DXQa1BQzPyV
         oq3VXntr8wsQ4crhO/hVWWrvdyhAt+V+05n3iEFXQu5jqms58orS4wEbw2uVitRnQGlw
         VLLF0YyVuwXBrZyB4VO5Dg/sppKlOce5X00IA44mCyW/MbxGkh5hdu4qvv0zhGw48+K5
         wKzyTEH7FkwdgsXIGPWnaiLJglvOVM3Y/6D+aNOB6OT7VhzhqyWeE0emPeRpnosUSibr
         al5g==
X-Gm-Message-State: AOJu0YzLHwwMDGpYO9Od00LCAg+vyDVa4YlbvEM+ElR0Qgkh5FP5yxOY
	nI6sQqah8tiK6qaIpJ4iUXbckp+6d/AvnsGC/bxaQCdVScPrTPZGou9f7g==
X-Google-Smtp-Source: AGHT+IEkIVQeLGV4Bpnt0NeAgJ+mNVQMFEvF+ns0vcwRkg093NP4JemOg5u4UkEFC9EV6NQiWD2NLw==
X-Received: by 2002:a17:90a:ab93:b0:2c4:dc63:96d7 with SMTP id 98e67ed59e1d1-2cf7e71c28fmr2254121a91.41.1722091106630;
        Sat, 27 Jul 2024 07:38:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb760e6absm7323986a91.55.2024.07.27.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (max1619) Clamp temperature range when writing limits
Date: Sat, 27 Jul 2024 07:38:15 -0700
Message-Id: <20240727143820.1358225-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727143820.1358225-1-linux@roeck-us.net>
References: <20240727143820.1358225-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module test code reports underflows when writing sensor limits.

temp2_min: Suspected underflow: [min=-77000, read 101000, written -2147483648]
temp2_max: Suspected underflow: [min=-77000, read 101000, written -2147483648]
temp2_crit: Suspected underflow: [min=-77000, read 101000, written -2147483648]

Clamp temperature ranges when writing limits to fix the problem.
While at it, use sign_extend32() when reading temperatures to make
the code easier to understand.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1619.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index a89a519cf5d9..464f4c838394 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -52,16 +52,6 @@ static const unsigned short normal_i2c[] = {
  * Conversions
  */
 
-static int temp_from_reg(int val)
-{
-	return (val & 0x80 ? val-0x100 : val) * 1000;
-}
-
-static int temp_to_reg(int val)
-{
-	return (val < 0 ? val+0x100*1000 : val) / 1000;
-}
-
 enum temp_index {
 	t_input1 = 0,
 	t_input2,
@@ -142,7 +132,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max1619_data *data = max1619_update_device(dev);
 
-	return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
+	return sprintf(buf, "%d\n", sign_extend(data->temp[attr->index], 7) * 1000);
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -158,7 +148,7 @@ static ssize_t temp_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->temp[attr->index] = temp_to_reg(val);
+	data->temp[attr->index] = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 	i2c_smbus_write_byte_data(client, regs_write[attr->index],
 				  data->temp[attr->index]);
 	mutex_unlock(&data->update_lock);
-- 
2.39.2

