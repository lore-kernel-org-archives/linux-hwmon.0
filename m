Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-by2on0099.outbound.protection.outlook.com ([207.46.100.99]:64544
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932112AbcDFHoV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 6 Apr 2016 03:44:21 -0400
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Borislav Petkov" <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 6/6] hwmon: (fam15h_power) Add platform check function
Date: Wed, 6 Apr 2016 15:44:15 +0800
Message-ID: <1459928655-6071-7-git-send-email-ray.huang@amd.com>
In-Reply-To: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
References: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds a platform check function to make code more readable.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/hwmon/fam15h_power.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 7d9d697..eb97a92 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -78,6 +78,11 @@ struct fam15h_power_data {
 	unsigned long power_period;
 };
 
+static bool is_carrizo_or_later(void)
+{
+	return boot_cpu_data.x86 == 0x15 && boot_cpu_data.x86_model >= 0x60;
+}
+
 static ssize_t show_power(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
@@ -94,7 +99,7 @@ static ssize_t show_power(struct device *dev,
 	 * On Carrizo and later platforms, TdpRunAvgAccCap bit field
 	 * is extended to 4:31 from 4:25.
 	 */
-	if (boot_cpu_data.x86 == 0x15 && boot_cpu_data.x86_model >= 0x60) {
+	if (is_carrizo_or_later()) {
 		running_avg_capture = val >> 4;
 		running_avg_capture = sign_extend32(running_avg_capture, 27);
 	} else {
@@ -111,7 +116,7 @@ static ssize_t show_power(struct device *dev,
 	 * On Carrizo and later platforms, ApmTdpLimit bit field
 	 * is extended to 16:31 from 16:28.
 	 */
-	if (boot_cpu_data.x86 == 0x15 && boot_cpu_data.x86_model >= 0x60)
+	if (is_carrizo_or_later())
 		tdp_limit = val >> 16;
 	else
 		tdp_limit = (val >> 16) & 0x1fff;
-- 
1.9.1

