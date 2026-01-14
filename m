Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7AF137930;
	Wed, 14 Jan 2026 00:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768351744; cv=none; b=j2LBLCRZ+6JVuUyHUZTBMzaFDf2AittODHfhxzJqseglHqSEaRChanTDO6qi+McR44OIKVanC0obAF+piMvOtRJXE946dZxLLYxK7w1oR20jImtXFh+y+a/Vg5FyX+5Y4gVRnTBPI82dO7DoiD0BqBCzTH+V11WrPz+DdTx7k8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768351744; c=relaxed/simple;
	bh=omMOofyBVN38IBiVN1n2wsYAy5EaED13sUkxbjNNMvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKG4MEsLJTCtGroubny7qs8IpDGAYvoI2nZ0FW2Yg5T5iPY9mFpLgQ7fgABlFBy2dUb61JzESuUPtaWLDExBI/u5gAPL5MWFSrXrnIyHMMxJoI8+FdTam407NrFNKMDpXOtqBpAkC3qA/Bru00cw6K1IOadEpOPWTTKeJ0rsfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4s7qgNR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4s7qgNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768351741; x=1799887741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=omMOofyBVN38IBiVN1n2wsYAy5EaED13sUkxbjNNMvQ=;
  b=g4s7qgNRLFd7yortAhqRqLmNdxJ6iy8o37kzcLLjf0RyaEpJOxuEIP5S
   S4mgjzd50IH8GKnvhKCPc9LiIx6naI3UehfOUnUJtGc+xq8kM1O4/0uLw
   CmnFpHkR+/jbvjzauLt8JKpdNL7yO9n8M/Y4bzjslPiBOjn/xmqVzJdLe
   EVffAq7ncFBy3FgYh2Fw6RrGxkECwgyl/sqr6v9GscxEcnqsraF1nzdA3
   e+qwgBBB1oAxnBVI8QYQQ9gLU07R+cLwVQL1PjpKnkQqntboH3/fhDgGs
   zYNlLDz+1xh3UH3B/WhYa+JzZqF4YS7XwsJoTFZ5u22AsKKsTjq2xCicJ
   w==;
X-CSE-ConnectionGUID: Cw/uX5dBSVikioVZYgZjfw==
X-CSE-MsgGUID: NqsdKXVBTVuMTuRMZOh+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68654892"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="68654892"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 16:49:00 -0800
X-CSE-ConnectionGUID: OdvWVfutRQmmyDklFxkgyg==
X-CSE-MsgGUID: GUtoVnNkSDCixTkXHxejUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="209583530"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2026 16:48:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfp4A-00000000FZS-1Ws9;
	Wed, 14 Jan 2026 00:48:54 +0000
Date: Wed, 14 Jan 2026 08:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v8 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support
 multiple Capability Data
Message-ID: <202601140833.WJ1oZKuV-lkp@intel.com>
References: <20260113172817.393856-4-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113172817.393856-4-i@rong.moe>

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b71e635feefc852405b14620a7fc58c4c80c0f73]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-lenovo-wmi-helpers-Convert-returned-buffer-into-u32/20260114-013537
base:   b71e635feefc852405b14620a7fc58c4c80c0f73
patch link:    https://lore.kernel.org/r/20260113172817.393856-4-i%40rong.moe
patch subject: [PATCH v8 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
config: x86_64-buildonly-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140833.WJ1oZKuV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140833.WJ1oZKuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140833.WJ1oZKuV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_cdxx' not described in 'DEF_LWMI_CDXX_GET_DATA'
>> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_cd_type' not described in 'DEF_LWMI_CDXX_GET_DATA'
>> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_output_t' not described in 'DEF_LWMI_CDXX_GET_DATA'
>> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 expecting prototype for _get_data(). Prototype was for DEF_LWMI_CDXX_GET_DATA() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
