Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F870C004D4
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Jan 2023 08:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjASIgr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Jan 2023 03:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjASIgq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Jan 2023 03:36:46 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC99270F
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Jan 2023 00:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674117406; x=1705653406;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5bDAhxR0SFZPL0G2Ve6wtu1HLDEvZF5JC94vW2wxVfo=;
  b=hrRXe9+Hyum0EfJPh7+Iuu7ddkiKCyYn8xofcGuFkrAoHsIsj+nsbNuC
   OqbBUESk2QVwkwdL/F/dRSSFCoXauxj4LmNQb+IsleBR+HyABn0pebocl
   2NXBeJPOwcdQF8WZLfAiu2uKADk5nb6f6EdmN1NdLeOySi4yHyGf8XtZ7
   irIGOj4EGvwdo3SUjEhfvL2+Rar+EYrGrNhKe/3T3uCUgqtd6dahRC0N4
   ffTtnb9lIUZm5qHyckEO1brIUsCX1YN+bFNO4EoJAngxWiF+cZ09Urc+7
   tGRBranVnwPJdgvq7GBKwO9xmeLOwWDlik4uIVwULcRIKpjI6Ogy8ebaP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327304786"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="327304786"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768128876"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="768128876"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 00:36:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIQPa-0001JO-2Q;
        Thu, 19 Jan 2023 08:36:42 +0000
Date:   Thu, 19 Jan 2023 16:36:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 4d891f76a30d3be4194a805c5e4277786140ef05
Message-ID: <63c90104.QXKUlpBXT/UdlAvk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 4d891f76a30d3be4194a805c5e4277786140ef05  dt-bindings: hwmon: correct indentation and style in examples

elapsed time: 721m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
m68k                             allmodconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20230118
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
m68k                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
ia64                             allmodconfig
arm                              allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm64                            allyesconfig
arm                                 defconfig
powerpc                      mgcoge_defconfig
sh                        dreamcast_defconfig
sh                           se7722_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                       imx_v6_v7_defconfig
sh                              ul2_defconfig
sh                           se7750_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
m68k                            q40_defconfig
mips                     loongson1b_defconfig
arm                       omap2plus_defconfig
sparc                             allnoconfig
arm                           tegra_defconfig
arm                         assabet_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20230118
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20230118
arm                  randconfig-r046-20230118
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
arm                        spear3xx_defconfig
arm                        neponset_defconfig
mips                       lemote2f_defconfig
arm                         socfpga_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
