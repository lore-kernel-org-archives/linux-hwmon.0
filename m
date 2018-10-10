Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39859 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbeJKEzT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Oct 2018 00:55:19 -0400
Date: Wed, 10 Oct 2018 14:31:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (core) Add hwmon_mode structure and mode
 sysfs node
Message-ID: <20181010213113.GA21236@roeck-us.net>
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
 <20181010043310.30873-2-nicoleotsuka@gmail.com>
 <2c535925-5b75-75e6-e383-645fdf45f519@roeck-us.net>
 <20181010211356.GA1706@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181010211356.GA1706@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On Wed, Oct 10, 2018 at 02:13:57PM -0700, Nicolin Chen wrote:
> Hi Guenter,
> 
> On Wed, Oct 10, 2018 at 06:08:30AM -0700, Guenter Roeck wrote:
> > > +available_modes The available operating modes of the chip.
> > > +		This should be short, lowercase string, not containing
> > > +		whitespace, or the wildcard character '*'.
> > > +		This attribute shows all the available of the operating modes,
> > > +		for example, "power-down" "one-shot" and "continuous".
> > > +		RO
> > > +
> > > +mode		The current operating mode of the chip.
> > > +		This should be short, lowercase string, not containing
> > > +		whitespace, or the wildcard character '*'.
> > > +		This attribute shows the current operating mode of the chip.
> > > +		Writing a valid string from the list of available_modes will
> > > +		configure the chip to the corresponding operating mode.
> > > +		RW
> > > +
> 
> > This is not a well defined ABI: The modes would be under full and arbitrary
> > control by drivers, and be completely driver dependent. It isn't just the sysfs
> > attribute that makes the ABI, it is also the contents.
> 
> > Also, being able to set the mode itself (for whatever definition of mode)
> > is of questionable value. This is not only for the modes suggested here, but
> > for other possible modes such as comparator mode vs. interrupt mode (which,
> > if configurable, should be via platform data or devicetree node entries).
> > For the modes suggested here, more in the other patch.
> 
> I could foresee an objection here but still wrote the change after
> seeing quite a few drivers (especially TI's chips) share the same
> pattern for operating modes: power-down, one-shot and continuous.
> For example, I could add it to ina3221 driver instead of touching
> the core code, but later I would do the same for the ina2xx driver
> (just received a board having ina230/226.)
> 
Most hardware monitoring chips have the functionality. That doesn't
mean that it makes sense to use/expose it.

> Although I don't mind doing this and will put it to ina3221 driver
> in v2, yet maybe we could think about a better way to abstract it?
> 

My comments to patch 2/2 still apply. Powerdown duplicates existing and
standardized functionality, one-shot mode is not as simple as just enabling
the mode, and I find it quite unlikely to one-shot mode would actually
save any energy.

Thanks,
Guenter
