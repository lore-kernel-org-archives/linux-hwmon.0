Return-Path: <linux-kernel-owner@vger.kernel.org>
To: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Rudolf Marek <r.marek@assembler.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fenghua Yu <fenghua.yu@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] hwmon/coretemp: requires CONFIG_PCI
Message-ID: <588e0d93-de4f-31ec-2d0b-81843db4966d@infradead.org>
Date: Tue, 28 Nov 2017 09:39:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix coretemp.c build when CONFIG_PCI is not enabled.
Fixes these build errors:

../drivers/hwmon/coretemp.c: In function 'adjust_tjmax':
../drivers/hwmon/coretemp.c:250:9: error: implicit declaration of function 'pci_get_domain_bus_and_slot' [-Werror=implicit-function-declaration]
  struct pci_dev *host_bridge = pci_get_domain_bus_and_slot(0, 0, devfn);
../drivers/hwmon/coretemp.c:250:32: warning: initialization makes pointer from integer without a cast [enabled by default]
  struct pci_dev *host_bridge = pci_get_domain_bus_and_slot(0, 0, devfn);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-415-rc1.orig/drivers/hwmon/Kconfig
+++ lnx-415-rc1/drivers/hwmon/Kconfig
@@ -631,7 +631,7 @@ config SENSORS_I5500
 
 config SENSORS_CORETEMP
 	tristate "Intel Core/Core2/Atom temperature sensor"
-	depends on X86
+	depends on X86 && PCI
 	help
 	  If you say yes here you get support for the temperature
 	  sensor inside your CPU. Most of the family 6 CPUs
