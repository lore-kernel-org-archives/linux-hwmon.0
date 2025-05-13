Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC9130A73
	for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 00:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097628; cv=none; b=HVBi2iLj0lAwi/W3tGZiAkyIA++DwnnNrTyshvCVBjlfT8dxoqDFN5UV90y/haHU6SgBPXEELfj12SYzAzey9mEb1SaWpeblSvIvDI+cvMXtVfTRpJiGGhTvelL5e2xSYsZV0My0uLGRe8Yh1hX3BdrdRowDC14QIw7dy4nkJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097628; c=relaxed/simple;
	bh=fXUtVEOU25fjuC90YfQVRzFA5zzYMzHnlvzLVa79PV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EXPaGrz5mFHlGz/4niCCnnRNgaH4rKaFz6byvnukzpxBYkG+blmcah4TYgVvl+r9TVRHYHAv2qh+pxbMLKBXVtLNW8qJayZuXwgVA8cNzFyt5pZEzb8+EaJeBtwLmvB2oE00h1hrmOpffuUNK5k40+/kdL1U7SLE64NMPSAEqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivVRVAgO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivVRVAgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747097626; x=1778633626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXUtVEOU25fjuC90YfQVRzFA5zzYMzHnlvzLVa79PV0=;
  b=ivVRVAgODXrCQLyZpkYDLtA5hW+U4jPZzf8YwYKanM6svmENEuKMeQuo
   +fpNle3dSnS0e7XczWvsV1Rk5vArJ3hGuKm/hgbRyM1RHvKfIycK7pmU+
   4hWEzNIJwnAhKfTjWiWYy73LHrTAOpmUWuo4BT+x8Bu4i9SUDxMi0v8XM
   RbFeSefazbVVkqjfSkOEDneBvite4cUsL+wdOVWGdv0pghOLd84Fqukmj
   baVZvkwalJ2jaKeraPHW0uJDiYt6wxZjNk5zsxYXheAa9t7/Ty2Dp+hvl
   fcSnTlceOgjn+oV99OVCaoc1s+N5imcOfvdI3FyhjtVy4KlG0XUoaYHRE
   g==;
X-CSE-ConnectionGUID: gDQnpHE6Q7KDZ7+en62T+w==
X-CSE-MsgGUID: 404pCwFITDClLJtbXHMCqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59558360"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="59558360"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 17:53:46 -0700
X-CSE-ConnectionGUID: hMDF6ac6RB6jPyWTgKuxwQ==
X-CSE-MsgGUID: TJ1/pZkoQo62wwP5TOkc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="174678078"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 May 2025 17:53:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEdtu-000FYx-0A;
	Tue, 13 May 2025 00:53:42 +0000
Date: Tue, 13 May 2025 08:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <eg@keba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 45/45] drivers/hwmon/kfan.c:108:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202505130827.32HeaRdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   b35fa477e6b6784401732d6d17ca643f7f73e4c5
commit: b35fa477e6b6784401732d6d17ca643f7f73e4c5 [45/45] hwmon: Add KEBA fan controller support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250513/202505130827.32HeaRdb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130827.32HeaRdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130827.32HeaRdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/kfan.c:108:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     108 |         default:
         |         ^
   drivers/hwmon/kfan.c:108:2: note: insert 'break;' to avoid fall-through
     108 |         default:
         |         ^
         |         break; 
   drivers/hwmon/kfan.c:141:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     141 |         default:
         |         ^
   drivers/hwmon/kfan.c:141:2: note: insert 'break;' to avoid fall-through
     141 |         default:
         |         ^
         |         break; 
   drivers/hwmon/kfan.c:169:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     169 |         default:
         |         ^
   drivers/hwmon/kfan.c:169:2: note: insert 'break;' to avoid fall-through
     169 |         default:
         |         ^
         |         break; 
   3 warnings generated.


vim +108 drivers/hwmon/kfan.c

    94	
    95	static int kfan_write(struct device *dev, enum hwmon_sensor_types type,
    96			      u32 attr, int channel, long val)
    97	{
    98		struct kfan *kfan = dev_get_drvdata(dev);
    99	
   100		switch (type) {
   101		case hwmon_pwm:
   102			switch (attr) {
   103			case hwmon_pwm_input:
   104				return kfan_set_pwm(kfan, val);
   105			default:
   106				break;
   107			}
 > 108		default:
   109			break;
   110		}
   111	
   112		return -EOPNOTSUPP;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
