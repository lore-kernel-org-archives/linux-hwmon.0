Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F41A239A;
	Sat,  7 Feb 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770462945; cv=none; b=VXHP6j2ZB+vUwz1VUwaotVMvHhLC52RNoj/Eq7QbM66pPK9rJxkBQrQz/25BQTkV6AS8WODWU9FMD7b8tN539U+fL4AxJ+fDqyvmjEQRnfonW3pJrTy2Rfaz54Yx/LMvJ/2alxGjOWCmyAyf8XZNrBPewMiDh+FTSvzo/fJF1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770462945; c=relaxed/simple;
	bh=qOTMyY8iw0Hxk+7JdvvZN0z2iHOtYdPDl/VrlBCuGrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlkKwwZvksqkDBVWtMBXj5uTrMYRP8xrLsxoPVqVmspc1p/WwEGdk32YlLRNSOQnmxmA9mHMt4iAwK2/vP8zG30lxtt3FOQnOCVhdWvoZL6uJvwQ755hxkrj2fH0Xof9ksDsXSXQ6razuKHi0C0m8wIryXRiQpI3ZV6UVg4SigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQfBHcHQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQfBHcHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770462945; x=1801998945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qOTMyY8iw0Hxk+7JdvvZN0z2iHOtYdPDl/VrlBCuGrU=;
  b=FQfBHcHQf0C6qenjTD2yu5P1R8KURIOMvsG8oI7VaPXfbdPVyiOEMpB6
   IRv90uFvk3n05sxHygcab1WHdwGfaZ2Fzs1mrozCJGEzG+XfzVEQYOCoe
   z7ZCKWnikMlBXA0L+m5WXWrdCj5yO+X4bUPkt1d7s53OA2r7IcruApxsS
   AJayUxwVmyie2zLvmqEtDwr8wAsamL1NCm9nC9s0k1dmWtSLzArAaHLge
   3OfT8KLAFhTdFRlm++BIaUzgXr0NOQf9lVtd0ReJzk6Rq1HevqHlXczEG
   6d9E+ET8mqw3GgOzEKSNae9yp71Cw3wdLjh4zKypCeBg+SHEXVCEiX1sl
   Q==;
X-CSE-ConnectionGUID: duXWD3Z3SDyxymREthCv1Q==
X-CSE-MsgGUID: DdEumKn9R9mehV939xGs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59219637"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="59219637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:15:44 -0800
X-CSE-ConnectionGUID: 7vXsVE9ATjei0yXdix2TyA==
X-CSE-MsgGUID: 2xznzKtsTV+/GqjsCPehrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="241759485"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2026 03:15:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vogHr-00000000lbs-02mx;
	Sat, 07 Feb 2026 11:15:39 +0000
Date: Sat, 7 Feb 2026 19:15:16 +0800
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
Message-ID: <202602071904.asgoYuoc-lkp@intel.com>
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
config: s390-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071904.asgoYuoc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071904.asgoYuoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071904.asgoYuoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/mpq8785.c: In function 'mpq8785_read_byte_data':
>> drivers/hwmon/pmbus/mpq8785.c:61:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if ((ret >> 5) == 1)
         ^
   drivers/hwmon/pmbus/mpq8785.c:63:2: note: here
     default:
     ^~~~~~~


vim +61 drivers/hwmon/pmbus/mpq8785.c

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
  > 61			if ((ret >> 5) == 1)
    62				return PB_VOUT_MODE_DIRECT;
    63		default:
    64			return -ENODATA;
    65		}
    66	
    67		return ret;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
