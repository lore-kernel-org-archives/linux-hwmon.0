Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78279C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Apr 2022 03:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiDEDDv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Apr 2022 23:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiDEDCx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Apr 2022 23:02:53 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D222137B1B
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Apr 2022 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649126503; x=1680662503;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hKvViH8UZKHnJtHwPEMbjzKGaOyaJ1HM1Gf4ZsBh7+4=;
  b=d7JZu8aM5BFB6gSbfGJgJNVH2t+4KI+gNcnTAPzeNrUZdDPVUzUTfVNG
   T+rlPaN3kRrs83hVP/ftO2Vq7M8CbmXTIDnBrXeCcniPJTENGE0w7EDGI
   2Pa4mvzv1vo1zku/T6XZJ97QafOyHtG+OG54GSD/zdmrpcOQFhmYJ/0Uc
   HatpHlkXQN0CQv6sxJA02iTqHZm92g9IkDv7yh0CyrYd8cg+6gvv6+SNH
   J/0Wrd/KQ3iuT+i4KiTCDy5T4tI2Iq6Pr3MZNy7QsZ1hhJD8lUZXWNYor
   /eMr6ld4YN8NjK1laEmkt8UbIzn5jealUmsmgkX3hilu/A82DlCWrzA+j
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260349104"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="260349104"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="721878191"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Apr 2022 19:41:41 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbZ8X-0002Yd-AT;
        Tue, 05 Apr 2022 02:41:41 +0000
Date:   Tue, 05 Apr 2022 10:41:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a5af7ccaf51299819dd0e5b1347d6f4d00752701
Message-ID: <624bac49.Rd+2MgqH5DBwifnG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a5af7ccaf51299819dd0e5b1347d6f4d00752701  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Octo

elapsed time: 724m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220404
arm                       multi_v4t_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        mvme147_defconfig
arc                        nsim_700_defconfig
xtensa                          iss_defconfig
arm                           corgi_defconfig
mips                            gpr_defconfig
sh                               alldefconfig
arm                        multi_v7_defconfig
powerpc                 linkstation_defconfig
arm                      footbridge_defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
xtensa                           allyesconfig
ia64                          tiger_defconfig
arm                            mps2_defconfig
arm                       omap2plus_defconfig
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
ia64                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a011-20220404
x86_64               randconfig-a013-20220404
x86_64               randconfig-a015-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a016-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a012-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                      walnut_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
powerpc                     kmeter1_defconfig
arm                         hackkit_defconfig
mips                        bcm63xx_defconfig
powerpc                     mpc512x_defconfig
i386                 randconfig-a001-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a005-20220404
i386                 randconfig-a006-20220404
x86_64               randconfig-a004-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a006-20220404
x86_64               randconfig-a001-20220404
hexagon              randconfig-r041-20220404
hexagon              randconfig-r045-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
