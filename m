Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A54ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 14:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiIAOzS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbiIAOzR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 10:55:17 -0400
X-Greylist: delayed 318 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Sep 2022 07:55:12 PDT
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6311DA4A;
        Thu,  1 Sep 2022 07:55:11 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 4776C147F4;
        Thu,  1 Sep 2022 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662043792; bh=Ky3RZt8+jm1rZGp70aX3vdqaOEd1Zl6fs+DqlwpBbqE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dFP9ryJdYtLqHaenIrLnvfh2QoycVRybjnusu05Dd3ScL38M+Jn93Mis/lC2UIaKO
         NtW1UlAAyKGhnZFavO4oL0qe7ox/p70Y6AUn17ZvLNfmTWBVGlUfH9VyJPjWbnePV8
         DiUuJHEK9/moWh1PjrISgDv3fappecCDluLy+pdmGQ1cCGUtNJHt4PRgui1UZZIzUr
         9ssXdF/VG/a2ppQ4Hkg4qkjKmt59joAdWN/XJ5m6KvJeEFmbLqtOI7ZjtbHe0Y/HAZ
         AS0MNmISzAh6r6gRtHhgGfsRiXmSi4ucPIeqsfZGKYsOn3x0BpY1FpaG3SnZUe6qFt
         ofsWJXvF+xtUg==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 2/2] [RFC] platform/x86: toshiba_acpi: Add fan RPM reading (hwmon interface)
Date:   Thu,  1 Sep 2022 16:49:41 +0200
Message-Id: <20220901144941.1426407-3-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901144941.1426407-1-lkml@vorpal.se>
References: <20220901144941.1426407-1-lkml@vorpal.se>
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
 drivers/platform/x86/toshiba_acpi.c | 49 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f2f98e942cf2..9a98974ab8bf 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -799,6 +799,7 @@ config ACPI_TOSHIBA
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on IIO
+	select HWMON
 	select INPUT_SPARSEKMAP
 	help
 	  This driver adds support for access to certain system settings
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 02e3522f4eeb..2b71dac34cf0 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -39,6 +39,7 @@
 #include <linux/i8042.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/hwmon.h>
 #include <linux/uaccess.h>
 #include <linux/miscdevice.h>
 #include <linux/rfkill.h>
@@ -171,6 +172,7 @@ struct toshiba_acpi_dev {
 	struct miscdevice miscdev;
 	struct rfkill *wwan_rfk;
 	struct iio_dev *indio_dev;
+	struct device *hwmon_device;
 
 	int force_fan;
 	int last_key_event;
@@ -2941,6 +2943,38 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	return 0;
 }
 
+
+/* HWMON support for fan */
+static ssize_t fan_fan1_input_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	u32 value;
+	int ret;
+
+	ret = get_fan_rpm(toshiba_acpi, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
+
+static struct attribute *fan_attributes[] = {
+	&dev_attr_fan1_input.attr,
+	NULL
+};
+
+static const struct attribute_group fan_attr_group = {
+	.attrs = fan_attributes,
+};
+
+static const struct attribute_group *toshiba_acpi_hwmon_groups[] = {
+	&fan_attr_group,
+	NULL,
+};
+
 static void print_supported_features(struct toshiba_acpi_dev *dev)
 {
 	pr_info("Supported laptop features:");
@@ -2995,6 +3029,9 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 
 	remove_toshiba_proc_entries(dev);
 
+	if (dev->hwmon_device)
+		hwmon_device_unregister(dev->hwmon_device);
+
 	if (dev->accelerometer_supported && dev->indio_dev) {
 		iio_device_unregister(dev->indio_dev);
 		iio_device_free(dev->indio_dev);
@@ -3187,6 +3224,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_rpm(dev, &dummy);
 	dev->fan_rpm_supported = !ret;
 
+	if (dev->fan_rpm_supported) {
+		dev->hwmon_device = hwmon_device_register_with_groups(
+			&dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
+			toshiba_acpi_hwmon_groups);
+		if (IS_ERR(dev->hwmon_device)) {
+			ret = PTR_ERR(dev->hwmon_device);
+			dev->hwmon_device = NULL;
+			pr_err("unable to register hwmon device\n");
+			goto error;
+		}
+	}
+
 	toshiba_wwan_available(dev);
 	if (dev->wwan_supported)
 		toshiba_acpi_setup_wwan_rfkill(dev);
-- 
2.37.2

