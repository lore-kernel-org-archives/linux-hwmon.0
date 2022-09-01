Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338C4C6FA83
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 21:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbiIAV6l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 17:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbiIAV6k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 17:58:40 -0400
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008DDBC39;
        Thu,  1 Sep 2022 14:58:37 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 0FBA6147F4;
        Thu,  1 Sep 2022 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662069516; bh=TXaanvd1Az6AiuUh2W6PngQwsRLm3J4JOuzwxHFmPwc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aa/5g65uW/DWOUoLXCfI6XQoyXwioZttW2a/KaIAp/GOclRLRfrKrOsMFXKxfbV/v
         pUOTZrKbt9JEyvjwptHfLkqxJLHJfr5RTZL3kbs5J5T8RcYlYJAYAqCtN6oLlVEs25
         wErNw9ZMJLIhvLjigs0pX+dGTeq9uXDD7tS3NlJ64iHbcG1cohh6u1kK0iYE1gih/B
         h0oyLHkQoaw8g9L8z+29LxZRp/rcBUdUk6RFrKUUx0JfT64msUO3/eO1+xOvdMM9TA
         BNpJMMGLigT/8tD8Bo0jXXuOYbHlxmdhPIpqHBrIdAYbHNNfIhdBWmDP5SxDPG2WL5
         /9aDmYVwElECw==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading (hwmon interface)
Date:   Thu,  1 Sep 2022 23:58:19 +0200
Message-Id: <20220901215819.1608723-3-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901215819.1608723-1-lkml@vorpal.se>
References: <20220901215819.1608723-1-lkml@vorpal.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This expands on the previous commit, exporting the fan RPM via hwmon.

This will look something like the following when using the "sensors"
command from lm_sensors:

toshiba_acpi_sensors-acpi-0
Adapter: ACPI interface
fan1:           0 RPM

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/Kconfig        |  1 +
 drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f2f98e942cf2..4d0d2676939a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -797,6 +797,7 @@ config ACPI_TOSHIBA
 	depends on INPUT
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on HWMON || HWMON = n
 	depends on RFKILL || RFKILL = n
 	depends on IIO
 	select INPUT_SPARSEKMAP
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 02e3522f4eeb..a976dfb97a5e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -46,6 +46,10 @@
 #include <linux/toshiba.h>
 #include <acpi/video.h>
 
+#ifdef CONFIG_HWMON
+#include <linux/hwmon.h>
+#endif
+
 MODULE_AUTHOR("John Belmonte");
 MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
 MODULE_LICENSE("GPL");
@@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
 	struct miscdevice miscdev;
 	struct rfkill *wwan_rfk;
 	struct iio_dev *indio_dev;
+#ifdef CONFIG_HWMON
+	struct device *hwmon_device;
+#endif
 
 	int force_fan;
 	int last_key_event;
@@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	return 0;
 }
 
+/* HWMON support for fan */
+#ifdef CONFIG_HWMON
+umode_t toshiba_acpi_hwmon_is_visible(const void *drvdata,
+				      enum hwmon_sensor_types type,
+				      u32 attr, int channel)
+{
+	return 0444;
+}
+
+int toshiba_acpi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *val)
+{
+	/*
+	 * There is only a single channel and single attribute (for the
+	 * fan) at this point.
+	 * This can be replaced with more advanced logic in the future,
+	 * should the need arise.
+	 */
+	if (type == hwmon_fan && channel == 0 && attr == hwmon_fan_input) {
+		u32 value;
+		int ret;
+
+		ret = get_fan_rpm(toshiba_acpi, &value);
+		if (ret)
+			return ret;
+
+		*val = value;
+		return 0;
+	}
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info *toshiba_acpi_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops toshiba_acpi_hwmon_ops = {
+	.is_visible = toshiba_acpi_hwmon_is_visible,
+	.read = toshiba_acpi_hwmon_read,
+};
+
+static const struct hwmon_chip_info toshiba_acpi_hwmon_chip_info = {
+	.ops = &toshiba_acpi_hwmon_ops,
+	.info = toshiba_acpi_hwmon_info,
+};
+#endif
+
 static void print_supported_features(struct toshiba_acpi_dev *dev)
 {
 	pr_info("Supported laptop features:");
@@ -2995,6 +3050,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 
 	remove_toshiba_proc_entries(dev);
 
+#ifdef CONFIG_HWMON
+	if (dev->hwmon_device)
+		hwmon_device_unregister(dev->hwmon_device);
+#endif
+
 	if (dev->accelerometer_supported && dev->indio_dev) {
 		iio_device_unregister(dev->indio_dev);
 		iio_device_free(dev->indio_dev);
@@ -3187,6 +3247,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_rpm(dev, &dummy);
 	dev->fan_rpm_supported = !ret;
 
+#ifdef CONFIG_HWMON
+	if (dev->fan_rpm_supported) {
+		dev->hwmon_device = hwmon_device_register_with_info(
+			&dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
+			&toshiba_acpi_hwmon_chip_info, NULL);
+		if (IS_ERR(dev->hwmon_device)) {
+			dev->hwmon_device = NULL;
+			pr_warn("unable to register hwmon device, skipping\n");
+		}
+	}
+#endif
+
 	toshiba_wwan_available(dev);
 	if (dev->wwan_supported)
 		toshiba_acpi_setup_wwan_rfkill(dev);
-- 
2.37.3

