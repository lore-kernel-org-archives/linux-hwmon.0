Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF659C636D3
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Feb 2023 04:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbjBDEpf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Feb 2023 23:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbjBDEpf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Feb 2023 23:45:35 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A641423D9F
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Feb 2023 20:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675485933; x=1707021933;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4/tRIJVncfCmy3syaWuXWLvVzIgWqc0mdLiowjYvegg=;
  b=EZq60aBdCpMMkCw8OzsVqHtAoMYk0G6t6y6PbBeFy5kvVfEyOOno6bAk
   Tvq4Dh2Xxyhhk7BUmxmmIeVGgBZFitPkzptwIIzKTDO0Hbq93Qg0z3yEo
   yWzsv/hLBhgSkIqoRyXaWw7CQok4fM3+7pIlHWTXojn+5/xcHhDb2iFom
   dei/YILnuGlIn4GTUkR4Cd25fG2G6VLCkFvbKb+WrATZfrC5jVR3TMmok
   tn2bkk4flUOWUBOfUjHVxSqwmDva6YkGBYP+8lEJjV4O/G2FPEtxjPfIb
   WWyJZ2g+4Bp0+Wz3xVZwvJqbNALldsV4Ba6+6aUANRYCVZ5wzglLUwkSu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328933126"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="328933126"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 20:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911381304"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="911381304"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 20:45:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOAQd-00012z-27;
        Sat, 04 Feb 2023 04:45:31 +0000
Date:   Sat, 04 Feb 2023 12:44:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e2de0e6abd91b05411cb1f0953115dbbbe9b11ce
Message-ID: <63dde2c1.81+M+WRKinVCdnIA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e2de0e6abd91b05411cb1f0953115dbbbe9b11ce  hwmon: (asus-ec-sensors) add missing mutex path

elapsed time: 720m

configs tested: 41
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
x86_64                              defconfig
ia64                             allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                               rhel-8.3
s390                                defconfig
s390                             allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                             allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
x86_64                        randconfig-k001
arm                     am200epdkit_defconfig
mips                       rbtx49xx_defconfig
powerpc                    mvme5100_defconfig
powerpc                     kilauea_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
