Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894CEC636CD
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Feb 2023 05:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjBDF5g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Feb 2023 00:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBDF5f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Feb 2023 00:57:35 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F2049952
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Feb 2023 21:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675490254; x=1707026254;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NREr4MZ6CYP2rVjkz3iqyxPZR8cVFC/cmoTAaFkPiSY=;
  b=B2K4852lcjSxqRZfIeTUhrkNS3AKmdvyJkA364u+6y7jxXg8SBamTwDs
   QNL1postJTN9cvIXfQGHAhav8mjyZqMeNKQi+BbZGb+mdx/d3oihgGfPy
   sAA12EEIX9TSRX2qyiLCf5RHCZSaEWOVwoXvTaxlVM0tCho1xaGdmlPOE
   HDNJPm+61hXE6PeIJmVQ7QJwpmIYv5M+X4tV3/UeIe3A+g4e7t2vK1xfa
   iSSq5mjDsBYHJR7BNy17SYDOOlC4pkm0LU2+a8zH/u8JFZI21NldkWkDK
   /AYJe5oeXvku/HHpjvfOghczvQJN3746qNJs2a30HHK581UNai+eZGKX+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327556658"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="327556658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 21:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729482015"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729482015"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 21:57:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOBYL-00015D-0W;
        Sat, 04 Feb 2023 05:57:33 +0000
Date:   Sat, 04 Feb 2023 13:57:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7505dab78f58c953b863753208eeca682e8126ff
Message-ID: <63ddf3b0./BjCw6z2GYrLrXcM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7505dab78f58c953b863753208eeca682e8126ff  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Aquastream Ultimate

elapsed time: 792m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
riscv                randconfig-r042-20230204
s390                 randconfig-r044-20230204
arc                  randconfig-r043-20230204
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
sh                   sh7724_generic_defconfig
powerpc                         ps3_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                 decstation_r4k_defconfig
alpha                            alldefconfig
i386                             allyesconfig
sh                        edosk7760_defconfig
powerpc                       eiger_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
sh                           sh2007_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230204
arm                  randconfig-r046-20230204
hexagon              randconfig-r045-20230204
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
