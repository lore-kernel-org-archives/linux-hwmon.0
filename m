Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F5FECAAD1
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 03:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiIADC3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 23:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiIADC2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 23:02:28 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CAEB9432
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 20:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662001347; x=1693537347;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xh3DSr2Q5p96riDuzhH7bpReEgfjbTCCLStrky5DPz4=;
  b=N1ZAxOejHQVipo01WXPNWwow7p8eDmXF72do/bzMcI3q5PZhKvur7Qsc
   ++sskaFAUhX9SNHppCiD9yMIRovijOBGZLXrAlbY+n/F+Q25VcrhI7UOw
   oqVswHYi0iSBFUH/k6hG8GWlbdeP1v9jZ2ylJsO1xbF4sIopTFiMQ+nSh
   R1ep72iUpZ0kyf/EUZBbu6BfjvS/T+vIzVtAvfAkq51RgWPSUsVCiHowu
   aoBCg2hBWh9cCs/Is+rPEup1FivGrZg6nnWzYsVj39T5U0jRPEfQIFkkL
   QZUtE4tlc3xYt+pRc9qzptTd6iuYBFftMlbxspggRFGh2PUYbx1XcSg2O
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381898178"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="381898178"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 20:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="642137678"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:02:25 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTaTI-00011A-0t;
        Thu, 01 Sep 2022 03:02:24 +0000
Date:   Thu, 01 Sep 2022 11:01:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9e544d72f31a8022613929075f8436780af7ff71
Message-ID: <63102090.5maBd71RHuplgHu8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9e544d72f31a8022613929075f8436780af7ff71  docs: hwmon: add emc2305.rst to docs

elapsed time: 724m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arc                  randconfig-r043-20220831
arm                                 defconfig
um                             i386_defconfig
riscv                randconfig-r042-20220831
powerpc                           allnoconfig
um                           x86_64_defconfig
s390                 randconfig-r044-20220831
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arm                              allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a004
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
x86_64                        randconfig-a013
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
xtensa                         virt_defconfig
powerpc                        warp_defconfig
arm                        multi_v7_defconfig
arm64                            alldefconfig
loongarch                           defconfig
loongarch                         allnoconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r041-20220831
hexagon              randconfig-r045-20220831
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
powerpc                          allyesconfig
arm                      pxa255-idp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
