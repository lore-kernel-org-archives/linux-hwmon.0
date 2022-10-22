Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1CAC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Oct 2022 06:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiJVGQF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Oct 2022 02:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiJVGQF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Oct 2022 02:16:05 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF88257602
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Oct 2022 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666419364; x=1697955364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GiE7jDRnngmnch8Sp9NttX44hEUDhyllVQ8Abi4gxUk=;
  b=RT6615e+QL7lGaID/P/wWuLxIuv93NOUmIbr68rfOUbFbibxba2AFMUJ
   pX4yRaTZwAUHgegfGJmqsxfCN0R7uWsry2721Kfq1jwq5H4Am6zBsEVpw
   50xvxj/o3jVCVrIKYT/HHw6ZOhDcNHeMlz67lOkNB9VuowjsyWRMwQyBD
   7XsB0JhWOd+uqdO50Jcy7SZ5zfR2ruFd2jFHQMHh7WuGb99C6rTvIIOdl
   sCNrpEyAedsnGaZDDQlrEK44bpHmWYxFHUwWRSb+2KXO6xVCBm2lkAKoI
   yPF530LUoWcgTQ+o/U9s//ZmHMGDTGmY+vgaq49M2KK3E2amBIPRn2HOn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="287559274"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; 
   d="scan'208";a="287559274"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 23:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="699605158"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; 
   d="scan'208";a="699605158"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2022 23:16:02 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1om7ne-0003Op-0L;
        Sat, 22 Oct 2022 06:16:02 +0000
Date:   Sat, 22 Oct 2022 14:15:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0d1e30b94017cc9ddd3235560277c0fbf2f96b2e
Message-ID: <63538a67.1MjURS9zDbZGgQMB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0d1e30b94017cc9ddd3235560277c0fbf2f96b2e  hwmon: (adm1177) simplify using devm_regulator_get_enable()

elapsed time: 724m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
arc                                 defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
x86_64                        randconfig-a006
arc                  randconfig-r043-20221019
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arm                                 defconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
arc                  randconfig-r043-20221020
x86_64                        randconfig-a015
s390                 randconfig-r044-20221020
riscv                randconfig-r042-20221020
arm                              allyesconfig
arc                           tb10x_defconfig
sh                            titan_defconfig
powerpc                     pq2fads_defconfig
arm                         nhk8815_defconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20221022
s390                 randconfig-r044-20221022
riscv                randconfig-r042-20221022
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
mips                    maltaup_xpa_defconfig
arm                           u8500_defconfig
csky                                defconfig
parisc                generic-64bit_defconfig
i386                          randconfig-c001
m68k                            q40_defconfig
sh                           se7721_defconfig
m68k                        mvme147_defconfig
nios2                            allyesconfig
arc                              alldefconfig
m68k                          atari_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
sparc                       sparc32_defconfig
sh                          sdk7786_defconfig
parisc                           alldefconfig
mips                      fuloong2e_defconfig
arm                        multi_v7_defconfig
powerpc                         ps3_defconfig
m68k                           virt_defconfig
sh                           se7722_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
loongarch                         allnoconfig
arm                         lubbock_defconfig
powerpc                      pcm030_defconfig
parisc64                         alldefconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
sh                         microdev_defconfig
arm                            qcom_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221020
x86_64                        randconfig-a005
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221020
hexagon              randconfig-r045-20221019
x86_64                        randconfig-a012
i386                          randconfig-a004
hexagon              randconfig-r041-20221019
i386                          randconfig-a006
s390                 randconfig-r044-20221019
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
powerpc                   microwatt_defconfig
arm                         orion5x_defconfig
powerpc                      obs600_defconfig
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
arm                      pxa255-idp_defconfig
mips                          ath79_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig
arm                       netwinder_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8560_ads_defconfig
x86_64                        randconfig-k001
mips                       rbtx49xx_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
