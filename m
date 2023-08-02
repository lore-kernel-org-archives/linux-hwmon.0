Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EDFC001E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbjHBNq1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 09:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjHBNq1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 09:46:27 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BA3F5
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690983986; x=1722519986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4z7IEN1wyekBEs6NoGp9FZVqurA3jlN4d48vtWHIO70=;
  b=DNY+Z+XqJKYttKfLGAyi1XR5kXeFn5Ho8YK2+hN5tEa7DYY7iczjmlBw
   A6MEQmmSyOSOoAbq45Zd4c88Ae33tACquPn4S9MTVKrSg9GpMJYN/53jX
   1yc4E0yEYZFkjwkn7HU9AzkXKdydlXysA61Wr7ZlHXTf2sli4JL1XWwGL
   5cO7dXDij5rjvQhBxnB3UfAOlZE/GxyeODMI8+UYudnBUQy76VojPlI7D
   dZJKkIX0rzUWVKj51sXkdrrd6V9Cdr8TIkYcL6pZaWTBDD7/Ob8x7+TDh
   DIBfpKxPqZ30WAsZrv8TCl/GdKPBLD9xlQAypWu6mlvkvgatgwPMylQF8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534911"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400534911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873890"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852873890"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:22 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 0/6] Add HWMON support for DGFX
Date:   Wed,  2 Aug 2023 19:22:35 +0530
Message-Id: <20230802135241.458855-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the hwmon support on xe driver for 
DGFX. This is ported from i915 hwmon. 

v3: Fix review comments (Matt Brost/Andi) 
  

Badal Nilawar (6):
  drm/xe/hwmon: Add HWMON infrastructure
  drm/xe/hwmon: Expose power attributes
  drm/xe/hwmon: Expose card reactive critical power
  drm/xe/hwmon: Expose input voltage attribute
  drm/xe/hwmon: Expose hwmon energy attribute
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  77 ++
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  45 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 958 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  26 +
 drivers/gpu/drm/xe/xe_macros.h                |   3 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 12 files changed, 1146 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

