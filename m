Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5B2D042;
	Sat, 27 Jan 2024 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706377504; cv=none; b=VPFofnMTaV+fcGIVHYc262+OTifWnUYu6H3BpRr+Fl8YuAKtgQc8CWwig9yEugB25PohtIsco5b9dLlCTp2Fh97z4IN5QnP1MnL/JUiIeClG8KcxSvFRGWHbbnn3vRGF0+4JEFm3Cbhj/8rpGe8Z/RwmBIW0rAeI6G7w/LlmCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706377504; c=relaxed/simple;
	bh=eJucBB62y53/6x3b8IeytY61xG836ojNrHpvPBuocbw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qIXGjEhUNXBlNqMA3LnMeR/6LwajR1oXiJRIio2zwd20188ieBB39JWcdb9zi3I0BsFAb/I9B7wQZ6M140ntx3D/G5j3Dx25Af2H+6gswFOOEYNcgtUahp7JA2caO3qnKBLdATNkfb3Qv3UWI0BSEThGkM0tnn97D48TsZr9OHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqJEuynE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqJEuynE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso23548615e9.3;
        Sat, 27 Jan 2024 09:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706377501; x=1706982301; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8anKxnJbLLtWVdu6pUUU4w5pqzpUyEAuIBblrjsBQ20=;
        b=cqJEuynEJhWn85Z44I/RxqPMITi/t9dEmuHR6Af1mJ5te90GIrrSQnRGyqOU1MYDJF
         vnfFNg/0Yp9GTXGkRrvXZlZJXZb/Zk37nhFd352nj1IuKdiMalHtObQC60+cW1sYfNae
         EG0Ad+QxdhwKwabnjvYBMwcG+Y/KpC7INEG/NtAZa926ix55F1x5Npg19Cn8McrTLF4a
         iIpyvGi5EqnaXO7R57Co7jTn/AFgcm9ADVi3hJk+HoLNvRuIkSDHyG/80RuYBnjpFJ/z
         Bk6Ecwx6Yd31IM0GAsYE1BRynzYdtCqsV9pEUGM2dhUZDVrEMTdN+A8mnxUdbq9Levg4
         wETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706377501; x=1706982301;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8anKxnJbLLtWVdu6pUUU4w5pqzpUyEAuIBblrjsBQ20=;
        b=vr1BZGDwkpLMVUOlfYI+juqyHBG85aDhJ9c7NsKgglM/4EO5XuwJxdaW1xuER/oEJX
         o0aHyWGK0LyBEmMaysrw3yy6Y6D9T7wgm8ab5MV9MAOnlFxRIa4KEf5iqGy5LnwHnAVO
         tT/KqfOqsxTnTu17DgcIOgMI02Lwu/fo8uOheO0v7Fo0eH4pOg6RW62Qz+o9/+d5gWb8
         zX6lmvfUIvKclR9hHzHe3PKbZZ3Z5zt3waBVYCkeCxzeu6U4MKLe9P8aliTQZuTT9zl2
         CrzlkNCsYeqUaxDediBpXhf+6yiNFA6qs/Ay9YdOFsweiKujSF7D2TYmqV1aOhOJyafr
         Awaw==
X-Gm-Message-State: AOJu0YwoylQspxTwq+GX1SDxO38Kdj6E8UeLMDoC/jS3F1I0/DzBG3F9
	jdxWw1jkjk1HRAR9itjKoPG1Jfn5jg8Y6px+FWIPby17Q+V6IKEa
X-Google-Smtp-Source: AGHT+IG6jGko7sEAjG+dh8v+IQYvKdvRtdk/7Erkl9hDpj34WF81qQnIevb3PbDYrghT2sFd01Ii9Q==
X-Received: by 2002:adf:fc46:0:b0:33a:de7b:43bc with SMTP id e6-20020adffc46000000b0033ade7b43bcmr1192734wrs.130.1706377501168;
        Sat, 27 Jan 2024 09:45:01 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id ck8-20020a5d5e88000000b003392986585esm3946712wrb.41.2024.01.27.09.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 09:45:00 -0800 (PST)
Message-ID: <13ce7c11-a958-4892-ada9-faf5bfdcb89d@gmail.com>
Date: Sat, 27 Jan 2024 18:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] hwmon: Drop non-functional I2C_CLASS_HWMON support for
 drivers w/o detect()
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Class-based I2C probing requires detect() and address_list both
to be set in the I2C client driver, see checks in i2c_detect().
It's misleading to declare I2C_CLASS_HWMON support if the driver
doesn't implement detect().
Class-based probing is a legacy mechanism, in addition apparently
nobody ever noticed that class-based probing has been non-functional
in both drivers from the very beginning. So drop the fragments of
class-based probing support.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/hwmon/emc2305.rst | 1 -
 drivers/hwmon/adt7410.c         | 2 --
 drivers/hwmon/emc2305.c         | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
index 2403dbaf2..d0bfffe46 100644
--- a/Documentation/hwmon/emc2305.rst
+++ b/Documentation/hwmon/emc2305.rst
@@ -6,7 +6,6 @@ Kernel driver emc2305
 Supported chips:
    Microchip EMC2305, EMC2303, EMC2302, EMC2301
 
-   Addresses scanned: I2C 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d
    Prefixes: 'emc2305'
 
    Datasheet: Publicly available at the Microchip website :
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 952506779..fd214d9b3 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -95,14 +95,12 @@ static const struct i2c_device_id adt7410_ids[] = {
 MODULE_DEVICE_TABLE(i2c, adt7410_ids);
 
 static struct i2c_driver adt7410_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7410",
 		.pm	= pm_sleep_ptr(&adt7x10_dev_pm_ops),
 	},
 	.probe		= adt7410_i2c_probe,
 	.id_table	= adt7410_ids,
-	.address_list	= I2C_ADDRS(0x48, 0x49, 0x4a, 0x4b),
 };
 module_i2c_driver(adt7410_driver);
 
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 29f0e4945..6ef733c0b 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -12,9 +12,6 @@
 #include <linux/platform_data/emc2305.h>
 #include <linux/thermal.h>
 
-static const unsigned short
-emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
-
 #define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
 #define EMC2305_REG_VENDOR		0xfe
 #define EMC2305_FAN_MAX			0xff
@@ -611,14 +608,12 @@ static void emc2305_remove(struct i2c_client *client)
 }
 
 static struct i2c_driver emc2305_driver = {
-	.class  = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "emc2305",
 	},
 	.probe = emc2305_probe,
 	.remove	  = emc2305_remove,
 	.id_table = emc2305_ids,
-	.address_list = emc2305_normal_i2c,
 };
 
 module_i2c_driver(emc2305_driver);
-- 
2.43.0


