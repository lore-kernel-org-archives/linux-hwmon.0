Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD63C83F3F
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Sep 2023 18:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235471AbjIDSQM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Sep 2023 14:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjIDSQM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Sep 2023 14:16:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964441A7
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Sep 2023 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693851367; x=1725387367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=45S/s8UTE8iiEknQf+gNOJ+vzGzV3O4lSI/iF7IVEc0=;
  b=P35u5fPFis36f1yEOspy8WxWfIOZrrAt2UJfLpLGWwPbzGtgGGinc9js
   kL+bBsRvrk8fVGPsioyUPEdXBJ9VMagtOJ/jaFbFSBXFB1mZGEffMnIax
   o7BypuGf0fS0urA97j8cLDPEJxVTXD0MgVZiirI5OtL/grQLFQrxBUwvo
   W2i9SDTgJ0apNgc5Cc6aMv56oN4dFA9/ek2CrCOoaHXQJeoYUzJLPP32M
   vv2nctFWICrNeSU4Uz/nsl+T6XG+FNtxzDovsIUPn95L3IUf5hvEPsWjd
   1hb60t7OoF5mYqyuGHpMi4o8u6dO4VKe46QbplM8QX2LZSxVrj/gNiVIO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366867382"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="366867382"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071692688"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="1071692688"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:04 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v4 1/6] drm/xe: Add XE_MISSING_CASE macro
Date:   Mon,  4 Sep 2023 23:52:53 +0530
Message-Id: <20230904182258.2291881-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904182258.2291881-1-badal.nilawar@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add XE_MISSING_CASE macro to handle missing switch case

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..21ba859d5f80 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,7 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+				__stringify(x), (long)(x))
+
 #endif
-- 
2.25.1

