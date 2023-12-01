Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A338DF;
	Fri,  1 Dec 2023 08:24:21 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="378549495"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="378549495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="835815703"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="835815703"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:24:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r96JK-000000012L5-02Wy;
	Fri, 01 Dec 2023 18:24:14 +0200
Date: Fri, 1 Dec 2023 18:24:13 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <ZWoIrVAaE04Zs6Xy@smile.fi.intel.com>
References: <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
 <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 01, 2023 at 08:04:12AM -0800, Guenter Roeck wrote:
> On 12/1/23 07:47, Andy Shevchenko wrote:
> > On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno Sá wrote:
> > > On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:

...

> > > Yes, that is the only thing we have. Meaning that there is no hw setting to set the
> > > pins to open drain. Open drain is what they are. That is why I'm not seeing the point
> > > in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
> > 
> > At least you have to implement error for PUSH_PULL mode and other modes,
> > so from the (core) software point of view the user should be able to ask for
> > anything and get an answer from the certain driver that "hey, i do support OD",
> > or "hey, push-pull can't be supported with this hw".
> > 
> 
> It seems to me that this is heading towards a mfd driver. I don't feel comfortable
> with all that gpio specific code in the hwmon subsystem.
> 
> Maybe I should request that all hwmon chips with gpio support must be implemented
> as mfd drivers. I'll have to think about that.

Or auxiliary bus?

-- 
With Best Regards,
Andy Shevchenko


