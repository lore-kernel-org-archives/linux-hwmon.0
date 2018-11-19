Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37512 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728938AbeKTG4o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Nov 2018 01:56:44 -0500
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: hwmon: Add descriptions for ina2xx sysfs entries
Date: Mon, 19 Nov 2018 12:31:16 -0800
Message-Id: <20181119203116.25589-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

There are a few sysfs entries being exposed to user space by the
ina2xx hwmon driver while not getting explicitly documented. So
this patch just adds a description section for them.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 Documentation/hwmon/ina2xx | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/hwmon/ina2xx b/Documentation/hwmon/ina2xx
index b8df81f6d6bc..0f36c021192d 100644
--- a/Documentation/hwmon/ina2xx
+++ b/Documentation/hwmon/ina2xx
@@ -62,3 +62,18 @@ bus and shunt voltage conversion times multiplied by the averaging rate. We
 don't touch the conversion times and only modify the number of averages. The
 lower limit of the update_interval is 2 ms, the upper limit is 2253 ms.
 The actual programmed interval may vary from the desired value.
+
+General sysfs entries
+-------------
+
+in0_input		Shunt voltage(mV) channel
+in1_input		Bus voltage(mV) channel
+curr1_input		Current(mA) measurement channel
+power1_input		Power(uW) measurement channel
+shunt_resistor		Shunt resistance(uOhm) channel
+
+Sysfs entries for ina226, ina230 and ina231 only
+-------------
+
+update_interval		data conversion time; affects number of samples used
+			to average results for shunt and bus voltages.
-- 
2.17.1
