Return-path: <sam@mendozajonas.com>
Message-ID: <1493354043.32554.1.camel@mendozajonas.com>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 28 Apr 2017 14:34:03 +1000
In-Reply-To: <1493168635.1790.6.camel@mendozajonas.com>
References: <20170421042505.20403-1-sam@mendozajonas.com>
	 <248726f5-f1e7-4feb-1917-049173303aa6@roeck-us.net>
	 <1493168635.1790.6.camel@mendozajonas.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 2017-04-26 at 11:03 +1000, Samuel Mendoza-Jonas wrote:
> On Fri, 2017-04-21 at 06:49 -0700, Guenter Roeck wrote:
> > On 04/20/2017 09:25 PM, Samuel Mendoza-Jonas wrote:
> > > IR35221 is a Digital DC-DC Multiphase Converter
> > > 
> > > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > > ---
> > > - Tested on a ppc64 system which includes several of these devices.
> > > - This patch re-implements the linear reg2data/data2reg functions from
> > >   pmbus-core like some other drivers in order to scale some results. Is
> > >   this something that would be better off being made generic for pmbus
> > >   drivers to call?
> > 
> > That might make sense. The only other driver is zl6100, or am I missing
> > something ?
> 
> I believe ltc2978 has a small implementation as well.
> 
> > 
> > Trying to understand the code, the data format seems to be linear11 with
> > an added exponent on top of it. Is that correct ? If so, I wonder if we should
> > make that configurable, ie store the additional exponent in R and handle it
> > in the pmbus core. Would that help ?
> 
> Yes that's essentially what it is. Using R for the extra exponent would
> be a neat solution, however at least for this chip commands in the same
> class have different scaling exponents (eg VIN_UV_WARN_LIMIT vs
> READ_VIN). I'll have a look though and see if I can cover this - maybe a
> small wrapper function that updates the exponent in the data returned by
> pmbus_read_word_data()/etc?

After thinking about this for a bit I don't think it's as straightforward
 as I would like :)

For ir35221 storing an exponent in R isn't quite enough since we have
regs of the same class with different exponents. Perhaps we could have a
simple array in pmbus_driver_info that gives an exponent for each reg,
but then we have per-page scaling too just to be annoying.
In zl6100 the main change is essentially (value * 9) / 10 which isn't a
power of two anyway.

What the three mentioned drivers have in common are partial
implementations of pmbus_reg2data_linear() - pmbus_reg2data() could be
made public, but since that converts from sensor->data which we're meant
to be updating in the first place it feels a little backwards even if we
temporarily update it with the new (unscaled) value. Is it worth trying
to split out some of the reg2data logic in order to simplify these
drivers slightly?

Sam
