Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36186 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752110AbdCBNGZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Mar 2017 08:06:25 -0500
Received: by mail-wr0-f193.google.com with SMTP id l37so9398333wrc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Mar 2017 05:04:44 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux@endlessm.com,
        punit.agrawal@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org
Cc: Carlo Caione <carlo@endlessm.com>
Subject: [PATCH 1/2] Documentation: bindings: Introduce scpi,sensors-scale
Date: Thu,  2 Mar 2017 13:14:59 +0100
Message-Id: <20170302121500.8121-2-carlo@caione.org>
In-Reply-To: <20170302121500.8121-1-carlo@caione.org>
References: <20170302121500.8121-1-carlo@caione.org>
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

