Return-Path: <SRS0=hNyA=AH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D080C433DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 07:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5343820775
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 07:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgFZHBo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Jun 2020 03:01:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:3622 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgFZHBn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Jun 2020 03:01:43 -0400
IronPort-SDR: 1hQ9oadZXcLBsxfzTT7532Qr37ymCX03qt2bqyOwIqgjhldfDH/xQnHZv1NeizD+E+q6194HAL
 U8j5fDUl+5FQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="145294906"
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; 
   d="scan'208";a="145294906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 00:01:28 -0700
IronPort-SDR: Vp7IClmiOEcU/iNEq+s1IutyUT3O9wvhEtp1yiiI7UD6Frft+5+49MVkNHmu+Lv0xnJltLBqBQ
 JfY7MXtFMYYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; 
   d="scan'208";a="354700634"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Jun 2020 00:01:27 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1joiMY-00025J-BU; Fri, 26 Jun 2020 07:01:26 +0000
Date:   Fri, 26 Jun 2020 15:01:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:master] BUILD SUCCESS
 aff54955d70c5403393865a8ee13b3ff5da85b04
Message-ID: <5ef59d3a.BjmZhCmYQx8wtzvP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  master
branch HEAD: aff54955d70c5403393865a8ee13b3ff5da85b04  dma-pool: Fix too large DMA pools on medium systems

elapsed time: 726m

configs tested: 108
configs skipped: 3

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
sh                           se7751_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
i386                             alldefconfig
nds32                             allnoconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
parisc                            allnoconfig
arm                            lart_defconfig
mips                      loongson3_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200624
i386                 randconfig-a006-20200624
i386                 randconfig-a003-20200624
i386                 randconfig-a001-20200624
i386                 randconfig-a005-20200624
i386                 randconfig-a004-20200624
x86_64               randconfig-a004-20200624
x86_64               randconfig-a002-20200624
x86_64               randconfig-a003-20200624
x86_64               randconfig-a005-20200624
x86_64               randconfig-a001-20200624
x86_64               randconfig-a006-20200624
i386                 randconfig-a013-20200624
i386                 randconfig-a016-20200624
i386                 randconfig-a012-20200624
i386                 randconfig-a014-20200624
i386                 randconfig-a011-20200624
i386                 randconfig-a015-20200624
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
