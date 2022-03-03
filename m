Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9869BC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Mar 2022 12:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbiCCMjm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Mar 2022 07:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbiCCMjk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Mar 2022 07:39:40 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30723CFEB
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Mar 2022 04:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646311135; x=1677847135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JAh6ThpIMO1LB2HSq6UeKGXSZ53mfHhOeLuj0JnkqWo=;
  b=eAuahrggacCuJmW+TSFiZYS9QxAGkX8nhe9RYxdBNmfnxDVuHj0m9II0
   k7KAwYbYhfdNkBmN6+OvFUopWmte5ikK5grXhrBPgQJE89MOhE7a99srx
   frpRGkbWHYmfgmGkdS8ZQ0nc3ItknAPJxv8DP4AnX8QnhAOSnlwcJflai
   gr+ZCgMfsGbI/XGpemqkFf/lqF4dJ2Mlz1BRgtKPsgkEhlXdqmjL7JWkL
   IM7gBwHESQNtys/kGLS8I/wDnvzRS4M/sBMjK+u7ICqy2jzNmkomlFPAN
   j02N7mlWNKzylldejPcEfpOtGaL3LcB4MT5eVlVx+XUEBRDmADk77SJ9a
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="252488839"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="252488839"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 04:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535812616"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 04:38:53 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nPkjM-0000W6-Ke; Thu, 03 Mar 2022 12:38:52 +0000
Date:   Thu, 03 Mar 2022 20:38:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a113870165b862440a31a8614fa6905a85033486
Message-ID: <6220b6d4.RXoYJwLyfA1+0/PW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a113870165b862440a31a8614fa6905a85033486  dt-bindings: hwmon: Add sample averaging properties for ADM1275

elapsed time: 840m

configs tested: 110
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sparc64                             defconfig
arm                           sunxi_defconfig
sh                        edosk7705_defconfig
mips                         db1xxx_defconfig
arm                          badge4_defconfig
sh                            shmin_defconfig
nios2                         10m50_defconfig
arc                        nsim_700_defconfig
arm                        cerfcube_defconfig
nios2                               defconfig
riscv             nommu_k210_sdcard_defconfig
mips                 decstation_r4k_defconfig
arm                           h3600_defconfig
arm                           sama5_defconfig
sparc                            alldefconfig
mips                            gpr_defconfig
m68k                       m5475evb_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220302
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220303
arc                  randconfig-r043-20220302
riscv                randconfig-r042-20220302
s390                 randconfig-r044-20220302
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                        vexpress_defconfig
mips                            e55_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220303
s390                 randconfig-r044-20220303
hexagon              randconfig-r045-20220303
hexagon              randconfig-r041-20220303

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
