Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEBEC43334
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Jul 2022 09:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiGCJHo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Jul 2022 05:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiGCJHm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Jul 2022 05:07:42 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8960C6170
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Jul 2022 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656839261; x=1688375261;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XHyBzImbdt6glvEsQ0bKjEE6FwcHP68qj3rpGWSM4qs=;
  b=TyENts6wsphwBton2eUuHOfJZOhKh79yWNXVqvUwd2LOCw01VcOgZoLK
   kYUdUYGpQ0d8Bbb8Oc0PUd/YQFV0nX3kvAEMd2l/zlhgIj/tLEU361Hru
   4GZUsIrCON8i1lN7u0pmx8QKMItJm0P3PSwumshwYXDO3B0y47pGNo8Nr
   TgbVxJqPVhMAJVE7fSDpUN82/SkrDEmfEA+lz/roe1R0P5z1qum7o/Ojq
   Kdyo7nR1x5mBLvSk5YaSB+h+TcvUpLIvCXkxiamr3SUklnlMRHER8QUT6
   Ls0Q9Kvk+ysKAW4cH8KEeOVxfiDSCDiDohaw5yfTkDUAgXy7ujycLeUac
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="283655560"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="283655560"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 02:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="542171129"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2022 02:07:39 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7vZr-000GHb-5d;
        Sun, 03 Jul 2022 09:07:39 +0000
Date:   Sun, 03 Jul 2022 17:07:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9f6ca00b5be47e471e9703e6b017e1e2cfa7f604
Message-ID: <62c15c3b.tQo145M46aURvMOD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9f6ca00b5be47e471e9703e6b017e1e2cfa7f604  hwmon: (asus_wmi_sensors) Save a few bytes of memory

elapsed time: 721m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220703
riscv                randconfig-r042-20220703
s390                 randconfig-r044-20220703
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
