Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33677 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756531AbcLBCd2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 21:33:28 -0500
Received: by mail-pg0-f68.google.com with SMTP id 3so6367572pgd.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2016 18:33:28 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: John Muir <john@jmuir.com>, John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: [PATCH v3 2/2] devicetree: hwmon: Add documentation for TMP108 driver.
Date: Thu,  1 Dec 2016 18:32:42 -0800
Message-Id: <1480645962-55584-3-git-send-email-john@jmuir.com>
In-Reply-To: <1480645962-55584-1-git-send-email-john@jmuir.com>
References: <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480645962-55584-1-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simple hwmon binding documentation.

Signed-off-by: John Muir <john@jmuir.com>
---
 Documentation/devicetree/bindings/hwmon/tmp108.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt

diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
new file mode 100644
index 0000000..8c4b10d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
@@ -0,0 +1,14 @@
+TMP108 temperature sensor
+-------------------------
+
+This device supports I2C only.
+
+Requires node properties:
+- compatible : "ti,tmp108"
+- reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
+
+Example:
+	tmp108@48 {
+		compatible = "ti,tmp108";
+		reg = <0x48>;
+	};
-- 
2.8.0.rc3.226.g39d4020

