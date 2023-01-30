Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C18C54EAA
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Jan 2023 13:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236724AbjA3NA1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjA3NA0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 08:00:26 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DE234304
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675083605; x=1706619605;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xb8qYDm+wYfa8X+YIL0yvSaKLYWlW87iKjqMp+guw68=;
  b=Z6XqVxrJPJJWR7h1I4x5lyHNhobtcKskBJy+LCHtncJvUsR9/CRQ4EBV
   zAUSWnlPHj//6cnYMCt6Tzirq5TkfAmdN0xdN/ABFgeJB4aRgcMDqAgg7
   nCdC2JXCz/swkOBHJeTPoMfcNQtbzTcmaMGf5d24UxVh8ZOneSqZyGd3g
   5CDCtvObpZxWbFw+2K/LRPxafDv7fsxvokvfiAlI+zVffroG5HxgYdSr1
   5KhhH/mL0/+XbcP1P2bb26AYCp+VBJSP/DCkg6xLmahXXWv7Lycnuafkf
   8NPSyDcy7bDl+tmSZFiqwUOHvVGIaRz63Cjoje7CqSY5rzCYNJIH73tbl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="329662480"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="329662480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="752812434"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="752812434"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2023 05:00:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMTlS-0003dG-1O;
        Mon, 30 Jan 2023 13:00:02 +0000
Date:   Mon, 30 Jan 2023 20:59:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 054d0c889cb50ecec17d67aa2ea11ccea42b71a8
Message-ID: <63d7bf47.xMhOUFTH9/g/CON8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 054d0c889cb50ecec17d67aa2ea11ccea42b71a8  Documentation: hwmon: correct spelling

elapsed time: 721m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
um                             i386_defconfig
x86_64                              defconfig
i386                 randconfig-a003-20230130
um                           x86_64_defconfig
x86_64               randconfig-a001-20230130
x86_64                           allyesconfig
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
x86_64                               rhel-8.3
arc                                 defconfig
x86_64               randconfig-a003-20230130
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
s390                             allmodconfig
arm                                 defconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20230129
m68k                             allmodconfig
x86_64               randconfig-a006-20230130
arc                              allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a005-20230130
i386                                defconfig
x86_64                           rhel-8.3-syz
arm                  randconfig-r046-20230129
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
arm                  randconfig-r046-20230130
arm64                            allyesconfig
arc                  randconfig-r043-20230130
arm                              allyesconfig
i386                             allyesconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
sparc                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                     ep8248e_defconfig
arm                         axm55xx_defconfig
sh                           se7722_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     asp8347_defconfig
arm                        oxnas_v6_defconfig

clang tested configs:
i386                 randconfig-a013-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
s390                 randconfig-r044-20230130
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
x86_64               randconfig-a014-20230130
riscv                randconfig-r042-20230129
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a016-20230130
hexagon              randconfig-r041-20230130
x86_64               randconfig-a011-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
