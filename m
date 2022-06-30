Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782BAC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Jun 2022 09:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbiF3JjM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Jun 2022 05:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbiF3Jio (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Jun 2022 05:38:44 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C102F25C9
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jun 2022 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656581923; x=1688117923;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IB9ZwQcwQ3blM2gesxKch5Xg1t95S9esrFKG5d91tzw=;
  b=A5cNV+8VH7965NJxkxss1Dn/DtlkFCud5m50jQltiffyhFxfXf+ArmQa
   DGdrOdcu3ObLwmY7aw1hE3m5ReFXScVIEJOX7KQVAXzivVs1xnFudC1/0
   RDWmgfwNlUK2QDxIBVySJVgqtEOTdzuxSI/ar4XwOuE4Evg08A73CRUzL
   DN2xAF9M5vtBAs749iNrl4+G61tUc6BsNzRJzNh2+lC07rEZLl3rbKsmf
   FFBpcNifuY90kpefJsdD7Ku4I8ohSk/KrPIHmt+CdKJi96xioImspZ8xG
   BwomRtyFJeINlAQN7ukzEmRxq4xZSGFk47MuzMWx60OFldkj4jHrYiBlV
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="279846520"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="279846520"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 02:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="595624594"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2022 02:38:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6qdG-000CZ0-2v;
        Thu, 30 Jun 2022 09:38:42 +0000
Date:   Thu, 30 Jun 2022 17:37:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f0aa153b6ce8018a052d9c05dc1b8483ac3a0f1a
Message-ID: <62bd6ee8.cKup6KGO1TGwOJ7a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f0aa153b6ce8018a052d9c05dc1b8483ac3a0f1a  hwmon: (pmbus/ucd9200) fix typos in comments

elapsed time: 720m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                       m5208evb_defconfig
powerpc                      ppc6xx_defconfig
m68k                       bvme6000_defconfig
m68k                         amcore_defconfig
sh                          landisk_defconfig
m68k                       m5475evb_defconfig
sh                               alldefconfig
mips                        vocore2_defconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220629
s390                 randconfig-r044-20220629
riscv                randconfig-r042-20220629
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         s5pv210_defconfig
arm                            mmp2_defconfig
powerpc                      ppc64e_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220629
hexagon              randconfig-r045-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
