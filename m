Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC30ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 21:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiIAV6j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 17:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbiIAV6h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 17:58:37 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6EC64E5;
        Thu,  1 Sep 2022 14:58:36 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 03B79147F2;
        Thu,  1 Sep 2022 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662069515; bh=FBFk8TloyLt1sSi1NThDrEC2N9fG0pVwH5cKoeUGlm8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hsQYU82XAGkyuKuN7DohAZnx1Xpy9teTzXTphFL9Of6VMdRwK3VAxL7tU+dUgvAg7
         CZc+XXo3pnIqQJ+HTxxP+kM/is50p5ZeJXuSiAMaW9piX2LJBpz/NwvCPmouSKncHB
         Ve62HhoIBI2Py23cJpN20e/7PIQiAXoDM7QPPLLQgiz5KdFoVH3iG5hA+ui/HKjLCS
         rM29E29Q8typ0aMScBKPk+OE91byFk2YAKjAtnaYqCHiaW7pYnoE0rNpqzWyIq5P0w
         /muzX7Di15mBQgZj+3wQElXZYFcCF2xt+z0ZcvuCJbX/X5qvKg7mr+ra1hJ2vIPeXx
         2Xmr1TxuLIs3g==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 1/2] platform/x86: toshiba_acpi: Add fan RPM reading (internals)
Date:   Thu,  1 Sep 2022 23:58:18 +0200
Message-Id: <20220901215819.1608723-2-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901215819.1608723-1-lkml@vorpal.se>
References: <20220901215819.1608723-1-lkml@vorpal.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This add the internal feature detection and reading function for fan RPM.

The approach is based on tracing ACPI calls using AMLI (a tracer/debugger
built into ACPI.sys) while using the Windows cooling self-test software.

The call used is {HCI_GET, 0x45, 0, 1, 0, 0} which returns:
{0x0, 0x45, fan_rpm, probably_max_rpm, 0x0, 0x0}

What is probably the max RPM is not currently used.

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/toshiba_acpi.c | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0fc9e8b8827b..02e3522f4eeb 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -106,6 +106,7 @@ MODULE_LICENSE("GPL");
 #define HCI_VIDEO_OUT			0x001c
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
+#define HCI_FAN_RPM			0x0045
 #define HCI_WIRELESS			0x0056
 #define HCI_ACCELEROMETER		0x006d
 #define HCI_COOLING_METHOD		0x007f
@@ -185,6 +186,7 @@ struct toshiba_acpi_dev {
 	unsigned int illumination_supported:1;
 	unsigned int video_supported:1;
 	unsigned int fan_supported:1;
+	unsigned int fan_rpm_supported:1;
 	unsigned int system_event_supported:1;
 	unsigned int ntfy_supported:1;
 	unsigned int info_supported:1;
@@ -1616,6 +1618,29 @@ static const struct proc_ops fan_proc_ops = {
 	.proc_write	= fan_proc_write,
 };
 
+/* Fan RPM */
+static int get_fan_rpm(struct toshiba_acpi_dev *dev, u32 *rpm)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_FAN_RPM, 0, 1, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status = tci_raw(dev, in, out);
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to get Fan speed failed\n");
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] == TOS_SUCCESS) {
+		*rpm = out[2];
+		return 0;
+	}
+
+	return -EIO;
+}
+
 static int keys_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
@@ -2928,6 +2953,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
 		pr_cont(" video-out");
 	if (dev->fan_supported)
 		pr_cont(" fan");
+	if (dev->fan_rpm_supported)
+		pr_cont(" fan-rpm");
 	if (dev->tr_backlight_supported)
 		pr_cont(" transflective-backlight");
 	if (dev->illumination_supported)
@@ -3157,6 +3184,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_status(dev, &dummy);
 	dev->fan_supported = !ret;
 
+	ret = get_fan_rpm(dev, &dummy);
+	dev->fan_rpm_supported = !ret;
+
 	toshiba_wwan_available(dev);
 	if (dev->wwan_supported)
 		toshiba_acpi_setup_wwan_rfkill(dev);
-- 
2.37.3

