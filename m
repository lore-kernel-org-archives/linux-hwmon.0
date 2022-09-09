Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E65ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 13:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIINS2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 09:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiIINS1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 09:18:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B06AB1A4
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Sep 2022 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662729506; x=1694265506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1FgZnCglKQIMlqYB26IamcAnsZFNI+MXt0B8BhamrB0=;
  b=VQeaGIjPTFHtTvynfVxgQGqwaVUpa/AC6LYwmWJjBVzGvhjCMmbxvSgA
   xfLpvz0DwTNvgWkBBdEnuYAnjrXE6fme3m3cfeO0a+V7h/NmxG+Cb3Iwr
   vHtRyFrMS2Nub/TkGQznH0Hn3a7YpplCf/lo6VxXMYxPZv7+9E/RYmWT3
   WwHgljl1u3MDvuDaXNaTatCdhdtV5PpdK+7IgucZ5VQy6pTC+Sf+BwHpy
   aNYDz4pn03+SiTLUn3Z1vu483qmwAh6Qsl9nh2TX8JiV54UdUT+DQy6Wg
   EKeWWOag64RFKYrS4cMP5LnMxXEL4IR8iW/AX/+ErOzK7MXe2ZMHTimf7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361426186"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="361426186"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 06:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="943773246"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2022 06:18:25 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWdto-0001Cs-1e;
        Fri, 09 Sep 2022 13:18:24 +0000
Date:   Fri, 09 Sep 2022 21:17:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e43212e0f55dc2d6b15d6c174cc0a64b25fab5e7
Message-ID: <631b3cef.Qk+1Zd7/z6CFHcvv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e43212e0f55dc2d6b15d6c174cc0a64b25fab5e7  hwmon: (mr75203) enable polling for all VM channels

elapsed time: 1079m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                             shx3_defconfig
xtensa                              defconfig
mips                    maltaup_xpa_defconfig
mips                  maltasmvp_eva_defconfig
sh                        edosk7705_defconfig
powerpc                      ppc40x_defconfig
mips                      loongson3_defconfig
sh                         apsh4a3a_defconfig
parisc                           alldefconfig
sh                            migor_defconfig
openrisc                            defconfig
arm                             pxa_defconfig
arc                              alldefconfig
arm                           u8500_defconfig
i386                          randconfig-c001
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
mips                           xway_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
sh                     magicpanelr2_defconfig
sparc64                          alldefconfig
arm                         nhk8815_defconfig
m68k                          multi_defconfig
nios2                            allyesconfig
sh                             espt_defconfig
mips                     decstation_defconfig
powerpc                     stx_gp3_defconfig
sh                          sdk7780_defconfig
arm                      footbridge_defconfig
arm                        realview_defconfig
m68k                       m5275evb_defconfig
parisc                           allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                          atari_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
arc                  randconfig-r043-20220907
mips                            ar7_defconfig
mips                         rt305x_defconfig
arc                      axs103_smp_defconfig
openrisc                    or1ksim_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                             alldefconfig
arm                        mini2440_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
mips                 decstation_r4k_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
powerpc                        fsp2_defconfig
powerpc                 mpc8272_ads_defconfig
mips                        qi_lb60_defconfig
arm                          pcm027_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                           mtx1_defconfig
mips                          ath79_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220909
hexagon              randconfig-r045-20220908
s390                 randconfig-r044-20220909
arm                       spear13xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         palmz72_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
