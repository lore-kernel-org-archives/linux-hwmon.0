Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74099C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Mar 2022 21:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240780AbiCJVcI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343964AbiCJVcH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Mar 2022 16:32:07 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB462192CB4
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 13:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646947865; x=1678483865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EB8dIZFppbK+DL9XwZFi9S3vQv90aDPZqke7LiwZqJM=;
  b=YFum5RBXJGdL9vhZu6hDY2xG3Z5CGNJwA25YVXlDq+jrYwAF8UC2aItC
   paeiZMHmuAaArJHXSQ5SdneSBVkLXnE4wQBPJjyL8pi2y6qAvqRVz97tj
   THIyOeldi8zwdcJW+fSywSdP2y9HdpMM9Y48Qy73kJ5gY2CEQqDfRT6cX
   HbLe8SqscP7GCQBhMB//z560EHGOrtmlegP7zOX2uqRqc6B+8DENIPUqZ
   iN0e7NTIoMv2xrvWrSt1vTY7k5TRyKUkYKKv8/4kXw62elp1q113tJBdH
   XG9AR6K9WWpbps5Cl6wRBq2Tzdc3VwSEKW0+vfnsOLdYjCG8fjII6BM14
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280124218"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="280124218"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 13:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="514165793"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Mar 2022 13:31:03 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSQNC-0005Py-OG; Thu, 10 Mar 2022 21:31:02 +0000
Date:   Fri, 11 Mar 2022 05:30:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [groeck-staging:watchdog-next 22/34]
 drivers/watchdog/mtk_wdt.c:13:10: fatal error:
 dt-bindings/reset/mt7986-resets.h: No such file or directory
Message-ID: <202203110514.1vOt36pD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   d7e5876bf57044f8be42e2eecae47ea1d3e46f8d
commit: 6c2b372365e1e64170e209a1e903c5cb64bebc63 [22/34] watchdog: mtk_wdt: mt7986: Add toprgu reset controller support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220311/202203110514.1vOt36pD-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=6c2b372365e1e64170e209a1e903c5cb64bebc63
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 6c2b372365e1e64170e209a1e903c5cb64bebc63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the groeck-staging/watchdog-next HEAD d7e5876bf57044f8be42e2eecae47ea1d3e46f8d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:13:10: fatal error: dt-bindings/reset/mt7986-resets.h: No such file or directory
      13 | #include <dt-bindings/reset/mt7986-resets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
