Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D821C3DA7C
	for <linux-hwmon@archiver.kernel.org>; Sat, 31 Dec 2022 03:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiLaDXH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 22:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbiLaDWw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 22:22:52 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A813D12AB2
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 19:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672456971; x=1703992971;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q+i5/anPiLAwh0pQlv/Eiv0ICOvyW/DnWp6CUnAkwGM=;
  b=BHlkPBBnkC0RO8y8CKA2MTmoMJq2P7xuT63orPNOPi5MLwT3dAjmMfLL
   nhO7cWoFNsNvW0lSm03xcQiA1Y2jPwQ/vF4c3PnPBKAiVPS0nT1zBLBg/
   5YmlED068YW0/RPkvBGE0s8rGkgV7U8RbfkKqtA6vjgZGCdg296Mtym/H
   RjXGgATMy1X3zyGtc2V7/qvhuVS4DBF6BNe0rhA2BojlFREZqwD6OYkPd
   0hw3P0R/Q7GYjAoQaPLW2E8HvaVC1CBo4gRGWqkwU/aHecF1icGUsrq1l
   4GrWmWhzVTXxEcutGZObzXOTqY07cNuCmXxhLGA2wZqksowd3kB/BknNP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="318978282"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="318978282"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 19:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="982797988"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="982797988"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Dec 2022 19:22:50 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pBSSP-000Mw8-0S;
        Sat, 31 Dec 2022 03:22:49 +0000
Date:   Sat, 31 Dec 2022 11:22:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 3cf5ad9eb41101658b601d718c40cdc54f1e9bde
Message-ID: <63afaaf7.HQbtJiCeeUUikh5B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 3cf5ad9eb41101658b601d718c40cdc54f1e9bde  hwmon: (aht10) Fix some kernel-doc comments

elapsed time: 721m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
x86_64                    rhel-8.3-kselftests
i386                                defconfig
i386                 randconfig-a016-20221226
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-bpf
i386                 randconfig-a015-20221226
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
ia64                             allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64               randconfig-a012-20221226
x86_64               randconfig-a014-20221226
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
x86_64                            allnoconfig
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a005-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a002-20221226
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
x86_64               randconfig-a006-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a005-20221226
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
