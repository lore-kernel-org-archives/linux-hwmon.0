Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ACFECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 14:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbiIAOzV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233953AbiIAOzT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 10:55:19 -0400
X-Greylist: delayed 321 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Sep 2022 07:55:14 PDT
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC922A95D;
        Thu,  1 Sep 2022 07:55:11 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id D46C4147F2;
        Thu,  1 Sep 2022 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662043791; bh=YT5aCybs7L+30oXxHy8U3ElGErnSTqxZvFsnbbgpccY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X2kDiQgQqcHXZ3w4nGIEqz2wzod//VEBgl07yCQorMDo/9xb0ArMV3CvbskE4/bWV
         gZDbfqOke2gqet6+rxamKAso4eiCF2YjBTVtUjK7AhUoJ3ZmQWccsLPmqInfS4dFRo
         FJOGrqILib29dvJzrnMD9UOpxZIWbLBfMgt5xisGka4S5W0k1HtOq4HNrFOmV81eNL
         y2z8wLo8WyyYD2shXAdyDYAGOcfPD0/HQyfwnml2yoVX3EmR+anBvTZdw5f5bJ0rn9
         jEH8zpHjpDtEIHu28FbdevXEk39Vm2LdHThEEzh+1z4vN21IaTc3Bk1NNdHn8wbFt0
         VpZ5KSvpYfwaA==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 1/2] [RFC] platform/x86: toshiba_acpi: Add fan RPM reading (internals)
Date:   Thu,  1 Sep 2022 16:49:40 +0200
Message-Id: <20220901144941.1426407-2-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901144941.1426407-1-lkml@vorpal.se>
References: <20220901144941.1426407-1-lkml@vorpal.se>
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
2.37.2

