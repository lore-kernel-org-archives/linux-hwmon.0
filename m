Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BEFC54EBE
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Jan 2023 06:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjAPGRQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Jan 2023 01:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjAPGRQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Jan 2023 01:17:16 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E203C2C
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 22:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673849834; x=1705385834;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aX/W/8OPOWKrosuC1Ag6Uf5cGi23T5KgdfRXXE1PjgI=;
  b=BTEbZn7QcwS04j295n6mjF19NH6ChUiWD9L2C0tpJczi24HkhmsEUylj
   jT2me7Hip+ApBPCrsdD4DcesoXStRpcwhqe5D3GX3fwVnqF6l5sCNi+r5
   QxYNelD+w0gLU0BWgeE0odAtTTGrQErbUB7VzHG+gEdXS4Z6Xaehy6xF8
   lQ9BUvm85l6DYfOtkqIpqX95sEpucUsP40ZcAxnDxqK+y3i5E+5bx9vsV
   3zOz/kvnhYKu0SVsIJLVWOFgbcLtw2DVwbrGgrj6CPZLQWGk8IcIX2bVj
   peqWI04aIHynAo6lMvdGHJ/+wfg49H9+CE0fxNdecx4pIqWOCzveqfBGa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="324452955"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="324452955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2023 22:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="904223337"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="904223337"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jan 2023 22:17:12 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHInv-0000CR-2u;
        Mon, 16 Jan 2023 06:17:11 +0000
Date:   Mon, 16 Jan 2023 14:16:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 774dccfe77dcd8cf1d82df1f61fe95a720dc76e4
Message-ID: <63c4ebc6.AFhF6kX+IvsiPU6t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 774dccfe77dcd8cf1d82df1f61fe95a720dc76e4  hwmon: (ftsteutates) Add support for fanX_fault attributes

elapsed time: 724m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
i386                                defconfig
x86_64                           rhel-8.3-bpf
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
um                           x86_64_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
arc                              allyesconfig
alpha                               defconfig
s390                                defconfig
ia64                             allmodconfig
i386                          randconfig-a014
arc                  randconfig-r043-20230115
i386                          randconfig-a012
m68k                             allyesconfig
i386                          randconfig-a016
s390                             allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
x86_64                          rhel-8.3-func
arm                  randconfig-r046-20230115
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
i386                          randconfig-a003
mips                             allyesconfig
x86_64                        randconfig-a011
powerpc                          allmodconfig
i386                          randconfig-a005
arm64                            allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a015
arm                              allyesconfig
i386                             allyesconfig
nios2                         10m50_defconfig
powerpc                     stx_gp3_defconfig
loongarch                           defconfig
arm                        mini2440_defconfig
powerpc                   motionpro_defconfig
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
x86_64               randconfig-k001-20230116
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116

clang tested configs:
i386                          randconfig-a013
hexagon              randconfig-r045-20230115
x86_64                          rhel-8.3-rust
i386                          randconfig-a011
riscv                randconfig-r042-20230115
i386                          randconfig-a015
s390                 randconfig-r044-20230115
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a003
hexagon              randconfig-r041-20230115
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a014
arm                          pxa168_defconfig
powerpc                   bluestone_defconfig
mips                     cu1000-neo_defconfig
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
arm                  randconfig-r046-20230116
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230116

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
