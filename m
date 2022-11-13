Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7DCC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Nov 2022 15:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbiKMP3n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Nov 2022 10:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKMP3m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2022 10:29:42 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF09EB8
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Nov 2022 07:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668353381; x=1699889381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JHQeyOQ5B24sRyXtT8cVN5SDD+t1YNoQquTJkXgP0ZM=;
  b=CRBphOV7X0nMhBQMT3OVYq0nzrPnpKNQsSSmYN37u81Cuo7a0r8R6Ovu
   YU41CnhrEbaPm6zhdZSjw8BTpuiV94/I6HPD/q3Q5OZpUks6MwzWiF6xE
   FyOxlby9FoWo0N33NiP4zDBqlO5AWoEiZ4k40Law04VuX8A6xvBVfPqKZ
   VkdIJ58rZciFPZnUJT81ef23LpvpQx9H5JEdPRVqvXTNphdDPqtrKdd/W
   iAKogPOq8OucJOa2i4QN331loxzkAY/aSGt5aA4IQyvjKCSETCTV7Ehyx
   7ZQAkiDsbg9mzCTFgVtKzWpPC0eUTH7ZkEVIlL8nLLka7pYcpIvB+YY7V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398109677"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398109677"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 07:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638148880"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638148880"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by orsmga002.jf.intel.com with ESMTP; 13 Nov 2022 07:29:39 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH V2 1/3] hwmon (coretemp): rearrange tjmax handing code
Date:   Sun, 13 Nov 2022 23:31:43 +0800
Message-Id: <20221113153145.32696-2-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221113153145.32696-1-rui.zhang@intel.com>
References: <20221113153145.32696-1-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Rearrange the tjmax handling code so that it can be used directly in
the sysfs attribute callbacks without forward declarations.

No functional change in this patch.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/coretemp.c | 156 +++++++++++++++++++--------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index ec35ada68455..50b640bfa504 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -93,84 +93,6 @@ struct platform_data {
 	struct device_attribute name_attr;
 };
 
-/* Keep track of how many zone pointers we allocated in init() */
-static int max_zones __read_mostly;
-/* Array of zone pointers. Serialized by cpu hotplug lock */
-static struct platform_device **zone_devices;
-
-static ssize_t show_label(struct device *dev,
-				struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
-
-	if (tdata->is_pkg_data)
-		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
-
-	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
-}
-
-static ssize_t show_crit_alarm(struct device *dev,
-				struct device_attribute *devattr, char *buf)
-{
-	u32 eax, edx;
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
-
-	mutex_lock(&tdata->update_lock);
-	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
-	mutex_unlock(&tdata->update_lock);
-
-	return sprintf(buf, "%d\n", (eax >> 5) & 1);
-}
-
-static ssize_t show_tjmax(struct device *dev,
-			struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
-}
-
-static ssize_t show_ttarget(struct device *dev,
-				struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
-}
-
-static ssize_t show_temp(struct device *dev,
-			struct device_attribute *devattr, char *buf)
-{
-	u32 eax, edx;
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
-
-	mutex_lock(&tdata->update_lock);
-
-	/* Check whether the time interval has elapsed */
-	if (time_after(jiffies, tdata->last_updated + HZ)) {
-		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
-		/*
-		 * Ignore the valid bit. In all observed cases the register
-		 * value is either low or zero if the valid bit is 0.
-		 * Return it instead of reporting an error which doesn't
-		 * really help at all.
-		 */
-		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
-		tdata->last_updated = jiffies;
-	}
-
-	mutex_unlock(&tdata->update_lock);
-	return sprintf(buf, "%d\n", tdata->temp);
-}
-
 struct tjmax_pci {
 	unsigned int device;
 	int tjmax;
@@ -373,6 +295,84 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 	return adjust_tjmax(c, id, dev);
 }
 
+/* Keep track of how many zone pointers we allocated in init() */
+static int max_zones __read_mostly;
+/* Array of zone pointers. Serialized by cpu hotplug lock */
+static struct platform_device **zone_devices;
+
+static ssize_t show_label(struct device *dev,
+				struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+
+	if (tdata->is_pkg_data)
+		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
+
+	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
+}
+
+static ssize_t show_crit_alarm(struct device *dev,
+				struct device_attribute *devattr, char *buf)
+{
+	u32 eax, edx;
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+
+	mutex_lock(&tdata->update_lock);
+	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
+	mutex_unlock(&tdata->update_lock);
+
+	return sprintf(buf, "%d\n", (eax >> 5) & 1);
+}
+
+static ssize_t show_tjmax(struct device *dev,
+			struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct platform_data *pdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
+}
+
+static ssize_t show_ttarget(struct device *dev,
+				struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct platform_data *pdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
+}
+
+static ssize_t show_temp(struct device *dev,
+			struct device_attribute *devattr, char *buf)
+{
+	u32 eax, edx;
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+
+	mutex_lock(&tdata->update_lock);
+
+	/* Check whether the time interval has elapsed */
+	if (time_after(jiffies, tdata->last_updated + HZ)) {
+		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
+		/*
+		 * Ignore the valid bit. In all observed cases the register
+		 * value is either low or zero if the valid bit is 0.
+		 * Return it instead of reporting an error which doesn't
+		 * really help at all.
+		 */
+		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
+		tdata->last_updated = jiffies;
+	}
+
+	mutex_unlock(&tdata->update_lock);
+	return sprintf(buf, "%d\n", tdata->temp);
+}
+
 static int create_core_attrs(struct temp_data *tdata, struct device *dev,
 			     int attr_no)
 {
-- 
2.25.1

