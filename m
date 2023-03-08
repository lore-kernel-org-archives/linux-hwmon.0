Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3831C64EC4
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 06:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjCHGro (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 01:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCHGrm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 01:47:42 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8479E668
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Mar 2023 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678258061; x=1709794061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=54qkDOiVh/ywi33QQQTh1BkUszTCx6qLaHFJ6bh3yxE=;
  b=OjEeCDyUrYh9aZ6Dt23n95G1Zp3K4ALfmSH3Pnhh6oLI9NjMZxa8H1qK
   PKP+iNsgorwchCohPcxTWaLbk1ZFBPVzWlj8E2ixXpbZH9yZV9XED4inf
   EVYIXUF0Ygp1QZauZEi94zP99+GnTPz0is2mQM4YPk99hzrFpGY1vi71q
   Hy5NpYAyL752XzXuHWIZwqvw4dYJ4obfeAG42OBZiAe24GZaJ17TJ1n5A
   RTsCpAQ49IaJiQ8endJeaJm2/fNCABysqGRgyGTK681vs8nwaY4JpxWSR
   N9YEwPA4FGWmmqGxNuhgAVketuDiypcGWDMfGwo3fuqHBdCc4CcSKG9kb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337597093"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="337597093"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 22:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="741002589"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="741002589"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 22:47:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZnaL-0001w7-16;
        Wed, 08 Mar 2023 06:47:37 +0000
Date:   Wed, 08 Mar 2023 14:46:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 9d82afe4c0fa55b2b7ee95c915313bb805b86edc
Message-ID: <64082f53.+shZiWz007P919aE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 9d82afe4c0fa55b2b7ee95c915313bb805b86edc  dt-bindings: watchdog: migrate rt2880 text bindings to YAML

elapsed time: 728m

configs tested: 125
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230306   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230306   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230305   clang
arm                  randconfig-r031-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230306   gcc  
arm64                randconfig-r024-20230306   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230306   gcc  
csky                 randconfig-r013-20230306   gcc  
csky                 randconfig-r023-20230306   gcc  
hexagon              randconfig-r013-20230305   clang
hexagon              randconfig-r015-20230305   clang
hexagon              randconfig-r022-20230305   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230305   gcc  
ia64                 randconfig-r006-20230305   gcc  
ia64                 randconfig-r011-20230305   gcc  
ia64                 randconfig-r026-20230305   gcc  
ia64                 randconfig-r026-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230306   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230305   gcc  
microblaze   buildonly-randconfig-r001-20230306   gcc  
microblaze           randconfig-r003-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230305   gcc  
mips                 randconfig-r005-20230305   gcc  
mips                 randconfig-r006-20230306   clang
mips                 randconfig-r021-20230305   clang
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230305   gcc  
parisc               randconfig-r034-20230305   gcc  
parisc               randconfig-r035-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230306   clang
powerpc              randconfig-r021-20230306   clang
powerpc              randconfig-r033-20230306   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230306   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230305   gcc  
s390                 randconfig-r033-20230305   clang
s390                 randconfig-r034-20230306   gcc  
s390                 randconfig-r035-20230306   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230306   gcc  
sh                   randconfig-r025-20230305   gcc  
sh                   randconfig-r031-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230306   gcc  
sparc                randconfig-r036-20230305   gcc  
sparc64              randconfig-r005-20230306   gcc  
sparc64              randconfig-r025-20230306   gcc  
sparc64              randconfig-r036-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
