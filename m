Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4545BC61DA4
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Feb 2023 05:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjBNFdt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 00:33:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBNFdr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 00:33:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301BC11EBC
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Feb 2023 21:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676352827; x=1707888827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9qrB8i6I8jOvQtnzY9iAwMDwgOWiLaQT40HUJ7CRQTU=;
  b=X3N43xTC3dMH2z5kJimMKf6vk+psJAxe4eawc+x6ty64COIMWUdICq6n
   PrmI5AmtVJFD/LtZCVGOtSzGoULjWByGtABAE1pcK3x5dcUL40tls0FH8
   xDqw30+GlWXLMyNZi/ou5YhCQrSE4fYyG1g3jnb4Rv3Q9Aq51lYgq3+ec
   7rXd98XTrqmbYYwmt19T7fYXC/WlfysMfAaCeu3C0jtV0YECJtfwvkWF2
   GG+j98czi7s45tI293rMoI/V+w8t8gtVyTlQxi7jrlnT8Y8cX8Amt9/UA
   Rg73FOXyOUqaXSGC2knu6dsyFoKfpmo653tljM1tGD+1wzVSJX8v6wQSS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491793"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358491793"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047075"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="669047075"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:46 -0800
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Riana Tauro <riana.tauro@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        gwan-gyeong.mun@intel.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/3] PL1 power limit fixes for ATSM
Date:   Mon, 13 Feb 2023 21:33:39 -0800
Message-Id: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previous PL1 power limit implementation assumed that the PL1 limit is
always enabled in HW. However we now find this not to be the case on ATSM
where the PL1 limit is disabled at power up. This requires changes in the
previous PL1 limit implementation.

Submitting 3 patches for easier review but patches can be squashed if
needed.

Ashutosh Dixit (3):
  drm/i915/hwmon: Replace hwm_field_scale_and_write with
    hwm_power_max_write
  drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
  drm/i915/hwmon: Expose power1_max_enable

 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 85 +++++++++++++------
 2 files changed, 68 insertions(+), 24 deletions(-)

-- 
2.38.0

