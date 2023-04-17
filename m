Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C352C77B61
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Apr 2023 03:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjDQDKR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 23:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjDQDJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 23:09:39 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5206E40EF
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 20:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681700944; x=1713236944;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4iqkQhPATmaD9dv7+zYQ+xHwMhmk/tVDTbQ7Ak7QTHE=;
  b=gkxaWqJ0zgDSP1IW/iC8j7VWBdZGA3vebU41EBsJZWYFkRecVLyRqJKU
   scFNQrFz5tC37IZiJcz86SyVNt51UffIC9m1iNyjSSWek/xdEwz14Kwxp
   ZqvDT+k7P1olOrbBgXmViUl7hS0CGoUYePMF0FIrWSu1DI1qyzaP1oscp
   yJILSmA4I1kkxGJx+DrpjtIVMq3dYJEICe4WL0sNeWcnYgTcOftFaDPw/
   d6piEddf18hIiSQmuIgheyLQ9Tao2s7OWNYh+5teS2qGiHi/a1+QRXj5o
   SRQkwRWAW86JLs1Nr7pe7ACwy9W+/AnZ9QIX5A4ndeSI5xV6YHhXBcLOU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="328955163"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="328955163"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 20:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723111196"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="723111196"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2023 20:08:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poFEE-000c5n-1c;
        Mon, 17 Apr 2023 03:08:30 +0000
Date:   Mon, 17 Apr 2023 11:08:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 1dc8e097967b69a56531c9ccb70b854771310e85
Message-ID: <643cb812.Uih5RmX4TPBuXaZr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 1dc8e097967b69a56531c9ccb70b854771310e85  hwmon: (k10temp) Check range scale when CUR_TEMP register is read-write

elapsed time: 722m

configs tested: 43
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
