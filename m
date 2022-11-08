Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4194C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Nov 2022 07:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbiKHHsn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Nov 2022 02:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiKHHsl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Nov 2022 02:48:41 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A9913D2E
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Nov 2022 23:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667893720; x=1699429720;
  h=from:to:cc:subject:date:message-id;
  bh=UV4+58PRM9e5gJ03V8xMntQTVRmdJd69tX8VU5teh5Q=;
  b=Sud5df0qRTN6qAtjrmhAenTKht6PksCrx7DrnD/0IhZNTSoNQ8WtKZWF
   aQIKCfMgKjFVjDi43uPuV3ANnF8lKQJ9EZzyfRYUQDlG6F7PY+/0vavf9
   JulVBGxnWixAmtFJx2Com4zF3LbYA5MwCHWHQymgg/MJ3LcF4N8Clm4bc
   vf0ELLeNWccmh39gfvWyh2BfTQkI0hVnqMdVxLFA4UwcnFKbBD4oW9eZh
   f1/PUYa0Dgm1cN+6a9Png0XKg7IdU7rw7f5GTPPc2HPZaYLv2hjtwWTU4
   VieRk7FgOFlvaGFxYsCjgTL97BcdgfXvE7RlNfqc84LcDtsGyn1TYmPST
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290351688"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="290351688"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705204793"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="705204793"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 23:48:37 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH 0/3] hwmon (coretemp): Add support for dynamic tjmax/ttarget
Date:   Tue,  8 Nov 2022 15:50:48 +0800
Message-Id: <20221108075051.5139-1-rui.zhang@intel.com>
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
