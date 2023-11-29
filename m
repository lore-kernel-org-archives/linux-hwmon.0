Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9951F10E3;
	Wed, 29 Nov 2023 08:18:45 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479389564"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="479389564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839475132"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839475132"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:18:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r8NGo-00000000U2X-0Hrq;
	Wed, 29 Nov 2023 18:18:38 +0200
Date: Wed, 29 Nov 2023 18:18:37 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <ZWdkXakM4lRe1bij@smile.fi.intel.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 05:08:41PM +0100, Nuno Sá wrote:
> On Wed, 2023-11-29 at 15:49 +0100, Linus Walleij wrote:
> > On Fri, Nov 24, 2023 at 3:18 PM Nuno Sa via B4 Relay
> > <devnull+nuno.sa.analog.com@kernel.org> wrote:

...

> > Other than that it looks fine.
> 
> Cool, I actually thought that having the direction + get/set stuff would be
> weird given the fact that we can only PULL_LOW or HIGH_Z the pins.

Oh, then it's probably should be a pin config involved.

-- 
With Best Regards,
Andy Shevchenko


