Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8biN+dx"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9A4189;
	Mon, 27 Nov 2023 05:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701091033; x=1732627033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jPe+mAbPpnyNZkTqYzOt88Czcd9OZNWfQMy+IPturg4=;
  b=W8biN+dxmHzU878PhrqG2u/pYVqA3uzFhkBUaZRzyGeR5Wo5SPARnJLN
   HCjaWZja8lgHG0+4RKIzXQuGLTwNXKG2Ozqv6OQKzHqC8EnD/az1GxvMR
   OpRIb162rf6/+lB+dUktHVzlPMVxC1kgJyE5MoTie5Dap0X2RL52Imp2E
   APC/UIKWs/Wg5xi3kdmCivnsHXenpAT6ESGZ+7iTx/Ewc63WF/EMbteMJ
   vkE1/O9HVTF8g7goE2w2kMF+oQ5XRkbIvku8+hsAtAGhyWrVpIMSKTgkT
   xDW8Lwyi/kPSneplcISsL7C5WNS0qfOfu0/MQiDq8yKV2KZfIPmyIbfCv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="423833679"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="423833679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="718031612"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="718031612"
Received: from zhipengw-mobl1.ccr.corp.intel.com (HELO rzhang1-mobl7.ccr.corp.intel.com) ([10.255.29.237])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:17:10 -0800
From: Zhang Rui <rui.zhang@intel.com>
To: linux@roeck-us.net,
	jdelvare@suse.com
Cc: fenghua.yu@intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (coretemp) Remove unnecessary dependency of array index
Date: Mon, 27 Nov 2023 21:16:50 +0800
Message-Id: <20231127131651.476795-3-rui.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127131651.476795-1-rui.zhang@intel.com>
References: <20231127131651.476795-1-rui.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sensor_device_attribute pointer is available, use container_of() to
get the temp_data address.

This removes the unnecessary dependency of cached index in
pdata->core_data[].

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/coretemp.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6053ed3761c2..cef43fedbd58 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -342,7 +342,7 @@ static ssize_t show_label(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
+	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_LABEL]);
 
 	if (tdata->is_pkg_data)
 		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
@@ -355,8 +355,7 @@ static ssize_t show_crit_alarm(struct device *dev,
 {
 	u32 eax, edx;
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
+	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_CRIT_ALARM]);
 
 	mutex_lock(&tdata->update_lock);
 	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
@@ -369,8 +368,7 @@ static ssize_t show_tjmax(struct device *dev,
 			struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
+	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TJMAX]);
 	int tjmax;
 
 	mutex_lock(&tdata->update_lock);
@@ -384,8 +382,7 @@ static ssize_t show_ttarget(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
+	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TTARGET]);
 	int ttarget;
 
 	mutex_lock(&tdata->update_lock);
@@ -402,8 +399,7 @@ static ssize_t show_temp(struct device *dev,
 {
 	u32 eax, edx;
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct platform_data *pdata = dev_get_drvdata(dev);
-	struct temp_data *tdata = pdata->core_data[attr->index];
+	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TEMP]);
 	int tjmax;
 
 	mutex_lock(&tdata->update_lock);
@@ -445,7 +441,6 @@ static int create_core_attrs(struct temp_data *tdata, struct device *dev,
 		tdata->sd_attrs[i].dev_attr.attr.name = tdata->attr_name[i];
 		tdata->sd_attrs[i].dev_attr.attr.mode = 0444;
 		tdata->sd_attrs[i].dev_attr.show = rd_ptr[i];
-		tdata->sd_attrs[i].index = attr_no;
 		tdata->attrs[i] = &tdata->sd_attrs[i].dev_attr.attr;
 	}
 	tdata->attr_group.attrs = tdata->attrs;
-- 
2.34.1

