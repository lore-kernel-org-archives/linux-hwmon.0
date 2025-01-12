Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F351BC9F6
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2025 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736698557; cv=none; b=NzY0VYfGWvedrJe4SlIHcBaBfqWVmPSOUcBKdVnRoKluN6bm5IdM3tw0pa73bkkVr4ixhb2BxzccA8vdHBlnh74pgMGtXml28YThDJTSs/JbGn9OSUgKr/30eC80bVzjUyyyxOHp2bvC6ujDmhFIh0GYhO6iei85ayI7DYnBUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736698557; c=relaxed/simple;
	bh=KfnWIPYIklJ77R0ULXLfeEuAlJgNQX6ohBHiTMPucH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mec6Lms26YOdzjbl8X3YDn3pzo/ozhRYczbkrR/rdlhTj3aU8KJtXIfqIJl2rB3McIDYzsc7/IScCteX8UWo10WdMk25x90pZQ+OCbkXOeS0fktsnwlr9gnW4MES51Rm16PrFb3EGg/gYdxEufgWzi1p/RstC2coV2niuqqy80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFNaMEt5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFNaMEt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736698555; x=1768234555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfnWIPYIklJ77R0ULXLfeEuAlJgNQX6ohBHiTMPucH8=;
  b=jFNaMEt5WpbvowOSSn73GIQS4E4GhcYd/uEBJkVh7y9aFuHZH1QYBcd5
   Rozc1dYK3CVtggHmm3ODaZBf/mRcmu39ftBZ69ZY7eQxGOKrZ3hb07249
   cYdhQe5cWLNxPDxqHgM30CXEQlkI8M0E/vm0V3U+85ajjwlvnLJRMXzxQ
   ngsDPG5qOqnbGmTjuYdHeK9WxybZ6d5c/fiC7xAgM8Mrsw8gb0ySEsF3p
   UzlEH4OdS+5sn1r8qYtzt++klf3WqMIBe93WEgLVD/ahxehWfxIMmzi+T
   e5LnTPKIb+TXfAYQ6WPlRGYFObH245gJr1xHHJma3cyfBTP/sJdsCmwBu
   w==;
X-CSE-ConnectionGUID: s/ZQNnVYS/aNvdRoUQg3jg==
X-CSE-MsgGUID: /e9P2sxSSyehqHS3Xuh9FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36211980"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36211980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 08:15:54 -0800
X-CSE-ConnectionGUID: odVUq5IkTdOqyuheTjbFuQ==
X-CSE-MsgGUID: XMg9gd75TCaPRO60BcQ0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141497059"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2025 08:15:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX0cw-000MA9-1T;
	Sun, 12 Jan 2025 16:15:50 +0000
Date: Mon, 13 Jan 2025 00:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 41/43]
 drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id'
 undeclared here (not in a function); did you mean 'dps920ab_driver'?
Message-ID: <202501130056.dNRlSRuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ffd30617d9ea248f5766778227bc2b59ee2e691a
commit: 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c [41/43] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
config: loongarch-randconfig-r131-20250112 (https://download.01.org/0day-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130056.dNRlSRuE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id' undeclared here (not in a function); did you mean 'dps920ab_driver'?
     205 |         .id_table = dps920ab_device_id,
         |                     ^~~~~~~~~~~~~~~~~~
         |                     dps920ab_driver


vim +205 drivers/hwmon/pmbus/dps920ab.c

   198	
   199	static struct i2c_driver dps920ab_driver = {
   200		.driver = {
   201			   .name = "dps920ab",
   202			   .of_match_table = of_match_ptr(dps920ab_of_match),
   203		},
   204		.probe = dps920ab_probe,
 > 205		.id_table = dps920ab_device_id,
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
