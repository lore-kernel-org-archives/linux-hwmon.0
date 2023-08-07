Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A65C001DE
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Aug 2023 01:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjHGBsb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Aug 2023 21:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjHGBsa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Aug 2023 21:48:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B17170B
        for <linux-hwmon@vger.kernel.org>; Sun,  6 Aug 2023 18:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691372909; x=1722908909;
  h=date:from:to:cc:subject:message-id;
  bh=VTI+Q33/6X0abVjebOTyWlSDMyBgCR8EMTCO04p7Wqs=;
  b=LbUoD/i6RWTK9aztuYiyKoV4RM+AUQ4jGO+CKpOivdZBNtF/iRVPTlVF
   dnAGoKcJ65Jhbwzgue91XGLmMI2JDBzJCE+VPQBEcJrvViJtlS8ucUjlw
   pQs2pQ7FnssvdvY8TviLh+Fp7F8iZ01aMr/Tmw4b0ORboSM+qlxXX3oQL
   hPfaT+Q4DoAY5oYHESSp3rRdwMllvSZd1jJRdkH/kXXactzcZW4mfns2d
   6HDh/U38ub5Ud7jhicoQrYBURxAxcwBMqsRU6CTETCCZQ4xLoaJQ2KzeY
   DrDa0rMpQ9/3SbmDfM7VX4tnweyl71+gKaKra6Ic8FMnPiLayd5q8agiT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="373185446"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="373185446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="765812081"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="765812081"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Aug 2023 18:48:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qSpMA-0004TN-35;
        Mon, 07 Aug 2023 01:48:26 +0000
Date:   Mon, 07 Aug 2023 09:47:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f38963b9cd0645a336cf30c5da2e89e34e34fec3
Message-ID: <202308070957.fixOLyrN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f38963b9cd0645a336cf30c5da2e89e34e34fec3  hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100

elapsed time: 722m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230806   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r024-20230806   gcc  
arc                  randconfig-r043-20230806   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230806   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r014-20230806   clang
hexagon              randconfig-r022-20230806   clang
hexagon              randconfig-r041-20230806   clang
hexagon              randconfig-r045-20230806   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230806   clang
i386         buildonly-randconfig-r005-20230806   clang
i386         buildonly-randconfig-r006-20230806   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230806   clang
i386                 randconfig-i002-20230806   clang
i386                 randconfig-i003-20230806   clang
i386                 randconfig-i004-20230806   clang
i386                 randconfig-i005-20230806   clang
i386                 randconfig-i006-20230806   clang
i386                 randconfig-i011-20230806   gcc  
i386                 randconfig-i012-20230806   gcc  
i386                 randconfig-i013-20230806   gcc  
i386                 randconfig-i014-20230806   gcc  
i386                 randconfig-i015-20230806   gcc  
i386                 randconfig-i016-20230806   gcc  
i386                 randconfig-r032-20230806   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r036-20230806   gcc  
microblaze           randconfig-r001-20230806   gcc  
microblaze           randconfig-r013-20230806   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r016-20230806   gcc  
openrisc             randconfig-r031-20230806   gcc  
openrisc             randconfig-r034-20230806   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230806   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230806   clang
s390                 randconfig-r003-20230806   clang
s390                 randconfig-r005-20230806   clang
s390                 randconfig-r012-20230806   gcc  
s390                 randconfig-r015-20230806   gcc  
s390                 randconfig-r021-20230806   gcc  
s390                 randconfig-r044-20230806   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r033-20230806   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r006-20230806   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230806   clang
x86_64       buildonly-randconfig-r002-20230806   clang
x86_64       buildonly-randconfig-r003-20230806   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r023-20230806   gcc  
x86_64               randconfig-r026-20230806   gcc  
x86_64               randconfig-x001-20230806   gcc  
x86_64               randconfig-x002-20230806   gcc  
x86_64               randconfig-x003-20230806   gcc  
x86_64               randconfig-x004-20230806   gcc  
x86_64               randconfig-x005-20230806   gcc  
x86_64               randconfig-x006-20230806   gcc  
x86_64               randconfig-x011-20230806   clang
x86_64               randconfig-x012-20230806   clang
x86_64               randconfig-x013-20230806   clang
x86_64               randconfig-x014-20230806   clang
x86_64               randconfig-x015-20230806   clang
x86_64               randconfig-x016-20230806   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230806   gcc  
xtensa               randconfig-r011-20230806   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
