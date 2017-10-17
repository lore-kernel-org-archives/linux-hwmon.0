Return-Path: <hotran@apm.com>
Return-path: <hotran@apm.com>
From: Hoan Tran <hotran@apm.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lho@apm.com,
	patches@apm.com,
	Hoan Tran <hotran@apm.com>
Subject: [PATCH v4] hwmon: xgene: Support hwmon v2
Date: Tue, 17 Oct 2017 11:28:34 -0700
Message-Id: <1508264914-4614-1-git-send-email-hotran@apm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch supports xgene-hwmon v2 which uses the non-cachable memory
as the PCC shared memory.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
v4
 - Initialize version variable

v3
 - Use local version variable
 - Use inline calls instead of the private map function

v2
 - Map PCC shared mem by ioremap() in case hwmon is v2

 drivers/hwmon/xgene-hwmon.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 9c0dbb8..b4e3f11 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -91,6 +91,11 @@
 #define to_xgene_hwmon_dev(cl)		\
 	container_of(cl, struct xgene_hwmon_dev, mbox_client)
 
+enum xgene_hwmon_version {
+	XGENE_HWMON_V1 = 0,
+	XGENE_HWMON_V2 = 1,
+};
+
 struct slimpro_resp_msg {
 	u32 msg;
 	u32 param1;
@@ -609,6 +614,15 @@ static void xgene_hwmon_tx_done(struct mbox_client *cl, void *msg, int ret)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
+	{"APMC0D29", XGENE_HWMON_V1},
+	{"APMC0D8A", XGENE_HWMON_V2},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
+#endif
+
 static int xgene_hwmon_probe(struct platform_device *pdev)
 {
 	struct xgene_hwmon_dev *ctx;
@@ -650,6 +664,16 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 		}
 	} else {
 		struct acpi_pcct_hw_reduced *cppc_ss;
+		int version = XGENE_HWMON_V1;
+#ifdef CONFIG_ACPI
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(xgene_hwmon_acpi_match, &pdev->dev);
+		if (!acpi_id)
+			return -EINVAL;
+
+		version = (int)acpi_id->driver_data;
+#endif
 
 		if (device_property_read_u32(&pdev->dev, "pcc-channel",
 					     &ctx->mbox_idx)) {
@@ -690,7 +714,13 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 		 */
 		ctx->comm_base_addr = cppc_ss->base_address;
 		if (ctx->comm_base_addr) {
-			ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
+			if (version == XGENE_HWMON_V2)
+				ctx->pcc_comm_addr = (void __force *)ioremap(
+							ctx->comm_base_addr,
+							cppc_ss->length);
+			else
+				ctx->pcc_comm_addr = memremap(
+							ctx->comm_base_addr,
 							cppc_ss->length,
 							MEMREMAP_WB);
 		} else {
@@ -758,14 +788,6 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
-	{"APMC0D29", 0},
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
-#endif
-
 static const struct of_device_id xgene_hwmon_of_match[] = {
 	{.compatible = "apm,xgene-slimpro-hwmon"},
 	{}
-- 
1.9.1
