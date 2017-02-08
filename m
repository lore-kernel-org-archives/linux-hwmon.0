Return-path: <chunkeey@googlemail.com>
From: Christian Lamparter <chunkeey@googlemail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 1/2] devicetree: add lm90 thermal_zone sensor support
Date: Thu, 09 Feb 2017 00:01:55 +0100
Message-ID: <2979642.2YCYMDeKdL@debian64>
In-Reply-To: <20170208223034.om75tphg277l2ink@rob-hp-laptop>
References: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com> <20170208223034.om75tphg277l2ink@rob-hp-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-hwmon@vger.kernel.org>

On Wednesday, February 8, 2017 4:30:34 PM CET Rob Herring wrote:
> On Sun, Feb 05, 2017 at 10:03:15PM +0100, Christian Lamparter wrote:
> > This patch updates the LM90's devicetree definition to
> > include the #thermal-sensor-cells property as well as
> > the sensor constants in include/dt-bindings/thermal/lm90.h.
> > 
> > Cc: Wei Ni <wni@nvidia.com>
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> > I'm aware that there was atleast one previous attempt to add
> > thermal_zone temperature sensors for the LM90 module. This was
> > discussed on:
> > <http://www.gossamer-threads.com/lists/linux/kernel/1992853>
> > <https://lkml.org/lkml/2014/3/4/194>
> > 
> > This RFC is meant to get it going again. As I would really
> > like to have this functionality for the Netgear WNDR4700.
> > This router uses a G781 to measure the SoCs temperature
> > in order to regulate a TC654 fan-controller.
> > <https://git.lede-project.org/?p=source.git;a=commit;h=9e0fd1b52ad1f805a308bf6a5a13236f352fd962>
> > ---
> >  Documentation/devicetree/bindings/hwmon/lm90.txt |  6 ++++++
> >  MAINTAINERS                                      |  1 +
> >  include/dt-bindings/thermal/lm90.h               | 12 ++++++++++++
> >  3 files changed, 19 insertions(+)
> >  create mode 100644 include/dt-bindings/thermal/lm90.h
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
Ok thanks. Just a quick note: Don't apply this yet. I'm working
on a patch, but this has to wait for the weekend.

OnT: From Guenter Roeck:
> Sure, no problem with that. Does supporting this require changes in the hwmon
> core ?
No changes to hwmon's core are required. It's basically this 1/1 patch with
+#define LM90_LOCAL_TEMPERATURE 1 (updated to 0)
+#define LM90_REMOTE_TEMPERATURE 0 (updated to 1)

swapped and a small update to lm90.c. This way the
defines are doing something in the driver [0]:

static const u8 lm90_temp_index[3] = {
        LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
};

will become something like:

static const u8 lm90_temp_index[3] = {
	[LM90_LOCAL_TEMPERATURE] = LOCAL_TEMP,
	[LM90_REMOTE_TEMPERATURE] = REMOTE_TEMP,
	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_TEMP
};

Regards,
Christian

[0] <http://lxr.free-electrons.com/source/drivers/hwmon/lm90.c#L1018>
