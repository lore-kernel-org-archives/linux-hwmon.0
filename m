Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB89F3B38AD
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475899; cv=none; b=vDsnwQZQ6hCooOLDQ7zecwPTjUHwtsQ6M4O2mNyL+yaL4Rh0s/HeOtB1ZqO0LqtxUKbIpJarEpw0gjh4BEi29OUOhav4W7bjLqsIWZ2syMJc95uBLRCaIUH2yAotGD+42+a372JyRs8Ax+innIlbA2I9ds0Sv14YcLPYvx3t/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475899; c=relaxed/simple;
	bh=t+tAgxm9SCY2qLzjleHKiKuLDbMbIcYOH7BEqc9btFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp9DW4xH1Bt53lMcdQyGK7DjNpUU7WPAST+5i2zYEEqg+JyEOKuths0dv3Ekt+7tnA/axJtdnX+0Q6sSzY7sca5tBa6WIpJU7hOzlQDvOKW4jDbW0u66mwXHMX6S8kv/vrTSk6+4RiM3kM2h3+kg2vHxWBdN2dJaGpN0x9fx5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKbPJeHX; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKbPJeHX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c999f162c9aso55377a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475897; x=1784080697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJn6LIlnvSIFGAP2H2LRGqLK+6I6t3HuV2hY505XYC0=;
        b=gKbPJeHXtNfgNEdf10BYX2HUbkK+sBk7rYjJH527ivDJTNlUwFFHI5l694BBYzSsDE
         SVRtTqFEhSkgXSy19HygRG4dzWnIWav7mi38HYb0GrtCU8V12CAQ63crsM2Wd8qGhVPV
         5tJHdz3PBsd1fE4P4OJxpoDgsS/6N8tc0qYISFRQ6lFk7rSz3wsGHkoKypdzRQp7y1wK
         ZRKYnnSr4XWCWIDCy7GT+Gh5gO3gWolSk/xaAnses1ZyXRtRjnK7eZNfeeVECEtM4rPT
         MbjRX4fPVjtWbbQnUVnTRayKLtG/bQOmfmxj4MfV6pEJ1c0PR9cnnPrG1diz7Vwav2HY
         skJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475897; x=1784080697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJn6LIlnvSIFGAP2H2LRGqLK+6I6t3HuV2hY505XYC0=;
        b=Yy39j1sx7T+JIiChejbixzEusnlT7Vp8NxGJJF/6VjcwkeAS1hl5s/w+5vCEn+XPJL
         tng2TSwZB2atRsQ1kntTbWCZZn8wi4WBNU5l9v9sNMsIsUEIHY4Oa7p2ZCAc04cNwf0V
         cojoWPzYLWIKGf34auoXqJzGB/89SsQrOa4yAAh9LBq51WKeeZcQM9BnjXixRzlRLOrV
         Ed2ss2eYPTozhok6OwT+sv7TFYgYJ5pg0L3Vty56lmwFf7kHGtYnDTlg8egiIkhnfvub
         YX39GiqI00oyrw5/HsWJYiyAVPzXsoQTD6uZd8p+KrV58jRncGIxcWLC4KEPFf9GI91q
         AkuA==
X-Gm-Message-State: AOJu0Yy5HGopGnp9JIsIWWUr2Yia4/AhMs+qaFt1LWMI92/G3SM3pf45
	ts42TKpKkuSnT5MGn0AKXHCZ4wIjFZOtbAMMDBMqN8+ooY3h5mgBTc4PSt7f2g==
X-Gm-Gg: AfdE7clc7KYdw3sOb2E34Fpa+dB6EV9/EOTME9pnQl1IzOTSyrTSbhWd74bYMsdWxqN
	ApL7ykB7027esrH7/OMoaWhRsiKxLCQt/DnFZglO8rNabx4MFAJhcWqqZD/HE+5cvpsQHplrBUI
	bnWyyvvTFLJ6tXnMFm8Y3qvShKPFnCVzFs5Rn4lSA7WP2xsMHV6Q8+SuiOEx0FaLuUDcXPyzZd+
	VxXSSjxYu2VksVti8K+5Nt719r+l6MAMPNgmWl8C3BrGHrQfZU6DYhfOEZo+jtBo5yS9u8/JM22
	kPpWKHfKoD2DFGkxZp4dPFqs+tdwCKKMb6wJhE9thhSqo+s+IY1uuAjegtmi5oFaQlt0V4bEn4J
	iV3KRxqCckkjcujiaEARCFK2TUtt81olAoAQpxPURHwmtYjFcB9SXyGRedY565Em+/b80bspExY
	ir2j2MRjBDTrOYgtVPnSM9onNY9A==
X-Received: by 2002:a05:6a21:a96:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c0bcbbfabamr301685637.49.1783475897212;
        Tue, 07 Jul 2026 18:58:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8f521sm13424647eec.22.2026.07.07.18.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:58:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 18:58:06 -0700
Message-ID: <20260708015806.213790-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708015806.213790-1-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
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
Fixes: f3b4b146eb107 ("hwmon: Add driver for NZXT Kraken X and Z series AIO CPU coolers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nzxt-kraken3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index d00409bcab93..cca53252b343 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -970,6 +970,7 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 fail_and_close:
 	hid_hw_close(hdev);
 fail_and_stop:
+	hid_device_io_stop(hdev);
 	hid_hw_stop(hdev);
 	return ret;
 }
-- 
2.45.2

