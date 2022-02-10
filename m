Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9075C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Feb 2022 12:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbiBJMvw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Feb 2022 07:51:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238007AbiBJMvv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Feb 2022 07:51:51 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BC2263E;
        Thu, 10 Feb 2022 04:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644497513; x=1676033513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O2sV7j//NOYqlh2mGrqgY1OMSmiSfEuikM6h29Iuhms=;
  b=IGS6lhYDpzM5SGU1S8PNhBOb9VOdUIxDyK64bS+GhBupxS8rOeFSL6pH
   0oIkVAL5qmcACJRX7XB14gGoQf+i9mV9TJZ4qxui74hO9SVjUX6A05ehw
   f5Y/HqPnwQO6AJScaPt0jtGyRU1Rh4bQtxkIp8ucRrG+5Aqy1fIiqFkTp
   Qh/OmaXme0RaYQC2+p2HSwcfyav2/YPXMLJhqJVJIuKOf6xyTjIHFZJX/
   52fXP2PVJNTxgO74wsBfM5qQxPljAjVwHSONbcjTm851lZfQiUo2I+8OW
   b3oKCCWXfBi3OioYsLoLShrfVi090jhbdk9m8ZYDhSWFripzZJZMQ+n/9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="335899265"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="335899265"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 04:51:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="541595712"
Received: from muni.iind.intel.com ([10.190.201.115])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 04:51:50 -0800
From:   Vikash Chandola <vikash.chandola@linux.intel.com>
To:     iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vikash Chandola <vikash.chandola@linux.intel.com>
Subject: [PATCH] hwmon: (pmbus) Clear pmbus fault/warning bits before read
Date:   Thu, 10 Feb 2022 12:41:54 +0000
Message-Id: <20220210124154.1304852-1-vikash.chandola@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pmbus fault and warning bits are not cleared by itself once fault/warning
condition is not valid anymore. As per pmbus datasheet faults must be
cleared by user.
Modify hwmon behavior to clear latched status bytes if any bit in status
register is high prior to returning fresh data to userspace. If
fault/warning conditions are still applicable fault/warning bits will be
set and we will get updated data in second read.

Hwmon behavior is changed here. Now sysfs reads will reflect latest
values from pmbus slave, not latched values.
In case a transient warning/fault has happened in the past, it will no
longer be reported to userspace.

Signed-off-by: Vikash Chandola <vikash.chandola@linux.intel.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 776ee2237be2..1cc82d644079 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -577,6 +577,15 @@ static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 		break;
 	default:
 		status = _pmbus_read_byte_data(client, page, reg);
+		if (status > 0) {
+			/*
+			 * Status greater than 0 could mean that there was a fault/warning.
+			 * Clear faults and do a second read to make sure we are not getting
+			 * stale values.
+			 */
+			pmbus_clear_fault_page(client, page);
+			status = _pmbus_read_byte_data(client, page, reg);
+		}
 		break;
 	}
 	if (status < 0)
-- 
2.25.1

