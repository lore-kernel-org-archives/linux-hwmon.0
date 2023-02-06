Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBB7C61DA4
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Feb 2023 04:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjBFEyL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Feb 2023 23:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBFExy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Feb 2023 23:53:54 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A295F271F
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Feb 2023 20:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675659233; x=1707195233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a9Q9kfcsk+zGTByFDZByQ979dpgP7t7DAmoWHryV4/A=;
  b=CWG+Q/p7U8CvCaCqnM0HOpV8n9HfLfgrevq46jZy0Ke/DjAOjNp3NPOW
   gKvo/KX5VUV8JobXtG8O28A/Mhl9kmv+JjMfXfPtLfsSrAmL/28wJlQIq
   Rq1s6/MBBjhLoTLXHWr5QquiS+oqcraTQ8nuHhpSXwoJdwHCN1LjmfZHL
   4pTTwtNwbPIrtzL5oO/NwTCR4eKixIcYvcCLL4CU9C1RypKV6h3TuNVOS
   brd+Av2Q7OQPR/WmmcMMNm4ART4UukWZQPDwb0P4BZ0a25drmTgwf+wi+
   wBDHH23LGfKMdmcbTe1Av5O9tBr8StGOfoVbb6kV62N8ozLcfOyTcKiUO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317139204"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="317139204"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 20:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729893338"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="729893338"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 20:53:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOtVk-0002Om-32;
        Mon, 06 Feb 2023 04:53:48 +0000
Date:   Mon, 06 Feb 2023 12:52:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 32abdd3a9f66f0f32022954796d895fdaaadfc50
Message-ID: <63e087a7.SrCAoHUcM3jmex0i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 32abdd3a9f66f0f32022954796d895fdaaadfc50  dt-bindings: watchdog: qcom-wdt: add qcom,apss-wdt-sa8775p compatible

elapsed time: 723m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
ia64                             allmodconfig
x86_64                              defconfig
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
arc                                 defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a013
s390                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
sh                               allmodconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
i386                 randconfig-a011-20230206
arm                                 defconfig
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
arm64                            allyesconfig
i386                 randconfig-a016-20230206
i386                 randconfig-a015-20230206
arm                              allyesconfig
i386                             allyesconfig
m68k                        m5307c3_defconfig
arm                          pxa3xx_defconfig
powerpc                      pcm030_defconfig
arm                            pleb_defconfig
sh                 kfr2r09-romimage_defconfig
mips                  maltasmvp_eva_defconfig
arm                           sunxi_defconfig
arm                           tegra_defconfig
mips                    maltaup_xpa_defconfig
i386                          randconfig-c001
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig

clang tested configs:
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
x86_64                        randconfig-a016
i386                 randconfig-a001-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a005-20230206
x86_64                          rhel-8.3-rust
i386                 randconfig-a006-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a001-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
