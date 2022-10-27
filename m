Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67A3FA3740
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 04:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbiJ0EIj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 00:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbiJ0EIh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 00:08:37 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8C06B653
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 21:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666843716; x=1698379716;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Me/tGZuFLaymrDxeDZKiP0ztIyQRViY0TFmD3+rqzzQ=;
  b=Clz7uEJa4orXcbldBCo1wAxOaDY3I/PDkZyOm5YmEdTzcEvPISLKv5N8
   zAXQhjnAd+qoALO2fy5+W9IgVwxhuEs2c6gzCsbN/iVT8A868DyNlogOx
   6eTzomL3+qyYOWhxE/zxjqH0lFac37tUQ3NZ3zZBhH3QpdV82G+HN17G9
   2D7++EUQ0l+NQS8dqN7SuAnS6Jug0isLu8083a1chJi8MDhy1wOdG1UuI
   PWafrOZAjY4Pd8ykL97dJ0SWSMeZa0G1HCKXw7oKjQBMcx2pzQ1NsuDh/
   g+9FN4+JPQkOVqi7HCRFjMwq2cB18g8+nurYrQde5M+9A6dkBgdEhYkQV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288520000"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="288520000"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 21:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="663467142"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="663467142"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Oct 2022 21:08:34 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onuC2-0008FO-0V;
        Thu, 27 Oct 2022 04:08:34 +0000
Date:   Thu, 27 Oct 2022 12:08:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 71778bb7436c66f1642c5c969f7f950b0a9c157c
Message-ID: <635a0426.S3AVk2jw/+1/7yNq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 71778bb7436c66f1642c5c969f7f950b0a9c157c  watchdog: kempld: Remove #ifdef guards for PM related functions

elapsed time: 724m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                              allyesconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                             allmodconfig
mips                             allyesconfig
s390                                defconfig
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
ia64                             allmodconfig
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
i386                          randconfig-a005
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
sh                          rsk7201_defconfig
sparc                             allnoconfig
m68k                        m5272c3_defconfig
xtensa                    smp_lx200_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
arm                         axm55xx_defconfig
powerpc                     redwood_defconfig
sh                      rts7751r2d1_defconfig
mips                        vocore2_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
nios2                         3c120_defconfig
mips                 randconfig-c004-20221026
arm                           h5000_defconfig
m68k                          hp300_defconfig
alpha                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                  decstation_64_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20221026
hexagon              randconfig-r045-20221026
x86_64                        randconfig-k001
arm                          pxa168_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      pmac32_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
