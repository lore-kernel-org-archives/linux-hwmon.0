Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CA11D8A08
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184322; cv=none; b=Q7tZ9atUTzh8ITWPbhcEjwZ8ypihyxXzTjahVEfyVmf3wKsr0DTT63ACQF3uJQYzdJ8qb7yukkd0TbQL/dqTKCOLMhoElWY1Fpl1aFmfP4w7mlHZ7HbYPKAsgBl+2wRrO+MMrmo8yhHgqtBNAq9sGGe23qztsyaOHjePLYqwx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184322; c=relaxed/simple;
	bh=CEl0nPY7Ni16OM6+fcj5xhVd5l+xWdEubPUD6u7QD7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBynazw2qh9ycSU2SSl3e1igDV4iIoA9OcvRc3MLKwSpTk7bUVWraoWugIc4ozItlDm0u/et1pfemb5edxEDuwU/0R7peYqwkA0l0eXcWVSslaAxSC3oyWLDgIwFGeT5jZhwyiFY/WinKkuZ9JMNF0HnRj8pwHNmiNYTjQVnyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cq8F4vbG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cq8F4vbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732184320; x=1763720320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CEl0nPY7Ni16OM6+fcj5xhVd5l+xWdEubPUD6u7QD7M=;
  b=Cq8F4vbGjwZACZ/3TlE/eMmEB9ijDN5ZOaEKwEGhyJNgCg4E+fMg0kME
   bO9TkAoCDgmSdQvyu2jVePqmhhFX5Ona4baQvpI/fu2CZ7Kp9qakST0Xv
   NfZe1ZBZxUGomvJiM91E7F2+n6DWC3ZF3hePXi8kBvKtuqpzg0H7udu5O
   gK7CrL8F92d/TSHF1oAH55G9r9nv0k63tEUElfoZKtAZ93aZk0hF6cJa5
   0OlngkkS3RiaT/S8aBTm04Ox6N8bFB2p4TRb7ME7/TJFYWFIvUKF6sMSP
   5THjb7z3budqn1D9X+BbJDK6+/GcUf4/weMmiOUtq3AMhGQkXA7fhHIe6
   A==;
X-CSE-ConnectionGUID: xizVeMSPSk61P29NW0XNbw==
X-CSE-MsgGUID: /JFdgtAmRjWXW/c5XhfRgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43673343"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="43673343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:18:40 -0800
X-CSE-ConnectionGUID: q0gMwvp0R3uhqVkhHqJ/8Q==
X-CSE-MsgGUID: 0DJ5CDipT/af09nsQnS2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="95010734"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2024 02:18:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE4Gh-0002qH-30;
	Thu, 21 Nov 2024 10:18:35 +0000
Date: Thu, 21 Nov 2024 18:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 1/42] drivers/hwmon/hwmon.c:432:41: warning:
 pointer type mismatch ('long long *' and 'long *')
Message-ID: <202411211850.BxMkSXmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   b731b2c24d88f6782fdf6e1c19d735cd5aadeb3b
commit: 2c67fcdff546bc261761a3d66aa165a627b71458 [1/42] hwmon: Introduce 64-bit energy attribute support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211850.BxMkSXmZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211850.BxMkSXmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211850.BxMkSXmZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/hwmon.c:432:41: warning: pointer type mismatch ('long long *' and 'long *') [-Wpointer-type-mismatch]
     432 |                                hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
         |                                                              ^ ~~~~~~~~~~~~~~~~~~~   ~~~~
   5 warnings generated.


vim +432 drivers/hwmon/hwmon.c

   422	
   423	static ssize_t hwmon_attr_show(struct device *dev,
   424				       struct device_attribute *devattr, char *buf)
   425	{
   426		struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
   427		s64 val64;
   428		long val;
   429		int ret;
   430	
   431		ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
 > 432				       hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
   433		if (ret < 0)
   434			return ret;
   435	
   436		if (hattr->type != hwmon_energy64)
   437			val64 = val;
   438	
   439		trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
   440				      hattr->name, val64);
   441	
   442		return sprintf(buf, "%lld\n", val64);
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
