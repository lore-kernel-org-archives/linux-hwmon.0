Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9C35F17B;
	Sun, 29 Mar 2026 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787634; cv=none; b=ba/fFKxMfY1Ha0s590sv5GE4bW0xCxD3tqmTy3mmbmRODpy4LZ9iGZwehZFTo2nJZnQswAIIGFttrOt3oJqMfkiy4XUInR1ShsG45EUe5thJ4uNSpZJhWgIuLlQDme8iot9DXl8u+6hqj9GbGpq6/cwz9OR70ZzIeaRQWbGsXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787634; c=relaxed/simple;
	bh=Xvbdeptpf0MqY7er9anc0tJZz0bWfgR1+exszyU22K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkjBRbXOyUvq2OmojZacQI5cAqF5RFbJaGIjYK11Y4Z7jrC1TLOiD3Tw03PcHIeuq/CypQ2U1vdwMHWtp/Rj3itqks+QOP30QcOhpnz12jf+e1PGIRJzQsGx8ExgH8HterFL0v5C/FWRDx/hrzZqx5OKZGP/jSq1WY8lBqS3LGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMJY/JYy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMJY/JYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774787633; x=1806323633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xvbdeptpf0MqY7er9anc0tJZz0bWfgR1+exszyU22K0=;
  b=SMJY/JYyVDhIWrEcY55q2pgPAjGYYQdxlV68DTGVHZDAfni3w2l2Biem
   HdZlBsqYN3bDqkqyMkHJ9udp4ZrJ3NmqSrGfPu2W29yrzw7o2GK6ZzCk3
   vwPmDGrHVSRCWFG8W8D2mOVt3NQLO2HL7mDwc9glw38zWtS+KNWAzvBs7
   rnhs9ZSGsqEiat6XD7f9MLL53jK+Mv9Nvn8PJ0bjERwnP67cnXyQ6uxdM
   qjquNKw/GZ0ts+lwRgXpwGzQUA6BKIV83KXRPzqD/2fzpnA7FzGuCWpim
   d//gVMSL9ssFoWU5oKvjcRJqHOfFg+4z58iv5bBiq1Wvdme5G+7QtoNkw
   A==;
X-CSE-ConnectionGUID: N0E3scj0SjSTMUdH5nC6FA==
X-CSE-MsgGUID: NRRjdbIXRsGabHk371Hb+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75683015"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75683015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 05:33:52 -0700
X-CSE-ConnectionGUID: AdZ7I6F/TpWaWgd8QiIjYw==
X-CSE-MsgGUID: OHx3KQ1WStqmz0LRai03KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="248841289"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2026 05:33:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6pKs-00000000CLt-3NBq;
	Sun, 29 Mar 2026 12:33:46 +0000
Date: Sun, 29 Mar 2026 20:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Rong Zhang <i@rong.moe>
Subject: Re: [PATCH 4/4] hwmon: (witrn) Add monitoring support
Message-ID: <202603292058.Vszdl5uf-lkp@intel.com>
References: <20260327-b4-hwmon-witrn-v1-4-8d2f1896c045@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-hwmon-witrn-v1-4-8d2f1896c045@rong.moe>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0138af2472dfdef0d56fc4697416eaa0ff2589bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/hwmon-Add-label-support-for-64-bit-energy-attributes/20260329-030139
base:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
patch link:    https://lore.kernel.org/r/20260327-b4-hwmon-witrn-v1-4-8d2f1896c045%40rong.moe
patch subject: [PATCH 4/4] hwmon: (witrn) Add monitoring support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603292058.Vszdl5uf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603292058.Vszdl5uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603292058.Vszdl5uf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/hwmon/hwmon-fp.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/hwmon/witrn.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
