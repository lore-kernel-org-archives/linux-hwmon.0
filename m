Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:36762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751882AbcL1VxA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Dec 2016 16:53:00 -0500
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fix spelling mistakes of "Celcius" -- > "Celsius"
Date: Wed, 28 Dec 2016 21:51:37 +0000
Message-Id: <20161228215137.7675-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/hwmon/ds1621            | 8 ++++----
 Documentation/thermal/nouveau_thermal | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/ds1621 b/Documentation/hwmon/ds1621
index f775e61..fa34079 100644
--- a/Documentation/hwmon/ds1621
+++ b/Documentation/hwmon/ds1621
@@ -117,10 +117,10 @@ support, which is achieved via the R0 and R1 config register bits, where:
 
 R0..R1
 ------
- 0  0 => 9 bits, 0.5 degrees Celcius
- 1  0 => 10 bits, 0.25 degrees Celcius
- 0  1 => 11 bits, 0.125 degrees Celcius
- 1  1 => 12 bits, 0.0625 degrees Celcius
+ 0  0 => 9 bits, 0.5 degrees Celsius
+ 1  0 => 10 bits, 0.25 degrees Celsius
+ 0  1 => 11 bits, 0.125 degrees Celsius
+ 1  1 => 12 bits, 0.0625 degrees Celsius
 
 Note:
 At initial device power-on, the default resolution is set to 12-bits.
diff --git a/Documentation/thermal/nouveau_thermal b/Documentation/thermal/nouveau_thermal
index 60bc293..6e17a11 100644
--- a/Documentation/thermal/nouveau_thermal
+++ b/Documentation/thermal/nouveau_thermal
@@ -42,7 +42,7 @@ thresholds can be configured thanks to the following HWMON attributes:
  * Critical: temp1_crit and temp1_crit_hyst;
  * Shutdown: temp1_emergency and temp1_emergency_hyst.
 
-NOTE: Remember that the values are stored as milli degrees Celcius. Don't forget
+NOTE: Remember that the values are stored as milli degrees Celsius. Don't forget
 to multiply!
 
 Fan management
-- 
2.10.2

