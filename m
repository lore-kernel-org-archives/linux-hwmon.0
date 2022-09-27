Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02F2C54EE9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Sep 2022 05:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiI0Frl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Sep 2022 01:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiI0Frj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 01:47:39 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718F48E4C8
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 22:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664257659; x=1695793659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OhVp/Gyhr/Zw+SvZJtMCwlmQOVcfxilaqZ2j0NhiYrw=;
  b=Mz34cFRDm4JtNN5MTq0hmbwWz2tEUM8ZO+7b9ihVDl1M4P9ZLsOBOBFT
   rqse2S6Hr+/CabY7FW1sEStwaupJFTi2zj0vhSG31jrr+l/oklCdi6dpc
   49BkpaVBhXdPxVN0mLG/MVTgSXfzDGEmeA9IEEzQp2U3vGcG+8+Mp+Oek
   reT/tKQHRIOtTshHWMwhjQwgjUAUkZwCEug8yohR6Fp5AWgaQvKJdRNqZ
   JrPFdMw4i7u8biJIRZF8ND3Sl5i5O7SueUeVVZl6vIBqUM/o4aMt077X1
   2zj4SgJ26pNLfFyvQKk0D7+pQdkmO95puflOklfMLKAcq5ydl51DvCYzA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327582685"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="327582685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:47:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376796"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="725376796"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:47:36 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andi.shyti@intel.com, tvrtko.ursulin@intel.com
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date:   Tue, 27 Sep 2022 11:20:13 +0530
Message-Id: <20220927055020.3499420-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the HWMON support for DGFX

Test-with: 20220919144408.251981-1-riana.tauro@intel.com

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

v7:
  - Fixed review comments (Anshuman)
  - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko) 

v8: s/hwmon_device_register_with_info/
      devm_hwmon_device_register_with_info/ (Ashutosh)

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
 drivers/gpu/drm/i915/i915_hwmon.c             | 736 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
 drivers/gpu/drm/i915/i915_reg.h               |   6 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
 9 files changed, 876 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

