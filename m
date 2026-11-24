Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541586;
	b=Jn9u//DUOXsNOnBkVqNDUdtKoWuyyuP3wIBpXjO47D4cVW0Dp5IyYi90Z1KHwlL39U+X
	 /BTLqJLvvOFPWqoxMTwA4yHuSeftAx14Au+GYivduP9XdhiGu/a0ES2DIHoAsjJNZhJmh
	 JriTeSoi6+bArfB7SnnvhJm8xzMeukOXwpRj1lq8aNBHAn+vuv0B2kswVbewUfH0qWCq0
	 3y03vlFk6j8NdtCUjPZgmatY7PGShHlre9hoJFPECzNjequyg0W1kr8DzDemOPS0x0qui
	 MkVn8Kdd7PfGg12hD0umj2OI9uiMutT+ksv3Z/fFjQDcQK+Lsf+LFfiBPENZRxkjsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
	b=Ap4F+uIhJKRqqrxsF+ypBIthHP3ataMGoEvJt9am+D2L0vXtL3o7TlS5r5j5JIohzZ2X
	 pyT3Ol2TaeSGZN37k+eIMEzMrr8X0IjINcxSQ+WwrsZVUz6rfFHd1L0DG7xn4iyIAc1p3
	 wrFCRuotmJR45+NCHV6n7HVlymNGF5Tt/N9fkQMl+yRmPp82kK93Deh56gTrCgfqssV5F
	 V9GDFbT+RmXN4XcxwDjRYAHswUSJS4SPNp9Ijh+Cbd+2BYUEZ3bt7hoi++hcZpj5aANpr
	 CdtVy9Tq3NRIMDq/gERMRVEvvAG8bYUkMXelljZqJJkaABEQMExVxsYxu5PiIyVSI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TqSelDAY;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27460A381E
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A27460A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TqSelDAY
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3427196f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541584; x=1796146384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=TqSelDAY01AjgWVHCQiO0qyJq3dm05j1NqSpfGrgkq9xoK1o8SCXAgeAGNwi4cf9O1
         D80AavKbdD1cEMbyLmrpOvAADwwORG3wKlSmR/iI028gfH1CngOgZo8EH7fqSHoi0IjN
         gbz/tX9AROw9PK38xaf7fVXgFK1g55P/YssfZJn/1ZBYbFlStVICBbLO0e/rCVwRjNQH
         Of6V55nX5km2biF4bfDYfTlBsMVasElqhJ8zi6qiEtGFGhQRCKLgEf0C0DxgzwqgFgvf
         e2gCdcxBwhbNsrqmeI4iNRGbDG0u1FFNDFsNZB8JGx4FyjBI+xYlkjuuqiXr4JVXpXy3
         rsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541584; x=1796146384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2xibGYCW99ZvwUe/lKayob3iHv2iOk1v6WVsVu9rhE=;
        b=pd/Mt0LQyA/5PfU9Uxnmwt8jeBZ4nQk5ajcqp3+dRdOEdb9AEvy2PvzDD/zHAwvkUX
         XMkPF6x1BdlsjvKTz1bdtPhcPFtq9hJYUdNqM2KteuNwYOxsUQWGDPNnUYQY8jpIABGD
         acd+xrr53JoF0lVplPdGjR1UgsPpZWnUfp5t0c5gPhxWecUtRSjgLow9VvUcv5fw90A9
         vZIz1PJvTB+afC6bIZjlqpSVtgRbDipWN61QcYjFlPt8FVCPF817cTGoSt9nncy/eIeg
         n0re9ixHUtfFTVdwL26ae9F08+iUt7W+SKQct5q2OdGLUGrXGNpkm4gktiTb0hSTxEqb
         oHiA==
X-Forwarded-Encrypted: i=1; AL+hErH/hzmA0HBbA20zM/FUlznGLUwTit0+g3/XZI1rEusUZciWM9Hq1jnEPLco/InGM9wg0WeNoYhT4O1pcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9WqaeoJ38MmEMlUF/fYgUSSRPG53093YTq2q28IFSoD35D3vW
	eapxaK/d9tvMxRNsf5Gs+O5Gu8ZOnY4/KzArRfvE/CDAUx+NbNYaK63YOHwYYUkYXs8=
X-Gm-Gg: AZFdTZdsrhLvMJn3gePLxXOas9Ni7GlyKlWUpSOOZe8CBU3RbOBH02X34RZ5cg7IKIc
	OtR+VLB6tGp3d+VsxM0FSlVxcwQl2dpFJkEdcHPb08ETYtQ2g6ypug7sK/fa0FSptihNbrQsePw
	vXPKEZLeEjKAFx2z5QnDvHzpIyVQET7cg8MvKgw5BFCRFmKALN5aYC+BiH+huxhXtrxoVY/7WdV
	Py+fXArvH+6x9CIF5oirKLZ+35vzKrhKXDLn94GdgTfCkAwJzUTfeRNcLwNA8Tv6h2sGKra0rQ4
	bMs8Rz5Izia7lQsz0cHly6GEMrJ3Jj/CiKS3v76gv3GxKSxYOA+ObhJXqXq0bx7GgWBIQhzNgDA
	5pepSp0jucH59sfc4JkqNcFK3jU2QMgd8CkcmCmKCnXmSK6UMzelixq1km7hAFmREfqFQD9jm7n
	KaGM41eksClC9dcapkaIXH3cmukVf0949F+ArWuuplvNjdL0Z9N0dvmQ+dHB0ClL4zrgyA6LZGA
	YUFTomo7Yee+PhV0WLY01kCqsZzM8YdBQW08xOt0650s4HAPsJ2yLnF/hYaZeMsBBT4nB8FpkG7
	47DgVC/EiDJ3T49kmjfQBPrfNlo=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr297420805e9.9.1795541583997;
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm832341115e9.4.2026.11.24.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:03 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 3/3] pwm: rp1: Register auxiliary device for the fan tachometer
Date: Tue, 24 Nov 2026 18:36:57 +0100
Message-ID: <20261124173658.31030-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
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

On the Raspberry Pi 5, the firmware running on the RP1 Cortex-M core
measures the fan tachometer pulses and periodically writes the computed
RPM value into the phase register of PWM channel 2, inside the RP1 PWM
controller register block.

The Linux PWM framework has no abstraction to report such a value, and
the reading belongs to the hwmon subsystem. Following the auxiliary bus
model, let the PWM driver instantiate a "fan" auxiliary device
(pwm_rp1.fan.<id>) to which the hwmon driver can bind, without needing
any additional DT node.

The way the tachometer value is obtained (the register is shared with
the channel phase control) is an implementation detail of the PWM
driver, so provide rp1_pwm_read_tachometer(), exported in the 'RP1_PWM'
symbol namespace, for the auxiliary driver to use, as documented in
Documentation/driver-api/auxiliary_bus.rst.

The auxiliary device is destroyed first in .remove(), so that the hwmon
driver is unbound before the PWM controller resources are released.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS                               |  1 +
 drivers/pwm/Kconfig                       |  5 +++
 drivers/pwm/pwm-rp1.c                     | 49 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 12 ++++++
 4 files changed, 67 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c7b280a2bdb..26f8520c02ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23382,6 +23382,7 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 F:	drivers/pwm/pwm-rp1.c
+F:	include/soc/bcm2835/raspberrypi-pwm-rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 523789e82355..7b271a16a483 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -641,9 +641,14 @@ config PWM_RASPBERRYPI_RP1
 	tristate "RP1 PWM support"
 	depends on MISC_RP1 || COMPILE_TEST
 	depends on HAS_IOMEM
+	select AUXILIARY_BUS
 	help
 	  PWM framework driver for Raspberry Pi RP1 controller.
 
+	  The driver also registers an auxiliary device that allows the
+	  companion hwmon driver (SENSORS_RP1_FAN) to report the fan speed
+	  measured by the RP1 firmware.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index 69ce0db4e9aa..f7443b9f9fa1 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -38,6 +38,7 @@
  *   channel. As a result, phase control will be ignored for now.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -49,6 +50,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -79,12 +81,16 @@ enum rp1_pwm_ctrl_mode {
 
 #define RP1_PWM_NUM_PWMS			4
 
+/* Channel whose phase register is used by the firmware to report the fan RPM */
+#define RP1_PWM_FAN_TACH_CHAN			2
+
 struct rp1_pwm {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	bool clk_enabled;
 	spinlock_t lock; /* sync for RP1_PWM_GLB_CTRL RMW access */
+	struct auxiliary_device *fan_adev;
 };
 
 struct rp1_pwm_waveform {
@@ -286,6 +292,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+/**
+ * rp1_pwm_read_tachometer() - read the fan speed reported by the RP1 firmware
+ * @adev: the "fan" auxiliary device registered by this driver
+ * @rpm: where to store the fan speed, in RPM
+ *
+ * Meant to be called only by the driver bound to the auxiliary device
+ * created by rp1_pwm_probe(), which carries the controller private data as
+ * platform data. The auxiliary device is unregistered before the PWM
+ * controller resources are released, so that data is guaranteed to be
+ * valid for as long as the auxiliary driver is bound.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm)
+{
+	struct rp1_pwm *rp1 = dev_get_platdata(&adev->dev);
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	*rpm = readl(rp1->base + RP1_PWM_PHASE(RP1_PWM_FAN_TACH_CHAN));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -347,8 +379,23 @@ static int rp1_pwm_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	/*
+	 * The fan tachometer is exposed to the hwmon subsystem through an
+	 * auxiliary device. The chip id is unique, so it is used to avoid
+	 * name clashes if more than one RP1 PWM controller is enabled.
+	 */
+	rp1->fan_adev = auxiliary_device_create(dev, KBUILD_MODNAME, "fan",
+						rp1, chip->id);
+	if (!rp1->fan_adev) {
+		ret = dev_err_probe(dev, -ENODEV,
+				    "Failed to register fan auxiliary device\n");
+		goto err_remove_chip;
+	}
+
 	return 0;
 
+err_remove_chip:
+	pwmchip_remove(chip);
 err_disable_clk:
 	clk_disable_unprepare(rp1->clk);
 
@@ -360,6 +407,8 @@ static void rp1_pwm_remove(struct platform_device *pdev)
 	struct pwm_chip *chip = platform_get_drvdata(pdev);
 	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
 
+	/* Unbind the fan driver before tearing down the PWM controller */
+	auxiliary_device_destroy(rp1->fan_adev);
 	pwmchip_remove(chip);
 
 	if (rp1->clk_enabled) {
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 000000000000..290a052480bc
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/types.h>
+
+struct auxiliary_device;
+
+int rp1_pwm_read_tachometer(struct auxiliary_device *adev, u32 *rpm);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.51.0

