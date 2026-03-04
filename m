Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD0371CF1;
	Wed,  4 Mar 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622333; cv=none; b=TW7iMzfyZ1COz+ghwCFjBEMXnpLrc3PWUJgB9r4ODG53HWLXk1qt06Oywoguv7FgOOwZqCKgxcDjZWzE12K/vsp5kMkKTZuhPY1vmnraAPdLbc8vPiYkFGspwtoBYK+UPS1TAYO7spLYh7CGiAkI5nC2SpGSJ3ioEXHwhlKW6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622333; c=relaxed/simple;
	bh=/Pp8xd0MR53jkbmdo8SmhG/HDAzp5ECtWSf22t4Ir9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7dtzVm8lLlraooazlgiokiAsy8V4A0NDXiltUlhresfTKXiWFepacYkVXBUKGjTHkMzdSNIcYeu03j+btw5z6Fr+eJ6eIDhG0lhbjkAsC8CbME3nN+gOYuxazXehkWDKwe3COo6KpkovE3cpLDq2K+tqrS0TlGCuWGoGz90zrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZTR737A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZTR737A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772622331; x=1804158331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Pp8xd0MR53jkbmdo8SmhG/HDAzp5ECtWSf22t4Ir9Q=;
  b=iZTR737AbBow32u27dy4kK+89mXzFd1UukxzyPnK9mG2NKUKW0QReCZx
   pZ4w8fS32Tc0NNB4JEhEKUT9brjAY5sAU6ayxGscDj6oJ3xD0jfMhYDTq
   uFNTFQgXTEx1MQMSXyZvd2KvbbnTdgFPXsZzmIJZvUSppxH5vIz0/Notp
   PkymIdIO2BuFCWU7xPX7wTk8IzatJKgtgZRSRVIMx9c2qeVIfnOpSt7z5
   gdkBE5gmim3PfRGFNPuFDEhE2DJ8oCrXd9kln2JS7eOWFZ59T0Td0AJde
   k2vxB3VKAoiz1gGgRU6boTHd6iMcTzPSgphEyFM9rvtPpooo58rABhr3B
   w==;
X-CSE-ConnectionGUID: IePeBvWLSsSXFK1VNhNzdg==
X-CSE-MsgGUID: otAfXvRZSJmkpTF9l7Ko2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76281171"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="76281171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 03:05:30 -0800
X-CSE-ConnectionGUID: ChR8CHo2Rjma9c6r6eCz2w==
X-CSE-MsgGUID: kQr/68s/S6W37euO0DGe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="216624885"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 03:05:27 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxk2f-000000001fp-3THD;
	Wed, 04 Mar 2026 11:05:25 +0000
Date: Wed, 4 Mar 2026 12:05:00 +0100
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <202603041109.HFnPWnj8-lkp@intel.com>
References: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bindings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
base:   78558965440b27814592ec82d8f3668395953b1b
patch link:    https://lore.kernel.org/r/20260303-ltc4283-support-v6-2-efe11502fad2%40analog.com
patch subject: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap Controller
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041109.HFnPWnj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041109.HFnPWnj8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   =======================         ========================================== [docutils]
>> Documentation/hwmon/ltc4283.rst:258: WARNING: Blank line required after table. [docutils]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +258 Documentation/hwmon/ltc4283.rst

   256	
   257	=======================		==========================================
 > 258	power1_failed_fault_log		Set to 1 by a power1 fault occurring.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
