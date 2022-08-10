Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B422FC19F2D
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 02:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiHJC5J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 22:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiHJC5J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 22:57:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E956E894
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 19:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660100228; x=1691636228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3tLOP7kIQPKR5+K6rCDZMeqrM1zXYu5C3Ohm1HdsnaI=;
  b=J36Q6sgxlOlILgHgIBB8a3yLHzscVUCfQXQnQuD7Ud+NQ85Gh6/av7ka
   OakG9JLnP/rj/ShmL2S6idl/msL5p4oP9sT0CkhCdHyDBR4JGxThZsaQl
   cI1Dytsg2VB9UU5pn/erdYmUj1GEFDxt0oelrLS9hVxR1oCEqS4XEp8lI
   9fbMm8Hy4bk3NSDX7OxJN8tbDpIdl1MIK36pJlYik9wLF8c0Vcayp04cY
   QdXV7ja9/DusuFGtI1AAj8/lXHlshharw+ur1UaI5WuOqMSpbS0YUhWKz
   RnCPdZQJDwPxAOL4nGL13baVOwOSQBMsPXPK/O+YfHj0ZIc0+8CAWtPeb
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316926433"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="316926433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 19:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="555572455"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 19:57:06 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oLbu6-000NSD-0d;
        Wed, 10 Aug 2022 02:57:06 +0000
Date:   Wed, 10 Aug 2022 10:56:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 06bfee84a1c1d2325ad54da70a6a3ddc36c23d9a
Message-ID: <62f31e73.E9DtedH0gTCrv2bP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 06bfee84a1c1d2325ad54da70a6a3ddc36c23d9a  dt-bindings: hwmon: sparx5: use correct clock

elapsed time: 715m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220809
riscv                randconfig-r042-20220809
s390                 randconfig-r044-20220809
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                             allyesconfig
x86_64               randconfig-a006-20220808
x86_64               randconfig-a005-20220808
x86_64                              defconfig
i386                 randconfig-a001-20220808
i386                 randconfig-a005-20220808
x86_64                          rhel-8.3-func
x86_64               randconfig-a003-20220808
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a004-20220808
powerpc                           allnoconfig
x86_64                               rhel-8.3
i386                 randconfig-a002-20220808
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a001-20220808
i386                 randconfig-a003-20220808
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a002-20220808
i386                 randconfig-a004-20220808
i386                 randconfig-a006-20220808
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
arm                                 defconfig
m68k                             allyesconfig
arm                              allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220809
hexagon              randconfig-r041-20220809
x86_64               randconfig-a016-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a014-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a016-20220808
i386                 randconfig-a015-20220808

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
