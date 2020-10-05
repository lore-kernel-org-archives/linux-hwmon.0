Return-Path: <SRS0=kkoh=DM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54756C4363A
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 06:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24633207F7
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 06:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgJEGNc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Oct 2020 02:13:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:47858 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgJEGNc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 5 Oct 2020 02:13:32 -0400
IronPort-SDR: 5mycCAKqUzWEpyAFO/baEgYkTqplniHI7TBNFYCNFI0WzgmhgvagRgtdRNO7KWEsYVO03z7gfh
 VTg0vM4gkr7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="224956721"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="224956721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2020 23:13:22 -0700
IronPort-SDR: pid2JH3sgJlRQcXR/9dYdhOpy600FpgDqCQd9hwxV+GAtboxekRlJf5lHZT9dUYHrXBuB93UbH
 AIEvffkDTLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="314197857"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Oct 2020 23:13:21 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kPJkO-0000h8-Mv; Mon, 05 Oct 2020 06:13:20 +0000
Date:   Mon, 05 Oct 2020 14:13:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 5b1a5f781e0de4e5dae47ca9dad17439b298e08a
Message-ID: <5f7ab971.4SRKH/Ug3gx/qn6C%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 5b1a5f781e0de4e5dae47ca9dad17439b298e08a  hwmon: (pmbus/max20730) add device monitoring via debugfs

elapsed time: 721m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_qemu_32r6_defconfig
powerpc                      katmai_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
m68k                        mvme16x_defconfig
sh                            titan_defconfig
arc                             nps_defconfig
sh                             shx3_defconfig
powerpc                      ppc44x_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     akebono_defconfig
powerpc                    mvme5100_defconfig
sh                        edosk7705_defconfig
sh                          urquell_defconfig
powerpc                 mpc8313_rdb_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
mips                         mpc30x_defconfig
arm                        spear3xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
