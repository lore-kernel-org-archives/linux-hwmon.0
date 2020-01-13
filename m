Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B00DC33CAE
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:09:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AAA5207E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgAMPJA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 10:09:00 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58678 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728933AbgAMPJA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 10:09:00 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 13 Jan 2020 17:08:55 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 00DF8hqf006851;
        Mon, 13 Jan 2020 17:08:55 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 6/6] docs: hwmon: Include 'xdpe12284.rst' into docs
Date:   Mon, 13 Jan 2020 15:08:41 +0000
Message-Id: <20200113150841.17670-7-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113150841.17670-1-vadimp@mellanox.com>
References: <20200113150841.17670-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add documentation for 'xdpe122' devices.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/hwmon/xdpe12284.rst | 101 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/hwmon/xdpe12284.rst

diff --git a/Documentation/hwmon/xdpe12284.rst b/Documentation/hwmon/xdpe12284.rst
new file mode 100644
index 000000000000..6b7ae98cc536
--- /dev/null
+++ b/Documentation/hwmon/xdpe12284.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver xdpe122
+=====================
+
+Supported chips:
+
+  * Infineon XDPE12254
+
+    Prefix: 'xdpe12254'
+
+  * Infineon XDPE12284
+
+    Prefix: 'xdpe12284'
+
+Authors:
+
+	Vadim Pasternak <vadimp@mellanox.com>
+
+Description
+-----------
+
+This driver implements support for Infineon Multi-phase XDPE122 family
+dual loop voltage regulators.
+The family includes XDPE12284 and XDPE12254 devices.
+The devices from this family complaint with:
+- Intel VR13 and VR13HC rev 1.3, IMVP8 rev 1.2 and IMPVP9 rev 1.3 DC-DC
+  converter specification.
+- Intel SVID rev 1.9. protocol.
+- PMBus rev 1.3 interface.
+
+Devices support linear format for reading input voltage, input and output current,
+input and output power and temperature.
+Device supports VID format for reading output voltage. The below modes are
+supported:
+- VR12.0 mode, 5-mV DAC - 0x01.
+- VR12.5 mode, 10-mV DAC - 0x02.
+- IMVP9 mode, 5-mV DAC - 0x03.
+- AMD mode 6.25mV - 0x10.
+
+Devices support two pages for telemetry.
+
+The driver provides for current: input, maximum and critical thresholds
+and maximum and critical alarms. Critical thresholds and critical alarm are
+supported only for current output.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "iin" and 3, 4 for "iout":
+
+**curr[3-4]_crit**
+
+**curr[3-4]_crit_alarm**
+
+**curr[1-4]_input**
+
+**curr[1-4]_label**
+
+**curr[1-4]_max**
+
+**curr[1-4]_max_alarm**
+
+The driver provides for voltage: input, critical and low critical thresholds
+and critical and low critical alarms.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "vin" and 3, 4 for "vout":
+
+**in[1-4]_crit**
+
+**in[1-4_crit_alarm**
+
+**in[1-4]_input**
+
+**in[1-4_label**
+
+**in[1-4]_lcrit**
+
+**in[1-41_lcrit_alarm**
+
+The driver provides for power: input and alarms. Power alarm is supported only
+for power input.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "pin" and 3, 4 for "pout":
+
+**power[1-2]_alarm**
+
+**power[1-4]_input**
+
+**power[1-4]_label**
+
+The driver provides for temperature: input, maximum and critical thresholds
+and maximum and critical alarms.
+The driver exports the following attributes for via the sysfs files:
+
+**temp[1-2]_crit**
+
+**temp[1-2]_crit_alarm**
+
+**temp[1-2]_input**
+
+**temp[1-2]_max**
+
+**temp[1-2]_max_alarm**
-- 
2.11.0

