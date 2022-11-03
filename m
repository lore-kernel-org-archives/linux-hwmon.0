Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9028C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Nov 2022 09:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKCJZQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Nov 2022 05:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiKCJYa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Nov 2022 05:24:30 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242EDDF9D
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Nov 2022 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667467460; x=1699003460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tbXFRco0QfLYKJZNjnIIrc3gmslNVYljU5J5hOD9KzI=;
  b=SpnmttICpUlDKD3cP3ww9k/y6vwHVTgCMeqemxwWtSn5ScK58d1lBy5m
   lmyG76W3Sa4mURlIH3xe+zmgYxBDy2bPHMx5E81YKme3+TK2KGJHD0cpt
   Llqy9JBebpbWkUwLntJZ2qe+eHo/EF06MhDtmlte9ni1ML6lVbUEnd+vy
   eqQoWJw63EfLuDP8FhBbFEzXYlaxwj2joS64tVvw3SMS/iZXwBlrLBFs0
   3OIs1J5lbi7phgj3aoMQ8fCrcEyAfjL0QqFED20jwWrwlqea4j56DaiM2
   m9xiZFgjjE3IP7lW0ySVr3Et7MrRko7AVkvRDgRHbRfOzvXTr9HZPwEAL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="292953857"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="292953857"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 02:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="723875466"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="723875466"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 02:24:18 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oqWSP-000FlC-2c;
        Thu, 03 Nov 2022 09:24:17 +0000
Date:   Thu, 03 Nov 2022 17:24:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 077e12df5a65639ec002707ddcf9b50d67256204
Message-ID: <636388bd.n9xeYD9CAObSKIYh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 077e12df5a65639ec002707ddcf9b50d67256204  watchdog: aspeed: Enable pre-timeout interrupt

elapsed time: 722m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
i386                                defconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
i386                          randconfig-a001
arm                                 defconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
arc                                 defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
s390                             allmodconfig
i386                          randconfig-a005
x86_64                           allyesconfig
alpha                               defconfig
i386                          randconfig-a014
s390                                defconfig
i386                          randconfig-a012
arm64                            allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a016
s390                             allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a002
arc                  randconfig-r043-20221102
riscv                randconfig-r042-20221102
s390                 randconfig-r044-20221102
x86_64                        randconfig-a006
i386                             allyesconfig
mips                     decstation_defconfig
powerpc                   motionpro_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                               alldefconfig
i386                          randconfig-c001
arm                            pleb_defconfig
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
um                                  defconfig
riscv                               defconfig
arm                        keystone_defconfig
openrisc                    or1ksim_defconfig
powerpc                      mgcoge_defconfig
m68k                          sun3x_defconfig
arc                            hsdk_defconfig
powerpc                     mpc83xx_defconfig
riscv                            allmodconfig
sh                             sh03_defconfig
powerpc                   currituck_defconfig
sh                           se7712_defconfig
arm                        clps711x_defconfig
csky                                defconfig
powerpc                     stx_gp3_defconfig
sh                      rts7751r2d1_defconfig
mips                       bmips_be_defconfig
m68k                       m5208evb_defconfig
powerpc                         wii_defconfig
m68k                       m5275evb_defconfig
m68k                           sun3_defconfig
arm                         nhk8815_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
hexagon              randconfig-r041-20221102
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a003
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
powerpc               mpc834x_itxgp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
