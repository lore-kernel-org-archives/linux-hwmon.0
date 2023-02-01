Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6411C05027
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Feb 2023 06:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjBAGqP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Feb 2023 01:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjBAGqO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Feb 2023 01:46:14 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5685834C2E
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Jan 2023 22:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675233972; x=1706769972;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IOdgIi2C3Nz5YrJT3NNe6PwC6PWWmvF8crAFTEW8QSI=;
  b=faT4HEsGmQUusxTPUmCyFL9ofoeY6Apmmb66GxSnGHAhFt/jQD8BT4dA
   KwwbUe2dEsdjUz5TCG94xbx9K5YnzTpkkoCaSjzH04KWlZUPuW89ZOCW4
   rIhLVZFemvVeMprjDI9Kdj4gtGHNd9064orQl/+Q6+abfvQYC0Drrmyic
   fwN/1NYK4A2/5qcDMz0oXvvgtoce/fhejlwVJraZQgXZVbUcJt+sbY9v/
   tMfmTqp8QjqxKtrtBHBsH6xttclKkh49FOF/qxsAGQLVUYQSBmM/tH2CZ
   +ds/BrH9JLDItEbx4Wvsa/bRZvwIk54HzZ7610JXEYat4g79GeUCb2PuR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355395156"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="355395156"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 22:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="733448382"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="733448382"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 22:46:10 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pN6sk-0005Aw-0b;
        Wed, 01 Feb 2023 06:46:10 +0000
Date:   Wed, 01 Feb 2023 14:45:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 9df46d5a95852fc1284d13e1988786ed3bde2457
Message-ID: <63da0a84.WRfCFkq8A0rO/X0W%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 9df46d5a95852fc1284d13e1988786ed3bde2457  watchdog: report options in sysfs

elapsed time: 724m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64               randconfig-a001-20230130
x86_64                              defconfig
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
x86_64                               rhel-8.3
x86_64               randconfig-a005-20230130
sh                               allmodconfig
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a002-20230130
powerpc                          allmodconfig
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
mips                             allyesconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
x86_64                           allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
x86_64               randconfig-a014-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
