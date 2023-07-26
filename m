Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C00C0015E
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 20:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjGZUjq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 16:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjGZUjm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 16:39:42 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790BA2738;
        Wed, 26 Jul 2023 13:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690403975; x=1721939975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+cKLNA4uUiuEQu3I0iTXUMTurCFF5eAeJR+RIRkfok=;
  b=jwyFvLXAZNtLcNR7RbHvep54Bk8JMdS8aMYBVpiOTeA+RnIHBDILMONO
   Ytfd9yAFJbkJBiW2X579hMcct8YmeBhQl+qI7YgGNUtdy/nsvLS3I7A1X
   1WC5PS4UjzUVfdwM5qXXncYbO6oJjnfCx0/WhnOzX4oZKfk12pu/5xlFa
   Zx6rEq9R2HarcXPe2OaqrCGmnhEIonTZE55Ol86gPzAxl1aIhR7qgu4Km
   zTkYpreFhh7uMBvm7jmV5EA6NxtN5NEgrhhfW5833e0nkRhQRQAAIIEL+
   lCH5ShY4rFu/WnphKu5a3nlW6JXJ4DACJPoEXonr2k5VioM1eS6ykLKrr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431925461"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="431925461"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 13:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796710805"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="796710805"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 13:39:33 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOlIC-0001Jx-1s;
        Wed, 26 Jul 2023 20:39:32 +0000
Date:   Thu, 27 Jul 2023 04:39:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andre Werner <andre.werner@systec-electronic.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 35/36] htmldocs:
 Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
Message-ID: <202307270449.YQ4vCUwO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   c944c8c532f7bd6d9e52ee3e2e97dcdd9c6014c0
commit: 33faa6fcc93f78e6b0e9b5aaf986446ac3c34047 [35/36] hwmon: Add driver for Renesas HS3001
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270449.YQ4vCUwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270449.YQ4vCUwO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
>> Documentation/hwmon/hs3001.rst:34: WARNING: Missing matching underline for section title overline.

vim +4 Documentation/hwmon/hs3001.rst

     2	
     3	Kernel driver HS3001
   > 4	===================
     5	
     6	Supported chips:
     7	
     8	  * Renesas HS3001, HS3002, HS3003, HS3004
     9	
    10	    Prefix: 'hs3001'
    11	
    12	    Addresses scanned: -
    13	
    14	    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
    15	
    16	Author:
    17	
    18	  - Andre Werner <andre.werner@systec-electronic.com>
    19	
    20	Description
    21	-----------
    22	
    23	This driver implements support for the Renesas HS3001 chips, a humidity
    24	and temperature family. Temperature is measured in degrees celsius, relative
    25	humidity is expressed as a percentage. In the sysfs interface, all values are
    26	scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
    27	
    28	The device communicates with the I2C protocol. Sensors have the I2C
    29	address 0x44 by default.
    30	
    31	sysfs-Interface
    32	---------------
    33	
  > 34	===============================================================================

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
