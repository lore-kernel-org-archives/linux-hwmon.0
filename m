Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C85CC6FA82
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 20:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbiIUUWq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 16:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiIUUWn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 16:22:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA75A4064
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663791762; x=1695327762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77D+qEvHyb6GAcJWDMQL++e6FHJBKQfcF78uWtdFWlM=;
  b=Zyv2ZrHLF4xre/g0wl1Ln+Xrh79WenuYwIFi4oKy0cYe9eCXY3WDZwJj
   w9LMMeh0WfMc6K8BdeNuQdWhJ/kF+wT1iE+Y+UUPfbrHhbMpcs5aIagcE
   enxD0eewqNfxoQ4DCiUB9M6pMoiLfSrf9QhxmAWqUuJ+p0Le+a40JMBCy
   pKcYWbRqpYgVVTjkktvB3bhS7P4XQTK70OxighBnKMFxeGug8zKLi8Dv7
   kf0TLwGZaOUCIQOE2rpi45kaN77fMxzY751NnhsvFfeJFmHFviNdVFL/f
   1A1jF4oExulnIA+o8yexfvRe/0UMegqJtHvTFc85SlIromSQJQBjs4jqf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300959460"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="300959460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 13:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="619505576"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2022 13:22:40 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ob6Ex-0003vR-2p;
        Wed, 21 Sep 2022 20:22:39 +0000
Date:   Thu, 22 Sep 2022 04:22:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Eliav Farber <farbere@amazon.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [groeck-staging:hwmon-next 36/55] ERROR: modpost: "__divdi3"
 [drivers/hwmon/mr75203.ko] undefined!
Message-ID: <202209220427.ovoZDKKT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eliav,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   103974b1117651a5884e2bc7832d7b02990e0232
commit: 3b12ca798e022192fb451e9e5ef1bb147f21c413 [36/55] hwmon: (mr75203) add support for series 6 temperature equation
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220922/202209220427.ovoZDKKT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=3b12ca798e022192fb451e9e5ef1bb147f21c413
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 3b12ca798e022192fb451e9e5ef1bb147f21c413
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the groeck-staging/hwmon-next HEAD 103974b1117651a5884e2bc7832d7b02990e0232 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/hwmon/mr75203.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/hwmon/mr75203.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
