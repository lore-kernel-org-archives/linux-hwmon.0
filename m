Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.119]:50154 "EHLO
        atl4mhfb03.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753962AbcHXIQQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Aug 2016 04:16:16 -0400
Received: from atl4mhob19.myregisteredsite.com (atl4mhob19.myregisteredsite.com [209.17.115.112])
        by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id u7O8EbsI017451
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Aug 2016 04:14:38 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.210])
        by atl4mhob19.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id u7O8DY7q048340
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Aug 2016 04:13:34 -0400
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux@roeck-us.net, linux-kernel@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/2] hwmon: (max6650) Add initial rpm target devicetree documentation
Date: Wed, 24 Aug 2016 10:13:27 +0200
Message-Id: <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
References: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <5f14ba10-60dd-0e0a-dcd0-f8bbbed33510@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add devicetree property for early initialization of the fan controller
to prevent overheating, for example when resetting the board while the
fan was completely turned off.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 Documentation/devicetree/bindings/hwmon/max6650.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
index d6c10e3..f6bd87d 100644
--- a/Documentation/devicetree/bindings/hwmon/max6650.txt
+++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
@@ -13,6 +13,10 @@ Optional properties, default is to retain the chip's current setting:
 - maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
 			allow more fine-grained control of slower fans.
 			Valid: 1, 2, 4, 8, 16.
+- maxim,fan-target-rpm: Initial requested fan rotation speed. If specified, the
+			driver selects closed-loop mode and the requested speed.
+			This ensures the fan is already running before userspace
+			takes over.
 
 Example:
 	fan-max6650: max6650@1b {
@@ -20,4 +24,5 @@ Example:
 		compatible = "maxim,max6650";
 		maxim,fan-microvolt = <12000000>;
 		maxim,fan-prescale = <4>;
+		maxim,fan-target-rpm = <1200>;
 	};
-- 
1.9.1

