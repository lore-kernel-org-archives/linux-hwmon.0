Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8687C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 08:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbiAXIg1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 03:36:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:23805 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236382AbiAXIg0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 03:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643013385; x=1674549385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGMxF+c6CA6XbZj+hG6y0ZML5wA7ZQmrneegWvMtmuM=;
  b=FovFJ/cZKlwTGaeL0IRvcl0kNdkEjvL4+YAk5zFFhwFLpf/lR4s0/UEK
   sltmhk1oftQ9RkTkOVc2lSAeaW3gX311me+5nON8h2RVlOuO/K9XP8J3Q
   46Ryr40M8ZOpTM8oRXIhv0HDPevShpXxvVbApeAWZj6u93vIgAwzeahXb
   6D5xQuXucPZ6ccPbcJTtsyDQLqho97a4qz4DdKdPRMtpO+x5t8HDRDRQQ
   E6FecUoHKg8WREAGdvLL4C4rEtCOldaHD7AX0zPQgyN+yzm4T2ADHAsLK
   JSeSZlgnOWv17J1+29jysVGtXYETBBCkvQn1174QBsarRp/vhJ1r0nnO+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="233354936"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="233354936"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 00:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="768608766"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2022 00:36:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBupr-000I1W-8s; Mon, 24 Jan 2022 08:36:23 +0000
Date:   Mon, 24 Jan 2022 16:35:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Shych <michaelsh@nvidia.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [groeck-staging:hwmon-next 32/33] drivers/hwmon/powr1220.c:185:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202201241605.pf50OsUm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   9b9f1e670d2c61c676039474fd2d98ca0a54ff75
commit: 19d8ebde288924d3385763832ea99396c8b4fe8c [32/33] hwmon: (powr1220) Upgrade driver to support hwmon info infrastructure
config: hexagon-randconfig-r032-20220123 (https://download.01.org/0day-ci/archive/20220124/202201241605.pf50OsUm-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=19d8ebde288924d3385763832ea99396c8b4fe8c
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 19d8ebde288924d3385763832ea99396c8b4fe8c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/powr1220.c:185:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/hwmon/powr1220.c:185:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +185 drivers/hwmon/powr1220.c

   169	
   170	static umode_t
   171	powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
   172			    attr, int channel)
   173	{
   174		switch (type) {
   175		case hwmon_in:
   176			switch (attr) {
   177			case hwmon_in_input:
   178			case hwmon_in_highest:
   179			case hwmon_in_label:
   180				return 0444;
   181			default:
   182				break;
   183			}
   184	
 > 185		default:
   186			break;
   187		}
   188	
   189		return 0;
   190	}
   191	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
