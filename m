Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C25C83F2C
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Sep 2023 18:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjIDSQJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Sep 2023 14:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjIDSQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Sep 2023 14:16:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5CF12A
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Sep 2023 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693851365; x=1725387365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e48FJP8tkyFZ7AupeRdl4ciaaJ3876lRnJDs5vGELew=;
  b=Y0vminCB7Ne+RTc3S9SCiJXrYFl2bKtNghTr2yp+mr/vk03/hCRPQEJl
   ZahK1DTaaqccjKbUZEAKxX62NLq5MOCSOxtxOHNRWwkjyyjEA7kX/nJC+
   V/H0fKyvm9AAstXyHLb4/W+LGgtKK7Ch87b/bnF9aX0slYUAHmUtGGZ7a
   UnXUgLeGPPfroJEt7aBtlzM6FegGvf7+fYaF9xkNw8wHVYfAv6AdsOPwn
   vBQAGOSWoII2C2/rhHKzBLgbTxf/rvY5mGEQxvgCY+XRrz96u1v0R7GvT
   Aa0/wSKEvTGyfQZCdRu1qYrG23HiZ0knKqyrJn4G09nt9tbPx8SICpPCr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366867379"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="366867379"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071692671"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="1071692671"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:01 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v4 0/6] Add HWMON support for DGFX
Date:   Mon,  4 Sep 2023 23:52:52 +0530
Message-Id: <20230904182258.2291881-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the hwmon support on xe driver for 
DGFX. This is ported from i915 hwmon. 

v3: Fix review comments (Matt Brost/Andi) 

v4:
  - Squashed "Add HWMON infrastructure" patch to "Expose power attributes"
  - Dropped changes related to disable PL1 to boost firmware loading. 
    Will handle it saperate patch/series.
  - Dropped changes related to gt specific energy attributes. 
    Will handle gt specific energy attributes in saperate patch/series with design
    change suggested by Guenter
  - Fix review comments (Andi/Guenter)

Badal Nilawar (6):
  drm/xe: Add XE_MISSING_CASE macro
  drm/xe/hwmon: Expose power attributes
  drm/xe/hwmon: Expose card reactive critical power
  drm/xe/hwmon: Expose input voltage attribute
  drm/xe/hwmon: Expose hwmon energy attribute
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  72 ++
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  44 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 767 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
 drivers/gpu/drm/xe/xe_macros.h                |   3 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   1 +
 12 files changed, 936 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

