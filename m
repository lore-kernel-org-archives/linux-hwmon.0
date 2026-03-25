Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EB347503
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429719; cv=none; b=LP8pVrNjnKTuORgR4BuoGVSvYJHOXRwM9jQs1xFV35X8iE9bbXearYmlRSHDU+HegnqIAJDTrDwICOg3uFAVjT5n1I4gBUTk813eVdEBgJrf640h3lKqk/hwxOY40F9+jHF6chI8WiK5+UfzVSTsEHAYLgj6GtHSOCh19HChlNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429719; c=relaxed/simple;
	bh=Y1YDUMJ0n8VY4xi8WORJkohpo3iw+yO1KCBrDnrWWIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nWO0w++gMXy8t13FziO/A3osWEV44c20NnnAwkUlWWE7UeARZTt2mZjenXIZRSjN0af48nKzRRP8UF3apxRQC8mWE9VBlzO9tGmLoUHvXR7O1ZeLYqeSZsazCLTajW0x59S767UwNZJrQvc6DP1SgvYU9Oi4sHsRfJaOnWOzu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmhtCt7P; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmhtCt7P"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so829413a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429717; x=1775034517; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhWnbpoS9T7pkofCjEvHd+AoIWGTN97nVl4Dsa2uwX8=;
        b=NmhtCt7Pc5PspekFeEaAdowiZo8TDhKUSVAPUBbfAtU5bM9LAkGSiJc9YhVN4tEbe4
         WTPkfZsvtfxr97plyASxKzFCsfggVpIf2bXb186YyApoYu9FGpjesJ/0+GkDEll+hXKu
         l7fPHhZb1++9eZ6Y91IS5Q2pA3/rAYgdgiFN4tTaT3JPezbghKsXpoudAdKyhWOSDUKP
         ON9J5dtfA1pDa4+r4Rk0p4kr0WoDJpXj0fPqD3L7NS1N2KWR+EhZsVsVXhzMzcslAJ0b
         Du3HVs1MQRvg9YaN4/I643hNqxpxYe20tG9hvU/K5KFnGSdDqBVeqOugAKiYyybUnImn
         Ygaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429717; x=1775034517;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhWnbpoS9T7pkofCjEvHd+AoIWGTN97nVl4Dsa2uwX8=;
        b=MKeJ87I15BkwOvmbtkWwCKI2UPJiVtSTjXzx2lYeB/5Fp5bTCfAbNus8ASRPJMPHll
         cR/rvjPOzjQIYQBB1A8nP/hUL0wpEqKz+JpG6/lRakMuXWzUrBcmVwaWGmlK/wRUcRjf
         /cVtpR+M42dLD/zUbSGriZ/8ejcxE/zIqh7orQjKkRpMfaCM3AxEax2NksfOTudWuHgp
         CYQByCT9hU/J4AYwaa+PNrehY8Owhk/ZyiInzoZtd3Z1mrGJdL3rGMKg6iHSOBDC+qp+
         TN6BQCd4jntU1Te9meUnWTA0FzJFPaq66KtsD90ABKP0JxMTb8DPcw/LqDFloo5FqaTS
         calg==
X-Forwarded-Encrypted: i=1; AJvYcCWEc0maxGqIQlcYL23Uks2wqjdMYTlb+WnNoSTggK9BCO3hHMdfjSwyP75+N2XIkzWj8eX5qyQb1kJXag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWMKNFIItKKTzLPueEehDWYB7jPEvPf+Wsm94NU27whyZ4GvCb
	8d7GIvGFSnKgfyVVT+tHizZS0DhwoBe5mV0l6URpANde7fkt0gdcARHf
X-Gm-Gg: ATEYQzyMS/+b3WaIai1f0/lUIQTGeJ4hoVOrvLB5qHbR63Bqgss87KMBKsCco/w1K0p
	zV+W4kAImCIMsXBH1ITHe5eXQ/9zGBxC0q45jyURlrwKDxAOsiFNSkfK4jzEClTVpUcovEfxK5j
	bu08p91o+GynVn6xFcFGwiMFeaaEn8/5TWAWAvJQaQjQ+8qtQHEc7H8qkoyec/61qPh1iF3WUYu
	Rkvh8NJRTwSWPrtMhHsT+ndPQw+lDcP2AP8Zb5YV0rrSCu9Y8yDH6/f2EGfXoiYKgsbp+tQpVDh
	SaMF1GzUlTEU0zlrYF9aj5hxhy7pjT4Fk/uGQapLq3h3Kllv9lfZk8XrKu5qOwpU6a7yN3+EsSY
	UzahdUniNXYngE/EKMGRiA1/ETwo8YOGYX61np+Xjrs6yvRRMBaqWPqK29m4XqkVyRiIqvLPJR4
	9HJf+VGNaFUI1sh73WuvVT0E1vWsrViOITWxKOdtMiVd0+c5KE5JLJ
X-Received: by 2002:a05:6300:8b0f:b0:398:e30d:da6d with SMTP id adf61e73a8af0-39c4ae4faaemr2929569637.68.1774429717318;
        Wed, 25 Mar 2026 02:08:37 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:37 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Wed, 25 Mar 2026 17:08:10 +0800
Message-Id: <1774429690-129139-5-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add support for the GXCAS GXHT30 humidity and temperature sensor.
The GXHT30 is software compatible with the Sensirion SHT30.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index f2b1d3b8eb23..1561c0f46f75 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -942,6 +943,7 @@ MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 static const struct of_device_id sht3x_of_match[] = {
 	{ .compatible = "sensirion,sht30", .data = (void *)sht3x },
 	{ .compatible = "sensirion,sts30", .data = (void *)sts3x },
+	{ .compatible = "gxcas,gxht30", .data = (void *)sht3x },
 	{ }
 };
 
@@ -959,5 +961,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

