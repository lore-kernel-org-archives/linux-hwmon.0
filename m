Return-Path: <SRS0=MVeP=65=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792E0C433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 06:58:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C593206F1
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 06:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgEOG6E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 May 2020 02:58:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:45729 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727910AbgEOG6E (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 May 2020 02:58:04 -0400
IronPort-SDR: X1NwVPlOkRMrvesgQ6oQi4JXjv8u5opnTLiBrwftJo2dAB26Wwcl75lyZ96dbE1shvD1rw27tr
 gmQxF+/TlR9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 23:58:03 -0700
IronPort-SDR: PRlLhEfoHYAbsSAiN/UuGnnx2SzxXbbAEbZpZI8HbB2mgzNrRc0cU5WST/pCTIdZYHmADGGmsp
 zRyzqU6adF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; 
   d="scan'208";a="298959680"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 May 2020 23:58:02 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jZUID-0005Lo-Ou; Fri, 15 May 2020 14:58:01 +0800
Date:   Fri, 15 May 2020 14:57:56 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 9b7f228e84edae4b962df35ac7d0fecaabfe1e19
Message-ID: <5ebe3d74.9YHSnIfddz33mXNy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 9b7f228e84edae4b962df35ac7d0fecaabfe1e19  hwmon: (lm90) Add max6654 support to lm90 driver

elapsed time: 484m

configs tested: 125
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
mips                         rt305x_defconfig
arm                           corgi_defconfig
m68k                       m5208evb_defconfig
powerpc                       holly_defconfig
arm                        oxnas_v6_defconfig
mips                           ip27_defconfig
sparc                            alldefconfig
mips                  decstation_64_defconfig
mips                            e55_defconfig
m68k                          multi_defconfig
powerpc                     mpc5200_defconfig
arc                        nsim_700_defconfig
riscv                    nommu_virt_defconfig
arm                  colibri_pxa270_defconfig
arc                          axs103_defconfig
s390                       zfcpdump_defconfig
powerpc                       maple_defconfig
sh                           se7722_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
ia64                             allmodconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
sh                            shmin_defconfig
arm                        neponset_defconfig
arm                         socfpga_defconfig
m68k                        m5407c3_defconfig
arm                        multi_v7_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200515
i386                 randconfig-a005-20200515
i386                 randconfig-a003-20200515
i386                 randconfig-a001-20200515
i386                 randconfig-a004-20200515
i386                 randconfig-a002-20200515
x86_64               randconfig-a005-20200515
x86_64               randconfig-a003-20200515
x86_64               randconfig-a006-20200515
x86_64               randconfig-a004-20200515
x86_64               randconfig-a001-20200515
x86_64               randconfig-a002-20200515
i386                 randconfig-a012-20200515
i386                 randconfig-a016-20200515
i386                 randconfig-a014-20200515
i386                 randconfig-a011-20200515
i386                 randconfig-a013-20200515
i386                 randconfig-a015-20200515
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
