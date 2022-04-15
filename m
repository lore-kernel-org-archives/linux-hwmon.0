Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E33C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Apr 2022 01:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbiDOBP3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Apr 2022 21:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiDOBP2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Apr 2022 21:15:28 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EA56B0B9
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Apr 2022 18:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649985182; x=1681521182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R4uvzURdzMvz4D+NWuOV59dDeemDc3yGABgqWSlR1zY=;
  b=AEft/VFyF5M3d06z5gGFuLLYrtI+hhX17f4ZtT3pkdhCBrbArkW/TnTG
   QswAzAuoA7Ve5IpvM7CzBv3BSsZOtQPa8wGerpK2jvUS/QKKNN/wYk/u6
   7JJ/hrXE6+aDErmIAtGgHtjlJmnFCnUukTmX8ijpH2UyhZ2NvAZ/11jkE
   IYns0fctwbrp72qUgiEN546p9W0h4Y/vugNzVTSNzjcI6qyt2clv8N5Mt
   I9K8c1cKBzP8ZYEjw8GSFjp7YgIGqtZFfIJo7CQnRqAPcaXuPTd0WiMyM
   WK0Kj/tBBTazhGQ3t28wC0V2cUzGdZn7Ax9JsDW8KcODGvaUME5zFl4iq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349504404"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="349504404"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 18:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="527124315"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Apr 2022 18:12:58 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nfAWA-0001N3-3s;
        Fri, 15 Apr 2022 01:12:58 +0000
Date:   Fri, 15 Apr 2022 09:11:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 4d0d5c352303a318925ceb84a86818761aa6586b
Message-ID: <6258c654.1pRSbQRFNSCioohV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 4d0d5c352303a318925ceb84a86818761aa6586b  dt-bindings: hwmon: ti,tmp421: Fix type for 'ti,n-factor'

elapsed time: 2048m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                             sh03_defconfig
powerpc                 mpc837x_mds_defconfig
arc                        vdk_hs38_defconfig
mips                  decstation_64_defconfig
openrisc                  or1klitex_defconfig
mips                      maltasmvp_defconfig
xtensa                         virt_defconfig
m68k                       m5475evb_defconfig
arm                        shmobile_defconfig
arm                        oxnas_v6_defconfig
arm                        keystone_defconfig
arm                             rpc_defconfig
mips                         mpc30x_defconfig
powerpc                     pq2fads_defconfig
ia64                          tiger_defconfig
parisc64                            defconfig
powerpc                     taishan_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         assabet_defconfig
parisc                generic-64bit_defconfig
x86_64                           alldefconfig
arm                           sunxi_defconfig
xtensa                           alldefconfig
x86_64                              defconfig
arm                           u8500_defconfig
arm                        spear6xx_defconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
arm                  randconfig-c002-20220414
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20220413
arc                  randconfig-r043-20220413
s390                 randconfig-r044-20220413
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220413
arm                  randconfig-c002-20220413
i386                          randconfig-c001
riscv                randconfig-c006-20220413
mips                 randconfig-c004-20220413
powerpc              randconfig-c003-20220414
arm                  randconfig-c002-20220414
arm                       spear13xx_defconfig
mips                malta_qemu_32r6_defconfig
arm                      tct_hammer_defconfig
powerpc                     tqm5200_defconfig
arm                        multi_v5_defconfig
mips                           mtx1_defconfig
arm                        spear3xx_defconfig
arm                       mainstone_defconfig
arm                       netwinder_defconfig
mips                        workpad_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220414
hexagon              randconfig-r045-20220414
riscv                randconfig-r042-20220414

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
