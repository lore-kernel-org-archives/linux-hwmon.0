Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA8BC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Mar 2022 07:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbiCJHYk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Mar 2022 02:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238574AbiCJHYj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Mar 2022 02:24:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04DF5AEFA
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Mar 2022 23:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646897018; x=1678433018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DW4ZkjykbyMj9hKtNQeQHVqLXxJ1uy9HK9dUIuuugg=;
  b=SMeUNKVXC2LZsP21EFm6kvMRwGuGizOB7qETTOq7vBkVWek3A7N+5gVT
   s2mVvAORL4PZCfSuN8Iq4Ke2Nrfl/PUBA7S87lfsfqzbyW0uGwULDxygW
   7LEv9nBqi/FmNZX4nH/5pez+vKwOasZQrKmNx+S1lYz/3iXbHebHzhyd4
   Dl1SmMHCHJRRv4xoQb+mhaThFFFR5IknZEcBrXxN27Bcd2BjooCk8b40m
   tvZytwvevEgRG4i60uDbWZ7zlAnFOVhyr9LfT92XK0lttCI1ym/Ukd68F
   te9fvTlBrsEw4XlVRxOjHwYyDySBAzORHuG/U2/xmawAd6K+Nzs2zGUXa
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252749207"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="252749207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 23:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="554517163"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2022 23:23:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSD96-0004XS-4D; Thu, 10 Mar 2022 07:23:36 +0000
Date:   Thu, 10 Mar 2022 15:23:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [groeck-staging:watchdog-next 22/33]
 drivers/watchdog/mtk_wdt.c:13:10: fatal error:
 'dt-bindings/reset/mt7986-resets.h' file not found
Message-ID: <202203101530.3l4W0JyC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   b6447e51682d2d364b82ba35606888e39251dfcf
commit: 6c2b372365e1e64170e209a1e903c5cb64bebc63 [22/33] watchdog: mtk_wdt: mt7986: Add toprgu reset controller support
config: arm-randconfig-r001-20220310 (https://download.01.org/0day-ci/archive/20220310/202203101530.3l4W0JyC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=6c2b372365e1e64170e209a1e903c5cb64bebc63
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 6c2b372365e1e64170e209a1e903c5cb64bebc63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:13:10: fatal error: 'dt-bindings/reset/mt7986-resets.h' file not found
   #include <dt-bindings/reset/mt7986-resets.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/watchdog/mtk_wdt.c

  > 13	#include <dt-bindings/reset/mt7986-resets.h>
    14	#include <dt-bindings/reset/mt8183-resets.h>
    15	#include <dt-bindings/reset/mt8186-resets.h>
    16	#include <dt-bindings/reset/mt8192-resets.h>
    17	#include <dt-bindings/reset/mt8195-resets.h>
    18	#include <linux/delay.h>
    19	#include <linux/err.h>
    20	#include <linux/init.h>
    21	#include <linux/io.h>
    22	#include <linux/kernel.h>
    23	#include <linux/module.h>
    24	#include <linux/moduleparam.h>
    25	#include <linux/of.h>
    26	#include <linux/of_device.h>
    27	#include <linux/platform_device.h>
    28	#include <linux/reset-controller.h>
    29	#include <linux/types.h>
    30	#include <linux/watchdog.h>
    31	#include <linux/interrupt.h>
    32	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
