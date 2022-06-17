Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A026C43334
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jun 2022 00:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbiFQASZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Jun 2022 20:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiFQASZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jun 2022 20:18:25 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A0356210
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jun 2022 17:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655425102; x=1686961102;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pcuuDby9Iu97ZMAsSzleX1e/oRPgjU9AHfJeXBetWns=;
  b=cKRzEUqe0LVhsKnAlbKlIuaisEAMEyiVMuyJZXOYG3Qi/EPEm+So4r8f
   UdigO5OPyoBDLSbSc+A77zO1wjHDHr3bJbr5lql0EdnN/OyKSo7geHJTs
   ReGAGMDNLGZcbJ+eB72oYp+BfNxlcKP5ZzHhChrebdjcEGPbqWLX9sgBE
   cW65btbK1I1cOipg6KWCGHiR8tcflovijJFiICJIG0ELagaPk+kLwZOIM
   HYJN+aIIaMOy0levcD7wDzaMbOWxG3jHRrdsn/p0rqtBQv2jv4W2ukcml
   STSLR0/dUzRLWCI7WFvFEFzk61nhoOFgcJ3/MsJfbVLmdFJSCMbEJxIZA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280097521"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280097521"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 17:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="653396465"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2022 17:18:21 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1zgq-000OuP-OS;
        Fri, 17 Jun 2022 00:18:20 +0000
Date:   Fri, 17 Jun 2022 08:18:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 ad9542b26754d1624658a69610588839aa39453c
Message-ID: <62abc83b.PmAE6X3y2HbEJ/w7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: ad9542b26754d1624658a69610588839aa39453c  hwmon: (dell-smm) Add Dell G5 5590 to DMI table

elapsed time: 1910m

configs tested: 56
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
