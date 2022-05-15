Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA9C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 May 2022 20:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbiEOUcr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 May 2022 16:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiEOUcq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 May 2022 16:32:46 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D48C5FEC
        for <linux-hwmon@vger.kernel.org>; Sun, 15 May 2022 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652646765; x=1684182765;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tdm7Hsvw5ycuKlslPyv9T+9SAU6C0GmJX6IlSyj8nKE=;
  b=anVkCHFnoh6mGWn4oak15c5sKsfu1yUmNSbw2DbVSlo0yuYlM5+1l2sg
   ntE1Se+tQNgZKmfRybWFG6jVNtCK4jLurnJIpjpmX8renxm52TkFug2ZH
   Pjk16m5DEngBb3DKHXTRcWtFAHiGdMGpfzsj6wpLmooMhCnGRGm1TRYiu
   vag8V3ufHQ9QdnQZuIwe0Ms+8AHvo9eXL8uQZOHxz1zcE+Dl+Zti7Nb3d
   ApB+aP7QGcCTcZtWgpSlddLfzPuAaTI/hh+zHM52cV+yyRfo1eZL3cLhB
   CyIbEaw1kMcgJV4YcN/m/3LPpq44tSeGijvyC2plNP5jXPL5exzEAP8YT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333738486"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="333738486"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 13:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="659841695"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2022 13:32:41 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqKuv-0001xZ-3b;
        Sun, 15 May 2022 20:32:41 +0000
Date:   Mon, 16 May 2022 04:31:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 7897b39ba6b4bc1a6f8250a090105e03873dcace
Message-ID: <62816338.aDLsHZy1UECtzWB7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 7897b39ba6b4bc1a6f8250a090105e03873dcace  watchdog: ts4800_wdt: Fix refcount leak in ts4800_wdt_probe

elapsed time: 1753m

configs tested: 55
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
nios2                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
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
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
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
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
