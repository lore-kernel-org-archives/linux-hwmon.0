Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE403C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 10:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjADKTt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Jan 2023 05:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbjADKTr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jan 2023 05:19:47 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B5D167CF
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Jan 2023 02:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672827586; x=1704363586;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=32aXAje8A/sE9nWUgbeeHzy64NNpZEW31zVYXuZbDLo=;
  b=bFRX93IwhmjEa0A2ka9QqZPJ5lR+8ULaqbOMo3mA8EA2AVMJ6MjDouPx
   9+Zhes9YNTGPvgd9ftPTJH1/MEJeemhxabaXh2ai5gkIfnZB/lfh/ngRB
   vbs47jo9ZGgbN5y/Q+zMEn7jUH9l58WtzPKPM/uLQ2gw/9DzJGzX/LJlG
   Lu6RALgL2nICuGzT5DpJ332wkCBi0CcPF0Vs7+JcbDr+RC/rOu67wuQRy
   SCaQym0EViWu/++5PFzSdTyciJ6ZW/tIMRaXmU2v0CDes+r1eaJlTKkEI
   oA1+DGV2M62QnpLmoo1JdUs/jKQo2lffC9ZSSp3m9isEMFvryJ6rF0p7E
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="302273803"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="302273803"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 02:19:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="648534238"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="648534238"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Jan 2023 02:19:44 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pD0s3-0000F5-1D;
        Wed, 04 Jan 2023 10:19:43 +0000
Date:   Wed, 04 Jan 2023 18:18:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 2fbb848b65cde5b876cce52ebcb34de4aaa5a94a
Message-ID: <63b55292.75VpcD1L2UvfBhoX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 2fbb848b65cde5b876cce52ebcb34de4aaa5a94a  hwmon: (nct6775) Fix incorrect parenthesization in nct6775_write_fan_div()

elapsed time: 720m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
arm                                 defconfig
powerpc                           allnoconfig
s390                                defconfig
i386                                defconfig
s390                             allmodconfig
i386                 randconfig-a004-20230102
x86_64                           rhel-8.3-bpf
i386                 randconfig-a003-20230102
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
i386                 randconfig-a002-20230102
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                        randconfig-a015
i386                 randconfig-a001-20230102
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
m68k                             allyesconfig
i386                 randconfig-a005-20230102
arm                              allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64               randconfig-a003-20230102
x86_64               randconfig-a005-20230102
arc                              allyesconfig
i386                 randconfig-a006-20230102
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
x86_64               randconfig-a006-20230102
x86_64               randconfig-a001-20230102
riscv                randconfig-r042-20230101
x86_64               randconfig-a004-20230102
s390                 randconfig-r044-20230101
x86_64               randconfig-a002-20230102
arc                  randconfig-r043-20230102
i386                             allyesconfig
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101
ia64                             allmodconfig
x86_64                            allnoconfig

clang tested configs:
x86_64                        randconfig-a014
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a015-20230102
x86_64                          rhel-8.3-rust
i386                 randconfig-a016-20230102
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
