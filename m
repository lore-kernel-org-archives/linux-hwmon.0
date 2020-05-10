Return-Path: <SRS0=Zk20=6Y=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB53BC38A2A
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 May 2020 04:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD617218AC
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 May 2020 04:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgEJE2X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 May 2020 00:28:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:9575 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgEJE2X (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 May 2020 00:28:23 -0400
IronPort-SDR: rohFQNxBKkhadCeKU2MhGWQrJoAEgp2PMl6a0iPy8evx/hddXqY3vPFWbHSD3/2wAglU+pyGx8
 XTFWudksOe6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 21:28:22 -0700
IronPort-SDR: Z7JhTNWyGfjNKdBBBaFLzrf6xhSMo+A1GnRzLm4U0bzf7RDUk2Gw2jsTi/NEWlr6tfg01/PKP5
 576LwqEPLBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,374,1583222400"; 
   d="scan'208";a="250159587"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 May 2020 21:28:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXdZc-000Ci3-G8; Sun, 10 May 2020 12:28:20 +0800
Date:   Sun, 10 May 2020 12:27:41 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 bcb543cc3d4034da3f3fd8bc4296a26dfeadf47d
Message-ID: <5eb782bd.7ZlbNni3UaeyuWQ6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: bcb543cc3d4034da3f3fd8bc4296a26dfeadf47d  hwmon: (drivetemp) Fix SCT support if SCT data tables are not supported

elapsed time: 484m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                       allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200510
i386                 randconfig-a005-20200510
i386                 randconfig-a003-20200510
i386                 randconfig-a001-20200510
i386                 randconfig-a004-20200510
i386                 randconfig-a002-20200510
x86_64               randconfig-a016-20200510
x86_64               randconfig-a012-20200510
x86_64               randconfig-a015-20200510
x86_64               randconfig-a013-20200510
x86_64               randconfig-a014-20200510
x86_64               randconfig-a011-20200510
i386                 randconfig-a012-20200510
i386                 randconfig-a016-20200510
i386                 randconfig-a014-20200510
i386                 randconfig-a011-20200510
i386                 randconfig-a013-20200510
i386                 randconfig-a015-20200510
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
