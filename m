Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-by2on0064.outbound.protection.outlook.com ([207.46.100.64]:32207
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1759759AbcDFHnw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 6 Apr 2016 03:43:52 -0400
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Borislav Petkov" <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 1/6] hwmon: (fam15h_power) Add CPU_SUP_AMD as the dependence
Date: Wed, 6 Apr 2016 15:44:10 +0800
Message-ID: <1459928655-6071-2-git-send-email-ray.huang@amd.com>
In-Reply-To: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
References: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds CONFIG_CPU_SUP_AMD as the dependence of fam15h_power
driver. Because the following patch will use the interface from
x86/kernel/cpu/amd.c.

Otherwise, the below error might be encountered:

All errors (new ones prefixed by >>):

   drivers/built-in.o: In function `fam15h_power_probe':
>> fam15h_power.c:(.text+0x26e3a3): undefined reference to
>> `amd_get_cores_per_cu'
   fam15h_power.c:(.text+0x26e41e): undefined reference to
`amd_get_cores_per_cu'

Reported-by: build test robot <lkp@intel.com>
Acked-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d13a..4be3792 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -288,7 +288,7 @@ config SENSORS_K10TEMP
 
 config SENSORS_FAM15H_POWER
 	tristate "AMD Family 15h processor power"
-	depends on X86 && PCI
+	depends on X86 && PCI && CPU_SUP_AMD
 	help
 	  If you say yes here you get support for processor power
 	  information of your AMD family 15h CPU.
-- 
1.9.1

