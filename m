Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5743CE7F
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382506; cv=none; b=p8IPwJ5wCMV/YVLZoCNVDuK3x4kiOZS10csvMulQMaumEfhmvXRKPZRyCNG6s6k2BEBHFhgID4RdpXNvN3KFERiTodUEAqaTyN9dmVYPj5v/BmWgtVoHvpEgbyKg0/yZWPClxrR3s7JCe7RmToXW5xhLSq7S6osVlw5SOuxzmO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382506; c=relaxed/simple;
	bh=8RMjW2GZiFLdZ5ZhXAK6hKwmt70RrGO/ubTXCPobtc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJ1nScumdzDD9zqJrZiUbh5AnjY18M6MKdVuQXm8PapelTrP3dNwj6gv+8RtPTFNzFOITbTn51c8O5suk/huX4eXjl1iYkoi/wPXJMZkhOzJwNVeJozxqIs/WzgZYv6lrFnCR3e7KXVanEIA6Fc0ecSDCvaxMEl06VYLoR0dIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fncPsz6e; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fncPsz6e"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6c1983dfaffso2284568eaf.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382504; x=1789987304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeYhK5Bct0822vB0fqa5xHImLPh+u4sb5Rd0DXecL4M=;
        b=fncPsz6e+TJPGaLubeOK2THYTbEXgq+KHuDX5sxHfEH8kYwIoDrjy0jsfR7eGO1qD+
         gfJmomiCJLKwgYJpt0Ko2h5XpUJrs0RJnTeUt9MzUrDn5j+43p3Au1Kt9YEvrIeEkG22
         OeGVQ0P/Mf8wBuThBzAT/ILl5LpEwoPR/zhdCXtR7m7SHKMdCNMdfkKEre8Dt3cB47+j
         VYOQNpffM95Gk59jGI9lMdBaEGIh8qjht+FUPyZNuHwFTeWA3yEShUcm9ApQVXkDZAbg
         hZdh17WyJ+mTScVjauk/z5riZ8BpP8uuytu7caymRAtL184l1bkxdQqDZ8X8WtZ7W7Ze
         sdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382504; x=1789987304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeYhK5Bct0822vB0fqa5xHImLPh+u4sb5Rd0DXecL4M=;
        b=FO+ltENm6Wz61b2LLSDrAO3TPSQWIf2yyKH4Y6hVQSysgtCy4qTKAfQvP4MNlW2od0
         ATGD9vSqmtV9i4pS113kX8eyKKFJu/1bjdxRNZr4Xy/tNH2RPj7R1Elhb5vPgCr5vGs7
         DWMXXVn2iSZ98pBVZz/D8Fhsg1d/lXqFhvI813NnIaoTCDSHr0g6PQRCnZj73mfVgDuS
         NuBgWelbpsBhV0tGuExOVt1EgYnpfBnxz4CSTIHl/ONKfEBCMiPvfJe+2O1+6gZn+a7S
         XOLlOaxLrUmJPkEL+mF1RstYXF92H6bp/UoQDYC46MSgWQVDNhXmUsdrhQmbrhcBiKpw
         bUBg==
X-Forwarded-Encrypted: i=1; AKwUvBz5/uuKLVFX5lWdm2YZSKby4ioTHssehQAfQ75AVSWqx6ZOIr1zMnaAUm+qXmZ3aemqYKQuhTVECvjFew==@vger.kernel.org
X-Gm-Message-State: AFuF++kH8/ep24AlwoBNogXbtpan8tXBxauU9OldAyvRNvfKXYW8En62
	e0IIaeKcZE9hhXGHPky+KkgH7wykjtG5lX6feNS2Pc9jJ7Kdlz6jXB3W
X-Gm-Gg: AYBFou32DiEz/Rmh6urc7plFjW5bxBQrCwi42PYmWofBEJzcNvTEeM/uajQGQtEX4VP
	vqsHEsdi8brGlylCwMfU/k6780q6s1sV3WXsxp2Nw5frf7b0V3bs1GGn7++8vZkLdHgxr9kakLY
	fwef7+sy2UMn9k9R8r1+D/R8xKIBI16y1Xk/lOwhS6UDp0IxwJWQ5lHr+EAXnXFuv3jKCOuLyGr
	RCw03NgI0C9tmvnpoN9DeDBELceePwUXDIK1ZKJ+rpwUf+hk3zuOml1lRiyzilagHLTrSrMvZnP
	nMwUK6innG40EmeIVmayMx5LC7ZjoaQ0IcqLkoraU3JG61/H3wCdaPNhm9CHN5zXb7l6P4S5dK7
	DWZ1IWNt7YFUvhKxkCps0SkvkSmtV+UMjZHq5o1tM4wGpXuJlaR1VnFGIn+p4XgekGJTjVSv5F2
	IhPpJK/ACLQRakRW7w5NnvY3cekKPU+JeMwc2K1zWr9N50PoEeTnt+rOil7Ayf/ewhtD0z6tq6Z
	QmVJbybg6EOcTyT
X-Received: by 2002:a05:6820:81c5:b0:6b7:8415:d77e with SMTP id 006d021491bc7-6c541f45b3bmr748644eaf.41.1789382503583;
        Mon, 14 Sep 2026 03:41:43 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm23213037c88.4.2026.09.14.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:41:43 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler
Date: Mon, 14 Sep 2026 17:41:36 +0700
Message-Id: <20260914104136.1797979-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() always schedules alarm_work but returns IRQ_NONE,
so the kernel treats every alarm interrupt as unhandled. On a shared
line that risks the whole line being disabled as spurious.

v1 just fixed that, but it was still IRQF_SHARED, and always returning
IRQ_HANDLED there defeats spurious-interrupt detection for the line --
if the interrupt ever fires without a real event, nothing catches it,
and a fault could spin the CPU in the handler.

Sashiko flagged this in v1, and Guenter confirmed: this interrupt must
not be shared. So v2 drops IRQF_SHARED too.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260901160931.DD3811F00A3D@smtp.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Also drop IRQF_SHARED (Guenter): always returning IRQ_HANDLED on a
  still-shared line defeats spurious-interrupt detection for it. v2
  is a full patch with both fixes, not a delta on top of v1.

 drivers/hwmon/gpio-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..0dbd07f5dc53 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -67,7 +67,7 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
 
 	schedule_work(&fan_data->alarm_work);
 
-	return IRQ_NONE;
+	return IRQ_HANDLED;
 }
 
 static ssize_t fan1_alarm_show(struct device *dev,
@@ -97,7 +97,7 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
-				IRQF_SHARED, "GPIO fan alarm", fan_data);
+				0, "GPIO fan alarm", fan_data);
 }
 
 /*
-- 
2.25.1

