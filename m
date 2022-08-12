Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC597C25B0F
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Aug 2022 17:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbiHLRfl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Aug 2022 13:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239505AbiHLRfc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Aug 2022 13:35:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80F46AA31
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660325731; x=1691861731;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nzJUx8USwd/80DCs0Vi1fhg+oet6kmLvFVKJUzA19IA=;
  b=cYlEkIlWHbcPxpfnydlzdYXnz0l05KXGDym8Yt29lpZbk19hC2/ssqcV
   fiH79CH3u6iPT0zFWVtBBkeaTJjjB4uF+bUGjSKJmrB7vmjTJp8rXpgj5
   Hg820qAca4Dyj6mIIdorpL23NHJAz5grG1ilreUmWI7sMvZYU60bbBWSn
   MXvt8hRS99wJdABoAaNsDzPkAjDfAINL4d06kHA5wqc1oX3EQQkhmKiPg
   ROS7SNnTUR9yHwbpZ/UrV4vE4lr6M6xjO6sSMa9/rediTCF8BFXmZIU1A
   HJ283DdGk2jvo64SpVY9g3SNh3lvIbaXLUUZGoQPhjfak3VYkrWr+3LwQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291643964"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="291643964"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="665904202"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:28 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com, linux@roeck-us.net
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date:   Fri, 12 Aug 2022 23:07:08 +0530
Message-Id: <20220812173715.2398586-1-badal.nilawar@intel.com>
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
 drivers/gpu/drm/i915/i915_driver.c            |   7 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 802 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
 drivers/gpu/drm/i915/i915_reg.h               |  22 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  13 +
 9 files changed, 953 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

