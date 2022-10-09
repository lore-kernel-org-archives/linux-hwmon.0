Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B1C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Oct 2022 11:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiJILW5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 9 Oct 2022 07:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiJILW5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Oct 2022 07:22:57 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4AD13E97
        for <linux-hwmon@vger.kernel.org>; Sun,  9 Oct 2022 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665314576; x=1696850576;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s7adLjobP1AfPD229TY3X7rHlFK3JrsM7e5CR+69mUY=;
  b=PQzI4k0PsNtL1jCc/m1r42Q1v8lMG1nVoP9nf/h0hAMweCxhoCvYXBdx
   ZsbG9ofAaXhYvgcqn3HEaKAQmk5Z10esa88Iqrbn0lXAvJQKcxNfvRI/L
   8TcXG6W7+H0KdiIHk2nRjucQ2gMqiiz8RHdh7AhF0dBFfPYRXSyfzlEA5
   JQ1R6HC9ZcdeixcvKqBAlmh351Y8UoOvgV9wGkGsrKMVDNPG7X1XRAhi/
   nz3Mz+Efp0doef/TkJbd2dJ6V31nKuhavTMZJ+hEoKW4fgpbB+kEPr8zr
   lQ5uOUxtALMv8h3WylxS4a4v2bCBLn+ZUMUYdD70TMcW+EVRbsJZopRKJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="390351896"
X-IronPort-AV: E=Sophos;i="5.95,171,1661842800"; 
   d="scan'208";a="390351896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2022 04:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="768093105"
X-IronPort-AV: E=Sophos;i="5.95,171,1661842800"; 
   d="scan'208";a="768093105"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2022 04:22:50 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ohUOP-0000t6-1F;
        Sun, 09 Oct 2022 11:22:49 +0000
Date:   Sun, 09 Oct 2022 19:21:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 6b744a0170dfaafd4df711527cef3bc1eff8c9e7
Message-ID: <6342aed2.AEgG74wKgzFNd1TU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 6b744a0170dfaafd4df711527cef3bc1eff8c9e7  watchdog: Add tracing events for the most usual watchdog events

elapsed time: 720m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                               defconfig
alpha                            alldefconfig
s390                                defconfig
m68k                           virt_defconfig
arc                              allyesconfig
csky                             alldefconfig
arc                               allnoconfig
s390                             allyesconfig
x86_64                        randconfig-a004
x86_64                          rhel-8.3-func
alpha                             allnoconfig
riscv                             allnoconfig
x86_64                        randconfig-a013
csky                              allnoconfig
s390                 randconfig-r044-20221009
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
arm                      footbridge_defconfig
arc                  randconfig-r043-20221009
mips                      maltasmvp_defconfig
i386                          randconfig-a001
riscv                randconfig-r042-20221009
alpha                            allyesconfig
sh                           se7206_defconfig
x86_64                        randconfig-a011
m68k                             allyesconfig
i386                          randconfig-a003
m68k                             allmodconfig
x86_64                        randconfig-a006
loongarch                           defconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
x86_64                              defconfig
mips                             allyesconfig
i386                          randconfig-a005
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                                 defconfig
i386                          randconfig-a012
sh                               allmodconfig
i386                          randconfig-a016
i386                                defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
i386                          randconfig-c001
powerpc                      chrp32_defconfig
powerpc                    sam440ep_defconfig
arm64                               defconfig
sh                        edosk7705_defconfig
mips                            gpr_defconfig
m68k                        mvme147_defconfig
sh                            migor_defconfig
openrisc                    or1ksim_defconfig
loongarch                        allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
xtensa                generic_kc705_defconfig

clang tested configs:
hexagon              randconfig-r045-20221009
hexagon              randconfig-r041-20221009
mips                        omega2p_defconfig
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001
powerpc                       ebony_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc8272_ads_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                        icon_defconfig
powerpc                    mvme5100_defconfig
mips                  cavium_octeon_defconfig
powerpc                     mpc5200_defconfig
arm                              alldefconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
