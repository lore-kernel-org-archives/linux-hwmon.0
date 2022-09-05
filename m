Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F21DECAAD5
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Sep 2022 10:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237015AbiIEKrQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Sep 2022 06:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237475AbiIEKrO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Sep 2022 06:47:14 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3010E4AD49
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Sep 2022 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662374833; x=1693910833;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lmWilmeMEg7ddBJe8UJ3HxLhdp1AfiA+BimhyrilclI=;
  b=TIESCovoAvXiEbOy30fFpBUflCO0G99g9li4iBMH4oeAg3gTZ1UNfhlq
   E0GWKjZWvnEZnFvaxE17kKQd1fcaN9wuDmb9ZQ2cKb+LvBWBPC859PaNL
   r7yeZLXBkiMKjRRvFzYaweMYK2XjqDWMr9/Anp5BHXMp8vJGqSRnRqC9I
   I9IUaCpj4vNXD4ePneLHV6PBGs+Y0PnJl0PKmpT6d1Xg3kIKsQnZBOFKD
   Y6H2RzT3e4oI4/AmAhTZQDMvJx23X9AQVgQlfOse3VaFyBw7ak9+niqE9
   QyCbU8IxVqtnBxA7wtvRJnFbALQrS2pgO4XKW4NxLfa6ipcbTMyDUiDdv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="297674357"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="297674357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 03:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="942066791"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2022 03:47:11 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oV9dG-00043V-1Y;
        Mon, 05 Sep 2022 10:47:10 +0000
Date:   Mon, 05 Sep 2022 18:46:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cec18aa4b63aece81b9956c9abb019a173647447
Message-ID: <6315d39d.iWLx0QC87JWV6bEV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cec18aa4b63aece81b9956c9abb019a173647447  hwmon: (emc2305) Remove unused including <linux/version.h>

elapsed time: 722m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
i386                 randconfig-a003-20220905
x86_64                         rhel-8.3-kunit
i386                 randconfig-a004-20220905
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a003-20220905
x86_64                           rhel-8.3-syz
x86_64               randconfig-a002-20220905
i386                 randconfig-a001-20220905
arc                  randconfig-r043-20220905
arm64                            allyesconfig
x86_64                              defconfig
arc                  randconfig-r043-20220904
x86_64               randconfig-a004-20220905
m68k                             allyesconfig
s390                 randconfig-r044-20220904
i386                 randconfig-a002-20220905
x86_64               randconfig-a005-20220905
x86_64                           allyesconfig
i386                 randconfig-a005-20220905
x86_64               randconfig-a001-20220905
m68k                             allmodconfig
i386                 randconfig-a006-20220905
x86_64               randconfig-a006-20220905
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
sh                         microdev_defconfig
riscv                randconfig-r042-20220904
openrisc                       virt_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
powerpc                      makalu_defconfig
powerpc                           allnoconfig
ia64                             allmodconfig
sh                               allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
i386                                defconfig
i386                             alldefconfig
ia64                          tiger_defconfig
sh                         apsh4a3a_defconfig
i386                             allyesconfig
arm                         nhk8815_defconfig
sh                ecovec24-romimage_defconfig
arm                            mps2_defconfig
arc                              alldefconfig
openrisc                    or1ksim_defconfig
sh                           se7780_defconfig
sh                           se7343_defconfig
powerpc                      mgcoge_defconfig
arm                         axm55xx_defconfig
arm                       imx_v6_v7_defconfig
i386                 randconfig-c001-20220905
m68k                         apollo_defconfig
powerpc                        warp_defconfig
riscv                    nommu_k210_defconfig

clang tested configs:
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a011-20220905
hexagon              randconfig-r045-20220905
i386                 randconfig-a014-20220905
hexagon              randconfig-r045-20220904
i386                 randconfig-a015-20220905
mips                       rbtx49xx_defconfig
i386                 randconfig-a016-20220905
riscv                randconfig-r042-20220905
hexagon              randconfig-r041-20220904
hexagon              randconfig-r041-20220905
s390                 randconfig-r044-20220905
hexagon                             defconfig
x86_64               randconfig-a012-20220905
x86_64               randconfig-a016-20220905
x86_64               randconfig-a015-20220905
x86_64               randconfig-a014-20220905
x86_64               randconfig-a013-20220905
x86_64               randconfig-a011-20220905
mips                           ip27_defconfig
arm                         lpc32xx_defconfig
arm                       spear13xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
