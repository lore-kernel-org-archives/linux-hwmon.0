Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789C2C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jan 2022 17:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbiAJRVJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Jan 2022 12:21:09 -0500
Received: from mga03.intel.com ([134.134.136.65]:54195 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238145AbiAJRVH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jan 2022 12:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641835267; x=1673371267;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OsRWe94tzO+v5m/hGVU/Wy1RBaj4iKDiAh/F5rmb9IY=;
  b=Nu/2a4B5IFycMxO0DKINR+N90yaOeL+MDa6JCgxrbmiI8qsnoRkE8R+h
   WCK0UdTqhhcyb4yVjIvVcCagpe88oBA64mNMysdxmuu+9HhnuxDxJ9BAJ
   HcZZfP3EX/vVcX1tT4UBAmGriRz7/wGo96iuRTiARhMit5m1DEtJpNeWQ
   lnH/eE37mPxsBa3cevmUic9JryntN6p/NGLw9ZSpR3u2XHoSuF0Luv9Yl
   yVRkRPwLBb1MfWBUtiHmvQljmGOmdAij7v1OryGX94w/54QvC+IsCb7oJ
   sffMk3fSxUmsrzvfOOotfDzAb3C1EoTE5M4xRipNZUKWFPDcB98w8nfgJ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243226078"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="243226078"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 09:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="622742473"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 09:21:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n6yLx-0003mF-SE; Mon, 10 Jan 2022 17:21:05 +0000
Date:   Tue, 11 Jan 2022 01:20:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 00f5117c5f785b95b13663e52dcdcf684a47d4e3
Message-ID: <61dc6add./qgm6EMCEyNhC66e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 00f5117c5f785b95b13663e52dcdcf684a47d4e3  hwmon: (nzxt-smart2) make array detect_fans_report static const

elapsed time: 722m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
