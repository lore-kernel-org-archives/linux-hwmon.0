Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74521578B;
	Thu,  9 Jan 2025 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417818; cv=none; b=NHvz9pHy4qo3I2Mmja0ED5v9svcCxn6egNEHSl9WZ784aqeYudM360IItP3CZ7yDc/RDBezrb2hOFYCPhqTJ4UXIAgBvAcGerobmnTHCDXxqnxm1IuII7pfOgqKsNDW3tAuRAdTj5qJasEuww2yREU78tgCd0vkYJvr4+CLG524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417818; c=relaxed/simple;
	bh=o2gV8+qd+OstVBKFXAlKb6b8WAzoR3uhP+40NL99g4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJq7xjFzM1rPePuX+Y8K6uUYcOnF9lLGrIQ+sV1utp9ZA2BZ0Gdy7YI0KVC6VGR9MUaFayPo4yejpkmfQPKmlOxdajSNhMXG2zE5O9gsLYU0fwDirG3+jerW4UhzPq9ONteBtXpo055ZknaAQKaEIL/zrefxXCOYz34ejY9cMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mv6bo9gr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mv6bo9gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736417817; x=1767953817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2gV8+qd+OstVBKFXAlKb6b8WAzoR3uhP+40NL99g4c=;
  b=Mv6bo9grXkpaJ6XkqcOrEk7xmpyD/Y39hUejyI73LHGjUUyxWWVPiRB3
   gN0i/H8/Sz04rW8MA5Jew7zZPRs5LJdHtfmD4oHzLm8VgOhfhrrZeboa3
   /08mVDFCz3IHDeKim8azrQiZWSI5omDbbGObVz/7GRFdFjSaZjJX4aqJ1
   Uc5WlF2+5X48T2W3TnuthmcWbLptXigWSoP9pc2NXvpSg4K0CoSDl+dy8
   zO35nir2zV/8XafyxgZKytKAvDZPY7phbXctRM+PUfuBcO4SCXFOgZqDP
   8NGYXL9lZ6jzlOiYwRTaGK2lVgtggh85D837gJBs3SjhYAMxhKciajA4A
   Q==;
X-CSE-ConnectionGUID: O/DLvZC6Q5CSOnWRFSpXqg==
X-CSE-MsgGUID: E4YutE46RmKB5UVfbg1X6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36830884"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36830884"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:16:56 -0800
X-CSE-ConnectionGUID: 6hdmEu8SSXO2+Mp4RQEcaQ==
X-CSE-MsgGUID: T0zJ1WQTRYmQeydN1S1tag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103329234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2025 02:16:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVpas-000HMR-1U;
	Thu, 09 Jan 2025 10:16:50 +0000
Date: Thu, 9 Jan 2025 18:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501091702.8ZdJcvFC-lkp@intel.com>
References: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-Add-INA233-device/20250106-151934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250106071337.3017926-3-Leo-Yang%40quantatw.com
patch subject: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
config: i386-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091702.8ZdJcvFC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091702.8ZdJcvFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091702.8ZdJcvFC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/hwmon/pmbus/ina233.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
