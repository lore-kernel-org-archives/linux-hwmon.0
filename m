Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F91EC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Jun 2022 05:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242923AbiFPFqx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Jun 2022 01:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358633AbiFPFqv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jun 2022 01:46:51 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFE05B883
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jun 2022 22:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655358410; x=1686894410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WkcIlXQFjf0vFUQw6fvGxi8bh2IXulCXcV4MBgJrndE=;
  b=UKAfKxk7z8zCSPJh9xVut1U3lBNUNCbZp09F9e6TkbZYusj6GLzzZ3Um
   cSzXdrI4HiYL1KxjEUnZIaBWNYTqRvIf3NDzyKPVxYERplCf/kW3FGt8/
   dgF5aXpInQIKMtv41GLIuVxBrAdq28vaL08YDjraRnZP+rdST0Jh8slgZ
   bO9TLcJMNoM0QurdR5qZr9mWk9u5XJY6g0a9xo4nq2O/hLBbwDkt27DlM
   VzqcTKJu+COZMlWXise3s++wVBl4kSicqHmqOvj/nrQThKggldLXclS+y
   jD9HSdRSLV0U+nlNrjaRYMdWpv2zTr+UNajzYEoxfaCvxf1bOwEgdSy04
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259026203"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="259026203"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="653014487"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2022 22:46:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1iLA-000O73-G1;
        Thu, 16 Jun 2022 05:46:48 +0000
Date:   Thu, 16 Jun 2022 13:45:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 ec41c6d82056cbbd7ec8f44eed6d86fea50acf4e
Message-ID: <62aac397.nP+TftZLwXEdGOxL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: ec41c6d82056cbbd7ec8f44eed6d86fea50acf4e  hwmon: (asus-ec-sensors) add missing comma in board name list.

elapsed time: 798m

configs tested: 51
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
