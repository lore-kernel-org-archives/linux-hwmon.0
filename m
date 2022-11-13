Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5048C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Nov 2022 15:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiKMP3l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Nov 2022 10:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKMP3k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2022 10:29:40 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140F7EB8
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Nov 2022 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668353380; x=1699889380;
  h=from:to:cc:subject:date:message-id;
  bh=rN+TfV2maPj3z73mtCVW3MC/gU4//w8SjjQ11TtKI7E=;
  b=d69LeSUUh4xih07a8kGuBGuaR7oP9lOgK8vG9hqRVzxmZpjjRB3ai+I8
   GrJQHm/BZEHnCn29IfDAaV9XM/swuNe6JWXZ3onoEq0ei22jGqJzhb1WW
   AWrBpr/UrtTRYf3Iv7GlyfpgTm7QfFsrzCyHkPN4rfSTUgcyumSGEvj77
   n/wOKI3mXnZ/ritjwhbgMiERUYwzsgxy8ZieUX27id7WjyedmUTwQZGr6
   1QKB8SIdgfPDxt3r34aTHIwQv2Az3vJLBU2NEimOHR9wlrmpbuKWZIWRo
   Uu/jUoWL9cIgkYiJpxmr2fNRiQoPYfPhv7ROlTo2RgqBfXYJ79nWihP7O
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398109674"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398109674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 07:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638148868"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638148868"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by orsmga002.jf.intel.com with ESMTP; 13 Nov 2022 07:29:37 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH V2 0/3] hwmon (coretemp): Add support for dynamic tjmax/ttarget
Date:   Sun, 13 Nov 2022 23:31:42 +0800
Message-Id: <20221113153145.32696-1-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
runtime when the Intel SST-PP (Intel Speed Select Technology - Performance
Profile) level is changed. As a result, the ttarget temperature also changes.

Enhance the coretemp driver to always use updated tjmax when it can be
retrieved from MSR_IA32_TEMPERATURE_TARGET.

When tjmax can not be retrieved from MSR_IA32_TEMPERATURE_TARGET, stick with
previous behavior and always use static value. Plus that ttarget is not
available in this case.

The same dynaimic tjmax enhancement, for driver/thermal drivers can be found
at https://patchwork.kernel.org/project/linux-pm/list/?series=693050

thanks,
rui

---
Changes since V1:
- rearrange the code to avoid forward declaration
- optimize logic to check target temperature support only once
- coding style changes
