Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C559DC4167B
	for <linux-hwmon@archiver.kernel.org>; Sat, 31 Dec 2022 03:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236369AbiLaDXG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 22:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbiLaDWw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 22:22:52 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80E612A91
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 19:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672456971; x=1703992971;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fnZZp+Kl+iMzCk+h9IliaV6refzyB9iH0NQhM+bisNU=;
  b=gf7t2SiqbSwMUa/wmdaa1bdUc0sDoDpRdhnc2YM/w6h3WFOOwPtshILv
   ogKoYDCAaH7Bh1r1UiWutmB7D6pCwB26HkJCCI4hJ8RF+1mVKvZ8SAkfX
   LlKuihDpgILXTVUlts4Et57TM+iwId4alk0jXMaqqB4/dyZkNRX/zK1XJ
   dpJwVERwvkPSv7ASfcNOZj5Wyr4C5wxJucKbZ9XIRkdQMqL9hNZPY9wHh
   NYXCq3DLelnoQdFpi5Mhab5prPISaakmhySLqlxs/z944CYJNsfFGSh+V
   NI6qM0tjY2OQULyFWsZew7Ke2BmZu4HFO2kA8eFr5AiwCFN5lgFqKj7Z6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="407547205"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="407547205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 19:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="796376256"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="796376256"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2022 19:22:49 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pBSSO-000MvZ-2O;
        Sat, 31 Dec 2022 03:22:48 +0000
Date:   Sat, 31 Dec 2022 11:22:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 277f1da065af0680c339d7876becffa160707ac2
Message-ID: <63afaafc.137D6t4WJ5sViIxb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 277f1da065af0680c339d7876becffa160707ac2  hwmon: (ftsteutates) Fix scaling of measurements

elapsed time: 722m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
s390                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                              defconfig
x86_64               randconfig-a014-20221226
x86_64                               rhel-8.3
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a016-20221226
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                           allyesconfig
arm                                 defconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a005-20221226
i386                 randconfig-a004-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a002-20221226
x86_64                          rhel-8.3-rust
x86_64               randconfig-a004-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a005-20221226
i386                 randconfig-a006-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                 randconfig-r044-20221227

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
