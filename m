Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AF3C54E94
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Jan 2023 11:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbjAYLQz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjAYLQN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 06:16:13 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F8F582AC
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 03:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674645361; x=1706181361;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4+vTRrDuTCpEre/qVy/aNfoHBt0INTHHSFIN8hA0vSY=;
  b=HePQBDn8e38M31g/nnMTfOxAGCcjxXzLdNUn4+XEx8V7Yir5PgZnY8sR
   98kfkIln5e97KvqJTDL5ORcC71XIJgUPxe+oXnCrHCeLhTBc0YFirrcgl
   08MGeBCKqqZzAmAnfqvZQwKv/BcoDYQzZhtT+69wzlhSUV2TFBCd7i/To
   ZpFnIClMvpiehKqA9r2cryQKvG8Jol48f5idwFqfOahLdwU0ztHgVC4zr
   F6J70+9xqh2qfnTJtBeLlmE2eTa0kzUNn5q+8FDys+XzFE51IPjU9jvbX
   yyLMCBZkA10+qEB4+TEJvzceVVAF+wcejr60HN0/meEGkeEmUyB8B5DCw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306194978"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="306194978"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 03:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836316437"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="836316437"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2023 03:15:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKdkx-0007GC-24;
        Wed, 25 Jan 2023 11:15:55 +0000
Date:   Wed, 25 Jan 2023 19:15:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 ecabca1a36d59ec32fa315f3dc2e81784670b25b
Message-ID: <63d10f44.ltDdflGPZdh1xXiU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: ecabca1a36d59ec32fa315f3dc2e81784670b25b  hwmon: add initial NXP MC34VR500 PMIC monitoring support

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301251348.HFHcROTP-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301251734.bFyrYeeG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/hwmon/mc34vr500.rst: WARNING: document isn't included in any toctree
FATAL: modpost: drivers/hwmon/mc34vr500: struct i2c_device_id is not terminated with a NULL entry!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- m68k-allmodconfig
|   `-- FATAL:modpost:drivers-hwmon-mc34vr500:struct-i2c_device_id-is-not-terminated-with-a-NULL-entry
`-- x86_64-allnoconfig
    `-- Documentation-hwmon-mc34vr500.rst:WARNING:document-isn-t-included-in-any-toctree

elapsed time: 721m

configs tested: 62
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
s390                             allyesconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
x86_64                           allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arm                                 defconfig
x86_64               randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64                           rhel-8.3-syz
x86_64               randconfig-a006-20230123
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a005-20230123
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm64                            allyesconfig
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a004-20230123
arm                              allyesconfig
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
