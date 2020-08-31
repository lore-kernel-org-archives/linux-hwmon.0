Return-Path: <SRS0=8ZHx=CJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C4EC433E6
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 03:15:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B5F020720
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 03:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgHaDPI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Aug 2020 23:15:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:44892 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgHaDPH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Aug 2020 23:15:07 -0400
IronPort-SDR: E73zZncdWCeJh+0dyG4ZStbqUWO9ZdPawM/VDO3TCPrz3U/Wm7Vxs5aE4hy+JAk+UUsRUk4OIe
 jLPRLXRfyQZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241717251"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="241717251"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2020 20:15:06 -0700
IronPort-SDR: BVLK2r1Wn5bZfJvd67VZgHy5IUi50XQc1QeKrzIRvcHwDAqEg2bDxCgR4jrbTz5cUsX8QPrsQg
 mj1Ci6IJl0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="282961081"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2020 20:15:05 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCaHh-00015Q-3R; Mon, 31 Aug 2020 03:15:05 +0000
Date:   Mon, 31 Aug 2020 11:14:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 d500048804acce2101dc4a226192823a875ae639
Message-ID: <5f4c6afd.nqTx3/QrxSbhlhUk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: d500048804acce2101dc4a226192823a875ae639  hwmon: (gsc-hwmon) add fan sensor

elapsed time: 720m

configs tested: 81
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     pq2fads_defconfig
sparc64                             defconfig
m68k                                defconfig
sh                     magicpanelr2_defconfig
arm                         hackkit_defconfig
m68k                             allmodconfig
arc                            hsdk_defconfig
sh                            migor_defconfig
sh                          kfr2r09_defconfig
m68k                       m5249evb_defconfig
m68k                       m5275evb_defconfig
arm                         palmz72_defconfig
xtensa                              defconfig
sh                          r7785rp_defconfig
sh                        apsh4ad0a_defconfig
arm                           viper_defconfig
arc                     nsimosci_hs_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200830
i386                 randconfig-a002-20200830
i386                 randconfig-a004-20200830
i386                 randconfig-a006-20200830
i386                 randconfig-a005-20200830
i386                 randconfig-a003-20200830
i386                 randconfig-a013-20200830
i386                 randconfig-a011-20200830
i386                 randconfig-a012-20200830
i386                 randconfig-a015-20200830
i386                 randconfig-a016-20200830
i386                 randconfig-a014-20200830
x86_64               randconfig-a002-20200830
x86_64               randconfig-a005-20200830
x86_64               randconfig-a001-20200830
x86_64               randconfig-a006-20200830
x86_64               randconfig-a004-20200830
x86_64               randconfig-a003-20200830
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
