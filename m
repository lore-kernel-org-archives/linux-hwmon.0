Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62556C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jan 2022 05:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245149AbiA3FoX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jan 2022 00:44:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:17243 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235488AbiA3FoW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jan 2022 00:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643521462; x=1675057462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6PxSrJZrF8TyxwskXbHRD34MSR2qlkjN+GT96aXoTw=;
  b=Usa/GO+yp9t/vqmWyYgMERMEXJZmBGmUjaX+l7AFYt4fVdljC4o21T1G
   ZwRU88wPDDkfIbmLm+/lQIVNn2Vh77JviJdi0mfvWeRZvcI55Xl71KDeJ
   omLQMurElR4h1ggfpFNLDTHiKvVVfv8G9UjoVSWW9PCTcrBhIknbl2OdS
   qh5NzAMEb2Z5wyzWoOhPKbDVMel8tJS8T5W0sbPb12hCvSl17SzpAfowv
   Tnf+EY0zRDJviiSPhJYfq0Mn+aHIJqZGB3jCdRFTautZK5msJIFItKZu9
   LFn+6EPBgFFulnR+zDsZf5PNx7h4W1FsKTHNB6DXt6/DCpwMIsm8f3FTo
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="227294862"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="227294862"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 21:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="619088152"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2022 21:44:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nE30e-000Q7I-FL; Sun, 30 Jan 2022 05:44:20 +0000
Date:   Sun, 30 Jan 2022 13:43:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 1/4]
 drivers/watchdog/max77620_wdt.c:18:10: fatal error: linux/mfd/max77714.h: No
 such file or directory
Message-ID: <202201301352.Ip59nzT8-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   c00ed93a33886a91023b17f2503d72de49303063
commit: 4b35b464fe64f6dd5bf8d5df14090961fdf63a07 [1/4] watchdog: max77620: add support for the max77714 variant
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220130/202201301352.Ip59nzT8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=4b35b464fe64f6dd5bf8d5df14090961fdf63a07
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 4b35b464fe64f6dd5bf8d5df14090961fdf63a07
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/watchdog/max77620_wdt.c:18:10: fatal error: linux/mfd/max77714.h: No such file or directory
      18 | #include <linux/mfd/max77714.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/watchdog/max77620_wdt.c

  > 18	#include <linux/mfd/max77714.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/regmap.h>
    21	#include <linux/slab.h>
    22	#include <linux/watchdog.h>
    23	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
