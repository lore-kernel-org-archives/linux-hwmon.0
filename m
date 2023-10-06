Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE50E81E1D
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Oct 2023 16:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbjJFQyf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 6 Oct 2023 12:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFQye (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Oct 2023 12:54:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E54BF
        for <linux-hwmon@vger.kernel.org>; Fri,  6 Oct 2023 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696611273; x=1728147273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Aj/1WSL1CRuNbjGeogBSdFyYX9RACxn9HGx+wd+H1ho=;
  b=hJhJXFOFefzEqlGwP2Z5Eq57TejSuBcPb9mSQHGOCTuMqpoMKJbden4O
   JiYLu0gnBaj+jdEdl30V+1JT+wVWHPq/fAqDjQtUw4g45vSXsbj9uNKyw
   na+AFS1/C3oOyJCEggH+UVCbXZ9VCXRZoGjJSEQ1Cmn4qKRFQH0V4Q00w
   28/xGJkcyMSRqLxivTuL5X9Re0DuAq5GX4UdkeKBJ6KQRrrocd6Ut5OBA
   7rn9vfvsJ0UpDhgzSfW313W1tu0FTfZJ6oz8gi9Z/cI78n8qlYDx9dB5p
   IUK6r2x5yUeD0jiyvYFGvK5dAee59zd1CII5H2z4c8Pe38FaxLQ4oA3Ol
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450276153"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="450276153"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842894416"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842894416"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:30 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        andi.shyti@linux.intel.com, riana.tauro@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH 0/2] DGFX HWMON Enhancement
Date:   Fri,  6 Oct 2023 22:32:03 +0530
Message-Id: <20231006170205.4136927-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series contains couple of patches. First patch handles locking.
Second patch "Expose power1_max_interval" is, with couple of fixes, from
previous series https://patchwork.freedesktop.org/series/118934/

Badal Nilawar (2):
  drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 277 +++++++++++++-----
 3 files changed, 225 insertions(+), 69 deletions(-)

-- 
2.25.1

