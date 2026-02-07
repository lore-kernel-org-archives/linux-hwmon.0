Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6A51D6193;
	Sat,  7 Feb 2026 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770462345; cv=none; b=pvD2hG/sf4E+3s30waTetGbf43r9DRlxZdSdmpEzzXoZuVDCJj4LjMQEmOAsmM8unsMC6LVdDv1BvdO2SLB/OVgXcwHNAAwyOBZ5R3n457fjxKludU8QgpOjI+zqPTziM12GmAgPN6bMtDHh6F2V8ILo/zuJDp/CSsbbn7/0YKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770462345; c=relaxed/simple;
	bh=LcJAUWF/3Oe1UJRTXKu+i0TtwNH81GLm+6SxQxVMbQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEPg06KGMVAx+SX8tM7DM3gK0kUw+p8x0Nl5GrSrUQhBf8npTDToVHerf7qB4jPy6qHgnE+zyGkBRDquOemgd3l/O4TJnS4QUYcQXWmRUM8uG4+fx9Czdt28ycI1Q3LwtBRCINUexQRlQCL1Nhzlz4NGVfQp9IRsAxmgFtKb47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKWy7Agh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKWy7Agh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770462345; x=1801998345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcJAUWF/3Oe1UJRTXKu+i0TtwNH81GLm+6SxQxVMbQM=;
  b=HKWy7AghPlT2Oxco3PZwhP5wMlhd7reJw61fL1s+qFaqjiiGfPLjzPx1
   OjdPeV1Kr041a6gxz8LAutdN3FiGTrTzMmuYp/J5T9cZSoo5IruuLGDba
   vD/FpGVIAJiQJV85dsndn68XjkjPr96kjCM6+TrMLHpzu+Di0pGstkqCs
   yp7sCkPr3drAAM9Yqb6MekedWvqzHFiRRlS41vT1tgestxe4iCkWBnvYU
   YCS46ypMfp65QbqkxJ7XRZx1VYqzwOUzRxY7KlO6UejwLdCXT617PGnZ+
   Q8p+8jdiMfPvBjZpMp7sSOaC2xCix9eTtz7nauqD9qJF7yJ9gIg2OgsE7
   g==;
X-CSE-ConnectionGUID: V7IPL3qiSM6rEJ4xOjmGWA==
X-CSE-MsgGUID: IievAw/0TK2HSniGzZP2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70847813"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70847813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:05:44 -0800
X-CSE-ConnectionGUID: KqtSxh00RcK4ZpJpftAHqg==
X-CSE-MsgGUID: uqlFWAWRRxCHnRy84Zh3Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234059155"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 03:05:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vog8A-00000000lbM-2iTi;
	Sat, 07 Feb 2026 11:05:38 +0000
Date: Sat, 7 Feb 2026 19:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Message-ID: <202602071928.rf2Gjdgd-lkp@intel.com>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>

Hi Carl,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f]

url:    https://github.com/intel-lab-lkp/linux/commits/Carl-Lee-via-B4-Relay/dt-bindings-hwmon-pmbus-mpq8785-add-MPQ8786-support/20260205-180428
base:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
patch link:    https://lore.kernel.org/r/20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850%40amd.com
patch subject: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID VOUT on MPQ8785/MPQ8786
config: i386-randconfig-141-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071928.rf2Gjdgd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071928.rf2Gjdgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071928.rf2Gjdgd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mpq8785.c:63:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
      63 |         default:
         |         ^
   drivers/hwmon/pmbus/mpq8785.c:63:2: note: insert '__attribute__((fallthrough));' to silence this warning
      63 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/hwmon/pmbus/mpq8785.c:63:2: note: insert 'break;' to avoid fall-through
      63 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +63 drivers/hwmon/pmbus/mpq8785.c

    50	
    51	static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
    52	{
    53		int ret;
    54	
    55		switch (reg) {
    56		case PMBUS_VOUT_MODE:
    57			ret = pmbus_read_byte_data(client, page, reg);
    58			if (ret < 0)
    59				return ret;
    60	
    61			if ((ret >> 5) == 1)
    62				return PB_VOUT_MODE_DIRECT;
  > 63		default:
    64			return -ENODATA;
    65		}
    66	
    67		return ret;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
