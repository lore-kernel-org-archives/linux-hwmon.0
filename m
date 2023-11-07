Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B771BC41535
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Nov 2023 01:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjKGB1f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Nov 2023 20:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjKGB1f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2023 20:27:35 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E16103;
        Mon,  6 Nov 2023 17:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699320453; x=1730856453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/MIcgTpmOPNsaRiTaeyhdRNpxjoAXZKIkVQzxSboUU=;
  b=FQv/T+GN3ybCxoKYnloIzREfiOz5OOk7keqqApeJq/NhHH9n3pAeXmR1
   F2DdKIKifIwTJp/Am0xLUTYwBgV3Ro7rhOBnoPyyEL1gvLeP/lSDXIexR
   LNlIfNVi+U5tyt434f9FjGjuzaz38d4LZMsRF2diUmh0Tj4JFa2dlVYFN
   TbMcJiGv4cVJO3+TWnqoi8VlgCKsRyMVo0dEn7CX80QmA85AsOYrAelLN
   TmDnysssXWK3IdZX9VI773viam9yBb6tpTzv8wVC2GsX3Uei6TbWP6GpA
   G5/O8LPE2Fg2YyDAt16CDwg8GRyhInSHYSlkFdyhXnsIOmNLfK5oxddws
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10946743"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10946743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 17:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="906241833"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="906241833"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Nov 2023 17:27:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r0AsI-0006se-1G;
        Tue, 07 Nov 2023 01:27:26 +0000
Date:   Tue, 7 Nov 2023 09:27:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] hwmon: (pmbus) Add support for MPS Multi-phase
 mp5990
Message-ID: <202311070822.cgjfXGD7-lkp@intel.com>
References: <20231103080128.1204218-3-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103080128.1204218-3-peteryin.openbmc@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Yin/dt-bindings-hwmon-Add-mps-mp5990-driver-bindings/20231103-160759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231103080128.1204218-3-peteryin.openbmc%40gmail.com
patch subject: [PATCH v1 2/2] hwmon: (pmbus) Add support for MPS Multi-phase mp5990
config: xtensa-randconfig-001-20231107 (https://download.01.org/0day-ci/archive/20231107/202311070822.cgjfXGD7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070822.cgjfXGD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070822.cgjfXGD7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp5990.c:66:34: warning: 'mp5990_of_match' defined but not used [-Wunused-const-variable=]
      66 | static const struct of_device_id mp5990_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/mp5990_of_match +66 drivers/hwmon/pmbus/mp5990.c

    65	
  > 66	static const struct of_device_id mp5990_of_match[] = {
    67		{ .compatible = "mps,mp5990" },
    68		{}
    69	};
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
