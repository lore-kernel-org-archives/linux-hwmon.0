Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEC0ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 14:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiIPO6X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 10:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiIPO6W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 10:58:22 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9168E0FC
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340301; x=1694876301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3X5w6VQZEL51pZ3c6c5qhhCWAI2OuqWGhfa1I4/008s=;
  b=bh67Vl51zXlhAJhAExt4mSHmFacgzwN8DUrQtxkj2qyHsNwZH/JIddbq
   bIe/T1DoR8s45VmiKYyjk+4S0KIDlNDkg+xosJzcg2O9NQFmnu3u2PjH3
   ZSSAYA9FAuiT/PnFQ3tGchqGHe+1gxbd48o+n8RJKf9/WoF0g7VkN/mT7
   eWmSDlfQkiXqBFrRsCK+auJ7P+/+IxwBwcURifaKkst25C03ZOQFGpScd
   Fv0Zb7gDtc1TdnLB8K4bDWS/sbTxTdCjkufcoIWeW27vd9IbyOi15U9tv
   p4Bn88X7ADN9hdYgy/Hbtnd1o1oqNIOMpakfsJMd/JZFp4l0lrHGOFW5W
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="385298916"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385298916"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="862761550"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:19 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date:   Fri, 16 Sep 2022 20:30:47 +0530
Message-Id: <20220916150054.807590-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the HWMON support for DGFX

Test-with: 20220914140721.3500129-1-riana.tauro@intel.com

v2:
  - Reorganized series. Created first patch as infrastructure patch
    followed by feature patches. (Ashutosh)
  - Fixed review comments (Jani)
  - Fixed review comments (Ashutosh)

v3:
  - Fixed review comments from Guenter
  - Exposed energy inferface as standard hwmon interface (Ashutosh)
  - For power interface added entries for critical power and maintained
    standard interface for all the entries except 
    power1_max_interval
  - Extended support for XEHPSDV (Ashutosh)

v4:
  - Fixed review comment from Guenter
  - Cleaned up unused code

v5:
  - Fixed review comments (Jani)

v6: 
  - Fixed review comments (Ashutosh)
  - Updated date and kernel version in documentation

Ashutosh Dixit (2):
  drm/i915/hwmon: Expose card reactive critical power
  drm/i915/hwmon: Expose power1_max_interval

Dale B Stimson (4):
  drm/i915/hwmon: Add HWMON infrastructure
  drm/i915/hwmon: Power PL1 limit and TDP setting
  drm/i915/hwmon: Show device level energy usage
  drm/i915/hwmon: Extend power/energy for XEHPSDV

Riana Tauro (1):
  drm/i915/hwmon: Add HWMON current voltage support

 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 761 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
 drivers/gpu/drm/i915/i915_reg.h               |  14 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 +
 9 files changed, 901 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

