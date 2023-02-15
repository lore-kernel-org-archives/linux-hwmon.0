Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC7EC636D4
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Feb 2023 04:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBOEU0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 23:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbjBOET6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 23:19:58 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592C936686
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Feb 2023 20:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676434699; x=1707970699;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gAFPVujgJR3r6ekzaEiAOjP1ueLDHgnA14CBFczlyQ4=;
  b=I2CxLGDV+gFGyVA9RFqijpKrcU7KPVI+H+RB/u04v52WQxhkxONS1WUu
   4OgTi+b3DYH/zKNZ10pJvmuWh/iF6tv0PI4m/m6rWIMO8rKrXjf7FmeBG
   2nCmQhViDg3d+pUCQshdLX1HaG0bdcRcaawFV/Nk5XP42HsmbZgoLfbIg
   KHkgWPu8Sq4/xBvWm8V7SIORKbt3dKmsIfHzRKW6wpRO7RCNkQMLDd6DC
   ZdVkJQ2HASrkmXD+NWLBhCuj92pbX93D6/dZ1oQRvYyW1njgCTfs2+AbA
   btWPZpjIATrWelfZ8nrkPMQqzXs8qJMchNqL0dcVwem48h+oKvMIszKXg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311707121"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="311707121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 20:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701884217"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="701884217"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 20:15:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pS9Cd-00091Z-0n;
        Wed, 15 Feb 2023 04:15:31 +0000
Date:   Wed, 15 Feb 2023 12:15:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 6e3dec4e1b356e6a4f3d3b4038ac444283155656
Message-ID: <63ec5c4f.g56IgQgwIGsPcoRE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 6e3dec4e1b356e6a4f3d3b4038ac444283155656  watchdog: mt7621-wdt: avoid ralink architecture dependent code

elapsed time: 732m

configs tested: 50
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

clang tested configs:
powerpc                 xes_mpc85xx_defconfig
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
