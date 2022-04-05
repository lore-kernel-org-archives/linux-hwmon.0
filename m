Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A55C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Apr 2022 03:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiDEDDR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Apr 2022 23:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiDEDDK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Apr 2022 23:03:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC5B286F58
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Apr 2022 19:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649126509; x=1680662509;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1bP3zwC7gg/H9FerLfsZAipDrzPeJj2qAaDM/57Z2uI=;
  b=YMDh8EaKVCXtNMy0WooTotBGuBLhtZS6ONbS7Zz/48Hp9vEBNzwaNl8A
   FdZg/+IM1xAVhKIc1mR0VJg3OgkpeGKQNzNyAbbY4xGm+x6e9cELxHwi6
   a6HTnXGd88f5ZI+h1Lz8LSFvl3NaojxuX+qSg0ZWU9Xl2C9/LASO/i7v9
   wLOSK18O8gZIlUYEctL6sP3OfmHjJ0fntRf90n1HgLbb3jYxRbWSh5hio
   c6vkgyjVBkb/nvsrCnwpbNnIq+yVcbwVWn2oTK+7POr7yWZv95Drgs8Si
   Dysy5GCO5gFW8vLJj21iL2+1hLOB7Kq1KAmhf6MLjkJwdm/Jvgj6MEID1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260829709"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="260829709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="548886587"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2022 19:41:42 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbZ8X-0002Ya-A2;
        Tue, 05 Apr 2022 02:41:41 +0000
Date:   Tue, 05 Apr 2022 10:41:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 e4eb999cf8d0959cc69c4f7a59dbe13a3059a31c
Message-ID: <624bac57.1D+cM/kBgwcDbCgQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: e4eb999cf8d0959cc69c4f7a59dbe13a3059a31c  dt-bindings: watchdog: sunxi: clarify clock support

elapsed time: 724m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
nios2                         3c120_defconfig
arm                         axm55xx_defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
arc                        nsimosci_defconfig
m68k                          sun3x_defconfig
sh                                  defconfig
xtensa                              defconfig
alpha                            alldefconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
m68k                          hp300_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
arc                      axs103_smp_defconfig
arm                  randconfig-c002-20220404
x86_64               randconfig-c001-20220404
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
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
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                     ppa8548_defconfig
powerpc                   microwatt_defconfig
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
