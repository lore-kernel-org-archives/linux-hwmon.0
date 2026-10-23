Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750342;
	b=PZiTl8EFlGo7URSHUIzoEtEKlN/YsXOh0tzKuQkG05dvb1LchESbONmsj4za+O2N1Nq2
	 Gk9qo2bwRcW4YktCPpqc/v9sq2fqajVumbC15hS6UpbIX0cS48vC1Aa9WT3lqOUTxkzdz
	 G5otWvcuQn/iBDTIzsAD/jT65kWrH/Mk2KXFJdympOAVONu0NqfLUrxJT1sVAOkbe+qNn
	 pZqD99sVNIUlc8Kx6Bo96ZB+SIOcDqFgrSc9lBUGoYbv6Wgpprf4TCdzstzRJZ0xuoNDR
	 80YPyHsU1hU7cvw/24/mbrZjg7bOxHTBRYYOYuluGFURicH0Omd232MQ92wFrVA0+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=;
	b=nDYxmPuMMNzpwhYdbUpgB/c4uMKF4IuCw0YmTlqdvLYBbgeqDgkUjDDUtZdMrZXsZwZ4
	 nNQ9U0H4XmZRFNJ1XNvDV8hip5EJoTjKUgNebVSMo9DAdmk/lBAEm15IqlL2ME8j7pOtk
	 tCP+WWRRVyYRYoZ3Xip8GxJZ/4kXEaXQF7EOAca/9WDKSavaLXj8mQkXGMybXq280vlvC
	 071mmrqPvzxeMV1qjWS4vulRM+Lxe6GHZFR0L0PvdD41E6KsKt87aaaEbaAN3FyueiMgp
	 8BAVW6YQFhdsE8xqdNaTbYCA81nye0vwcnCO+qVhPsyVfXzXZmeemUnt7nIu9dVuzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IEj+4LUp;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAC60A2603
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDAC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IEj+4LUp
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so6800705e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750335; x=1793355135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=;
        b=IEj+4LUp0lhaROP24PtdeaYws2/e9/yHOlf1zKdVj7ASydfFO+eMApm3KGJMA5KuDV
         7PGG1w/yuaBKXkPFuf0VRtoBsvBCR+MJeO6TmPOqLKigZUGAfZ4cXqfoErI3gdVkv3PP
         TFYHtxn7n218s7CUIUtPNHGVZKXWiGvlabE8DjmN84RfXvK29WpvaNL+0LcmTMrsg7C9
         Kto81LOGs03LLeZzIKEy6k6qSLlzjoV1FylHQTH/cA36obnaS8Cih2F5z3E5XFhF16Ey
         Heji8LubqPX6v8JGjgM2mAH+MbTX3fkN1NlkcIBtxQhyPFhAW9wZFXLTXoaG7kfOgHbx
         1jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750335; x=1793355135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=;
        b=YhwYvcZ/hz0ikiyOnadd9mZ7ah/ScBh3LD8xbbCiLUVLpYzFrI4uYjbQnvhPcJmHDm
         KtvKQkrApdZklUyGDpydcxsQDT6n7HcSrHgmxFVN47sIxcsccy3D65ZydhCclCcsN2if
         EmhsVmqdQQq8WjfxWS8J8aOMp0QjHlecbdDzs2Hc88WbezUMFSplAfccbqKg2nkVeF6U
         Nf7zbhF4NhMVo8RRcwkTWVcy+2PWEH7z26PfKWn/8+56G0jztiPPprGcohNO0fc/pdOz
         mVjyOZqQtPO2dBLMcP09PlxDszsYbfHcw0B4tMozVjRnAIY5SW6+W1ZcPOuK6ipQLbp1
         ZMTw==
X-Forwarded-Encrypted: i=1; AKwUvBzd2SiTZANMDSRjDmFzAsKuHEv+ffjRosu8v1VAKRFeBo1vICu0PehqldSfCP+XvHjk9VXjUNdeP4b/Og==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5PDkxUdwy5uUO+BQm3NFIivJloZNUUmbBFllQ1ZcpGTJNA167
	asBDwKHMfKbt92nqdNaGkBM9U4pIIWj7pJ/LtwGGnXF/aFrjhChFpyBI1hcKEMLTzO4=
X-Gm-Gg: AYBFou1FsjevgpG7vxW1UEhMESovjVf5+GLUnktdNAsro+tu6ymMuB93sWqKszQr1uu
	t7RBcZsifWawKvbtHCwcUljjpAqay50+4y9FELSwjp8UGKQM9fLfMx4tV6D6wGtB5rIfou5xt6e
	o3j+FFq2TTTaN3fwn5RCoDM58avsGWZFFIt0WkB2A5aEQh1uTMO3AUCf6fNttgijkAjZemaKcN2
	hOnZHJ1oGBsl5VOJE6BjqJWigQLA7zXGtaFp+HIpPhiP1NeqQ4amLwm61dpKVLgru9AiPGYY1XY
	rVVH4a+0RRP74wEwynQbZ3D1IqfUKgyLhoCQ1pKcfFzWNUPhvRsZ1z84x2NZ823H3hQMFcx/Hh1
	L5kPCAxADaNJ9FMWp8vriHpyFSQgXqdARJvNCz5c9Jwu/e3/4drXgR3TMOnOU7IwZxOPl+a+Gmv
	MImxUA/YkoeGFldUR9AHqsG3GgPW59WgFo2lH0KKbq1HfV5gm/3qwQJ9Nob9+/NsgwFCpOd68T9
	LtQOH5mkXjJ5l30A7UWj6o2pwfBdFjZUaEc8b4MD4GD9Ytno+a/9g8=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr27965575e9.17.1792750334572;
        Fri, 23 Oct 2026 03:12:14 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211ba35d3sm43628645e9.6.2026.10.23.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:14 -0700 (PDT)
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
Subject: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan tachometer
Date: Fri, 23 Oct 2026 12:15:56 +0200
Message-ID: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
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

Add a hardware monitoring driver to support the fan tachometer on the
Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.

The RP1 PWM controller block contains specific MMIO registers that hold
the current fan speed in RPM. These registers are periodically updated by
the RP1 internal firmware based on the tachometer pulses.

Since the Linux PWM subsystem does not currently offer a framework for
exposing integrated hardware tachometer readings, this driver is
implemented as a standalone hwmon device. It parses the
'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
establishes a device link to ensure proper lifecycle management, and uses
RP1-specific PWM functions to retrieve the RPM values.

Provides the standard hwmon sysfs attribute 'fan1_input'.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/rp1-fan.rst |  41 ++++++++++
 MAINTAINERS                     |   1 +
 drivers/hwmon/Kconfig           |  11 +++
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/rp1-hwmon.c       | 136 ++++++++++++++++++++++++++++++++
 6 files changed, 191 insertions(+)
 create mode 100644 Documentation/hwmon/rp1-fan.rst
 create mode 100644 drivers/hwmon/rp1-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436ae..e078404a0e08d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -235,6 +235,7 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    qnap-mcu-hwmon
    raspberrypi-hwmon
+   rp1-fan
    sbrmi
    sbtsi_temp
    sch5627
diff --git a/Documentation/hwmon/rp1-fan.rst b/Documentation/hwmon/rp1-fan.rst
new file mode 100644
index 0000000000000..4497b61c0a394
--- /dev/null
+++ b/Documentation/hwmon/rp1-fan.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Raspberry Pi RP1 fan tachometer
+=======================================
+
+Supported chips:
+
+ * Raspberry Pi RP1
+
+   Prefix: 'rp1_fan'
+
+   Addresses scanned: -
+
+   Datasheet: not public
+
+Author: Andrea della Porta <andrea.porta@suse.com>
+
+Description
+-----------
+
+The Raspberry Pi RP1 is a multi-function I/O controller (southbridge) used
+on boards such as the Raspberry Pi 5. Among its peripherals, the RP1 includes
+a PWM controller responsible for fan control.
+
+In addition to standard PWM output, the RP1 provides fan speed monitoring
+(tachometer). The tachometer pulse measurement is performed internally by
+firmware running on the RP1 Cortex-M microcontroller core. The computed fan
+speed (RPM) is periodically updated by the firmware directly into dedicated
+MMIO registers located within the RP1 PWM block.
+
+This driver interfaces with the RP1 PWM controller to read these firmware-updated
+registers and exposes the fan speed as standard hwmon sysfs attributes.
+
+Sysfs entries
+-------------
+
+The following attributes are supported.
+
+======================= ========================================================
+fan1_input              fan tachometer speed in RPM (RO)
+======================= ========================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..f66c52e640342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22819,6 +22819,7 @@ M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
 F:	drivers/clk/clk-rp1.c
+F:	drivers/hwmon/rp1-hwmon.c
 F:	drivers/misc/rp1/
 F:	drivers/pinctrl/pinctrl-rp1.c
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fecff8610ea8b..c23dfd5f5055a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1981,6 +1981,17 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_RP1_FAN
+	tristate "Raspberry Pi RP1 PWM Fan Support"
+	depends on OF
+	depends on PWM_RASPBERRYPI_RP1 || COMPILE_TEST
+	help
+	  If you say yes here you get support for reading the fan tachometer
+	  from Raspberry Pi RP1.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rp1-hwmon.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 1229b6b3996d7..54f2bd057a2d8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -207,6 +207,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_RP1_FAN)	+= rp1-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/rp1-hwmon.c b/drivers/hwmon/rp1-hwmon.c
new file mode 100644
index 0000000000000..7943eda905dbc
--- /dev/null
+++ b/drivers/hwmon/rp1-hwmon.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring fan driver for Raspberry Pi RP1
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/hwmon.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
+
+struct rp1_fan_data {
+	struct device *pwm_dev;
+};
+
+static int rp1_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct rp1_fan_data *data = dev_get_drvdata(dev);
+	int rpm;
+
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		rpm = rp1_pwm_read_tachometer(data->pwm_dev);
+		if (rpm < 0)
+			return rpm;
+
+		*val = rpm;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info * const rp1_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops rp1_fan_hwmon_ops = {
+	.visible = 0444,
+	.read = rp1_fan_read,
+};
+
+static const struct hwmon_chip_info rp1_fan_chip_info = {
+	.ops = &rp1_fan_hwmon_ops,
+	.info = rp1_fan_info,
+};
+
+static void rp1_fan_put_device(void *data)
+{
+	put_device(data);
+}
+
+static int rp1_fan_probe(struct platform_device *pdev)
+{
+	struct platform_device *pwm_pdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *pwm_node;
+	struct rp1_fan_data *data;
+	struct device_link *link;
+	struct device *hwmon_dev;
+	int ret;
+
+	pwm_node = of_parse_phandle(dev->of_node, "raspberrypi,pwm-tachometer", 0);
+	if (!pwm_node)
+		return dev_err_probe(dev, -ENODEV,
+				     "RP1 PWM node not specified in Device Tree (requires 'raspberrypi,pwm-tachometer')\n");
+
+	if (!of_device_is_available(pwm_node)) {
+		of_node_put(pwm_node);
+		return dev_err_probe(dev, -ENODEV,
+				     "RP1 PWM node is disabled\n");
+	}
+
+	pwm_pdev = of_find_device_by_node(pwm_node);
+	of_node_put(pwm_node);
+	if (!pwm_pdev)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "RP1 PWM platform device not populated yet\n");
+
+	scoped_guard(device, &pwm_pdev->dev) {
+		if (!device_is_bound(&pwm_pdev->dev)) {
+			put_device(&pwm_pdev->dev);
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "RP1 PWM driver is not bound yet\n");
+		}
+	}
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		put_device(&pwm_pdev->dev);
+		return -ENOMEM;
+	}
+
+	ret = devm_add_action_or_reset(dev, rp1_fan_put_device, &pwm_pdev->dev);
+	if (ret)
+		return ret;
+
+	data->pwm_dev = &pwm_pdev->dev;
+
+	link = device_link_add(dev, &pwm_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!link)
+		return dev_err_probe(dev, -EINVAL,
+				     "Cannot create the device_link to PWM controller\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "rp1_fan",
+							 data,
+							 &rp1_fan_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id rp1_fan_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rp1_fan_of_match);
+
+static struct platform_driver rp1_fan_driver = {
+	.probe = rp1_fan_probe,
+	.driver = {
+		.name = "rp1-fan",
+		.of_match_table = rp1_fan_of_match,
+	},
+};
+module_platform_driver(rp1_fan_driver);
+
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("Raspberry Pi RP1 HWMon Fan Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("RP1_PWM");
-- 
2.35.3

