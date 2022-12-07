Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDBEC352A1
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Dec 2022 11:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLGLJT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Dec 2022 06:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiLGLIg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Dec 2022 06:08:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF908DBE
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Dec 2022 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670411168; x=1701947168;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DMCN8Y6DuSnxrwFHeyizZwsDd61XOfe3OENM4V39VBs=;
  b=hTjqTz6QMUJ3W78FK1owTuY9F1QizesDFirDeSbESkneA1s59mSCtHGO
   1q0Ksscp/q3ZmtmIvZg4To8k0bDfJvcjdpIWiSlGfqgeALPYlIYkafyuU
   QdJjnQo1mR9ILU3Wo1WWAC8sKcu4wqld/kwJHyOoPD7Qpe8mQBr+kw1jt
   It/0XFiocJ3fUOGamXlsAFg9bYnnUkmgz5CTLv9Ixq2CTFONDVx+yAmc4
   6n+IfOE2f9LcK2fBIQUE443otWRxPJCnmlUkxj/dw63OtOVLnFUMOfEIy
   42PmhoYO/fto46KJuQIVOSw30NnxuKrT2Rsr5jzfUH/xr70+bjXDwZAbI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="304495357"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="304495357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 03:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="891762302"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="891762302"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2022 03:06:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2sFV-0000B7-2s;
        Wed, 07 Dec 2022 11:06:01 +0000
Date:   Wed, 07 Dec 2022 19:05:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 364ffd2537c44cb6914ff5669153f4a86fffad29
Message-ID: <63907373.v0JCFopeaEqilGP9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 364ffd2537c44cb6914ff5669153f4a86fffad29  hwmon: (emc2305) fix pwm never being able to set lower

elapsed time: 721m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
alpha                            allyesconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                  randconfig-r046-20221206
arc                                 defconfig
arc                  randconfig-r043-20221206
s390                             allmodconfig
alpha                               defconfig
x86_64                        randconfig-a004
x86_64                              defconfig
x86_64                        randconfig-a002
ia64                             allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                               rhel-8.3
i386                          randconfig-a005
s390                                defconfig
x86_64                          rhel-8.3-rust
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
i386                          randconfig-a014
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221206
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221206
s390                 randconfig-r044-20221206
riscv                randconfig-r042-20221206
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
