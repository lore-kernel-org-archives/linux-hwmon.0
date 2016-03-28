Return-path: <Ray.Huang@amd.com>
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<spg_linux_kernel@amd.com>, Borislav Petkov <bp@alien8.de>, Huang Rui
	<ray.huang@amd.com>
Subject: [PATCH v5 1/6] hwmon: (fam15h_power) Add CPU_SUP_AMD as the dependence
Date: Mon, 28 Mar 2016 13:32:11 +0800
Message-ID: <1459143136-2412-2-git-send-email-ray.huang@amd.com>
In-Reply-To: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

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
