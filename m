Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C973F7A9B;
	Wed, 29 Apr 2026 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501721; cv=none; b=Aeim2tYp7DU7M/AA8LmP8Vr7G+ALeKZamefTbYyAzN1n+ln3UtcycXWpppqE6GF8e29fmtKlkaoC8HWDPS0AfkMjZAMBN5qsyYyX+79iNqdfMhvJ1uzaS3tFmubi2Z/94/jSfk8blIXx6AEgOkbsFfXEjJrf9sDsm+kLdGKdZnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501721; c=relaxed/simple;
	bh=A7LWwVYry1XAdvkzIRJn1skRmTZF9LeaynpHiyg53AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXsCtfXsUkkQfLIh+2uQJYI59ra0smhJNtQ8jLPTLesF/ze678ZbeTcV2l6l2MDf6L/oOwILYfPao6DWzdcjFPuenl1TqyVCz2h0/JBnmJSnRAMGbAK7Mv9/dtrDJpHUUhTilCEQP0xD2Q9FcLeOi3MTcV3LqCnNjUP3cJN9XXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eokGLQJc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eokGLQJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777501719; x=1809037719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A7LWwVYry1XAdvkzIRJn1skRmTZF9LeaynpHiyg53AY=;
  b=eokGLQJccjBZR0a6fZxCaC6rx6GPGfsrvq4ziGbZkyO2FVMNEiB0EL19
   q5COojwQL5Gq2hqFqTwRL3Y2aHCS2XJJb0tuGO0hEMUFtKQlhHDG+bt9X
   G4PrwAXvfYwqZVxMQOfUe8tgROuqyeo+RO4IRMGkMnZ1A/j7cHVgQ7CtA
   /BxOadfR8pgQR9ZpVrUcPN+XLf2Bdo3D5iFFSRZQqwUe7pqnw7uyx5vRh
   owf4HEvApwm1/KK5ZVtwUmSfZflDHze/bS4yM7i5taOX/6pgeHO9CBXLH
   f9COWEqiLoZg+ZN4Vtxi4QnA/6Lj75IWAx5ZoEs7qxzDm0Wu9ZXr6EMuu
   g==;
X-CSE-ConnectionGUID: o/ZN267UQCOfGsXFtdemKw==
X-CSE-MsgGUID: UlolwuIhTAmKx6zj7+lWug==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78155012"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78155012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:27:28 -0700
X-CSE-ConnectionGUID: QKi56/iIQUuiFzy/6I+A+A==
X-CSE-MsgGUID: +tKxOEIQSeOYz6aqrQEi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="233555744"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2026 15:27:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDNL-000000004dF-2Rwq;
	Wed, 29 Apr 2026 22:27:23 +0000
Date: Thu, 30 Apr 2026 00:27:07 +0200
From: kernel test robot <lkp@intel.com>
To: Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Rong Zhang <i@rong.moe>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Sergio Melas <sergiomelas@gmail.com>
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
Message-ID: <202604300021.hu1KkNxy-lkp@intel.com>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413060931.31091-2-sergiomelas@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Massive-hardware-expansion-and-structural-refactoring/20260417-063319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260413060931.31091-2-sergiomelas%40gmail.com
patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and structural refactoring
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300021.hu1KkNxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300021.hu1KkNxy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
   Documentation/hwmon/yogafan.rst:165: ERROR: Unexpected indentation. [docutils]
>> Documentation/hwmon/yogafan.rst:166: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/hwmon/yogafan.rst:169: ERROR: Unexpected indentation. [docutils]
>> Documentation/hwmon/yogafan.rst:170: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/hwmon/yogafan.rst:171: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/hwmon/yogafan.rst:318: ERROR: Malformed table.
   Bottom border or header rule does not match top border.


vim +166 Documentation/hwmon/yogafan.rst

   162	
   163	This approach ensures that the RLLag filter is a passive discrete-time
   164	first-order lag model:
   165	  - **Smoothing:** Low-resolution step increments are smoothed into 1-RPM
 > 166	  increments.
   167	  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the
   168	  change
   169	    to 1500 RPM/s, matching physical fan inertia.
 > 170	  - **Polling Independence:** The filter math scales based on the time
   171	  delta between userspace reads, ensuring a consistent physical curve
   172	  regardless of polling frequency.
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
