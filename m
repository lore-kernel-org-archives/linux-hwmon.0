Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E77EB64D7
	for <linux-hwmon@archiver.kernel.org>; Sun, 18 Jun 2023 16:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjFRQ31 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 18 Jun 2023 12:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFRQ30 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Jun 2023 12:29:26 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54B81B0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Jun 2023 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687105765; x=1718641765;
  h=date:from:to:cc:subject:message-id;
  bh=C0zbmiPaSV47pg1YiZvtAL30mwGH6ih7X2MKl0KXinY=;
  b=CqSPdLOzFWqWUkITMK0rs4GcTrB1C1IrexAeaiWb4oVePrd21GfJQXvu
   R95fRCR//PyJotdBmOrqwJYxY8LB9G4tRr5JKdaf157W3QYtOgea8vy+h
   OeEp7U37voLB7nK6hIsHEn9zdq0LP7mfw3gGBTKlGFRRLFcS6/I8N1DN5
   KIcybSGjMG4X8w3mAtkjQDH+iBvUvo98ns/OcM05E8lhhJqHpjR3wSFBm
   SKaKJe51vC1sbrdnkrWfuUipWEVkaS6L43T3taYe3fXXK0mXvw862bcwN
   u7DgLLpWZp957WgvBqYI+vkhzqlON7ElBLnWMfgWjE5LErHkNZwOoftF6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="344235444"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="344235444"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 09:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="826344631"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="826344631"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2023 09:29:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qAvHH-0003su-1C;
        Sun, 18 Jun 2023 16:29:23 +0000
Date:   Mon, 19 Jun 2023 00:28:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 aee395bb190564a3fa22aa65c60812c25410e94a
Message-ID: <202306190055.Vf4VppI0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: aee395bb190564a3fa22aa65c60812c25410e94a  hwmon: (nct6755) Add support for NCT6799D

elapsed time: 721m

configs tested: 121
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230618   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r014-20230618   gcc  
arc                  randconfig-r043-20230618   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                       imx_v4_v5_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r003-20230618   gcc  
arm                  randconfig-r046-20230618   clang
arm                           u8500_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r021-20230618   clang
hexagon              randconfig-r041-20230618   clang
hexagon              randconfig-r045-20230618   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230618   clang
i386         buildonly-randconfig-r005-20230618   clang
i386         buildonly-randconfig-r006-20230618   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230618   clang
i386                 randconfig-i002-20230618   clang
i386                 randconfig-i003-20230618   clang
i386                 randconfig-i004-20230618   clang
i386                 randconfig-i005-20230618   clang
i386                 randconfig-i006-20230618   clang
i386                 randconfig-i011-20230618   gcc  
i386                 randconfig-i012-20230618   gcc  
i386                 randconfig-i013-20230618   gcc  
i386                 randconfig-i014-20230618   gcc  
i386                 randconfig-i015-20230618   gcc  
i386                 randconfig-i016-20230618   gcc  
i386                 randconfig-r033-20230618   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230618   gcc  
loongarch            randconfig-r036-20230618   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r002-20230618   gcc  
microblaze           randconfig-r016-20230618   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                          rm200_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230618   gcc  
openrisc             randconfig-r015-20230618   gcc  
openrisc             randconfig-r025-20230618   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230618   gcc  
parisc               randconfig-r013-20230618   gcc  
parisc               randconfig-r024-20230618   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230618   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230618   clang
s390                 randconfig-r035-20230618   clang
s390                 randconfig-r044-20230618   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230618   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230618   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230618   clang
x86_64       buildonly-randconfig-r002-20230618   clang
x86_64       buildonly-randconfig-r003-20230618   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230618   clang
x86_64               randconfig-a002-20230618   clang
x86_64               randconfig-a003-20230618   clang
x86_64               randconfig-a004-20230618   clang
x86_64               randconfig-a005-20230618   clang
x86_64               randconfig-a006-20230618   clang
x86_64               randconfig-a011-20230618   gcc  
x86_64               randconfig-a012-20230618   gcc  
x86_64               randconfig-a013-20230618   gcc  
x86_64               randconfig-a014-20230618   gcc  
x86_64               randconfig-a015-20230618   gcc  
x86_64               randconfig-a016-20230618   gcc  
x86_64               randconfig-r026-20230618   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r022-20230618   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
