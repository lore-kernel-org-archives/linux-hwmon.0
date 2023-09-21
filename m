Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FA8E7D0A0
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjIUR05 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjIUR0o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:26:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D7626B8
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315701; x=1726851701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YAZeKBHLjed9WszyR6yfhUABYujx6VDl+31sOawmrSM=;
  b=ihgUijkecf5YOm4gkWJDcw98KcZe2P5tgnPflckiBEx/WRTtKJBrzMDG
   +7IA32tOsgTAjq0DIa4L3ydDpUKoVwW6L6WFMSvN6dYQWCKXIwCFhW/1J
   wFyrqClllMWidXDFg3/i6y3Fjmk5BDXXUyT8cMQLTFR3qqCIoHuahPY+i
   rzXgWzeMAvlTzegUBjkW/+YNBD7RBbMnqI9yZy7jtBAt6PT1ISbYF2LlE
   Lx4Pdre00s8nbqRhY6L35PVAQ/IHb4dbE5Ihb0+vCTjfBrQg2j6hYN3k5
   DXyVc39W8tAfVTmlJKJSYdSP/55MN0BNfnnZnaF3UICBM7s2RFj4Z6DD5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466788332"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466788332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740573603"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740573603"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:02 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v5 0/6] Add HWMON support for DGFX
Date:   Thu, 21 Sep 2023 15:55:13 +0530
Message-Id: <20230921102519.3355538-1-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 758 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
 drivers/gpu/drm/xe/xe_macros.h                |   4 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 11 files changed, 927 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

