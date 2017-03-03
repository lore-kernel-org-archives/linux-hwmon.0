Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36676 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751463AbdCCKHr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Mar 2017 05:07:47 -0500
Received: by mail-wm0-f67.google.com with SMTP id v190so2314304wme.3
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Mar 2017 02:07:11 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux@endlessm.com,
        punit.agrawal@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org
Cc: Carlo Caione <carlo@endlessm.com>
Subject: [PATCH v2 1/2] Documentation: bindings: Introduce scpi,sensors-scale
Date: Fri,  3 Mar 2017 10:14:48 +0100
Message-Id: <20170303091449.3512-2-carlo@caione.org>
In-Reply-To: <20170303091449.3512-1-carlo@caione.org>
References: <20170303091449.3512-1-carlo@caione.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

Document the new property `scpi,sensors-scale` used by the hwmon-scpi
driver to convert the sensor readings to the correct / expected scale.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 Documentation/devicetree/bindings/arm/arm,scpi.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
index 401831973638..35c621ce52c5 100644
--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -84,6 +84,24 @@ Required properties:
 			 as used by the firmware. Refer to  platform details
 			 for your implementation for the IDs to use.
 
+Optional properties:
+- scpi,sensors-scale: array of 5 elements defining the unit scale used by the
+                      SCP for the 5 different sensor classes (temperature,
+                      voltage, current, power, energy) such that 1 == unit,
+                      1000 == milli, 1000000 == micro, ...
+
+                      Example:
+                         scpi,sensors-scale = <1 1000 1000 1000000 1000000>
+                      In this case the values reported by SCP are:
+                      -> temperature in degree Celsius
+                      -> voltage in millivolts
+                      -> current in milliamperes
+                      -> power in microwatts
+                      -> energy in microjoules
+
+                      The default value is:
+                         scpi,sensors-scale = <1000 1000 1000 1000000 1000000>
+
 Power domain bindings for the power domains based on SCPI Message Protocol
 ------------------------------------------------------------
 
-- 
2.12.0

