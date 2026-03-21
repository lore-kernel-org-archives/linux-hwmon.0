Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29237367F26;
	Sat, 21 Mar 2026 05:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774072633; cv=none; b=loYWpRa4z3/DWCSUNRL+JF7G/osqnpPE+JmiwBDPpWFVqCdQnqsRLqLIxYr0XQ6xniEXz9X08ePdofLlzkQF+5Ej3aaOv5zmuq0B01hmIvTW6lb41ea+F/Dz08e5vPNub3MsAuRuLtZhTyoeAVLRxK+i0X6nytk8V6dlVkjRW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774072633; c=relaxed/simple;
	bh=BBScthakHfwb7QuR1J3Hfw2qvVfNau/W+bfx/Os98AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ0RDw96B10wTMwj4NgFeVHGaGQHDrlO9tIfVugCcxVa0eEhJAbj58LZQkYWGr52THaPu3wSXbI8TVDQ5+HOUI32osN8wImSD37rFPjylXGpOOBGWsJi/0I0Ly3v7i7p0TN6m8P6T9lQAkPPVRoeFSkv2ZqtgP1Ei1LScAMZTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS6aNmwK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS6aNmwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774072632; x=1805608632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BBScthakHfwb7QuR1J3Hfw2qvVfNau/W+bfx/Os98AY=;
  b=FS6aNmwKNbq9kgBleMQJYcUz+trQAoNcIifHT3H5Q1nXXbACnV9thEZB
   VVUEkofD4cmNRTPvOBQRY0Gvt4HFpGfnjMPmcRcCBB0K0zqxJ+dPlLE15
   csU6plamm9QXKP+yWs7WMKOAZCnZ/qFdhSIa4/0yvDms+I62u0x4Wc44b
   AChi0qXHy/UqawIuoVa4cF2eSSaCCHdq3Bn3zS1jR0euKE61L+orr6CzO
   p1NFz5e/SHMcBvhWB7OnTLL2jsqHFDhmt/EG9HDBgFtGcKZbBtDAF/oU/
   l08q3m+53iEldSzZv+64PyMBK/TbmRg3/sGFlDqO99tUEqorf6OSrKBl1
   g==;
X-CSE-ConnectionGUID: A44xTN8PRkeiuU0P7wDHAA==
X-CSE-MsgGUID: p8X7TTsiT3CYcvT/wFLZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77762194"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77762194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 22:57:11 -0700
X-CSE-ConnectionGUID: th6Z3pyCSjSzOqyoY5x2rQ==
X-CSE-MsgGUID: 89R1Jh0VQqqbAFouduValg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228221083"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 22:57:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3pKd-000000005gb-0EHz;
	Sat, 21 Mar 2026 05:57:07 +0000
Date: Sat, 21 Mar 2026 06:56:52 +0100
From: kernel test robot <lkp@intel.com>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, linux@roeck-us.net,
	corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add mpm369x driver
Message-ID: <202603210627.wqCkJ5al-lkp@intel.com>
References: <0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000@us-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000@us-west-1.amazonses.com>

Hi Yuxi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next next-20260320]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuxi-Wang/hwmon-add-mpm369x-driver/20260321-082055
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/0111019cffc12220-1800bb62-f2e0-4194-99a3-7d2ba03532c6-000000%40us-west-1.amazonses.com
patch subject: [PATCH 2/2] hwmon: add mpm369x driver
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260321/202603210627.wqCkJ5al-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210627.wqCkJ5al-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/mpm369x.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/mpm369x.rst

     2	
     3	Kernel driver mpm369x
   > 4	====================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
