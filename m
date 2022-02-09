Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FDDC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 13:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbiBINBq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 08:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbiBINBp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 08:01:45 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8DDC05CB97
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 05:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644411708; x=1675947708;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dbJu+5+jLP1oGJ18PjcSOvvCvOde1f5PKkQEAnU+/tE=;
  b=kLBPG20M/GRyhx8nmemQ2Wu0IJRzdh68JJ+DUjUXeefXTs5gJDgeXQK6
   OBeQ74lHe3fBdyR6VmZ7ZyDsb9admf3zgUaEetVoWd6bCRmdsqlnxed/y
   P1+XBvrMAsjUturcRjCLyfc6dIFHJ2Hs+1uCWnhsTpEe2UlaYu4II+gVp
   bricbeMYXFYMrlsDRma9koCWJ7IDPNY3M1fEpjXcO8titv0g0vuQEVa7J
   Rm2QPFUJeMCw+kzH54GRmrROMWYmrETk8r7EuYjbqIXrkQJDEZP1PUl/m
   zzH5u+kbh0D/LrSRJz2FVU/Ti4zlMUZ30abzPVlpMiCWyrkr3BHOwk4w2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312492477"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="312492477"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 05:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="585554159"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2022 05:01:47 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHmbS-0001pP-Lh; Wed, 09 Feb 2022 13:01:46 +0000
Date:   Wed, 09 Feb 2022 21:01:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b460ae6643ad52157cec964302dfcb61e7ed34d2
Message-ID: <6203bb2f.4UNDD904kMidKoXR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b460ae6643ad52157cec964302dfcb61e7ed34d2  Merge tag 'ib-mfd-hwmon-regulator-v5.18' into hwmon-next

elapsed time: 726m

configs tested: 103
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
powerpc                   motionpro_defconfig
sh                   sh7724_generic_defconfig
sh                               alldefconfig
arc                          axs103_defconfig
sh                         ap325rxa_defconfig
mips                         bigsur_defconfig
m68k                        m5407c3_defconfig
sh                         apsh4a3a_defconfig
powerpc                   currituck_defconfig
arm                        cerfcube_defconfig
sh                        dreamcast_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8548_defconfig
mips                         rt305x_defconfig
arc                          axs101_defconfig
ia64                      gensparse_defconfig
openrisc                  or1klitex_defconfig
xtensa                    xip_kc705_defconfig
arm                      integrator_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          sdk7780_defconfig
powerpc                     sequoia_defconfig
sh                   rts7751r2dplus_defconfig
sh                                  defconfig
mips                     loongson1b_defconfig
sh                   sh7770_generic_defconfig
powerpc                      tqm8xx_defconfig
sh                          polaris_defconfig
csky                             alldefconfig
arc                           tb10x_defconfig
microblaze                      mmu_defconfig
arm                  randconfig-c002-20220209
ia64                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                            allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64                        randconfig-a002
riscv                randconfig-r042-20220209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
i386                          randconfig-c001
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
