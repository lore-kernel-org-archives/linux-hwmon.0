Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58918 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752308AbcKOVEb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Nov 2016 16:04:31 -0500
Date: Tue, 15 Nov 2016 13:04:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh+dt@kernel.org>
Cc: Clemens Gruber <clemens.gruber@pqgruber.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: ina2xx: New DT properties
Message-ID: <20161115210428.GA3810@roeck-us.net>
References: <20161115195232.GA24893@archie.localdomain>
 <CAL_JsqLwiHDZKd=LbeR=8NKLNZ9YPg15+HTd1g8m+Q-vE_H-aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLwiHDZKd=LbeR=8NKLNZ9YPg15+HTd1g8m+Q-vE_H-aA@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 15, 2016 at 02:25:11PM -0600, Rob Herring wrote:
> On Tue, Nov 15, 2016 at 1:52 PM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> > Hi,
> >
> > I am preparing a patch for the ina2xx driver to allow configuring the
> > PGA bits (which define the shunt voltage range) and the BRNG bit (which
> > defines the bus voltage range) from the device tree.
> > We have multiple INA219 with different voltage ranges, so I can't just
> > change the hardcoded default in ina2xx.c
> > The ADC averaging setting should also be configurable.
> >
> > Now I am asking myself if I should create several new DT properties or
> > rather add one config-reg property to set a different default value for
> > the 16-bit configuration register (instead of the driver defaults of
> > 0x399F for the INA219 and 0x4527 for the INA226) ?
> >
> > Solution A:
> 
> Generally, this is preferred.
> 
> > ina219_foo: ina219@44 {
> >         compatible = "ti,ina219";
> >         reg = <0x44>;
> >         shunt-resistor = <25000>;
> >
> >         pga = <2>; /* PGA Gain /2 instead of the default /8 */
> >         /* Note: Possible PGA Gain values are /1, /2, /4 and /8 */
> >
> >         has-16v-brng; /* Bus voltage range of 16V instead of 32V */
> >
> >         averaging = <128>; /* Average 128 samples */
> > };
> >
> > Should each of those also have a sysfs attribute?
> 
> These should probably be in DT or in sysfs, but not both. The decision
> should be based on how are the settings picked: by the h/w design or
> an end user will want to modify them.
> 
Agreed.

Guenter

> > Solution B:
> >
> > ina219_bar: ina219@45 {
> >         compatible = "ti,ina219";
> >         reg = <0x45>;
> >         shunt-resistor = <25000>;
> >
> >         config-reg = <0x019F>; /* PGA /1, BRNG = 16V, No averaging */
> > };
> >
> > Regards,
> > Clemens
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
