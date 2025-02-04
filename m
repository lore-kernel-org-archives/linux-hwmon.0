Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530F219A6B
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Feb 2025 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700695; cv=none; b=oeEwT5rEz0GqvrEsJAaTYQsg2upPSg5jYQ7M4fNq49Ah/WTHdaqGQN4x/GEjK2/Nc+kXSl9fR3NOJlUA5+61EZHFHLpR2Skn//xlc5E4OMX8eH1IDiWfvUsjvKgBE9XvDoqzYfY5ZQFdvGQrmdcUPK5gjh2EOuiUJsC4SdcnzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700695; c=relaxed/simple;
	bh=+tDw1rM8R6L8IupSD+W6AbNnxB6dJEzU9dSZ87LXzRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBXsZHHfI9/Y6YZPrUPuxjOb3coNHV2a3XczzuCf5k231W1WMiG/CfZszxitabEcA+hIRu91xJJPJR+g7Su3nN3BHIBzXXrOCsqHW/rA4OWGYBlSa/0hAFnVLR8NsajEep8o6qxHvj1Nps1MnBzDgLV3Truksh7kGtvHE0fU1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMZ6zrXp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMZ6zrXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738700694; x=1770236694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tDw1rM8R6L8IupSD+W6AbNnxB6dJEzU9dSZ87LXzRY=;
  b=jMZ6zrXpBt2Ae6+p0rAXQqSaFCxjXMjNrp2O4jVi87uTo2sMx/LuiMXL
   wC/n2QTUl8Ub3IW0G6XXtzTxY/y3hf7PElAR97nsxH+qynukrYmNeEU0o
   R8Ph5jUcpYUWjqQUDWu7eb2joUmDShB3z7AaDCFIYYKekXhA+yhux8dha
   rBpc327Mcs1v4aNpgnjgpEYoDknK+C1uyaGEIzhJL1oXeraDAtujsFZ2n
   ai37daz8uN3z2fWPDTHBcDz0v66gGc1+4wCVDL9kYOtoRfr8WyBBmnuY1
   NiMfEi7mE3HKDgBl+Tl5aYQmncjC2da6hp4+PGyeliPcMZRttWgFQikn0
   w==;
X-CSE-ConnectionGUID: 8l+4FElDTumaYiFs8oUz4A==
X-CSE-MsgGUID: Hw/MvwNaRgCXa9l96IrtMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26845868"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="26845868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 12:24:53 -0800
X-CSE-ConnectionGUID: Z8vRZy6PT3Ci8+Nuslvifg==
X-CSE-MsgGUID: 3IqtRhj5S/KQkjq1kNci7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133948005"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 12:24:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfPTV-000syL-12;
	Tue, 04 Feb 2025 20:24:49 +0000
Date: Wed, 5 Feb 2025 04:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: drivers/hwmon/pmbus/pmbus_core.c:3507:33: sparse: sparse: symbol
 'pmbus_debugfs_block_data' was not declared. Should it be static?
Message-ID: <202502050447.CA5dAMMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   67b0f0fb646de244e59420a373c93a9deb2c60b5
commit: 9fac9564cf8a1da1d26a555355cb92b517444b1e hwmon: (pmbus/core) Optimize debugfs block data attribute initialization
date:   25 hours ago
config: csky-randconfig-r132-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050447.CA5dAMMU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502050447.CA5dAMMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050447.CA5dAMMU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/pmbus_core.c:3507:33: sparse: sparse: symbol 'pmbus_debugfs_block_data' was not declared. Should it be static?

vim +/pmbus_debugfs_block_data +3507 drivers/hwmon/pmbus/pmbus_core.c

  3506	
> 3507	const struct pmbus_debugfs_data pmbus_debugfs_block_data[] = {
  3508		{ .reg = PMBUS_MFR_ID, .name = "mfr_id" },
  3509		{ .reg = PMBUS_MFR_MODEL, .name = "mfr_model" },
  3510		{ .reg = PMBUS_MFR_REVISION, .name = "mfr_revision" },
  3511		{ .reg = PMBUS_MFR_LOCATION, .name = "mfr_location" },
  3512		{ .reg = PMBUS_MFR_DATE, .name = "mfr_date" },
  3513		{ .reg = PMBUS_MFR_SERIAL, .name = "mfr_serial" },
  3514	};
  3515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
