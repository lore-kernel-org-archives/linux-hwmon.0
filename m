Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22005CE7A8C
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 08:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjIYILg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbjIYILd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 04:11:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDD71A6
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695629484; x=1727165484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MslUwshz7kUCtfgWezAQSzIKsd6Rcst7NBBkIMQXddA=;
  b=EU9e214+9ogYwc+gaW2u2XgzXB/yDfcz/T2HjSQT/09vUVx2Yfn0hLpQ
   cAfd+DKQcfjROmRhd1QFkbX2bDSfRS/APZfngTs0H5YHBVFs1bXuh4hiD
   zdeUe1+xOuLf7y2TQ+yrR0Mw65XnBV+cO3hffA/+qktEmiJsP6cYN0D6K
   roJ9WkbkTh1Opar4i8QfuMN0vn3XKwBoVubz7QBUMawRB4judpNM2gTIT
   UyEfBXwSfgfKk4K34QrlLuo38cR/kAbyp9O2JWtTrg/vzGKYffuq3RFy3
   aEoxAU8tVGKbHZoRvVZeMZKoL5d2B7BdJkO6VI3E6jyBfgXzrBqopqdKb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467482443"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="467482443"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079126899"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="1079126899"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:11:20 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v6 0/5] Add HWMON support for DGFX
Date:   Mon, 25 Sep 2023 13:48:37 +0530
Message-Id: <20230925081842.3566834-1-badal.nilawar@intel.com>
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

v5: Rebased and clean up

v6: 
  - Dropped XE_MISSING_CASE patch
  - Fix couple of review comments 

Badal Nilawar (5):
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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 757 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  19 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 10 files changed, 921 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

