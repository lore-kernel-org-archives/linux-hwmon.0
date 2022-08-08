Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E15C00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 23:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbiHHXTl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 19:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiHHXTk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 19:19:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3730B183BD
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660000780; x=1691536780;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mNoG5aqkA7ywCwHm/2ajniuWQow1m6KjecOPaHWhvko=;
  b=bzE2iu5j4Iw+rh94Zd1WyPKxlP8AmVuYjkCK3FRENoyGoEclFSe85erq
   f+6eVXm7Ju3lzgk4XMQp8lZqmNj2Uc3tt3rfmxA7soYqKshhR1VMIvVMw
   opla91gheNewxjkK/XQeKCdqPLWAd28J1GMySpTEcr+ek/e4e80nGDv6p
   CSoay2z+b86nennbttnxcamm+xUZkvSk1S1Ema6OurttvbKjsm3fpk98k
   MwJl7s0zExJED8MyFW87vX/E5IPq7iUpvha9HmyHoJlsu+1FZUJyLOPBD
   wHVHq0iYgcfELosuJhNzSAN0Vd8Kiqm1KYWUYRoK8YPvLCmtKFwCRrADr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="290718049"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="290718049"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 16:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="604548062"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Aug 2022 16:19:35 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oLC22-000MaT-2d;
        Mon, 08 Aug 2022 23:19:34 +0000
Date:   Tue, 09 Aug 2022 07:19:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 da519304c1ad381d3fd31d45025c14c908147bc9
Message-ID: <62f199f1.H4cMDLsnbzL7EsDl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: da519304c1ad381d3fd31d45025c14c908147bc9  hwmon: (lm90) Fix error return value from detect function

elapsed time: 695m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
x86_64               randconfig-a003-20220808
x86_64               randconfig-a004-20220808
s390                 randconfig-r044-20220807
x86_64                              defconfig
arc                  randconfig-r043-20220807
riscv                randconfig-r042-20220807
sh                               allmodconfig
i386                                defconfig
x86_64               randconfig-a001-20220808
arm                                 defconfig
x86_64               randconfig-a005-20220808
i386                          randconfig-a016
x86_64               randconfig-a002-20220808
i386                          randconfig-a005
x86_64                               rhel-8.3
i386                          randconfig-a012
x86_64               randconfig-a006-20220808
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
i386                          randconfig-a001
i386                             allyesconfig
arc                  randconfig-r043-20220808
i386                          randconfig-a014
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
alpha                            allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                ecovec24-romimage_defconfig
mips                      loongson3_defconfig
loongarch                        alldefconfig
sh                           sh2007_defconfig
arm                             ezx_defconfig
parisc64                            defconfig
powerpc                 mpc837x_rdb_defconfig
arc                         haps_hs_defconfig
nios2                            alldefconfig
i386                 randconfig-c001-20220808

clang tested configs:
riscv                randconfig-r042-20220808
s390                 randconfig-r044-20220808
i386                          randconfig-a011
hexagon              randconfig-r041-20220807
i386                          randconfig-a006
i386                          randconfig-a013
hexagon              randconfig-r041-20220808
i386                          randconfig-a015
hexagon              randconfig-r045-20220807
x86_64               randconfig-a012-20220808
x86_64               randconfig-a016-20220808
x86_64               randconfig-a011-20220808
hexagon              randconfig-r045-20220808
i386                          randconfig-a002
x86_64               randconfig-a014-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a015-20220808
i386                          randconfig-a004
i386                 randconfig-a016-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a015-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a014-20220808

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
