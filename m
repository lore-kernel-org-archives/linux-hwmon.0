Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD97C43334
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jun 2022 04:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237248AbiFPEet (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Jun 2022 00:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiFPEet (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jun 2022 00:34:49 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7003A5AA40
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jun 2022 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655354088; x=1686890088;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aauzzgaT6/TCUN+zr2BOmeGuOK7EuVgHB5nmqo3VpFY=;
  b=guSXJ+Jd9kJqkCdtExFS034jjVwtbvWmMu7Dyx6IZRsd0ya7OXeTm7XK
   Hdf54ZUNNEISRSdqX1pv+iiQpWtaySY+VStTnFxNP1t7u+0k1E2tiy7Ni
   V/ez2RFFju+wl7wC1dRDsLddps3xP34w3m/Iu2uiy0jhQfinZu888UQ2H
   1uRRwf8HOQb2JVAIPMl65XT13K97mFkummjaml7rg3jJxUsKRg9uqN9WE
   eBAPVvPgwd3gRZFBk1lP+mF2Yy831N41meP36coVDsh2t2nzaQwC+zV5M
   9CYIHGx/j7UP1hfd1nNN50ZpKyhTi/2DNoiaFKvWi/9jrGIGAoPgY+fHn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279879347"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="279879347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 21:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="589469965"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2022 21:34:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1hDS-000O2P-1i;
        Thu, 16 Jun 2022 04:34:46 +0000
Date:   Thu, 16 Jun 2022 12:34:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:master] BUILD SUCCESS
 31c6caf381923e4e8ec4c7e8f6f1df82fa690134
Message-ID: <62aab2d9.bolKgcr7i6uQnPGW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git master
branch HEAD: 31c6caf381923e4e8ec4c7e8f6f1df82fa690134  ARM: 9207/1: amba: fix refcount underflow if amba_device_add() fails

elapsed time: 726m

configs tested: 53
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
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
h8300                            allyesconfig
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
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
