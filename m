Return-Path: <SRS0=kmu5=C7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C399DC2D0E2
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 15:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97F712399A
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 15:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgIVPmF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Sep 2020 11:42:05 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:46474 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726566AbgIVPmE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Sep 2020 11:42:04 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 11:42:04 EDT
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Sep 2020 18:35:22 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08MFZJKd029508;
        Tue, 22 Sep 2020 18:35:21 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 2/3] docs: hwmon: Include 'mp2975.rst' into docs
Date:   Tue, 22 Sep 2020 18:35:17 +0300
Message-Id: <20200922153518.5765-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922153518.5765-1-vadimp@nvidia.com>
References: <20200922153518.5765-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add documentation for Monolithic Power Systems, Inc. (MPS) 'mp2975'
multi-phase controller.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/hwmon/mp2975.rst | 116 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/hwmon/mp2975.rst

diff --git a/Documentation/hwmon/mp2975.rst b/Documentation/hwmon/mp2975.rst
new file mode 100644
index 000000000000..5b0609c62f48
--- /dev/null
+++ b/Documentation/hwmon/mp2975.rst
@@ -0,0 +1,116 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2975
+====================
+
+Supported chips:
+
+  * MPS MP12254
+
+    Prefix: 'mp2975'
+
+Author:
+
+	Vadim Pasternak <vadimp@nvidia.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+vendor dual-loop, digital, multi-phase controller MP2975.
+
+This device:
+- Supports up to two power rail.
+- Provides 8 pulse-width modulations (PWMs), and can be configured up
+  to 8-phase operation for rail 1 and up to 4-phase operation for rail
+  2.
+- Supports two pages 0 and 1 for telemetry and also pages 2 and 3 for
+  configuration.
+- Can configured VOUT readout in direct or VID format and allows
+  setting of different formats on rails 1 and 2. For VID the following
+  protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
+  10-mV DAC, IMVP9 mode with 5-mV DAC.
+
+Device supports:
+- SVID interface.
+- AVSBus interface.
+
+Device complaint with:
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading output current, output voltage,
+input and output power and temperature.
+Device supports linear format for reading input voltage and input power.
+Device supports VID and direct formats for reading output voltage.
+The below VID modes are supported: VR12, VR13, IMVP9.
+
+The driver provides the next attributes for the current:
+- for current in: input, maximum alarm;
+- for current out input, maximum alarm and highest values;
+- for phase current: input and label.
+attributes.
+The driver exports the following attributes via the 'sysfs' files, where
+- 'n' is number of telemetry pages (from 1 to 2);
+- 'k' is number of configured phases (from 1 to 8);
+- indexes 1, 1*n for "iin";
+- indexes n+1, n+2 for "iout";
+- indexes 2*n+1 ... 2*n + k for phases.
+
+**curr[1-{2n}]_alarm**
+
+**curr[{n+1}-{n+2}]_highest**
+
+**curr[1-{2n+k}]_input**
+
+**curr[1-{2n+k}]_label**
+
+The driver provides the next attributes for the voltage:
+- for voltage in: input, high critical threshold, high critical alarm, all only
+  from page 0;
+- for voltage out: input, low and high critical thresholds, low and high
+  critical alarms, from pages 0 and 1;
+The driver exports the following attributes via the 'sysfs' files, where
+- 'n' is number of telemetry pages (from 1 to 2);
+- indexes 1 for "iin";
+- indexes n+1, n+2 for "vout";
+
+**in[1-{2n+1}]_crit**
+
+**in[1-{2n+1}]_crit_alarm**
+
+**in[1-{2n+1}]_input**
+
+**in[1-{2n+1}]_label**
+
+**in[2-{n+1}]_lcrit**
+
+**in[2-{n+1}1_lcrit_alarm**
+
+The driver provides the next attributes for the power:
+- for power in alarm and input.
+- for power out: highest and input.
+The driver exports the following attributes via the 'sysfs' files, where
+- 'n' is number of telemetry pages (from 1 to 2);
+- indexes 1 for "pin";
+- indexes n+1, n+2 for "pout";
+
+**power1_alarm**
+
+**power[2-{n+1}]_highest**
+
+**power[1-{2n+1}]_input**
+
+**power[1-{2n+1}]_label**
+
+The driver provides the next attributes for the temperature (only from page 0):
+
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
-- 
2.11.0

