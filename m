Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DB3E7D0A0
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjIUR2P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjIUR1n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:27:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C68A1991
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315732; x=1726851732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=385VMAn+M4OrwIPdKqOnyZaSJds0bdqdEu9WTREgEbs=;
  b=cGWyHx//FiH/l3w3FYVpH2y8xo4GKr3nGDNXxoXce8dxs4+PB0X7YmWg
   R0Yhl2wd7XcA07OLMKrzVOx6OMNQfD4pxu/V4MnpGxS47iLxmuL5T1rwI
   10ng2hbvQj5+DGw2ReoH1K4xKag59xO0ZHCL17RR5ld2h/UV06SVJ8Ds6
   K4pzAwgKewRK3zMHTgnLpDtkDYmcbpCXH4WnKHjn5mMqvrFz+mFIwsQTX
   cv0XK74XthnyiNpbK6P3IXzRJxGXDuhRBfq4IDjOJf4Gv/VGqnTHYJ/Wu
   rFp450V6L6RX5/wY4KGdmmKhIaeE1xz0rxHhig6HVE7xUXmrj1jA1AjKQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466788339"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466788339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740573618"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740573618"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:06 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Date:   Thu, 21 Sep 2023 15:55:14 +0530
Message-Id: <20230921102519.3355538-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add XE_MISSING_CASE macro to handle missing switch case

v2: Add comment about macro usage (Himal)

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..6c74c69920ed 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,8 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+/* Parameter to macro should be a variable name */
+#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+				__stringify(x), (long)(x))
+
 #endif
-- 
2.25.1

