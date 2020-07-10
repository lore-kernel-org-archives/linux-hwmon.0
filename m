Return-Path: <SRS0=LxHm=AV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE79C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jul 2020 04:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8AF42064B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jul 2020 04:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgGJEUZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jul 2020 00:20:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:40002 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgGJEUZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jul 2020 00:20:25 -0400
IronPort-SDR: S7FDy+2h6PFZKuWu6WPnPLMlt1+Vbu8bJEF5IfOfFG1EVnI16+tfCKoAf7RTJp3vXXouqBhNEu
 4Xsm0LwcvVig==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="128215463"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="128215463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 21:20:24 -0700
IronPort-SDR: LVsZbWjXscZ7zzivPHayL5kx4uGLdhH6XvIJyAvOr1JQHgZShBazoG8BB5C06yWPv4yaiYaP8H
 d4nrivfiv7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="458162138"
Received: from lkp-server02.sh.intel.com (HELO 0fc60ea15964) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jul 2020 21:20:23 -0700
Received: from kbuild by 0fc60ea15964 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jtkWM-000014-Sv; Fri, 10 Jul 2020 04:20:22 +0000
Date:   Fri, 10 Jul 2020 12:20:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 7117b8140b4bbc9850c3c47a71342aec1867a55a
Message-ID: <5f07ec72./9yd7T8NR6ReqSf4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 7117b8140b4bbc9850c3c47a71342aec1867a55a  hwmon: (corsair-cpro) add fan_target

elapsed time: 725m

configs tested: 107
configs skipped: 10

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
mips                         rt305x_defconfig
sh                                  defconfig
nios2                            alldefconfig
m68k                         apollo_defconfig
mips                        omega2p_defconfig
powerpc                     mpc512x_defconfig
arm                        spear6xx_defconfig
m68k                       m5249evb_defconfig
arm                        multi_v7_defconfig
arm                            mmp2_defconfig
powerpc                         wii_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
arm                         ebsa110_defconfig
ia64                                defconfig
csky                                defconfig
m68k                          hp300_defconfig
powerpc                  mpc866_ads_defconfig
powerpc64                           defconfig
um                             i386_defconfig
openrisc                         allyesconfig
sh                        edosk7705_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
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
openrisc                            defconfig
mips                             allyesconfig
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
i386                 randconfig-a002-20200709
i386                 randconfig-a001-20200709
i386                 randconfig-a006-20200709
i386                 randconfig-a005-20200709
i386                 randconfig-a004-20200709
i386                 randconfig-a003-20200709
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
sparc64                          allmodconfig
sparc64                             defconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
