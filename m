Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E63F8DF1;
	Fri, 27 Mar 2026 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633559; cv=none; b=aeofJ/ZSa10+29ZQ9TDSCwcDRZJu7Ky0v7zZanvmgYlu61keOnnq7ba2j3RQuWhkMCZnNYoZbHhSoi1Kx3HGKnvNDd82gUMJu2N39JrUdzFN1/DrINSAO9O+fj1vGx040OgvNJhQHea7Xi1GekGnNU1PcntKnvdkMVkH+mIRIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633559; c=relaxed/simple;
	bh=7MKGLSU0Uc8AkKs75DselcoVRgmBQX9a7Ku4X+dfGNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHIouCxTX0i+aplSlaJPuo3PuzF0YuWaWmRC37MIqMxX3zmMOsmageOhEerSC84VMHaTY3CO0C6IU60kG6iE5LlhHtI0l/CI08ugLcdrtOWMVwhfgM47637BeRVZ0GCL/W+YsDGGJes2CAAaX293N50lKlNLFvbXknCrt1jaKWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/VDECN2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/VDECN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774633557; x=1806169557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7MKGLSU0Uc8AkKs75DselcoVRgmBQX9a7Ku4X+dfGNE=;
  b=F/VDECN2eyVyuumm3Gq/C3VFHahh0MCPUeCi8uY2gxWhnDd7s0RJXNN8
   9/unI50y1dVmBWINJddSipmn6DRnnwso8h1zdq8DhxD9vrKtsXG9Epk4l
   DeQZN/X3rn6EFMft3Tk6W2cgML5C2DoKRA2fCVANeq99wFtKDEBCJZtSV
   61rNo95WUaA0FCLqB/cxHCsEj0UUhX2LpzqEnpplms9czfVrVyuuOgPOr
   xRLxpz5qMascRdVP7gwyIhFdvu5kr/UtOCFbS/prHg5ey0abJW4U4oLWA
   a1pVDW9RS9W5merndA1HyE2uyoNc5Ior6NmB87Osu59/No8dooFtNZ6sw
   Q==;
X-CSE-ConnectionGUID: ceultxaZSsijRHy3y3uZ5Q==
X-CSE-MsgGUID: VFQTKrxESduhPLYVxYMmtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86403733"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86403733"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:45:57 -0700
X-CSE-ConnectionGUID: ggR0SxGjTOWeQLu4CSIrvw==
X-CSE-MsgGUID: WDlozi/rR8eF1AY3tlEOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="220980991"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 10:45:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6BFp-000000007XR-32ge;
	Fri, 27 Mar 2026 17:45:53 +0000
Date: Fri, 27 Mar 2026 18:45:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: Re: [PATCH v10] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
Message-ID: <202603271810.D8jNEcLp-lkp@intel.com>
References: <20260327012925.266336-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327012925.266336-1-sergiomelas@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Add-support-for-Lenovo-Yoga-Legion-fan-monitoring/20260327-184007
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260327012925.266336-1-sergiomelas%40gmail.com
patch subject: [PATCH v10] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603271810.D8jNEcLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271810.D8jNEcLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
   Documentation/hwmon/yogafan.rst:34: ERROR: Unexpected indentation. [docutils]
   Documentation/hwmon/yogafan.rst:40: ERROR: Unexpected indentation. [docutils]
>> Documentation/hwmon/yogafan.rst:80: WARNING: Title underline too short.


vim +80 Documentation/hwmon/yogafan.rst

    78	
    79	MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
  > 80	-----------------------------------------------------------------------------------------------
    81	82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
    82	80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
    83	83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
    84	82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
    85	81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
    86	82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
    87	82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
    88	82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
    89	82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
    90	82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
    91	83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
    92	81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
    93	*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
    94	-----------------------------------------------------------------------------------------------
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
