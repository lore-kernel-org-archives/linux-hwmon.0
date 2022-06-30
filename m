Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739BBC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiF3Jop (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Jun 2022 05:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiF3Jop (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Jun 2022 05:44:45 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F6242EFE
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jun 2022 02:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656582284; x=1688118284;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9+4qlaxB1GY0LMfb46XLCo/0U2ixiG6AJKzuJIYWde0=;
  b=KITmRxnhtwj3CIIaW5RPFCLHCqcPLpcDWhAHxvOxH9gT/caaPPWnffks
   EZsnzACc/+TbqHgpuoGcT1PvV64MvrmcPP/RuEEYc8W1ztmsUEHXxGS4J
   /5IeBWFcvBcxWKT0mUEL24HKs9dew/1FQTlPW5k7YdQYxXttVAvQJhohj
   QU/PhYFWFKWy0zHh1FrYQrt6168xXCaw0PXGZ2sbIkWfB7zag7ooNlbTE
   4T9xgFUSKBkmJZxo6QSh35eOVC8wE03wG7zmetedlKsiG8hQ5J5ojDI7w
   CDsQfNalv2k1ug4St/RkuXxsOp0Qs1Ia/oNPyCxSbT6UvdluSmluapmle
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283400717"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="283400717"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 02:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="837541970"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2022 02:44:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6qj4-000CZG-7z;
        Thu, 30 Jun 2022 09:44:42 +0000
Date:   Thu, 30 Jun 2022 17:44:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 d8cefa3f8df07c63f696bfe3ef459936c4580753
Message-ID: <62bd7085.shzYV5Lhi5q25m5T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d8cefa3f8df07c63f696bfe3ef459936c4580753  hwmon: (asus-ec-sensors) add support for Maximus XI Hero

elapsed time: 726m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220629
riscv                randconfig-r042-20220629
s390                 randconfig-r044-20220629
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220629
hexagon              randconfig-r041-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
