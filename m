Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4D3C64ED6
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Feb 2023 05:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjBZFqx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Feb 2023 00:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBZFqw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Feb 2023 00:46:52 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F13DBEF
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Feb 2023 21:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677390412; x=1708926412;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wJ85PlpBWwo7YRCmlbT7xhHqVkjhqQULedzeYniK7QE=;
  b=MhVKHBh/AZbaxxT9zn4RogDoEpk2Eq8SjRBaAsbgk2/R/lTyEwcJ5MYO
   A8g0HYyE8U/ZVEVHqxDT824yjbIoBmIhT+t7MsOtl4oWWNfKIyj3/jhid
   g6oZcWVTFrxt4Sh1JAeemPuP5XFgs9VWpd7YkcZzguWGTV3TWNONbHP0e
   E+xlFZa0atiH/vN4JdTPbs4klodPaFPBex+OJ9qdLriW2gTcDtwRuy3O8
   ViOvLQg9UxWgxhxHs4w6GKv3vAA+ZpTYlp8HTKeK04I2XvK/2suaW5qyR
   Eun+qCTA0omjT7pWInylztyUtHlPOzVm47kWryl6kogy9pKGAKG4yOEcW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="321928364"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="321928364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 21:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="737250970"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="737250970"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2023 21:46:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pW9s1-0003ar-23;
        Sun, 26 Feb 2023 05:46:49 +0000
Date:   Sun, 26 Feb 2023 13:46:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 58326709e8f8122df46d29981eb39896d600c7c4
Message-ID: <63faf230.0FT20kWhDPKRGXkP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 58326709e8f8122df46d29981eb39896d600c7c4  hwmon: (nzxt-smart2) add another USB ID

elapsed time: 722m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
