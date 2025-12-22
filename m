Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EC1EEA5F;
	Mon, 22 Dec 2025 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766403262; cv=none; b=aKHgFWz04TcJPLlGGrfPqD0dvwaixSXHsFhMEAbu14Vxh3Hm28ah7UfZfC4A4M6J0/ENSS9sjZawUjEHfIMI7A89PIsRldm9SD9l5iKVx3jcUNtzSQL39iwEnP16+wFQni+oxr/AFGLh7WPLQILNWS66aru2C5lb9XVzcFW1McM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766403262; c=relaxed/simple;
	bh=rT+DYWSjPXTnydMWYAh5WcPYurd2SHrVdIctLg31MS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwJMmL86bKZBCSO030H2djBgMI1z1AMsFpkJMkwW5Tu/Z+Gm1Mndyn0afKzSRQXG6LSgHdcqQ5Hms6FiN3uzBvqD/fxymn0uIlNuAFOHvOxUj7AZqtCi0Bs3S3NI7rt9X6brw2CzwZFyw4WQ+EtTpOJ8V673cG8Af+azqDpZD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eake0Oiw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eake0Oiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766403260; x=1797939260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rT+DYWSjPXTnydMWYAh5WcPYurd2SHrVdIctLg31MS8=;
  b=eake0OiwLcLBuCN9eVMo680Pi44PvPv1JOqQfelxZ4n4Uim2iXfwzVVg
   xbobGlMrPAewV7duoJ+nbfnsg+x8um5yJN0f5j1vpbRYUAg/5/z3ZTF/d
   4z+nPxY/jbbJurRpq2KD4fAQ6l5J7oQM5Snqc81EgzQaobs8lxYm9stZ7
   AsYp2jJWr4Ce7ZzTVLt3AL2aDK3sQn5py2O+goNiz+1rsxHXLVSpJiwlg
   Pyl5189GBFgZqpIF7pYB8KRusJxBxvqFQ26hZLDAu+u088GMlCLayecbL
   MaJq+eRpoySTjjGSVuyY49lmp++2EktaTpdoc7NWkMR9P2o02WwsDr9jz
   g==;
X-CSE-ConnectionGUID: bEYrEhvqSFuqKhi77xMKzw==
X-CSE-MsgGUID: J/0gcNjGS1mnk4R3uAaE7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72117408"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72117408"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:34:19 -0800
X-CSE-ConnectionGUID: +zErU3tiQie6VyqnHzZRsw==
X-CSE-MsgGUID: eUHsrarISKeipICS/vlQaw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 03:34:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXeB5-000000005Rg-1cg4;
	Mon, 22 Dec 2025 11:34:15 +0000
Date: Mon, 22 Dec 2025 12:34:01 +0100
From: kernel test robot <lkp@intel.com>
To: muhammadamirulasyraf.mohamadjamian@altera.com,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ang Tien Sung <tien.sung.ang@altera.com>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for
 SoCFPGA
Message-ID: <202512221215.5HgD2pyk-lkp@intel.com>
References: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22]

url:    https://github.com/intel-lab-lkp/linux/commits/muhammadamirulasyraf-mohamadjamian-altera-com/dt-bindings-hwmon-add-altr-socfpga-hwmon-yaml-binding/20251216-145542
base:   c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22
patch link:    https://lore.kernel.org/r/20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian%40altera.com
patch subject: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for SoCFPGA
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221215.5HgD2pyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221215.5HgD2pyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/altr-hwmon.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h


vim +2 Documentation/hwmon/altr-hwmon.rst

   > 2	Kernel driver altr-hwmon
     3	=========================
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
