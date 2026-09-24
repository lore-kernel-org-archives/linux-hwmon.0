Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA47A4DD3A7
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283221; cv=none; b=Q8GpPP7vpw6pULMyRg5/27/6+PwvIEw5lUPt+gmdDPrhVi5ds5ypM5wnloz1M8CuuwU88eeEbnmRyDqAdUbIA8CCbLl7u0zsxjL5oP3mpwXe5ogHvrO+vwIdkytmUo7U5LtP9f0ClT3r7LAHr6s0Fb4WnVyQGmlZTgDWKovfStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283221; c=relaxed/simple;
	bh=YXZNt7FoFx2gvLvRF36mGXyBk/084QFiboasIv3H5kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdKefwAT4A7mbtmtFNl9ioYUepX2Tzzu2Ess6e2C+u/fU8bjfSYTsvlXl3h7hgTxilyXwVT7otUKjr0ohE6A0mIsB3a5zvTlSaMVpyuCrNgL49/VKqgLTBWa68hT0F5siMklN+fc5OZIMHuKPfz+emNrGrjdxpfi1xka/qnd2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD3CSAA5; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD3CSAA5"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso156203f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790283218; x=1790888018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKIBJvMX0GJgTDoKadjpCO9qp4INYSWWQBf64XMtjRA=;
        b=RD3CSAA5nLiCPIcb4MmVu08BLSj3qVk5Y2GsjKvGNoY82+Ty6LIRGZPByhtDRfQKrf
         2jSwhEOj7isTHpihIXH8evAbOSX/dwLP/474b1zfl8KLfRjMdRbb9CdyBl8fkD3gDtJs
         g4mJot687X/lNaqJ/PXisGx4lLRHa9rxerEIKdK9j+G4KM1kvjCRAtbNrMry7WmQwMtI
         Hmi7hvrypUvb3c14bowbS6CViMCsD2W2cEwbqEw53h9z4sEstt87FZh22986EOoIf/l6
         GuKmqTeN4RJ678N60sYVLVu7Wq+IrDTJ/fp+EzDLEH7M0Kru4oSsx3qH2XpzwCrC9ASF
         3XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283218; x=1790888018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKIBJvMX0GJgTDoKadjpCO9qp4INYSWWQBf64XMtjRA=;
        b=JiUCRkUAsl2PQOBT/g9+ArYfcSdV+RPAC3nWPDsoNT/VHNzx7OSQQuq8MAfjOU9y0a
         MZSEVeZaoG1j0X533eSntvjxzM0IX4pxG38O67NgBwdm8qVo1I9hPxKi/dQ7j10wooH6
         OZbAsfCLsBBAq4LDJ8/TxOXY7Q25c0XYhEwSh33lUkw4As2rU2diDt1vAyEQPtmRH4cx
         erT26cH1HJ7IkvXJIqF5KFTxfXuWnEGsf/9sNysjQH5BPbk+Ff8hksij05o25OgfthnA
         uUMPiGG9Jb5laddcqEhZQvqvspfH/cQxQ5r8h/4FOvyyY9A78biB5hCDebrUKM0eP9S6
         Zc7Q==
X-Gm-Message-State: AFuF++ljNExRQZLds42RTvfmim58ula20uSMugxZ9XxuSlkJv1S0ZkQa
	oezw3MwTjSeOgQydJ1CZQFcLAz3wsNUTiZuO4FsmVuf6ZB2O+GQIrFq+
X-Gm-Gg: AYBFou1pfNNtO8EHgAvYTV5NQkPv6CZKsveFL4zw68+0kgVqYDcZkr2ibBsSuCL+n+Z
	FYOdvQjGV8lQYdcFvoG4Orn7k2LnDRgeVFVI8JtpyfFqHoQJVBlb8km58WKxVzCaLUEPveqXzXe
	YcP66RItxh+aXJbMQqmrW4yS7EX+0ov+Bh/7YuL/saAHG+5EGwTWCNTHa3QCzwxQBCR7NWHqOha
	F5rbJJLfeOsBhvGDGF52++tZaSjw0gMF5yvx44++SuOeuIHdXbK5YbqboyeyGSFiv4Zz+BjJuwS
	CDEOFSdX5d6gq6puGis0Xl4jzVDVc0oPDHUGQAT1Lkvy/4s7z6lXFXzLOGEXgPqfi8Dme1jtOL6
	BT2RMDucoJsmtV67QJ7FI0xXprVoMJROXwzMc7j8kegRzfcCHzqsUHkVFio15v3Wizn7gZ+0F1+
	YbBFXp5n1rinoPEQF2hKYoxv3/KxwN3R5P/kfGzcdJr59vPkPVu+lGJt6RsdoU9B5bCQ5SuRPv2
	XN5dsDvaxNC10Gt5BYL
X-Received: by 2002:a05:6000:1886:b0:486:e8fa:f9b7 with SMTP id ffacd0b85a97d-488716c12f0mr6527375f8f.13.1790283217820;
        Thu, 24 Sep 2026 13:53:37 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm1691360f8f.1.2026.09.24.13.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:53:37 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Date: Thu, 24 Sep 2026 20:53:23 +0000
Message-ID: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

temp1_input_show() drops the low bits of the temperature register by
dividing the raw value (raw / 32 on the LM70). These bits are not part
of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
return some of them as 1, and the TMP125 fills them with copies of the
temperature LSB. Division rounds toward zero, so a negative temperature
with any of these bits set is reported one LSB too high.

For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
the driver reports as -24750.

Use an arithmetic right shift instead, which drops the low bits and
rounds down. tmp421 had a similar problem with negative values, fixed
by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
values").

Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 and arm (ep93xx_defconfig) with CONFIG_SENSORS_LM70=m. Tested in QEMU (arm64 and arm) with a stub SPI controller returning the datasheet register values; not tested on hardware.

 drivers/hwmon/lm70.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 8b525725fef4..b29bac7a4cc1 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -96,21 +96,21 @@ static ssize_t temp1_input_show(struct device *dev,
 	 */
 	switch (p_lm70->chip) {
 	case LM70_CHIP_LM70:
-		val = ((int)raw / 32) * 250;
+		val = ((int)raw >> 5) * 250;
 		break;
 
 	case LM70_CHIP_TMP121:
 	case LM70_CHIP_TMP122:
 	case LM70_CHIP_LM74:
-		val = ((int)raw / 8) * 625 / 10;
+		val = ((int)raw >> 3) * 625 / 10;
 		break;
 
 	case LM70_CHIP_LM71:
-		val = ((int)raw / 4) * 3125 / 100;
+		val = ((int)raw >> 2) * 3125 / 100;
 		break;
 
 	case LM70_CHIP_TMP125:
-		val = (sign_extend32(raw, 14) / 32) * 250;
+		val = (sign_extend32(raw, 14) >> 5) * 250;
 		break;
 	}
 
-- 
2.47.3

