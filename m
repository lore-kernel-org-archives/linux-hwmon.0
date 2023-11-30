Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67752E6;
	Thu, 30 Nov 2023 05:36:38 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="312155"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="312155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745631312"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="745631312"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:36:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r8hDS-00000000hyq-2ge2;
	Thu, 30 Nov 2023 15:36:30 +0200
Date: Thu, 30 Nov 2023 15:36:30 +0200
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
Message-ID: <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 11:20:32AM +0100, Nuno Sá wrote:
> On Wed, 2023-11-29 at 21:55 +0100, Linus Walleij wrote:
> > On Wed, Nov 29, 2023 at 5:08 PM Nuno Sá <noname.nuno@gmail.com> wrote:
> > 
> > > Cool, I actually thought that having the direction + get/set stuff would be weird
> > > given the fact that we can only PULL_LOW or HIGH_Z the pins.
> > 
> > There are several drivers in the kernel that implement .set_config(),
> > it's existing and should be enabled if it has uses.
> 
> Yeah, it might make sense to support it specially for the input case. AFAICT, if I
> use the .set_config() (but from a quick look I think we will need to add support for
> it in gpiolib for the high-z configuration), then I can't use the gpio_regmap stuff.
> As the driver stands I don't think I could do it anyways because setting gpio2-3 and
> alert requires to write 0 on the register rather than 1. But again, I'm still very
> suspicious about the whole thing. The datasheet states:
> 
> "GPIO1-GPIO3 and ALERT all have comparators monitoring
> the voltage on these pins with a threshold of 1.28V even when
> the pins are configured as outputs."
> 
> But we can't really set the direction for gpio2-3 and the alert pins (only getting
> the level and setting it as PULL_LOW or HIGH_Z. gpio1 is the only one where we can
> configure it as input or open drain ouput. Bah, I'll try to see if someone internally
> can shed some light on this.

I have better proposal. If these GPIOs are not needed for the main
functionality of the hardware, can we just left it out for now and implement
later if required?

-- 
With Best Regards,
Andy Shevchenko


