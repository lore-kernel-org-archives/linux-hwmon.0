Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBADDC43334
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jun 2022 03:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiFODEE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 23:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242487AbiFODEC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 23:04:02 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EA64B41D
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 20:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655262240; x=1686798240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3DapBGce/8lqyJGkq9eqjhrzeCwZbVwXv+yalngn6EQ=;
  b=kJ2lB8R9j1KowZoff8LmbUlXIpCab1+d8u+L8QxCIHv3n9Kw5iCBYuBF
   +5XE0FhAhSbjS06pbaM7Vlm8VO+5b0kYny6VqXsKi0kY+3MoGseF4Enez
   gh5eyq7wsgWukSLMECFznKBWpjnPZhTDQA+JDdhIG3vGXvQKvL40GCGVp
   /xlngmaBKEukquXEfcRX/2qRw1ISdlKkzzVjdna1gr3gJ+gJcyiZkJGf0
   +CNgeCsrLPZIPopYGhp7oPT7SGFbBCuKjuP9zk3rloFjwp5n6CLD67bhx
   Qxk3dvOcq3EYSnTKdp2AMfoO5hDfR7Pc+1fytBrM2FG2FplLDVE30vjFc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="259272273"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="259272273"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 20:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="830783154"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2022 20:03:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1JK2-000MWX-PF;
        Wed, 15 Jun 2022 03:03:58 +0000
Date:   Wed, 15 Jun 2022 11:03:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 494bf37523fc28575aacd01b1bc02acbf1b4d4fa
Message-ID: <62a94bec.Co6p8a4B8XaA0FDv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 494bf37523fc28575aacd01b1bc02acbf1b4d4fa  hwmon: (dell-smm) Add Dell G5 5590 to DMI table

elapsed time: 2233m

configs tested: 87
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
arc                              allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a012-20220613
x86_64               randconfig-a013-20220613
x86_64               randconfig-a015-20220613
x86_64               randconfig-a014-20220613
x86_64               randconfig-a011-20220613
x86_64               randconfig-a016-20220613
i386                 randconfig-a013-20220613
i386                 randconfig-a011-20220613
i386                 randconfig-a014-20220613
i386                 randconfig-a015-20220613
i386                 randconfig-a016-20220613
i386                 randconfig-a012-20220613
arc                  randconfig-r043-20220613
riscv                randconfig-r042-20220613
s390                 randconfig-r044-20220613
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64               randconfig-a003-20220613
x86_64               randconfig-a006-20220613
x86_64               randconfig-a001-20220613
x86_64               randconfig-a005-20220613
x86_64               randconfig-a002-20220613
x86_64               randconfig-a004-20220613
i386                 randconfig-a001-20220613
i386                 randconfig-a004-20220613
i386                 randconfig-a002-20220613
i386                 randconfig-a003-20220613
i386                 randconfig-a006-20220613
i386                 randconfig-a005-20220613
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20220613
hexagon              randconfig-r045-20220613

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
