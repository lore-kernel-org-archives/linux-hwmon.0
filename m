Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpkFwsgL"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB7DD8;
	Thu, 16 Nov 2023 04:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700138442; x=1731674442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7i5pDIu8W1NKuPRmvouUT6+/JBgfYe8Hd8a+RRcWvM=;
  b=UpkFwsgLf985ma6LHALk/uvrSiED6Et4y3c+Je4V29r1xVfxIhwgdrE3
   AeA/70slLtKUza8peGM6FJXMNU6VzqQrkGDfncFKY98Zej6nL5uUEV/P9
   wsyqsClYrgtLdYRAhgnbIvx8zTQQdCa3G8VGbRrcV95WMDa6DifhMghfq
   X6Vt7b9EquyBDBaFEabLKPM2e/ESEUayIBl5Jtv2/ezR7b63znLLjM9Sl
   2RTc5vgJz1G6NSZakeBNf0PktcENQiXHEByhPdxAIluH35VNHig45/H3W
   cuzb0NB8uHOIS3yUZj+m+oTP40NPwEDhbZnFplrGynHn8zAq+azadw1JB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370437791"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="370437791"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 04:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096773125"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="1096773125"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2023 04:40:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3bfb-0001ej-2t;
	Thu, 16 Nov 2023 12:40:31 +0000
Date: Thu, 16 Nov 2023 20:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Henry Shi <henryshi2018@gmail.com>, hbshi69@hotmail.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, hb_shi2003@yahoo.com,
	henrys@silicom-usa.com, wenw@silicom-usa.com
Subject: Re: [PATCH v12] platform/x86: Add Silicom Platform Driver
Message-ID: <202311162035.fmFBbRzs-lkp@intel.com>
References: <20231113210216.30237-1-henryshi2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113210216.30237-1-henryshi2018@gmail.com>

Hi Henry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on linus/master tip/auto-latest v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Shi/platform-x86-Add-Silicom-Platform-Driver/20231114-050431
base:   tip/master
patch link:    https://lore.kernel.org/r/20231113210216.30237-1-henryshi2018%40gmail.com
patch subject: [PATCH v12] platform/x86: Add Silicom Platform Driver
config: i386-kismet-CONFIG_LEDS_CLASS_MULTICOLOR-CONFIG_SILICOM_PLATFORM-0-0 (https://download.01.org/0day-ci/archive/20231116/202311162035.fmFBbRzs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311162035.fmFBbRzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162035.fmFBbRzs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR when selected by SILICOM_PLATFORM
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=n]
     Selected by [y]:
     - SILICOM_PLATFORM [=y] && X86_PLATFORM_DEVICES [=y] && HWMON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
