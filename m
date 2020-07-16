Return-Path: <SRS0=HGJS=A3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8944CC433F1
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jul 2020 12:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7234F207BC
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jul 2020 12:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgGPM4V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Jul 2020 08:56:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:40767 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728757AbgGPM4U (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jul 2020 08:56:20 -0400
IronPort-SDR: IcrnJf+DhSBhBXYkx9fh5nO1QxrIQ0wP0RsaqSkAexq0Vs+f6gDEju1b6tfSC9cGV7OLHVkxJO
 Ljkb6oIF81HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="147360167"
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="147360167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 05:56:19 -0700
IronPort-SDR: nJsH0Nj52LYL9Jl4N+MAyuMRxF9dnEm8z7Ry10SGCLS7shIYxJMEohILsOT4WOqvb2d105K+nz
 BaxQGA8u1EwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="317021622"
Received: from lkp-server01.sh.intel.com (HELO 70d1600e1569) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Jul 2020 05:56:18 -0700
Received: from kbuild by 70d1600e1569 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jw3Qv-00001u-N3; Thu, 16 Jul 2020 12:56:17 +0000
Date:   Thu, 16 Jul 2020 20:54:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 1be223e3c7b1ee0ab88b28f0cffbd4ec7a20c302
Message-ID: <5f104e03.sgSZFmdQGnksis3K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 1be223e3c7b1ee0ab88b28f0cffbd4ec7a20c302  hwmon: add Corsair Commander Pro driver

elapsed time: 721m

configs tested: 93
configs skipped: 4

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
mips                         tb0219_defconfig
mips                        omega2p_defconfig
sparc64                             defconfig
arm                         mv78xx0_defconfig
arm                        neponset_defconfig
riscv                    nommu_k210_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
arm                      tct_hammer_defconfig
powerpc                        cell_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
mips                        nlm_xlr_defconfig
powerpc                      pmac32_defconfig
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
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a012-20200716
x86_64               randconfig-a011-20200716
x86_64               randconfig-a016-20200716
x86_64               randconfig-a014-20200716
x86_64               randconfig-a013-20200716
x86_64               randconfig-a015-20200716
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
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
