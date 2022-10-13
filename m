Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EFDC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Oct 2022 15:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJMPqE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Oct 2022 11:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiJMPqD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 11:46:03 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F94D2CF2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665675962; x=1697211962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xq2t2MmFZUfrde9u2sznaDBrsOgx6c52zrtyTYrYhEk=;
  b=XxLbvm67FGfJbH+DG+8QutJ5CTuJTXGNZn++W7C4hqGuQp+GATs77lwq
   vcaNINePVubtzm12+Ll9rP7feomgAV8Epo6jEaJsKHP1gR7V21CHIvWSx
   /oY85I6qQiZd+TEDpuCHvn2aEkHXgC9sRedo+D9dVfPo5nE7s1JqgFvlU
   ah9Ld2pVSSpvjSP2UkeF5IzMUEdUcnGIQHcwbsPxDJt1EE7TA4g+EK279
   RQ+aXsbxLIS9VrM/8fVhJ/eRvZOUd2h+CBO5K7MCLZ5BnNx5jyxNUnHvF
   kc6BqKEamN7HVRhSSan5Bqr6i/FuGPhetQoP2wi4h4DNit5rmvyMl9FyP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="367130110"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="367130110"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="660381003"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="660381003"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andi Shyti <andi.shyti@intel.com>
Subject: [PATCH 0/7] drm/i915: Add HWMON support
Date:   Thu, 13 Oct 2022 08:45:19 -0700
Message-Id: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the HWMON support for DGFX

Test-with: 20221013151400.2086268-1-ashutosh.dixit@intel.com

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

v9: Addressed review comments from Rodrigo and Andi

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
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 738 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
 drivers/gpu/drm/i915/i915_reg.h               |   6 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
 10 files changed, 879 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.38.0

