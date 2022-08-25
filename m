Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62988C04AA5
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Aug 2022 13:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239835AbiHYNTY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Aug 2022 09:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235527AbiHYNTT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Aug 2022 09:19:19 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5829C52E
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661433557; x=1692969557;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5MPYDJIIrhZGC5cpKo+virN7PJdCvJg53ZgU3XOXvZo=;
  b=ROMULLsdcu/sVVuSyeP+pJmzSmM2fpDgRwKYmhUF9qBYidgczqX21mUu
   6KTC4mg5PG4z9Oacqslab2Fxx6U1xHaVs4iPaTDbR5PSd6Wn78vfBTaew
   MJsO4SaZ7o+h7jcRfjTGancc77/Q+bJ1o8G89UG0jsK+arMo6VgMYfSeG
   3VC3m/OlFJNKssX3HEZ2Klfqe8to2Vx3/QaCmsj1dwaUUWzhvkr6XPuWG
   E9jDPljj1kbwTbJqrYBTGRuG5Wjc+FEwqsj3Fl6dbmNTZpKLN/tukRBLM
   jOAambCAJ5JLASN8PRcHAZi+xBsHk2TNK/Bfdg03OutvLQN62/XV5dhIu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281203525"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="281203525"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 06:19:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="670974892"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 06:19:13 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date:   Thu, 25 Aug 2022 18:51:11 +0530
Message-Id: <20220825132118.784407-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the HWMON support for DGFX

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
 drivers/gpu/drm/i915/i915_hwmon.c             | 788 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
 drivers/gpu/drm/i915/i915_reg.h               |  22 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 +
 9 files changed, 936 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

