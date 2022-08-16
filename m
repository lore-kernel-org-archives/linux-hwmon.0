Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA1FC2BB41
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Aug 2022 07:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiHPH5X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Aug 2022 03:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiHPH4o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Aug 2022 03:56:44 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA86BF2D5F;
        Mon, 15 Aug 2022 22:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660626783; x=1692162783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CABcsF1/F0hwqX7jp/Kocn9gec4fIegnf5bdop8i6qc=;
  b=W+rBLXm4Zp5CDkGCfqU8udb9fAG5xzKxyALBkESEdJ6Q8DE10Ori4dbF
   Y7Q3ckJjZr3xKtMt10KYb6JaXIalky1lQr40XrxPtuforLycZ+/BynF/V
   d60jwzs7Z7AWCVsGzHkYZ+egjVNIgkcUsFYKvQqxnBfEFTfMaPVc96hdO
   X4dkI6KOeJ0/LWo14qCg7ly8rUUI3s7qNy9k1FgA04onhf6paCIQhhIie
   9EUaFQXthm1+Lhsb6fFwFtAmV2/r6cmC0/V9vOdhA4PVzQzeqi8XW/Z5i
   Xzviw5WeCXutt505F7m7k0C47IM+RR67dehV6QApmU0BIiR31XvZezMGM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356130168"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="356130168"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 22:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="666953488"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2022 22:13:00 -0700
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
        fenghua.yu@intel.com, jdelvare@suse.com, linux@roeck-us.net,
        len.brown@intel.com, rui.zhang@intel.com
Subject: [PATCH V2 5/8] x86/topology: Fix duplicated core ID within a package
Date:   Tue, 16 Aug 2022 13:16:30 +0800
Message-Id: <20220816051633.17775-6-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816051633.17775-1-rui.zhang@intel.com>
References: <20220816051633.17775-1-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Today, core ID is assumed to be unique within each package.

But an AlderLake-N platform adds a Module level between core and package,
Linux excludes the unknown modules bits from the core ID, resulting in
duplicate core ID's.

To keep core ID unique within a package, Linux must include all APIC-ID
bits for known or un-known levels above the core and below the package
in the core ID.

It is important to understand that core ID's have always come directly
from the APIC-ID encoding, which comes from the BIOS. Thus there is no
guarantee that they start at 0, or that they are contiguous.
As such, naively using them for array indexes can be problematic.

Suggested-and-reviewed-by: Len Brown <len.brown@intel.com>
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 arch/x86/kernel/cpu/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index f7592814e5d5..5e868b62a7c4 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -141,7 +141,7 @@ int detect_extended_topology(struct cpuinfo_x86 *c)
 		sub_index++;
 	}
 
-	core_select_mask = (~(-1 << core_plus_mask_width)) >> ht_mask_width;
+	core_select_mask = (~(-1 << pkg_mask_width)) >> ht_mask_width;
 	die_select_mask = (~(-1 << die_plus_mask_width)) >>
 				core_plus_mask_width;
 
-- 
2.25.1

