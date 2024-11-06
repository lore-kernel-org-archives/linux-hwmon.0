Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50628EF;
	Wed,  6 Nov 2024 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919410; cv=none; b=j2+2GcFjEu1Tm0e8s4dOW1pzeTBux2ExiD3IT1JRjffvg4fr9GRVU0tpSyTbfuDYI3BeojtpPQyEmBwlvmJTEZiyJXpG/zWQ5VTPtykvgVPhhoaPEmR4Rm1DLGQ59wWpYvpwGMzVdwjQVDbnsYFma9ATIO+2pRKEMvEfBWBFQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919410; c=relaxed/simple;
	bh=WeOYK2Ugv5uXCeV4l3zpKEBTYXRLPK10LIXAB2A6XnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhH5qdkIqWK3BaH0nC1dBVO1ZYDWOmICsRMzFmemJptI2rD+cOKDiEPCBJ8gAkgHxeKGlHGXslwsxPqdp6Jkel40PM1glahCYv3e93jr8tLYfMUgIiJ2jeT5Wie14FBiA5JGNrCSlnb/aJgAcdfJbZvtTWo8KTCcCW5t/8iU/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVU3aZZ1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVU3aZZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730919408; x=1762455408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WeOYK2Ugv5uXCeV4l3zpKEBTYXRLPK10LIXAB2A6XnU=;
  b=AVU3aZZ15jfJCeLCNj/zh7Ue8t6pWblYxHSYi2OUcUzuCZ5ngJ2ZFyyx
   EUJhtMT13/gp3zfi9jORCMLR9BsMSabxWF3R6uPHtKOYuf5pckeM46ZFi
   OmxLN2UIZBZNGvJWx6G2bazOSFt9olBTbRmzDjsi0EDJWOxn43Jq6wF3g
   Y5sVPGSi8f+WjiJoCLMrvzNbQDHyPooInC7MSH2Oy1JXAvDlrvQHPyToE
   ZFwDGHSFKD9Rp6W3hi1ADBEn8OdhrE+klTPoaU6gbkQq4GEAoNA7fwJoj
   8Mw53BuF6XCCZVToYHFuaWnH6IoQCXKtkolCishgVuGTlmuzjJeQPJKCj
   A==;
X-CSE-ConnectionGUID: u9i5Ux+5R4SaltbSAuNfLg==
X-CSE-MsgGUID: PIRswKL8TQuTWG/nSTu95w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41357891"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="41357891"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 10:56:47 -0800
X-CSE-ConnectionGUID: W/DY7m6ORbiTLi1LGT9rSA==
X-CSE-MsgGUID: FeROC1g6SKKjySQSZKU9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89289376"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 10:56:32 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8lCg-000pJU-1i;
	Wed, 06 Nov 2024 18:56:30 +0000
Date: Thu, 7 Nov 2024 02:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop
 handling
Message-ID: <202411070251.mEqY5ErJ-lkp@intel.com>
References: <20241105135259.101126-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105135259.101126-2-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwmon-pwm-fan-Introduce-start-from-dead-stop-handling/20241105-215454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241105135259.101126-2-marex%40denx.de
patch subject: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop handling
config: i386-randconfig-016-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070251.mEqY5ErJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070251.mEqY5ErJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070251.mEqY5ErJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/hwmon/pwm-fan.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
