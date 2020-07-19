Return-Path: <SRS0=cJ4m=A6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97348C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 04:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F37207DA
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 04:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725272AbgGSEEu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Jul 2020 00:04:50 -0400
Received: from mga12.intel.com ([192.55.52.136]:15098 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725271AbgGSEEt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Jul 2020 00:04:49 -0400
IronPort-SDR: CTl8M9qqIxOC5Wm1BRBFOkuBg2DG7l0lDITiQm+UjnIFNAUxRX0+9NIwlCylEOvoc0HtxGC5bb
 yBYY+uq5Oavg==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="129355128"
X-IronPort-AV: E=Sophos;i="5.75,369,1589266800"; 
   d="scan'208";a="129355128"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2020 21:04:49 -0700
IronPort-SDR: 4Me5hWSjOyUpDFIQezOP9e9tzTNSE78TnBwb57iwG7WEGdmSKNeHwv4MGV406BZvXZIfZXRUQM
 wmqMhwr2liYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,369,1589266800"; 
   d="scan'208";a="487372949"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2020 21:04:48 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jx0ZD-00012Q-JL; Sun, 19 Jul 2020 04:04:47 +0000
Date:   Sun, 19 Jul 2020 12:03:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 c66ef39eb27fe123ee05082b90eb2985c33c7715
Message-ID: <5f13c62c.W+Xm5W99aUjSgb64%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: c66ef39eb27fe123ee05082b90eb2985c33c7715  hwmon: (drivetemp) Avoid SCT usage on Toshiba DT01ACA family drives

elapsed time: 721m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
arm                            hisi_defconfig
powerpc64                        alldefconfig
arm                        spear3xx_defconfig
h8300                       h8s-sim_defconfig
mips                         tb0219_defconfig
csky                             alldefconfig
sh                        edosk7705_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
