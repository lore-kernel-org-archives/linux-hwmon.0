Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3DDC6FA8E
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Feb 2023 05:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjBZFqy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Feb 2023 00:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBZFqx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Feb 2023 00:46:53 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE10AE05F
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Feb 2023 21:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677390413; x=1708926413;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kgj29AIyxg2nO6PWoSzi8s3a1EPZ1KKlah0ZFlQcbEk=;
  b=LxGmF2w8wuInrTxzla2WRN1cDYYbWfeQBhEyTvytQePut1HleoXWx0sH
   JW0+s7xb4dz+pjHKz1YP/SCHhm8DeIVJP4bc9CtchMGpqWWRVajlU8iUe
   FRK5KmTE+thLGO/nYDTwwTUjTjcHXs5NPcnzBeLaNs1Y/87BZ5c16esUD
   8YTDz7j2jdoyR3GQkwOaigvf6J5siKl3kwOieMybjJHnoVJR+LjJ0x/69
   J3oAa6t/PVKcnARV92ag7Dz3Q3t+0ShGLfQUBtFnQIUgYfaDzketkimgw
   jk3YdzaF6E1o2tjRJFxheJz04ShlQm37hZCaIzFUBNPUmR+Tsj+gtJGW9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="321928366"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="321928366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 21:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="737250971"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="737250971"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2023 21:46:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pW9s1-0003ax-2H;
        Sun, 26 Feb 2023 05:46:49 +0000
Date:   Sun, 26 Feb 2023 13:46:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 7fa92c05cef7986c8eefeb995837f6d1166426e5
Message-ID: <63faf237.taj0Q0zCCOy5LFOJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 7fa92c05cef7986c8eefeb995837f6d1166426e5  watchdog: at91rm9200: Only warn once about problems in .remove()

elapsed time: 721m

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
