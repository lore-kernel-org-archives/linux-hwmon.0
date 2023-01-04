Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D77C4708E
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 10:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbjADK0u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Jan 2023 05:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234700AbjADK0q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jan 2023 05:26:46 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65D010E6
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Jan 2023 02:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672828005; x=1704364005;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lRY6g3zJ1Ds0RxjZy3wI4MBoVHBrd9Z6Rf5BzCkoP3E=;
  b=O1CxEb4z+JtwdSNtJ0Ry1AtYvartBxUNthPlWYxD4xly0ldpxjkAu3Xi
   mp1zsDn680IfeKt3XH8+tomctZ7JwzbrVyKFB2YF/AWJm5eDoxOiPn0mC
   M/n6Jo3cUFbBhIq+YlHuUixhO3RkILKF8oPAvKFhnZQgS1aaVRfZuqprg
   is2HTPJNRNzFMCYA3fvOYeuKFbZPJZlKz06XoIyXoihzyfApVZUk+/WuA
   +K6bKDLcwne94qaVGuuDCl0tpNpt9nwc+KvDSQtnZ8URRyKW87Jv3lBZQ
   uz1dfXf0JixBAEw4DmkEL1kVAvXJak7PdVnc6BtqpGdNhNeNtkws9HYdd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301593279"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="301593279"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 02:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762632464"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="762632464"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2023 02:26:44 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pD0yp-0000Fg-2H;
        Wed, 04 Jan 2023 10:26:43 +0000
Date:   Wed, 04 Jan 2023 18:26:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b0587c87abc891e313d63946ff8c9f4939d1ea1a
Message-ID: <63b5543b.sj00faMGFqBlEmps%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b0587c87abc891e313d63946ff8c9f4939d1ea1a  hwmon: (coretemp) Simplify platform device handling

elapsed time: 727m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arm                                 defconfig
s390                             allyesconfig
um                             i386_defconfig
arm                              allyesconfig
um                           x86_64_defconfig
arm64                            allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
i386                 randconfig-a004-20230102
ia64                             allmodconfig
i386                 randconfig-a003-20230102
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
i386                 randconfig-a005-20230102
x86_64                              defconfig
i386                 randconfig-a006-20230102
i386                                defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64               randconfig-a003-20230102
x86_64               randconfig-a001-20230102
x86_64               randconfig-a004-20230102
arc                              allyesconfig
x86_64               randconfig-a002-20230102
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20230103
x86_64               randconfig-a006-20230102
riscv                randconfig-r042-20230103
s390                 randconfig-r044-20230103
x86_64                          rhel-8.3-func
x86_64               randconfig-a005-20230102

clang tested configs:
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
arm                  randconfig-r046-20230103
hexagon              randconfig-r045-20230103
x86_64               randconfig-a013-20230102
hexagon              randconfig-r041-20230103
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
