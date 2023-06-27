Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16E5EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjF0SZ3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjF0SZ2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:28 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADEAB8
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890327; x=1719426327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wgFOWDPXALst9CVuUIDfJ8ehUxgO75NWNBvVV3QkvR8=;
  b=M6y9OLkWZviepf+UBU95/xQ0dXx28nboiJZE2NKlvpkzLUiZK6GxNaC0
   AbnhIxXyVFlo7fWij5pSk1MqSTdf7ymCGzs4KM55Afh9JJ4He0EJOYazY
   59Oenn6/oiZfXxDqkofOadqdOHNGp/Ae3AXKsYY26HANJUzRjkcx2fCGS
   xaEZhhBhwI5QbQp7a4g0/7Coq6QUp10xLF8VUCGB47VF/WEtwefO2rAfg
   4/6jiLAc6KPNLJZ/TVl8iMTNK6sHXVli3igGJjgSSO4FguHtWBhIU+wpM
   XgXmNA4CfwlRUmyyLRmAqzsa1zqFSuYuXtTuKfTQEjj5Y8LlxTcZKZDvd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148972"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767231"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767231"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:24 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 6/6] drm/xe/hwmon: Expose power1_max_interval
Date:   Wed, 28 Jun 2023 00:00:43 +0530
Message-Id: <20230627183043.2024530-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose power1_max_interval, that is the tau corresponding to PL1, as a
custom hwmon attribute. Some bit manipulation is needed because of the
format of PKG_PWR_LIM_1_TIME in
PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
This is port from i915 hwmon.

v2: Get rpm wake ref while accessing power1_max_interval

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 140 +++++++++++++++++-
 3 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index f76f4c691946..4895b59f96c6 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -64,3 +64,14 @@ Description:	RO. Energy input of device or tile in microjoules.
 		for the gt.
 
 		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 473a44bd7c56..6897fe70b243 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -22,16 +22,24 @@
 #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
 #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
 #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
+
 
 #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
 #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
+#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
+#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
+#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2faf0f43f2d5..b8a2e327a22b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -43,6 +43,7 @@ enum hwm_reg_operation {
 #define SF_CURR		1000
 #define SF_VOLTAGE	1000
 #define SF_ENERGY	1000000
+#define SF_TIME		1000
 
 struct hwm_energy_info {
 	u32 reg_val_prev;
@@ -66,6 +67,7 @@ struct xe_hwmon {
 	struct mutex hwmon_lock;
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 };
 
 struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
@@ -324,6 +326,141 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	xe_device_mem_access_put(gt_to_xe(ddat->gt));
 }
 
+static ssize_t
+hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 r, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	process_hwmon_reg(ddat, pkg_rapl_limit,
+			  reg_read, &r, 0, 0);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
+	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+	/*
+	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
+	 *     = (4 | x) << (y - 2)
+	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
+	 * However because y can be < 2, we compute
+	 *     tau4 = (4 | x) << y
+	 * but add 2 when doing the final right shift to account for units
+	 */
+	tau4 = ((1 << x_w) | x) << y;
+	/* val in hwmon interface units (millisec) */
+	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	return sysfs_emit(buf, "%llu\n", out);
+}
+
+static ssize_t
+hwm_power1_max_interval_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 x, y, rxy, x_w = 2; /* 2 bits */
+	u64 tau4, r, max_win;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
+	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds
+	 */
+#define PKG_MAX_WIN_DEFAULT 0x12ull
+
+	/*
+	 * val must be < max in hwmon interface units. The steps below are
+	 * explained in hwm_power1_max_interval_show()
+	 */
+	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
+	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
+	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
+	tau4 = ((1 << x_w) | x) << y;
+	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	if (val > max_win)
+		return -EINVAL;
+
+	/* val in hw units */
+	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
+	/* Convert to 1.x * power(2,y) */
+	if (!val) {
+		/* Avoid ilog2(0) */
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		/* x = (val - (1 << y)) >> (y - 2); */
+		x = (val - (1ul << y)) << x_w >> y;
+	}
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, (u32 *)&r,
+			  PKG_PWR_LIM_1_TIME, rxy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  hwm_power1_max_interval_show,
+			  hwm_power1_max_interval_store, 0);
+
+static struct attribute *hwm_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t hwm_attributes_visible(struct kobject *kobj,
+				      struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	u32 reg_val;
+	int ret = 0;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		ret =  process_hwmon_reg(ddat, pkg_rapl_limit,
+					 reg_read, &reg_val, 0, 0) ? 0 : attr->mode;
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+static const struct attribute_group hwm_attrgroup = {
+	.attrs = hwm_attributes,
+	.is_visible = hwm_attributes_visible,
+};
+
+static const struct attribute_group *hwm_groups[] = {
+	&hwm_attrgroup,
+	NULL
+};
+
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
@@ -754,6 +891,7 @@ hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 	if (!ret) {
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 	}
 
 	/*
@@ -817,7 +955,7 @@ void xe_hwmon_register(struct xe_device *xe)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
-							 NULL);
+							 hwm_groups);
 
 	if (IS_ERR(hwmon_dev)) {
 		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
-- 
2.25.1

