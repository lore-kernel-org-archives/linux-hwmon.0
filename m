Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D92882A7
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769978121; cv=none; b=YWOuGCTaN6wjHlMaU9V6QO7e+YmADpEYVgUhKE9LPlX6sqFWbeowLtRzsXIxumR4yRM+W/q5a0wYWGCk8AeZoD+LpMUhyWXRdxFeKxxmX6JlN1W4nriYd5GH3moD6GoIIjveyh0X/LNV59a24I+GCSJX8Flh+5RTbHkAkJ3/nDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769978121; c=relaxed/simple;
	bh=5aFcpAaR/lASpDeQK/SKRvYCXntKw60Rvq8b69dCrfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LgdXzuIFTTQOFRQYSNBgHfdWHAYzgmjk5HEYZHCas0CPbhVdw+MGSpA6rYJAoJypZcdtUEL5qVw+Y+iE0/L2a0z5nIZxF5DV9h9IrFX2E7vvS2hKdXQBJ06VxU3XJMsl45gqf+D0NaHxg+j6C6HIz0rQChfY3CSQJVPDbwG2iJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1qjLEUB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1qjLEUB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso38624295e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769978118; x=1770582918; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91/0VfU3LtdVoSnFoD2Wj5KpABZ0e6Hnrwv0/nUnRaY=;
        b=d1qjLEUBpGMmNcA4iRbOdpiQ0r0e94uFb9lscngtOWjOlURwjalkY0JdrNAUz5o1hA
         HImDc0Z1NZM/XguIbd9DYh5GZ45FFhVPtGTeGG7uA/9teNxHc5XgGeSoLB5z3wBiNa/s
         qoHAUnpNf8rYClpNbZnN8kyGeugfweZlk3xXb7n2ve5sgtptecILMgqEQSs139dqgf9c
         Ow9Q2/T/KTxIILSHQaqonjCxXXyDC1CbV6weU6oJMrqyGiQPcrhGhov9R0ck+rGvELkB
         YrEl7OHIEJImiXQ+5IYoeL2DIIt6FjHrTOwKDFGIpyhCLsN7ZC9LBKVv+qpGBbTRjgY+
         pJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769978118; x=1770582918;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91/0VfU3LtdVoSnFoD2Wj5KpABZ0e6Hnrwv0/nUnRaY=;
        b=nRzOi07/AnRSElMaoFUflCSecibsaYw/Skg5Da3elYehgu6ALXhjpvXfiF2iV20gzN
         neGVJkSN0oYh8CIt8tzLMjGInOOycfGgXpxKCV+AaH7+xFj+QPdHQjMPdDG8plSMDZtZ
         P12eVBqUEcI/8giAE4Bnu5yKRV3cvbIw9ZcthawwBBvQANdq55/no1BAyAkCZfVO72re
         yiNCgMY37tjtFEvNSslNFb7BufqPGwxkwrWcoWCEXUrOldBMFFp88pMDsiIS9eOpxh3E
         1K9LaAMpbw3Y5KTtkCrIDZ3KQhJXtYzLIv3a/3sKoCnNzpJKPdzGQzvPUxSHJPecnKah
         4Luw==
X-Gm-Message-State: AOJu0YwdtKbfHoLt7aD2pXuh0R1K53zDVlGKq+xIinYkTBt5i5J1GZ1E
	6rt3VRLs4NO3zapkRZSvlH9fusQn72l2WvLRQ8cqWWhVC8Sk4eoHk4DLUUsbJA==
X-Gm-Gg: AZuq6aKX524oJxr51FOWnQ8mZgsic0Q+TK4b1cyle4au3nz+hBkq1ITglYMUTJM7gt4
	OqsBnE3yAWFQHsaOxMygfwk7+uT9pLo1votl9CgvIVeUitDkjuzKgkq/GzR6+76btd2jzFVF8MD
	ml3YTbXc9qXOSytHkMyBb+b1NzqDb36uQOzgCgqp6/GRl6j7A3jn+1dJKhzAIieOUlA+HTH0Dwr
	VEmfPgVhJDGJW+f5kzRB2KcH/Z576ssUVeNQJMh0InnANpoKp8O/q8VCDAG2OYfy1FKDOjytLWg
	JbZg+SeA9ZkwY1WTL88SldCuM6el0ZC/t5sE06ZbdhkIOIHN2T6YzZxbeOo2/sarnm8qbmDdSRs
	37CtDoKmXIQEW4J59EzJ1mB17kXd4azSgDLpIA6OA6UKPOvbEigifZYqm0+h0B2Vt/pDElI2Dn3
	KOncppfXTv0W8UzJx0AZGpdEcIVWkL9Po3idW0/evB4oRdVKSCyMo=
X-Received: by 2002:a05:600c:310f:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-482db46c28amr129120025e9.16.1769978118540;
        Sun, 01 Feb 2026 12:35:18 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435e10e48a6sm37663837f8f.8.2026.02.01.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 12:35:17 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 01 Feb 2026 21:35:06 +0100
Subject: [PATCH] hwmon: gpio-fan: fix set_rpm() return value
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-gpio-fan-set_rpm-retval-fix-v1-1-dc39bc7693ca@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPm4f2kC/x3MQQqDMBBG4avIrB2YRGqhVylFgv6xA20MExFBv
 LvB5fcW76ACUxR6NQcZNi26pArXNjR+Q5rBOlWTF9+LF8dz1oVjSFywDpb/bFi38OOoO6MPz+i
 kg0wPqodsqPm+vz/neQGJ4KZlbQAAAA==
X-Change-ID: 20260201-gpio-fan-set_rpm-retval-fix-e6a7f103e0d5
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The set_rpm function is used as a 'store' callback of a device attribute,
and as such it should return with the number of bytes consumed. However
since commit 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support"),
the function returns with zero on success.

Due to this, the function gets called again and again whenever the user
tries to change the FAN speed by writing the desired RPM value into the
'fan1_target' sysfs attribute.

The broken behaviour can be reproduced easily. For example, the following
command never returns unless it gets terminated:

  $ echo 500 > /sys/class/hwmon/hwmon1/fan1_target
  ^C
  $

Change the code to return with the same value as the 'count' parameter
on success to indicate that all bytes from the input buffer are consumed.
The function behaved the same way prior to the offending change.

Cc: stable@vger.kernel.org
Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 516c34bb61c9cfa2927d31ee6459c8306be2fb5b..d7fa021f376e39b79b6a0302377c4516f9861459 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -291,7 +291,7 @@ static ssize_t set_rpm(struct device *dev, struct device_attribute *attr,
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	unsigned long rpm;
-	int ret = count;
+	int ret;
 
 	if (kstrtoul(buf, 10, &rpm))
 		return -EINVAL;
@@ -308,7 +308,7 @@ static ssize_t set_rpm(struct device *dev, struct device_attribute *attr,
 exit_unlock:
 	mutex_unlock(&fan_data->lock);
 
-	return ret;
+	return ret ? ret : count;
 }
 
 static DEVICE_ATTR_RW(pwm1);

---
base-commit: 1117702454262fb361869451be5b006c022eb08a
change-id: 20260201-gpio-fan-set_rpm-retval-fix-e6a7f103e0d5

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

