Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B226CE33
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047952; cv=none; b=O2/n0ONGMvHacqL3cLcLyBdBkyqBLstUKi+40LB3Y1eW4E5c8mCji2gM5eMUuE4D0WAwEAf4jMhYTQ3U/WaIlE/np0G5nbOXaNSLEdwHTQfArpyas53A9xBrfuWuTZYCmGR36uYQgRHvftjKoU5sJbajZG2hTX17qWjlVPNBctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047952; c=relaxed/simple;
	bh=kARCeaAKhDeIKKAlMz1UbawFMFAokaEWYZvZ6sB7T4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GLl346nFil5VGG+B+oNBGfxcayXD0oDy2WUHbNhM72O5t2aTyDZE9gc7GthRciq/JExxAmaGZJyyas8xhUaJDcUt1VillfY0ICxB8BF47r7JX9vGHN2ussnz41PXR7JiRIe+ynOXhaE0fuT07ljJ0SA3ojV9LA9HghuNuZhq6eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBrXaunx; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBrXaunx"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3175207f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770047949; x=1770652749; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZZm7iyAn8JIl9dQI6HiLl2VItdwuhdut+41offwFMw=;
        b=ZBrXaunxXywOGHZplQrwYyDCxtTARGDcrWmRVOJwHk7ZUQC8Br/bXkpHBMr7wxk8gy
         YnyxfSRHkvbYzYHY4ZJcCdsL8ezoGpze2TLiCjWbyF2Qyp/q5wrqPwcbzqqkYO7BGhCB
         pFDXiNLdH1oDPZz8h2/s/067IMAGMXMsX4ShoUzzj0xcZHWVJk4kvisAqze9iL7TM30S
         hk+gORVMwzHLRMvwy/9YqFp5SVqs4zkwUe/OilTiHur71DljQ915BLNRqJLE8mQjl5J6
         gjdf2HtNMrM+wql2vCss3SBPjNOvGktDS7/4Oa+i6xYRGtP1H0ufzchnct0IB6XQ7+AW
         f8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047949; x=1770652749;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZZm7iyAn8JIl9dQI6HiLl2VItdwuhdut+41offwFMw=;
        b=pN3jgMaOK1YmvUIBE+YU5an6VYV4w9r287s9vKhEJPOaIPuqoI7wzKtOs61CxjoS8R
         1cK0Pl/fzpG9g1/ZN3VrYHVu155sQuqIvvQXQ9gZzHH2SRA7sSg6+d4Jk9yg6Qdn7rdM
         sDf7wNZmW128SfF/4dBJgrPDs/RlnZmLW8Rb7LlWDhuOMwnPJTCakz3FFijjl+jMBHjm
         t0hFI6iaXVhMdTSPYVbqAaSlaygdfb5dDl+hEImiIb8LuptuBBb54c83oh75laY09eTv
         VEnkPVTlaa32iOSTNI2Iu9sIR0ziSu8PqHIUASge5OmBoOKBmZsKAa175VZivBsdS7/M
         4KYA==
X-Gm-Message-State: AOJu0YzTlXUjhCWxJYHedp5mTrd0CfIQP86XNu9ZfzCOlDfyDjKw+e/f
	AqjvQ8qpPmYkNN0zTDH2uoAbZvonfAk0xtJC1/CW++GowJlsN2PKRvjwgKKgULgb
X-Gm-Gg: AZuq6aJ8kWaDcUjh0PiXbGNTW1rczMjxJcU3WQSyU5Z/4Zu6LEGttVCr61kBra9jADb
	/jjy6m+w5/ndf0wcalGmMEG2rotLOLG5avux5Y+L+/X2sN2IeVZI8fNT2LwWQv9Dlb/Wn2lcJjd
	Dnfn3AoEX+/+tk9cw5vHKLaQXBdiMwFfreyNa1H4Lz/sq0KGQAzUvVA2paVIYVVx39jlE0xwFNk
	+6UtMFlsv2gAUFKHViquQTvIDDE1Ah4YwMzFn7gUzCAS9LQOUfaJUbEbCYQ62tAwKIj9yNv7jBQ
	HeV7Ubx4PRnqZRKAcu6tZqjmE8HYWoBgIwJoQSOnBUJ7njun8rahLMK46dGISEUMc+9H9DplxHD
	XwWo+AkD4rlo2oBrWiSkyJuGxW8zI4xlm+VoH1PfHWjelrHTWskFADROtRAF3Ak/TSA3NfWll2p
	NLs+hQNcNI3bqOoLgy2LpK9DwQqRxO0NDbWGTDwZvAFaHbnEIO8PI=
X-Received: by 2002:a05:6000:26c3:b0:435:b7b9:afe5 with SMTP id ffacd0b85a97d-435f3a66f53mr16112258f8f.1.1770047949225;
        Mon, 02 Feb 2026 07:59:09 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm46708334f8f.26.2026.02.02.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:59:08 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 02 Feb 2026 16:58:57 +0100
Subject: [PATCH] hwmon: gpio-fan: allow to stop FANs when CONFIG_PM is
 disabled
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-gpio-fan-stop-fix-v1-1-c7853183d93d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMDJgGkC/x2MQQqAMAwEv1JyNqC1FPQr4qFoqrm0pRERin83e
 BmYgd0GQpVJYDYNKt0snJPK0BnYzpAOQt7VwfbW9wo8CmeMIaFcuWDkByeKbrM+TKN3oLtSSfP
 /uazv+wF5VnkcYwAAAA==
X-Change-ID: 20260202-gpio-fan-stop-fix-9ef4c26a9364
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

When CONFIG_PM is disabled, the GPIO controlled FANs can't be stopped by
using the sysfs attributes since commit 0d01110e6356 ("hwmon: (gpio-fan)
Add regulator support").

Using either the 'pwm1' or the 'fan1_target' attribute fails the same way:

  $ echo 0 > /sys/class/hwmon/hwmon1/pwm1
  ash: write error: Function not implemented
  $ echo 0 > /sys/class/hwmon/hwmon1/fan1_target
  ash: write error: Function not implemented

Both commands were working flawlessly before the mentioned commit.

The issue happens because pm_runtime_put_sync() returns with -ENOSYS
when CONFIG_PM is disabled, and the set_fan_speed() function handles
this as an error.

In order to restore the previous behaviour, change the error check in
the set_fan_speed() function to ignore the -ENOSYS error code.

Cc: stable@vger.kernel.org
Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 516c34bb61c9cfa2927d31ee6459c8306be2fb5b..37645e9141dc7034fd440afed695af57829ec900 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -148,7 +148,7 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 		int ret;
 
 		ret = pm_runtime_put_sync(fan_data->dev);
-		if (ret < 0)
+		if (ret < 0 && ret != -ENOSYS)
 			return ret;
 	}
 

---
base-commit: 1117702454262fb361869451be5b006c022eb08a
change-id: 20260202-gpio-fan-stop-fix-9ef4c26a9364

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

