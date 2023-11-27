Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D29DD;
	Mon, 27 Nov 2023 08:03:35 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="391610315"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391610315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099823783"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="1099823783"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:03:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r7e52-0000000HY9E-2bUV;
	Mon, 27 Nov 2023 18:03:28 +0200
Date: Mon, 27 Nov 2023 18:03:28 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <ZWS90GQTJWA7DrML@smile.fi.intel.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <202311250548.lUn3bm1A-lkp@intel.com>
 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wrote:
> On 27/11/2023 09:10, Krzysztof Kozlowski wrote:

...

> Wait, this was not even unusual test, just standard compile, which means
> you did not do basic tests on your end. You must build your new driver
> with W=1, smatch, sparse and coccinelle before sending upstream.

Well, sparse is lagging in development, for the last year it's at least two
times it broke kernel builds because of being not ready for the new stuff used
in the kernel. Do we have anybody to sync this? I don't think so, hence
requiring this from developer is doubtful. Otherwise I agree, that basic
compilation with GCC/LLVM must be done.

-- 
With Best Regards,
Andy Shevchenko


