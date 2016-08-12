Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta3.messagelabs.com ([195.245.230.162]:61835 "EHLO
	mail1.bemta3.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752627AbcHLMmu (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 12 Aug 2016 08:42:50 -0400
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id u7CCg6iY010203
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2016 13:42:07 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: linux-hwmon@vger.kernel.org
Cc: Thilo Cestonaro <thilo@cestona.ro>
Subject: [PATCH] hwmon: correct ftp urls in ftsteutates documentation
Date: Fri, 12 Aug 2016 14:39:10 +0200
Message-Id: <1471005550-5685-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Thilo Cestonaro <thilo@cestona.ro>

Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
---
 Documentation/hwmon/ftsteutates | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ftsteutates b/Documentation/hwmon/ftsteutates
index 2a1bf69..8c10a91 100644
--- a/Documentation/hwmon/ftsteutates
+++ b/Documentation/hwmon/ftsteutates
@@ -19,5 +19,5 @@ enhancements. It can monitor up to 4 voltages, 16 temperatures and
 implemented in this driver.
 
 Specification of the chip can be found here:
-ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
-ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
+ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
+ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
-- 
2.8.1

