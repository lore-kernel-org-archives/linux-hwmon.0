Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4D1A6;
	Fri,  1 Dec 2023 08:23:48 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="457842662"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="457842662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="893253502"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="893253502"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:23:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r96Im-000000012KW-2gjQ;
	Fri, 01 Dec 2023 18:23:40 +0200
Date: Fri, 1 Dec 2023 18:23:40 +0200
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
Message-ID: <ZWoIjN2N1jDfUWlk@smile.fi.intel.com>
References: <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
 <4afe8108fb12690779351f16b0b31977caca640b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4afe8108fb12690779351f16b0b31977caca640b.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 01, 2023 at 05:19:33PM +0100, Nuno Sá wrote:
> On Fri, 2023-12-01 at 17:47 +0200, Andy Shevchenko wrote:
> > On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno Sá wrote:
> > > On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:

...

> > > Yes, that is the only thing we have. Meaning that there is no hw setting to set
> > > the
> > > pins to open drain. Open drain is what they are. That is why I'm not seeing the
> > > point
> > > in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
> > 
> > At least you have to implement error for PUSH_PULL mode and other modes,
> > so from the (core) software point of view the user should be able to ask for
> > anything and get an answer from the certain driver that "hey, i do support OD",
> > or "hey, push-pull can't be supported with this hw".
> 
> Yeah, that makes total sense. But I guess that the 'default' should already 
> -EOPNOTSUPP right?

Without OP part (as internal Linux error code), yes.

-- 
With Best Regards,
Andy Shevchenko


