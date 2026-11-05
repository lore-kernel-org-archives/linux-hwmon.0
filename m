Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903077;
	b=LKFNmL4jnqEU2fCoOsntAfjuFdWcIy0R/YSzfrMP966JBGSXsCwaUZtD8uOpL0BRknvB
	 /ECjWBikuHBKsYz82hIENEYFySenP2xR1nZrYKpVPg7IWDl0A2bAHyjrySg2FEjCl95j0
	 ou20AFnM2YfjmmEXJ3xDwA8Rwj5Aga58Xn8Zqbp1SIz74gKtOcz4m/+VwvWfwfI1aHjJk
	 oGC+3kXDx/5x+vFZyiSYmCuPknBdOVLa0wG2ggeVO9/OVUEqxyzfAiYa4h0utIvSmj4hl
	 YoEi3FNEKYaRiKUngVqgzu3NNy8ZneR1jWKFQDkISuRtZ9jxInsUMgwjQL43Gd714/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903077;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Ewkx0ISAA1j6A2H+OcOp3O4RmEREltYbHmDupiy5k6I=;
	b=fzmNhouNdAo9ItBhD1IG89wsY4rBGBQzHnuecPQikzJWyc+5dYCL/q2CF9AwxdOE5KG5
	 sht+EDXI0Yvx4NNe9VWAIYdUAHKn2wZfGEXIXjjXc1sgJJ1KwdP7gkHAgzP8JLtW0VALb
	 dpIEE3BcjAydGbUIMWmY5hD8rGFfdTAFLS/DJ0GZevgFNuOeQoW1LkDLAyvPAx173PBwm
	 Oi+VLcmgQzSzyTg46ThR+pO2mdTHz1pTKZ8mwt+qcVPS3hD7ak2dmrL14F9MMVTK2ILp9
	 56xhiUQtwRzfNKeveZ9m4I5TZH2q1XR3TT9oKwihlHk3TGxMVfgJDuJMf12ecADVKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=c87Io7XK;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30111606A334
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 18:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30111606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=c87Io7XK
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id OywfxHPVMJFmFP28ZxdPQp; Thu, 05 Nov 2026 18:24:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id P28UxA4de3MEFP28UxiAT9; Thu, 05 Nov 2026 18:24:30 +0000
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=6aecc9e2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8 a=_jlGtV7tAAAA:8
 a=Tfol7mLqORo8Aa3OjIcA:9 a=GvGzcOZaWPEFPQC_NcjD:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ewkx0ISAA1j6A2H+OcOp3O4RmEREltYbHmDupiy5k6I=; b=c87Io7XKJk2MkkuneRqjUOOkCT
	NfnsNT+SfNEJWV1AkzzjkQOfrVQByk8OmVHHOiVlNIvp8e5pV6ImrSvJ3d1u1HqQmygibNimWV29d
	bGQ++a8kATjiHd2d3rZX3BxyEpfWpGGLbZNwgv4sY0D3YZH6d11ijqbLciOLrRGApfZzMMII+xsbX
	wbx8VCQVrkWPYM28n4O5ecFwwp1n5FFr4Hrxw0s++t5iawyYM8mC/RqBNGLxEwNdW6Xxrdw0FYWUI
	JZzzIedFCyz4ehqkIZIMwdm3OPv0Lye+hI4/SL0evNSNTdAVL+haYgani4T8TPw1d2I2jmzItow9Y
	Cr2RXipg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54524 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xP28T-000000036Sq-4BHN;
	Thu, 05 Nov 2026 23:54:30 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko@sashiko.dev>
Subject: [PATCH] hwmon: (gpio-fan) Fix runtime PM imbalance in probe and teardown
Date: Thu,  5 Nov 2026 10:24:27 -0800
Message-ID: <20261105182427.2369928-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xP28T-000000036Sq-4BHN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54524
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMMH813LcuJIVcv6jxS2sW9xQ20r7b6o7M3hUiytXsAt17LQBLCUm8NeCEUkYCQcFM+xevJBQTtGp0mjRTrnIgR4zeLPfXxZEyebT1sZFjlI22p6bR47
 vpR2kFCOS2qG8mzyE0pk493Ezvfhrw7NwaFmmqt6kYjrEq33xCZMfI9mvgvp6RMGbpdl7hP/pk1IDrnMQvWvGfNbXwk5cCrRowVaEzUrXRRQm2E7WoVbZE93

In gpio_fan_probe(), gpio_fan_stop() is registered conditionally as a
devres action before runtime PM is initialized, while gpio_fan_stop()
unconditionally calls pm_runtime_disable(). This breaks runtime PM
disable_depth and usage_count invariants across several paths:

- On alarm-only devices without control GPIOs, gpio_fan_stop() is never
  registered, leaving pm_runtime_enable() unbalanced on unbind and
  triggering "Unbalanced pm_runtime_enable!" on subsequent binds.
- When control GPIOs are present and devm_add_action_or_reset(), hwmon
  registration, or fan_alarm_init() fails, gpio_fan_stop() runs before
  pm_runtime_enable(), incrementing disable_depth to 2 (leaving runtime
  PM permanently disabled on re-probe) and, if speed_index > 0,
  underflowing usage_count via pm_runtime_put_sync().
- If pm_runtime_resume_and_get() fails when speed_index > 0, it drops
  its reference while speed_index remains non-zero, causing
  gpio_fan_stop() to call pm_runtime_put_sync() and underflow
  usage_count.
- Registering the hwmon device before enabling runtime PM exposes sysfs
  attributes that can invoke set_fan_speed() before runtime PM state is
  initialized.

Initialize runtime PM upfront with pm_runtime_set_suspended() and
devm_pm_runtime_enable(), remove pm_runtime_disable() from
gpio_fan_stop(), and acquire the initial active runtime PM reference
before registering gpio_fan_stop() and the hwmon device.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Sashiko <sashiko@sashiko.dev>
Link: https://sashiko.dev/#/bug/linux-349aa3ba-30c3-4c3c-b47e-f52839af2b8d
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gpio-fan.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 08b58b49be5b..402cc000bc3f 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -531,8 +531,6 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
-
-	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -560,6 +558,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	pm_runtime_set_suspended(dev);
+	err = devm_pm_runtime_enable(dev);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -567,6 +570,12 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		err = fan_ctrl_init(fan_data);
 		if (err)
 			return err;
+		/* If current GPIO state is active, mark RPM as active as well */
+		if (fan_data->speed_index > 0) {
+			err = pm_runtime_resume_and_get(dev);
+			if (err)
+				return err;
+		}
 		err = devm_add_action_or_reset(dev, gpio_fan_stop, fan_data);
 		if (err)
 			return err;
@@ -587,17 +596,6 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	/* If current GPIO state is active, mark RPM as active as well */
-	if (fan_data->speed_index > 0) {
-		int ret;
-
-		ret = pm_runtime_resume_and_get(&pdev->dev);
-		if (ret)
-			return ret;
-	}
-
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = devm_thermal_of_child_cooling_device_register(dev, np,
 								       "gpio-fan",
-- 
2.45.2

