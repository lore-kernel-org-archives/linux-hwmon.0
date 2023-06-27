Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E078EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjF0SZO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjF0SZN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:13 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EA6196
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890310; x=1719426310;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sjzesD+BZ8dzLPo9Wx3EknOovqIY+u94k3d/HA0D2Uc=;
  b=PDYwoeb+6/EEg7ZeFh426uATWSOBmTt1Cr/K93doocUsYOn3/o9UskIJ
   IQr3EJHA790JygnyfiNebU2yq0mOg36fiLejFCF3xDCKsSbQUT8Kr/4nS
   41rzdjxTSUjCf5OGLDOtZceM0LG+6Qd85o3Tu+VJatl9nz2cotBowM+5o
   2AxNTuYjzABq6VYk8EuQvSm4ZEeV9o/yyh7LJtIyy6SNeckir97ohGqJ7
   lmSImT0JnUL+UvafcNOBpRIPXt+Z/0vJv0O61GjBE/NbNL1kpsfDR/pCl
   c4NFrRg2DAQoGcAPrPqg+A0nOxIJWaEFX7I7z2rjvYkxNlDM9XclaAIWy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148907"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148907"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767166"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767166"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:07 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 0/6] Add HWMON support for DGFX
Date:   Wed, 28 Jun 2023 00:00:37 +0530
Message-Id: <20230627183043.2024530-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds the hwmon support on xe driver for 
DGFX

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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 989 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  26 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 11 files changed, 1174 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

