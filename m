Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C21107B6
	for <linux-hwmon@vger.kernel.org>; Fri, 22 Mar 2024 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711088777; cv=none; b=KBQWY21JSGOBhlqOVT9kmwdLpe12OLbohfctJZoLtozgryXcnF27O/nx3yxm3EAThg0h9vZd6Zkm6GKh63RxVbpQeC1tlAKvra3nSRkRF60+YE49Xfmw2wXT2EK+Df9hb9nPGz8JRsvPiCmqoqdbEaYNgnXxAlqSzTbz//8P0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711088777; c=relaxed/simple;
	bh=4qRK6YnOIDUQk6MDQBiPsBZv3QED9ZEwnrmxCyN69oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAUf81aP9C6Z8r4NJnBduM6AGrda2cpZoA44aatbrtcxOqRkP36myuXfgDCb0VxJACkQIRW/3PLQ4QugBUFYhfj67Wyu31vlLVD2l1l0lb2kNdXEZLnpKywk2L/7I/5c8bygzN9aNtDSDQLE+vX6NRjAHD9DEI7B4UilSUz8Q/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVtPtL0u; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVtPtL0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711088776; x=1742624776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qRK6YnOIDUQk6MDQBiPsBZv3QED9ZEwnrmxCyN69oQ=;
  b=LVtPtL0uwDBY4qAhsESbO/kuTrR2Ptk+eKLyss40fJqXDpzIEvt7qamH
   TvP0bgo0ilvioCFPMvQkpcIYPSjDkTGb7w6ydwV3U+uU8RrINn3SeQYtL
   +L+AwUyQCYKThpKdzXpwiCbM2TCgcPFpxrpnHvCP4DgsuEvfJcJV0dZWA
   NHMQvOkS8RyzIDLqBQ6JrjmxpJ0V26uvATLfFWdJP6elk60b4FYVQm4eo
   1Cbtca7a+4D0JCguaREgHiRWzXaZlYDxfrlpCVm4n7c2jwXa619lfHhEt
   IqgdI9GPvLXLR8kXZLgTYhuWZB4IoKTNbzxQ3UkolR6Oku2WsfY7PoyiX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5976085"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="5976085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 23:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19439666"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2024 23:26:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnYLz-000K5P-34;
	Fri, 22 Mar 2024 06:26:11 +0000
Date: Fri, 22 Mar 2024 14:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 5/11] arch/nios2/kernel/prom.c:24:17:
 warning: unused variable 'dtb'
Message-ID: <202403221428.i3uDsXt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   fb903d9dd099da7430dc653a99670d6f2676daf6
commit: 6e2e5d9394a30805514cd15a078ad361ac68c50b [5/11] nios2: Only use built-in devicetree blob if configured to do so
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20240322/202403221428.i3uDsXt4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221428.i3uDsXt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221428.i3uDsXt4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/nios2/kernel/prom.c: In function 'early_init_devtree':
>> arch/nios2/kernel/prom.c:24:17: warning: unused variable 'dtb' [-Wunused-variable]
      24 |         __be32 *dtb = (u32 *)__dtb_start;
         |                 ^~~


vim +/dtb +24 arch/nios2/kernel/prom.c

95acd4c7b69c9b Ley Foon Tan  2014-11-06  21  
95acd4c7b69c9b Ley Foon Tan  2014-11-06  22  void __init early_init_devtree(void *params)
95acd4c7b69c9b Ley Foon Tan  2014-11-06  23  {
95acd4c7b69c9b Ley Foon Tan  2014-11-06 @24  	__be32 *dtb = (u32 *)__dtb_start;
95acd4c7b69c9b Ley Foon Tan  2014-11-06  25  #if defined(CONFIG_NIOS2_DTB_AT_PHYS_ADDR)
95acd4c7b69c9b Ley Foon Tan  2014-11-06  26  	if (be32_to_cpup((__be32 *)CONFIG_NIOS2_DTB_PHYS_ADDR) ==
95acd4c7b69c9b Ley Foon Tan  2014-11-06  27  		 OF_DT_HEADER) {
95acd4c7b69c9b Ley Foon Tan  2014-11-06  28  		params = (void *)CONFIG_NIOS2_DTB_PHYS_ADDR;
95acd4c7b69c9b Ley Foon Tan  2014-11-06  29  		early_init_dt_scan(params);
95acd4c7b69c9b Ley Foon Tan  2014-11-06  30  		return;
95acd4c7b69c9b Ley Foon Tan  2014-11-06  31  	}
95acd4c7b69c9b Ley Foon Tan  2014-11-06  32  #endif
6e2e5d9394a308 Guenter Roeck 2024-03-21  33  

:::::: The code at line 24 was first introduced by commit
:::::: 95acd4c7b69c9b250d901d154390ec4c8b7b51c1 nios2: Device tree support

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
