Return-Path: <kernelorg@elchenberg.name>
Return-path: <kernelorg@elchenberg.name>
Date: Thu, 7 Jun 2018 08:04:55 +0200
From: Helge Eichelberg <kernelorg@elchenberg.name>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Disable fan support for Dell XPS13
 9333
Message-Id: <20180607080455.daccaaab8a7e2f2a35b68873@elchenberg.name>
In-Reply-To: <20180606152134.sw77aborznfy6mrj@pali>
References: <20180605173833.27003-1-kernelorg@elchenberg.name>
	<20180606152134.sw77aborznfy6mrj@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 6 Jun 2018 17:21:34 +0200
Pali Rohár <pali.rohar@gmail.com> wrote:

> On Tuesday 05 June 2018 19:38:32 Helge Eichelberg wrote:
> > Calling fan related SMM functions implemented by Dell BIOS firmware on Dell
> > XPS13 9333 freeze kernel for about 500ms. Until Dell fixes it we need to
> > disable fan support for Dell XPS13 9333.
> 
> Hi! Have you reported this firmware bug to Dell?

No, I haven't.

> Also we should probably match also BIOS version and do not apply this
> blacklist quirk for BIOS versions in which Dell fixed it.

The BIOS hasn't been updated since 08/31/2015 and I'm running the latest version (A08). I wonder if Dell cares anymore about the 9333 which has been replaced by the 9343 in early 2015. Nevertheless, should I add a line matching the BIOS version and should it look like this?

DMI_EXACT_MATCH(DMI_BIOS_VERSION, "A08")

Helge

> > Via "force" module param fan support can be enabled.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=195751
> > Signed-off-by: Helge Eichelberg <kernelorg@elchenberg.name>
> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index bf3bb7e1adab..9d3ef879dc51 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -1074,6 +1074,13 @@ static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
> >  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
> >  		},
> >  	},
> > +	{
> > +		.ident = "Dell XPS13 9333",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS13 9333"),
> > +		},
> > +	},
> >  	{ }
> >  };
> >  
> 
> -- 
> Pali Rohár
> pali.rohar@gmail.com
