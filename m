Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EE832E141
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479916; cv=none; b=k55q1wd9VYJr0Xrlx5Of+t14LMFDQnOMAGazeP4ouemOjudZ1Hro9S2b/8aFzVkXXNPKtmh9G5on5w7itcocIVPllnrgpp1DyIGn+u9LBeYWI6IUWbsinBHXwtrJjJJk9zFS8vIeymzh65FXOgIIxEumD+o921RYlZNpJisHgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479916; c=relaxed/simple;
	bh=sNwic/lAZRxSrh0xUjUwoZjp5XD4/UiRxMXXRuS1p3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcL3u0W+2rTCUL9Y62L5qvTYqPEL3gwb5xUujkNxGBQUSe36RJsy4Gqkn1YPpiEz9jmodtjYoQzhTKGzISM0iugPuSJvzjCavOntWspF1ioqWPqfNPWu70RkPWSw11HNaNGW6tjK1NZ4Vc8XfYrxkqrvSYLJ08ToJfCMVF2L3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djTQpyQV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djTQpyQV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381018b9375so221499a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479914; x=1784084714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u2IHPVHeT7NQRwXOg4WKjBdJH88qst8Wh6/zb5wQB4=;
        b=djTQpyQVgcWzeorFrj+UR1Ul6TrwpK3uMUwrqBGqUk+/dU3s2Rk82U0kBL0l3I6pSm
         O1qv8CrD906r1XBHRNlHwHmYeuZ1Tuxd/PmVM8JgR7O02z1dXtcobRqv1TShp+VSOI39
         XXdCUPurdi2eAuWif94hXiyfyRpyy4QivLEM3kRO6h4/NJjLw5wBk+U08Uak/SHcH1LB
         /4kRM2iwaaJxDF2IhZ3vK3LhJYlfazZUetrb6xMQQJKpqpT64UE24QhktwrwEod4JgTc
         7yvXC+U4oyozAXv1A67UkJTa2IMcBcMnCbFVYa6JZdZ7wH/45DpEEgPiuWAZ035rbC+H
         2zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479914; x=1784084714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7u2IHPVHeT7NQRwXOg4WKjBdJH88qst8Wh6/zb5wQB4=;
        b=ARr6EGW4/EADvMVMsf1DAT7aPLpmU4IfLT53gK8gbRv56GJWfy9b2Ba+2DFhiIsnBL
         pOC0P33L5DL++rFc3wgavnKwEILBfO/68FHKIhQwaJGNrfnvBOkHqTPWk65sPkqggcXf
         i2CalFGOOkjlhzUSH5XeMW5aEYVkBQsV+afTnk+l3ICxOOe4IEfWo2A9Zaunu2kvIHhF
         dFyAyxVyyKO2M5VSt2Fc9u8Vec+Mb/D1ixf08AiqGIXh9MxlEYoV2/wy93zVOYnZK1Ex
         WNb2uSjzTepzfciEJIN67AIHvDRN0YmCgIUFXH4ooR8Lew0Rgnlt53Tg1JZ543LpvhsB
         JOZg==
X-Gm-Message-State: AOJu0YyccgM3VK3wFoHUNAmlkcU0YnafVcRMJEIgeVb5ExyUjSohkjXi
	30naxhss+sZ4YFCCZRwND0m3as7hsjiEGzgdyzeejp7ycMa+ALfy0iXXDrtDWQ==
X-Gm-Gg: AfdE7ckEJEhKF2vMLEQ4XoydAVErV6i7YvYNJFCLIXnL7gxX+e8qNL8Woh/9rDJWowH
	KWWvj/i/rn8bk8AupxQDz2IlJKrxUtGN4tO8bxjsJC6UN7XSDPYmHMqZI42JlsnPsrfDYeHX28N
	1ybieAKsfGvGsOqTFhedoFbaTG45kYU00JfFDtB03SxxNED23w2tcQpSQ6+lPPHA47wuNtCD7LL
	el4IxL1Xsmzw5XIsBWi0XuSnY9nepuQ67v73Zqe5jvwwZKAj1lA7MtXGPSWheNB/7dxsn6u879e
	n9p0kRL2vvPZsw2c/9WdJ6HpoyM1A9mkdrXiqOmttEhxaQTVXJUnHGpJpKBl3aTwf9LgF2UYKHQ
	7qQ1zFbfT/aTHqebOUH2NfLfV2KKyWuJKImQpunDsx+F9VahVj07ZAjwW5MTpcxjVcNZqys9feb
	DMjclDi+kIaXCwXJhPtCFwg9a4RQ==
X-Received: by 2002:a17:90b:560b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38940058217mr594030a91.6.1783479914251;
        Tue, 07 Jul 2026 20:05:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm10943840eec.18.2026.07.07.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:05:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/4] hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 20:05:05 -0700
Message-ID: <20260708030507.227193-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708030507.227193-1-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
the driver probe function. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 42ac68e3d4ba0 ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Call hid_device_io_stop() only if hid_device_io_start() has been called

 drivers/hwmon/gigabyte_waterforce.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 27487e215bdd..4eea05f8b569 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -371,13 +371,15 @@ static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id
 	if (IS_ERR(priv->hwmon_dev)) {
 		ret = PTR_ERR(priv->hwmon_dev);
 		hid_err(hdev, "hwmon registration failed with %d\n", ret);
-		goto fail_and_close;
+		goto fail_and_io_stop;
 	}
 
 	waterforce_debugfs_init(priv);
 
 	return 0;
 
+fail_and_io_stop:
+	hid_device_io_stop(hdev);
 fail_and_close:
 	hid_hw_close(hdev);
 fail_and_stop:
-- 
2.45.2

