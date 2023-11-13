Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9C224C1;
	Mon, 13 Nov 2023 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3158DD54;
	Mon, 13 Nov 2023 08:31:50 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12016956"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12016956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830276548"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="830276548"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:31:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andy@kernel.org>)
	id 1r2Zqg-0000000DbZi-0jb4;
	Mon, 13 Nov 2023 18:31:42 +0200
Date: Mon, 13 Nov 2023 18:31:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <ZVJPbV2469kjqbHu@smile.fi.intel.com>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-3-nuno.sa@analog.com>
 <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
 <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 13, 2023 at 11:13:44AM +0100, Nuno Sá wrote:
> On Fri, 2023-11-10 at 18:50 +0200, Andy Shevchenko wrote:
> > On Fri, Nov 10, 2023 at 04:18:46PM +0100, Nuno Sa wrote:

...

> > > +/*
> > > + * relaxed version of FIELD_PREP() to be used when mask is not a compile
> > > time constant
> > > + * u32_encode_bits() can't also be used as the compiler needs to be able to
> > > evaluate
> > > + * mask at compile time.
> > > + */
> > > +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))
> > 
> > Can we name it accordingly as done in other places, and TBH it's a time to
> > move
> > it to the header. (At least I know about two more implementations of this).
> 
> Not sure what you mean? Is there some other drivers doing it already? I'll,
> anyways, wait on more feedback for the GPIO stuff because we might end up not
> needing it...

$ git grep -n 'define field_prep'

...

> > > +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to pull
> > > down the line */
> > > +	if (!gpio->active_high)
> > 
> > Hmm... Why do you need a separate flag for this? Shouldn't be described or
> > autodetected somehow?
> 
> Well, if a consumer as an active high gpio, it expects to call
> gpiod_set_value(..., 1) and the line to assert, right? To have that, we need to
> write 0 on the device register for some of the pins.

It doesn't matter, the GPIO (not _raw) APIs are using logical levels, 1 — activate,
0 — deactivate.

> And the same story is true for active low. gpiod_set_value(..., 0) will have the
> gpiolib to automatically invert the value and we get 1 in the callback.

Yes, but why do you have that flag in the structure?

> > > +		val = !val;

...

> > > +	*val = DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);
> > 
> > I'm wondering if you can do some trick to "divide" actually to 2^16 so, it
> > will
> > not use division op at all?
> 
> Hmm, not sure if it will be obvious but you mean something like:
> 
> *val = (be16_to_cpu(in) * (u64)fs) >> 16;
> 
> Is this what you mean? If so, we`ll loose the "CLOSEST" handling... Not so sure
> if we need to be "that" performant in such a code path. But Guenter can also
> share his opinion...

	*val = DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs + (BIT(16) - 1), BIT(16));

will give the same result without division, no?
What you need is to make sure that the multiplication won't get closer to
U64_MAX, which seems not the case here (max 48-bit number).

Ditto for all other similar cases which I already pointed out.

...

> > > +	u64 temp =  DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;

> > 
> > "* BIT(16)" / "* BIT_ULL(16)" ?
> 
> Well, I can just place the number as in the formula. Not too keen on the BIT()
> macros as this is not really a mask.

I'm not sure I got this. The << 16 neither a plain number and BIT() is equally
good. With power of two it's most likely that this is due to internal
implementation of the firmware or hardware, so again BIT() can be still good
enough to show that.

...

> > > +	msleep(3200);
> > 
> > Not a single letter to comment such a huge delay :-(
> 
> Well, it's after doing a reset so it should be pretty obvious is the number
> given in the DS. But I'll put a comment on it.

Please do.

-- 
With Best Regards,
Andy Shevchenko


