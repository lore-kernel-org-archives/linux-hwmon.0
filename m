Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6228BC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Dec 2022 06:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiL2Gsy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Dec 2022 01:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiL2Gsx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Dec 2022 01:48:53 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E5711C18
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Dec 2022 22:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672296532; x=1703832532;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BRMiXFq9Rc4ZFbbtxVPVD8Gn0L/FAC1bHEibZG//fFs=;
  b=E0qxrzT3Sm3GpE6xY+zePjOXTv78GphbQa34nA5CV2abhPCpHxHxWdTE
   ZO8/JoyE57ZszyuKcJJtvsvF9DFKFLdrxJ4FcOvk3++WyE87ibvGIKull
   cATexEoPwL8ldGBP/Q4GzgO/VfQVbpakBrWf47tNJFGmlh00Hhg4o+1+i
   XkyS0UmfXJFNOFnt/cgfmTkSltGZWVnEOv1uIYX+bTX6xC8SqOQYXW9e0
   88pLfP71DafOKoUV0i3EYmGjBEQXeCEZJDlyNNq2xUXG9uxpgo/2W9XrV
   Nvzf/w5RxFSf/Ym1GJMeYE12nCNFI0XQ13NsEKFEXvrPuK8e5bYHwnSXq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="301358397"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="301358397"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 22:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="827605104"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="827605104"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Dec 2022 22:48:50 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAmig-000GMv-0G;
        Thu, 29 Dec 2022 06:48:50 +0000
Date:   Thu, 29 Dec 2022 14:48:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8baa3cfc80b632cb2bb31658fab5cc44d4ef862a
Message-ID: <63ad3842.2hZcQFt/iPVpEmAB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8baa3cfc80b632cb2bb31658fab5cc44d4ef862a  hwmon: (coretemp) avoid RDMSR interrupts to isolated CPUs

elapsed time: 722m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
arm                              allyesconfig
s390                                defconfig
powerpc                           allnoconfig
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                                defconfig
i386                 randconfig-a014-20221226
i386                 randconfig-a012-20221226
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
x86_64                               rhel-8.3
alpha                            allyesconfig
arc                              allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a014-20221226
x86_64               randconfig-a013-20221226
m68k                             allmodconfig
x86_64               randconfig-a011-20221226
sh                               allmodconfig
x86_64               randconfig-a012-20221226
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
i386                          randconfig-c001
x86_64                        randconfig-c001
arm                  randconfig-c002-20221225
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
x86_64               randconfig-a003-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a006-20221226
x86_64               randconfig-a006-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
s390                 randconfig-r044-20221227
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
