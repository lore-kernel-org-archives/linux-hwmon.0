Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804530;
	b=UIv97Qa0solyWgDXD3A4eulKcXtRrN0Mt+UCuM1Y9WIADnrnuY8n0zOkjLC98i/KObSF
	 vaVm1JiY/FigVNHpkzc89pvAYOAcjw6oykaT8FtduvAAGYg2kyJCkfEUgreEjEyPPmFhQ
	 E5tHPxr20HCMFp2huFe+5zUdvraLY+WFH/VbVfoC40XkNPGlTyDwVwIxTPx1n60IgUfp3
	 7JIb/UsndaZn9P61MbZ99NrAPEuaZrPClRlsSM70UCgIMufaKxB8K38RicSOgEaEd7Wic
	 skS6iirzFUbcv+xQSJP22N2Z3DsrRPwGz9H157MwIAI2/rGrBskgI75YrLzqP7CfHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4+bF1PXdM9i12hwxUlirMfiz4q0u6ZQpW494Zdzq3Q8=;
	b=3g1k9aH/tecnSuZaluA5HyvLJlOzAVsfGUXz2akcVUwnF0A4cMJr0wwLAx1luq2JMkUi
	 qvfbhJOJ3hAlvBEjd1zYXaVvgjixPvcP09OrRXNms+lXrvncK+DLRnoEWATZl2UiWTThL
	 WSP+/vvSM3GLWSrBCgw6p4Ft65rVdjCv0lC67heJYvb2Sx4aCZ5JiXygSNYGFDR3vQEDA
	 1Wi/DCbAWsgYK8/W02YgYyFEtK7Hu47GurFWVllAguzUg70lH2ZJ0bijdFPywUmQ8Rjn5
	 2m0K0ZmJMDtKmzkoZluDf+Akq34CbaBeDB48K0GnkX6pZcOr7JF/bqa4HT2xAqqArsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmQ19CXE;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6F606A31C;
	Mon, 16 Nov 2026 04:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmQ19CXE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794804530; x=1826340530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jBip4E2/xRX2TRtB/jshEtf0db72k3wz/T8VBbLeJ4g=;
  b=VmQ19CXESMkHgWncgkBOviJcvF2HJn23x2wIRvS9HH/ifvcDg+Hf3NMF
   0VaJu0R+Unv7DDuSVzWhlwNGlca9G4eSeFSZhpl+xKVrF+Zjwe6iz0Rpf
   QxwnQpm6do4fil4rtqQjDLDbX2RNFRlNcwVXMDiOoFLHYWo++s5+tb4mx
   CmrxuXlwimqjpIVN5w62smWVeJUQ5hD3Iv7LpTkXtrKEmyHOQJlaIQvNb
   TMaDEsYk7NeigtX0fGgU8IrKBNT6OYcOPEAzR/7Nlv2U2IN3De3WwxsXc
   HFxeOcZCiWg6Jz9VguibsBzro5/7uk6qP7/UfRZo7E/SUk2JTvUi++drn
   Q==;
X-CSE-ConnectionGUID: GHX7I7dxRWmBOM2UmIOvbA==
X-CSE-MsgGUID: UItC521dTS2ET4dEV2TRkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3518298"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3518298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 20:48:49 -0800
X-CSE-ConnectionGUID: VuhJD+lmSleff1kF0eSD3g==
X-CSE-MsgGUID: rBi3O6LXSwKZ45yb2JguoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9284633"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 20:48:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSoe4-000000017qi-1AK4;
	Mon, 16 Nov 2026 04:48:44 +0000
Date: Mon, 16 Nov 2026 12:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Message-ID: <202611161243.v8EOeTtt-lkp@intel.com>
References: <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0b4cadbe7c39d830dec35c4a2655483de0dae568]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Turner/alpha-marvel-report-environmental-events-without-VERBOSE_MCHECK/20261114-123947
base:   0b4cadbe7c39d830dec35c4a2655483de0dae568
patch link:    https://lore.kernel.org/r/20261114-marvel-env-v1-5-890328e4b7e5%40gmail.com
patch subject: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer environmental sensors
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261116/202611161243.v8EOeTtt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161243.v8EOeTtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161243.v8EOeTtt-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `.init.text' of fs/nfs/blocklayout/blocklayout.o: defined in discarded section `.exit.text' of fs/nfs/blocklayout/blocklayout.o
   `.exit.text' referenced in section `.init.text' of fs/nfs/blocklayout/blocklayout.o: defined in discarded section `.exit.text' of fs/nfs/blocklayout/blocklayout.o
   alpha-linux-ld: drivers/hwmon/marvel-env.o: in function `marvel_env_refresh':
>> (.text+0x528): undefined reference to `marvel_cfgtree_partial_update'
>> alpha-linux-ld: (.text+0x52c): undefined reference to `marvel_cfgtree_partial_update'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
