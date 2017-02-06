Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46123 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750984AbdBFThX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Feb 2017 14:37:23 -0500
Date: Mon, 6 Feb 2017 11:37:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>
Subject: Re: [RFC 2/2] hwmon: lm90: add thermal_zone temperature sensor
 support
Message-ID: <20170206193720.GA24834@roeck-us.net>
References: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com>
 <0e28c2989f021bedaff3c8958ab8c1ef738182b7.1486327509.git.chunkeey@googlemail.com>
 <edca1928-6909-f353-3524-30546d715ed3@roeck-us.net>
 <6489282.5YPtSL3FNJ@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6489282.5YPtSL3FNJ@debian64>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Feb 06, 2017 at 05:01:31PM +0100, Christian Lamparter wrote:
> On Sunday, February 5, 2017 7:10:53 PM CET Guenter Roeck wrote:
> > On 02/05/2017 01:03 PM, Christian Lamparter wrote:
> > > This patch adds thermal_zone temperature sensor support
> > > to the lm90 module. The feature has to be enabled
> > > separately via the Kconfig option:
> > > 	CONFIG_SENSORS_LM90_THERMAL_DEVICE
> > >
> > > The LM90 supports two (three for MAX6695 and MAX6696)
> > > temperature sensors. The local sensor is integrated
> > > into the LM90 chip. The remote sensors are connected
> > > to external temperature sensing diodes.
> > >
> > > Cc: Wei Ni <wni@nvidia.com>
> > > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > 
> > Since the hwnmon core now supports thermal registration, and since the lm90
> > driver has already been converted to using the new hwmon API, I would
> > rather like to understand why using the hwmon core for this purpose is
> > insufficient, and I would prefer to address the deficiencies in the hwmon
> > core and not in the driver.
> 
> Hey, that's great, I completely missed that! Yes, this makes the changes
> to lm90.c obsolete.
> 
> However, what about the device-tree updates in 1/2? I'm asking because
> the hwmon device node still needs the #thermal-sensor-cells property
> defined for thermal_zone_of_sensor_register(). Without it, the sensor
> will be skipped and the thermal-zones will do nothing (no regulation).
> I can respin the device-tree patch (local and remote need to trade 
> places). What do you think?
> 
Sure, no problem with that. Does supporting this require changes in the hwmon
core ?

Thanks,
Guenter
