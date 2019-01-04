Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx01.hxt-semitech.com ([223.203.96.7]:46671 "EHLO
        barracuda.hxt-semitech.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727006AbfADI4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Jan 2019 03:56:04 -0500
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>
CC: <openbmc@lists.ozlabs.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Xiaoting Liu <xiaoting.liu@hxt-semitech.com>,
        Shunyong Yang <shunyong.yang@hxt-semitech.com>
Subject: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with driver_data
Date: Fri, 4 Jan 2019 16:55:51 +0800
Message-ID: <680b4d5659971cc4f6e1a6878837c2ce49962a7c.1546591275.git.xiaoting.liu@hxt-semitech.com>
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Current code compares device name with name in i2c_device_id to decide
whether PMBUS_SKIP_STATUS_CHECK should be set in pmbus_platform_data,
which makes adding new devices with PMBUS_SKIP_STATUS_CHECK should also
modify code in pmbus_probe().

This patch adds pmbus_device_info to save pages and flags. Its pointer
is put in driver_data of i2c_device_id, which makes adding new device
more straightforward.

Signed-off-by: Shunyong Yang <shunyong.yang@hxt-semitech.com>
Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
 drivers/hwmon/pmbus/pmbus.c | 54 +++++++++++++++++++++++++++------------------
 include/linux/pmbus.h       |  5 +++++
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7688dab32f6e..aa4cf9636e99 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -172,13 +172,15 @@ static int pmbus_probe(struct i2c_client *client,
        struct pmbus_driver_info *info;
        struct pmbus_platform_data *pdata = NULL;
        struct device *dev = &client->dev;
+       struct pmbus_device_info *device_info;

        info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
        if (!info)
                return -ENOMEM;

-       if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
-           !strcmp(id->name, "sgd009")) {
+       device_info = (struct pmbus_device_info *)id->driver_data;
+
+       if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {
                pdata = devm_kzalloc(dev, sizeof(struct pmbus_platform_data),
                                     GFP_KERNEL);
                if (!pdata)
@@ -187,36 +189,44 @@ static int pmbus_probe(struct i2c_client *client,
                pdata->flags = PMBUS_SKIP_STATUS_CHECK;
        }

-       info->pages = id->driver_data;
+       info->pages = device_info->pages;
        info->identify = pmbus_identify;
        dev->platform_data = pdata;

        return pmbus_do_probe(client, id, info);
 }

+static const struct pmbus_device_info default_pmbus_info = {1, 0};
+static const struct pmbus_device_info dps460_pmbus_info = {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info dps800_pmbus_info = {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info sgd009_pmbus_info = {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info pmbus_info = {0, 0};
 /*
  * Use driver_data to set the number of pages supported by the chip.
  */
 static const struct i2c_device_id pmbus_id[] = {
-       {"adp4000", 1},
-       {"bmr453", 1},
-       {"bmr454", 1},
-       {"dps460", 1},
-       {"dps800", 1},
-       {"mdt040", 1},
-       {"ncp4200", 1},
-       {"ncp4208", 1},
-       {"pdt003", 1},
-       {"pdt006", 1},
-       {"pdt012", 1},
-       {"pmbus", 0},
-       {"sgd009", 1},
-       {"tps40400", 1},
-       {"tps544b20", 1},
-       {"tps544b25", 1},
-       {"tps544c20", 1},
-       {"tps544c25", 1},
-       {"udt020", 1},
+       {"adp4000", (kernel_ulong_t)&default_pmbus_info},
+       {"bmr453", (kernel_ulong_t)&default_pmbus_info},
+       {"bmr454", (kernel_ulong_t)&default_pmbus_info},
+       {"dps460", (kernel_ulong_t)&dps460_pmbus_info},
+       {"dps800", (kernel_ulong_t)&dps800_pmbus_info},
+       {"mdt040", (kernel_ulong_t)&default_pmbus_info},
+       {"ncp4200", (kernel_ulong_t)&default_pmbus_info},
+       {"ncp4208", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt003", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt006", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt012", (kernel_ulong_t)&default_pmbus_info},
+       {"pmbus", (kernel_ulong_t)&pmbus_info},
+       {"sgd009", (kernel_ulong_t)&sgd009_pmbus_info},
+       {"tps40400", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544b20", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544b25", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
+       {"udt020", (kernel_ulong_t)&default_pmbus_info},
        {}
 };

diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index ee3c2aba2a8e..3c05edad7666 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -46,4 +46,9 @@ struct pmbus_platform_data {
        struct regulator_init_data *reg_init_data;
 };

+struct pmbus_device_info {
+       int pages;
+       u32 flags;
+};
+
 #endif /* _PMBUS_H_ */
--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
