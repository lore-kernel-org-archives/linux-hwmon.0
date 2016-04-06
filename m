Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-bn1on0055.outbound.protection.outlook.com ([157.56.110.55]:51024
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1760092AbcDFHoK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 6 Apr 2016 03:44:10 -0400
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Borislav Petkov" <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 3/6] hwmon: (fam15h_power) Add ptsc counter value for accumulated power
Date: Wed, 6 Apr 2016 15:44:12 +0800
Message-ID: <1459928655-6071-4-git-send-email-ray.huang@amd.com>
In-Reply-To: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
References: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

PTSC is the performance timestamp counter value in a cpu core and the
cores in one compute unit have the fixed frequency. So it picks up the
performance timestamp counter value of the first core per compute unit
to measure the interval for average power per compute unit.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Cc: Borislav Petkov <bp@alien8.de>
---
 drivers/hwmon/fam15h_power.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 4edbaf0..336d422 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -50,6 +50,7 @@ MODULE_LICENSE("GPL");
 
 #define MSR_F15H_CU_PWR_ACCUMULATOR	0xc001007a
 #define MSR_F15H_CU_MAX_PWR_ACCUMULATOR	0xc001007b
+#define MSR_F15H_PTSC			0xc0010280
 
 #define PCI_DEVICE_ID_AMD_15H_M70H_NB_F4 0x15b4
 
@@ -65,6 +66,8 @@ struct fam15h_power_data {
 	u64 max_cu_acc_power;
 	/* accumulated power of the compute units */
 	u64 cu_acc_power[MAX_CUS];
+	/* performance timestamp counter */
+	u64 cpu_sw_pwr_ptsc[MAX_CUS];
 };
 
 static ssize_t show_power(struct device *dev,
@@ -145,6 +148,7 @@ static void do_read_registers_on_cu(void *_data)
 	cu = cpu_data(cpu).cpu_core_id;
 
 	rdmsrl_safe(MSR_F15H_CU_PWR_ACCUMULATOR, &data->cu_acc_power[cu]);
+	rdmsrl_safe(MSR_F15H_PTSC, &data->cpu_sw_pwr_ptsc[cu]);
 }
 
 /*
-- 
1.9.1

