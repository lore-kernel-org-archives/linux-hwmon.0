Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29AAC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Feb 2022 14:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237600AbiBYOpt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240413AbiBYOpt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Feb 2022 09:45:49 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FB720D83E
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Feb 2022 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645800317; x=1677336317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9RG/GGOaHqTptfqQTBVGjKqE/iCOYaevW3sAQGwAQpQ=;
  b=HloeLHpYhC2nRzmyS9ekeKl04OcELv26z1ZjYfqOFZ9xt31QZVGrqbyA
   w3EVfVdAKDNXJ1lTeLcpKm3Cx+DeWbSD0ZaSFb6rj0MwC418DwavSxPwt
   OJZ/tc4cv26MsICHPglhYgau19jQN1fdI1xY68l30dXiX8qmWnaNurFzE
   ZlSUE2Srh9qEGXlJLjP5rrKTjc0jkLycaDG9VTN7pptUUmb5G6sFrauij
   8wDrfzqe0B/tFR+5grh02ScduXzA8wMAgPScf6YOg6yyWaxa5MEfF/DV1
   eOfuWcrbpgCaTGgQCmsQQWJWsMTsVWNEPdZpxBGvWCJ/yVWdKpTMwhIgZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252427281"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="252427281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 06:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="549283939"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 06:45:15 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNbqM-0004QY-KO; Fri, 25 Feb 2022 14:45:14 +0000
Date:   Fri, 25 Feb 2022 22:44:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9db3b740a801031b4730ab3d3b56d8fa8c942838
Message-ID: <6218eb66.CtkmwQ5t3+U3gAHD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9db3b740a801031b4730ab3d3b56d8fa8c942838  hwmon: (sch5627) Add pwmX_auto_channels_temp support

elapsed time: 720m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220225
i386                          randconfig-c001
mips                 randconfig-c004-20220225
openrisc                            defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                         wii_defconfig
powerpc64                        alldefconfig
arc                      axs103_smp_defconfig
m68k                          atari_defconfig
x86_64                           alldefconfig
mips                         rt305x_defconfig
arm                           sama5_defconfig
arm64                            alldefconfig
sh                            shmin_defconfig
sh                   sh7724_generic_defconfig
arc                           tb10x_defconfig
sh                           se7780_defconfig
arc                          axs103_defconfig
mips                         db1xxx_defconfig
powerpc                      bamboo_defconfig
m68k                         amcore_defconfig
arm                        keystone_defconfig
xtensa                    xip_kc705_defconfig
arc                    vdk_hs38_smp_defconfig
microblaze                      mmu_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pasemi_defconfig
m68k                          multi_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
arm                  randconfig-c002-20220225
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220225
x86_64                        randconfig-c007
arm                  randconfig-c002-20220225
mips                 randconfig-c004-20220225
i386                          randconfig-c001
riscv                randconfig-c006-20220225
arm                       mainstone_defconfig
arm                           sama7_defconfig
riscv                    nommu_virt_defconfig
i386                             allyesconfig
arm                         orion5x_defconfig
arm                        magician_defconfig
powerpc                          allyesconfig
arm                         palmz72_defconfig
mips                  cavium_octeon_defconfig
mips                        maltaup_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc836x_mds_defconfig
mips                     loongson2k_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
