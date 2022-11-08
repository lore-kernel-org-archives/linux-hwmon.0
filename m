Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15180C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Nov 2022 07:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbiKHHsn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Nov 2022 02:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbiKHHsl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Nov 2022 02:48:41 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37A313D3D
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Nov 2022 23:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667893720; x=1699429720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OgGfLqT6Bs7rBsAeWZxER/fh7GM8jB580Y6vPrcAUkE=;
  b=atfdFj9Tq7xKCUYY+Z5xLHCtN1t5wTsnf8QrIXWDq0EGF6ilrY55ihy6
   tlffHIc9T0AI7qVGfaX07R98tnUx1cxWtryK4TdVkJq+CJFTQNIZfD699
   tmloforZGUbwBIZaAnJhtF2qRSV9GuQx5cAEPSNPo1jKvMYn0RDyw7/Fy
   jPPUYqcX9aIhOjVRTb8f+e8ZSV4KiozFpZbujtybQvMwygOrXFZ3HxPLy
   AL1myjrMo599wBSwB1bt4o0SnGY1p8k0tBo8fUs0qsSif0vpA8vRA01Bv
   YKvXMi+hn+Chs518fRTpHjqhxtyEWc4Ueo+RaDNtOcsGYyIOJ2HgOFcNr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290351691"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="290351691"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:48:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705204797"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="705204797"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 23:48:39 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH 1/3] hwmon (coretemp): Remove obsolete temp_data->valid
Date:   Tue,  8 Nov 2022 15:50:49 +0800
Message-Id: <20221108075051.5139-2-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108075051.5139-1-rui.zhang@intel.com>
References: <20221108075051.5139-1-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Checking for the valid bit of IA32_THERM_STATUS is removed in commit
bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
temperatures"), and temp_data->valid is set and never cleared when the
temperature has been read once.

Remove the obsolete temp_data->valid field.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/coretemp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 8bf32c6c85d9..ec35ada68455 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -64,7 +64,6 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
  * @attr_size:  Total number of pre-core attrs displayed in the sysfs.
  * @is_pkg_data: If this is 1, the temp_data holds pkgtemp data.
  *		Otherwise, temp_data holds coretemp data.
- * @valid: If this is 1, the current temperature is valid.
  */
 struct temp_data {
 	int temp;
@@ -76,7 +75,6 @@ struct temp_data {
 	u32 status_reg;
 	int attr_size;
 	bool is_pkg_data;
-	bool valid;
 	struct sensor_device_attribute sd_attrs[TOTAL_ATTRS];
 	char attr_name[TOTAL_ATTRS][CORETEMP_NAME_LENGTH];
 	struct attribute *attrs[TOTAL_ATTRS + 1];
@@ -157,7 +155,7 @@ static ssize_t show_temp(struct device *dev,
 	mutex_lock(&tdata->update_lock);
 
 	/* Check whether the time interval has elapsed */
-	if (!tdata->valid || time_after(jiffies, tdata->last_updated + HZ)) {
+	if (time_after(jiffies, tdata->last_updated + HZ)) {
 		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
 		/*
 		 * Ignore the valid bit. In all observed cases the register
@@ -166,7 +164,6 @@ static ssize_t show_temp(struct device *dev,
 		 * really help at all.
 		 */
 		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
-		tdata->valid = true;
 		tdata->last_updated = jiffies;
 	}
 
-- 
2.25.1

