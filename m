Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3981EC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 07:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238809AbiEKHym (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 03:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243203AbiEKHyk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 03:54:40 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2237966CB2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652255679; x=1683791679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hdsg0VVYNTdscwOrmSNSiBs+hTH8nghKIfniNQ6uqaM=;
  b=U1Uhk4v9Km6WQUQiOWBfooQvc+AouqLbKzLuQ5XLBskEBhApYmSx9/8j
   zAE0zBP2zZNp/lj6zVk1Jr/TUKBl1hSlqtwy68v6l/nG3zvJ0P2dOC4kA
   l7Z95AqFwm9eCfuQpnZy9Ub0/fCuvugYoBCd0UgIMpIIAXgRBJzIRJrqt
   pU758GH3sBFUooviM+aNLmQDM2fs7j1vU/+D9JlZg4A6lN5vkZgU7VyLE
   xoC4uH7EysqpMM2Ub4ianGXRbyBqfYbfDC4RNjX+Y/bpn7GiHX/bT1fRp
   YD139XPdQRcKdEvzF8EU3upSqYT6FXQug1DPZmzXoxY+LkOEbRCgT2SDq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251674409"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="251674409"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 00:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="739104947"
Received: from rzhang1-dev.sh.intel.com ([10.239.48.43])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2022 00:54:37 -0700
From:   Zhang Rui <rui.zhang@intel.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com
Subject: [RFC PATCH] hwmon: (acpi_power_meter): Convert to hwmon_device_register_with_info
Date:   Wed, 11 May 2022 15:54:44 +0800
Message-Id: <20220511075444.3376950-1-rui.zhang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The acpi_power_meter driver doesn't create any standard hwmon sysfs
attributes under its hwmon device node, but instead, the driver has its
own code to create the hwmon style sysfs attributes in the ACPI device
node of the ACPI Power Meter device.
I'm not clear why it was designed in that way.

In order to elimite
[   79.960333] power_meter ACPI000D:00: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
convert the driver to use the new API, no chip_info or sysfs_groups
parameter needed.

The only difference brought by this patch is that the "name" attribute
will be created under the hwmon device node. Not sure if this matters or
not.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/acpi_power_meter.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index c405a5869581..81a982dda5af 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -890,7 +890,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (res)
 		goto exit_free_capability;
 
-	resource->hwmon_dev = hwmon_device_register(&device->dev);
+	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
+				ACPI_POWER_METER_NAME, NULL, NULL, NULL);
 	if (IS_ERR(resource->hwmon_dev)) {
 		res = PTR_ERR(resource->hwmon_dev);
 		goto exit_remove;
-- 
2.17.1

