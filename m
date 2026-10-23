Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750334;
	b=Z0FJtVH0H7gdYmesCHRQvBqaieM2psD0gvD5v3wx7u1ogkpE2PTLWrI4VKorTU3neXP1
	 Trug7u/drgMS+2GMHdps/RBXRuaoCzKrwOcHneKkQUzZ2xGeO0AF2FLkAWCPTbVMbziW/
	 htOL3QaZd+SstoAIhpkpVu3Z+l3V6yQ2+a+4a2sODBDxevWidx4yV24n2PQY8kCg0+TdQ
	 GiLtJIjg2Urn5LiLQoYxqmoCoL0yx5pfh6YlLe+DRLkt2f+piSL3HCw/pFIw0/NTyMfQ2
	 mqT+lK0jCx/kLGsXV+/PZ0eL1j5vwOxGMp7xLcFeCvBEg0wLQBTq6ElFcRZgt7t5m4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
	b=AsiJlgt9kewm5+uo59g9e3uYOgF1R0aZewL3o4RFSF6iQwABPflB8NvwTPFPIAgDlbUc
	 ISw0do1hC32C2o7dS2QT9/HvwN3LNflEdIuBP/cvKBEXiOYjlNC4RN1/jrHHSh+P7rHMh
	 3+Y03tdgjZD9sCAiruASR4UJjFzapFZXfBbKCqbky9GvqBILC7XrvX/xIiLHbI5FoPzj5
	 1B+aTqdsDv+2OXtT/4cbq5x5p7+P1n3XbnDBKR7DPPGTsVwGMOjKwFVgfUkAY4SIAGiEj
	 3B16RGOFmMF00GXr2r/8029KsjiW2Fk0QPWleCQ/C9ZxLmY5moyB/TWJn0QDkOb+tjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB857606A31B
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 10:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB857606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8059395e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750332; x=1793355132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=LWfiKVqhmmXyEgNLRl+/C9XxyyHrtX3XJxz7QlLPo6BSfYPzmOYZSFeTiheWHrUhzH
         QjhvtYZYrPEWbkjbY1IMhMh/EUH03ooaDaV3y/BfjwI/jvWysK5CqALqSz6cOwpxeEWr
         W3CeY8yYzmhoJrfW4Yut7z3W2vzB7lInKU24/eqK9AovJaotN+/FIGYMN/2pQwAdcX/r
         ZE4qfqyr2DFT3aHmso2MT8v5JN/U7HYinGLz6fDHI4sHG3tCYETxt64aiLX25AyMptsX
         fuWiMcLnxm05tm5nWV8MHm/v8B3IJPIkbF4QtiI/rlx335gwb18RaGxwGHTe5M31cKd5
         6Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750332; x=1793355132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=qFNA5VpDhO9rvvp1nJ1WTmv7jrTYjtP7Tcg1erOyw8Iih6XOJzVq/z/DjUMJ2gZXrA
         rdQ5kivFHZkXqBUz9pT8Gl9k6M/JVkojJd1Aax8RjiRQC1d4rMDw4HdvjsPHCrXYCMzv
         NlX0168ocpRzdzip9+rOh2yYPI6t+LcXI4vbdR35D3ZWZh3U3cu35OJfcgf5T7/qQdWS
         SQtexjpybwPk+F0+tJoiLSG2tjTyxr1K6BYvX5ecnXAm/QVkD3WiGIeueaKHR+BIsP3h
         aWvsuC8Rpl5RkP4zMIrnReQVPKG2zkAlaSy0lGdE5dYLBLiNvlcJ6bBkuQSgk6uol3Jt
         thIg==
X-Forwarded-Encrypted: i=1; AKwUvBzXCpGjS/RX6XQ0RV/vaLBZNi/2sqK2O5++LcXoexD2XJOVcL6iq0n7ny6qxbvYXgD4/G+xIlpuBknHLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsx8Ky1m0hZLT12xPDByHXBaYtwu6aCf1PEzE8uQfoA3/4jH/X
	K/rvKYxin6EPLK9Tbss3N/Zeig9T+TGLlS3h/p+PBj4sNaxznOwYP735vZRYOKvcQ5x/X29WDKF
	iZBDapSk=
X-Gm-Gg: AYBFou0HXe/aoOLLPAfc3zbP3uL+pZFJIuuyTtSkCe6kGhvwO91NLlkTBfeapfLY7wz
	4jq2fb+Rrlztjqp4ZYlZSNucXwOUTUepfK7rmEgBTngMwBsy699OY4uOxTs/bo+L3lRBE4so6hb
	5hlYYNHt+TEDDnRrM/4F+4YG4S1lGElayyAIRHcjYwpyF5HsZW6yGxU/NldB6ytuLxUVZwQcGKr
	j0Wj3cab9BZKHpMhsApqTv0DhgcrUATua9yjM8vQow/nem0O8LpYZTfLlIRWo6JG0A+HEfQerUA
	XivXeJSUPAzbxmRFxeRZmZfyj/ycWAxEuepVT+Bh/3hhFQ2MdAMj6Zef9Y0C7g0Q3rH7UfXqNB1
	ZLh1oteg+rzZvYBHpBGtNBsL49ScahyVTO03IaBwIQwc7tUiX+jVJ4p2AtfbIZ6iIrb2Fx9sWaY
	hJBqCe1Pz8zmGWBw8phYYQ7OZkOont1tO2M87myQ2VS6jYmUeWuGSM41pub2rOj6L48X0XLYMvD
	yH8pLxhMZtexH8sR6JCWS9U8LbeDShtpKErQTrW+V/fDzR4KkIfGTw=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr27725575e9.6.1792750332157;
        Fri, 23 Oct 2026 03:12:12 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm62807825e9.13.2026.10.23.03.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 1/4] pwm: rp1: Export helper to read fan tachometer RPM
Date: Fri, 23 Oct 2026 12:15:54 +0200
Message-ID: <a565aa38de650596daf04f3bc21a724e21c826f9.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Raspberry Pi RP1 southbridge, the internal PWM controller hardware
block houses a register associated with fan tachometer monitoring. The
tachometer pulses are measured by firmware running on the RP1 Cortex-M
core, which periodically writes the calculated RPM values directly into
dedicated MMIO registers within the PWM block.

Because the Linux PWM framework currently does not provide an abstraction
or API to report hardware-calculated tachometer readings to consumer
drivers, a direct accessor is needed by the companion hwmon fan driver
to read these values.

Add and export rp1_pwm_read_tachometer() to allow consumer drivers to
retrieve the fan speed from the PWM MMIO registers. To prevent polluting
the global kernel symbol namespace and restrict access to intended
consumers, export the function under the 'RP1_PWM' symbol namespace.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/pwm-rp1.c                     | 27 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 10 +++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index d4b13fba8d236..79d65f332dd30 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -286,6 +287,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+int rp1_pwm_read_tachometer(struct device *dev)
+{
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!of_device_is_compatible(dev_of_node(dev), "raspberrypi,rp1-pwm"))
+		return -EINVAL;
+
+	chip = dev_get_drvdata(dev);
+	if (!chip)
+		return -ENODEV;
+
+	rp1 = pwmchip_get_drvdata(chip);
+	if (!rp1)
+		return -ENODEV;
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	return (int)readl(rp1->base + RP1_PWM_PHASE(2));
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 0000000000000..3be0892da667e
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/device.h>
+
+int rp1_pwm_read_tachometer(struct device *dev);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.35.3

