Return-Path: <SRS0=HGJS=A3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD22C433DF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jul 2020 04:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC3F120775
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jul 2020 04:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725270AbgGPEDs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Jul 2020 00:03:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:10732 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgGPEDs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jul 2020 00:03:48 -0400
IronPort-SDR: BY5cMDfHcSWPi5I0II5GJ7a+UuPGt5xuiCUsqtOvINeM4VBRrHcH6jITN9uCnjyo4PQUsyrpTd
 DZYkt6DCxCdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="148465927"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="148465927"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2020 21:03:47 -0700
IronPort-SDR: ySnlMRe1FIAdk+ICuNFfVRj7+ahsrHXiqe+rnHWt+Sxqqqq2hr5HoOHjuPN9XkyAK5uISAW1lJ
 IOAQvyuOuHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="269139507"
Received: from lkp-server02.sh.intel.com (HELO 02dcbd16d3ea) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2020 21:03:45 -0700
Received: from kbuild by 02dcbd16d3ea with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvv7Z-000023-4y; Thu, 16 Jul 2020 04:03:45 +0000
Date:   Thu, 16 Jul 2020 12:02:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 3ce17cd2b94907f6d91b81b32848044b84c97606
Message-ID: <5f0fd155.b2KIHyEdC6IWcELz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 3ce17cd2b94907f6d91b81b32848044b84c97606  hwmon: (scmi) Fix potential buffer overflow in scmi_hwmon_probe()

elapsed time: 724m

configs tested: 93
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
arc                          axs101_defconfig
c6x                        evmc6457_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    gamecube_defconfig
arm                          lpd270_defconfig
riscv                    nommu_k210_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
arm                      tct_hammer_defconfig
powerpc                        cell_defconfig
arm                        clps711x_defconfig
arm                           corgi_defconfig
riscv                            allyesconfig
arm                         orion5x_defconfig
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
i386                 randconfig-a016-20200715
i386                 randconfig-a011-20200715
i386                 randconfig-a015-20200715
i386                 randconfig-a012-20200715
i386                 randconfig-a013-20200715
i386                 randconfig-a014-20200715
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
