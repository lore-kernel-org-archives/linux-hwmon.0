Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60224C77B75
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 May 2023 17:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjEHRlm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 May 2023 13:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEHRll (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 May 2023 13:41:41 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5218AE55
        for <linux-hwmon@vger.kernel.org>; Mon,  8 May 2023 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683567700; x=1715103700;
  h=date:from:to:cc:subject:message-id;
  bh=+9smzEml2BoorGLhZhvRwiVh1feLxmusjkLfBWp4Tjw=;
  b=awj9H3iXGXqZOMygm9BAJnYp0PkZ+0O/eTH4MC4W4g4lt6KMTAaQVrgA
   /MvBKhcc6/hnr6WSWO7ZqHOOcTkC04wyL9MFiREgpqiI63C0SNFYO+G4d
   PKEa9HLz3hzQMdoCazTlXmcqx/xAS9drKBvwd5uNhw5tQqK34bBmasOPj
   8XzaTwyHI3cdDMUtpui0pGFAqiHqF+NEdpdUC6OQpyEXTli4ZlEwaQAHR
   01cAQ/sKDR4a2EAtykbMJlsM1xSwXnsbEK3Tpc2f/VGb6B6wiGpu0zQap
   TbCS2CPOdnFrfAgH5sTfs4PvLEeuta5YfDnJrixGmXcLdKCBDRERCmX8f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436032793"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="436032793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 10:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="822770345"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822770345"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 10:41:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pw4rh-0001Ld-2E;
        Mon, 08 May 2023 17:41:37 +0000
Date:   Tue, 09 May 2023 01:41:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS WITH WARNING
 92613681c0090612f0368dcebdcc232af9d74ae8
Message-ID: <20230508174121.bEiNI%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 92613681c0090612f0368dcebdcc232af9d74ae8  Documentation/hwmon: Move misplaced entry in hwmon docs index

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305081625.IMCuQoxj-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/hwmon/oxp-sensors.c:299:10: warning: cast to smaller integer type 'enum oxp_board' from 'void *' [-Wvoid-pointer-to-enum-cast]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-randconfig-a006-20230508
    `-- drivers-hwmon-oxp-sensors.c:warning:cast-to-smaller-integer-type-enum-oxp_board-from-void

elapsed time: 799m

configs tested: 125
configs skipped: 11

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230507   gcc  
alpha                randconfig-r014-20230507   gcc  
alpha                randconfig-r016-20230507   gcc  
alpha                randconfig-r036-20230508   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230507   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r023-20230508   clang
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230507   gcc  
csky                 randconfig-r015-20230507   gcc  
hexagon      buildonly-randconfig-r004-20230508   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230508   clang
i386         buildonly-randconfig-r005-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r013-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230508   gcc  
ia64                 randconfig-r015-20230508   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230507   gcc  
loongarch            randconfig-r012-20230507   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230507   clang
mips                 randconfig-r021-20230508   clang
mips                 randconfig-r022-20230507   gcc  
mips                 randconfig-r022-20230508   clang
mips                 randconfig-r024-20230508   clang
mips                 randconfig-r025-20230508   clang
mips                 randconfig-r035-20230508   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r001-20230507   gcc  
openrisc             randconfig-r035-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230508   gcc  
parisc               randconfig-r023-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230507   clang
powerpc              randconfig-r002-20230507   gcc  
powerpc              randconfig-r026-20230508   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230507   gcc  
sh                   randconfig-r032-20230507   gcc  
sh                   randconfig-r034-20230507   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230507   gcc  
sparc                randconfig-r024-20230507   gcc  
sparc                randconfig-r031-20230507   gcc  
sparc64      buildonly-randconfig-r006-20230507   gcc  
sparc64              randconfig-r011-20230507   gcc  
sparc64              randconfig-r013-20230507   gcc  
sparc64              randconfig-r021-20230507   gcc  
sparc64              randconfig-r026-20230507   gcc  
sparc64              randconfig-r036-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230508   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64               randconfig-r016-20230508   gcc  
x86_64               randconfig-r033-20230508   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
