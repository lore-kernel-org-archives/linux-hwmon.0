Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E154EECAAA1
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 17:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiH3RCb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 13:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiH3RCO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 13:02:14 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35D884EDE
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661878895; x=1693414895;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1K9kPxowut1VQk9X8tlYYJubh2B+ObjPbmCmQPSejr8=;
  b=Na1iePKoubz4zr495upx6Z44++0j968Lta+F2dUdCbdn2+N2vKSaXWYy
   TXtncmfXQHud+rtq19n+e2GKjgNFq5LgXV2f/is4T21keWylP0kqjBS+E
   F/7+VHwHdPWkSAXRGDjKjJ+VOQDtH5GZ0nySK7Xg74YfAfMv7Hr4U8IQ/
   a5a0YdjDyTlPDleiWjWTguFI6idhS2u7TWQmw2Ixce9LuBVITyg6gTNDR
   /jURQNxhrVYWZZVjBH6BKABs2PBQWAqH5tOrqpNxi7uB9b0rcobDOXBrA
   EFK9rJFpxPyo6c95eXDskyDcjNGh6wkLKtiLD7mSXA6l5hHsNYvHGuduR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295245123"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="295245123"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 10:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="857176217"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2022 10:01:25 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT4c8-0000QO-2d;
        Tue, 30 Aug 2022 17:01:24 +0000
Date:   Wed, 31 Aug 2022 01:00:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f233d2be38dbbb22299192292983037f01ab363c
Message-ID: <630e4231.l7Hm2GIhUMIGoJhk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f233d2be38dbbb22299192292983037f01ab363c  hwmon: (gpio-fan) Fix array out of bounds access

elapsed time: 725m

configs tested: 84
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220830
x86_64                           allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
x86_64                        randconfig-a004
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
i386                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                      mgcoge_defconfig
mips                         db1xxx_defconfig
sh                         ap325rxa_defconfig
sh                        sh7785lcr_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                        nsimosci_defconfig
arm                            xcep_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7705_defconfig
arm                          pxa910_defconfig
arc                                 defconfig
sh                            hp6xx_defconfig
arm                            pleb_defconfig
openrisc                       virt_defconfig
m68k                           sun3_defconfig
sh                      rts7751r2d1_defconfig
i386                          randconfig-c001
riscv                    nommu_k210_defconfig
arc                         haps_hs_defconfig
mips                      fuloong2e_defconfig
arm64                               defconfig
s390                                defconfig
sh                          rsk7264_defconfig
arm                            zeus_defconfig
parisc                generic-64bit_defconfig

clang tested configs:
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
