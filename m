Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F2EC43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 20:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiFTUrA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 16:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiFTUq7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 16:46:59 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581591A3BB
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655758019; x=1687294019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D8lXaLHE0CpjESkrnINdjT7RVBNH+F5q4NPxHFuTqo4=;
  b=j17Xe3RsJm9aPhnzYRx2Vc0jopounZCYPKHfl9IuR/bNJO+nGlxNUZRg
   6VEr5Vbuda9De2YEoVM68Fv1cgCc+FUuA+TqCYuedkX/5TnfDXXVszPYL
   hYeHvTutj7oaG25+18pdlZaJLJHxovUi38McfDYlbv98jaJtfRUygVDUB
   rZGU1IodguLItMxagmW2aWdFJi2BtVo4jF8KHfdI9QsFxMuC+SuOZsLJM
   4JevLo6CpnH8TfqrR6lTwo+Ptnq+/73n3h+QPVJpXX56K2KK7LT173llP
   W1gZ10kXVvFqzOOcgoengs0XiLIjTp6vstBGIACoVOGjTFtwzvfrC0rCP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263004438"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="263004438"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:46:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620226936"
Received: from bnilawar-desk.iind.intel.com ([10.145.162.36])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:46:56 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 0/4] drm/i915: Add HWMON support 
Date:   Tue, 21 Jun 2022 02:16:45 +0530
Message-Id: <20220620204649.894703-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

v2:
  - Reorganized series. Created first patch as infrastructure patch
    followed by feature patches. (Ashutosh)
  - Fixed review comments (Jani)
  - Fixed review comments (Ashutosh)

Dale B Stimson (3):
  drm/i915/hwmon: Add HWMON infrastructure patch
  drm/i915/hwmon: Add HWMON power sensor support
  drm/i915/hwmon: Add HWMON energy support

Riana Tauro (1):
  drm/i915/hwmon: Add HWMON current voltage support

 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  43 ++
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 drivers/gpu/drm/i915/i915_driver.c            |   7 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 608 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  22 +
 drivers/gpu/drm/i915/i915_reg.h               |  15 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |   9 +
 9 files changed, 712 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

