Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39054 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752917AbdCHUFa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2017 15:05:30 -0500
Date: Wed, 8 Mar 2017 11:11:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carlo Caione <carlo@caione.org>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v2 0/2] scpi-sensors: Fix SCP sensor readings scale
Message-ID: <20170308191133.GA4486@roeck-us.net>
References: <20170303091449.3512-1-carlo@caione.org>
 <CAOQ7t2bj29EG3z6uRQ=nBUeLXF4ODB4yayw3+Eohstg3aaA1_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ7t2bj29EG3z6uRQ=nBUeLXF4ODB4yayw3+Eohstg3aaA1_g@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Mar 08, 2017 at 09:24:38AM +0100, Carlo Caione wrote:
> On Fri, Mar 3, 2017 at 10:14 AM, Carlo Caione <carlo@caione.org> wrote:
> > From: Carlo Caione <carlo@endlessm.com>
> >
> > The implementation details for SCPI seems to suggest that the sensor
> > readings must be reported by SCP using a well defined scale
> > (millidegree Celsius for temperature, millivolts for voltage,
> > milliamperes for current, microwatts for power and microjoules for
> > energy).
> >
> > This is also important for the interaction with other subsystems: for
> > example both the thermal sub-system and the hwmon sysfs interface expect
> > the temperature expressed in millidegree Celsius.
> >
> > Unfortunately since this behaviour is dependent on the firmware
> > implementation there are cases where the sensor readings are reported
> > using a different scale. For example in the Amlogic SoCs the
> > temperature is reported in degree and not millidegree Celsius.
> >
> > In this patchset we introduce a new DT property `scpi,sensors-scale` that is
> > used by the scpi-hwmon driver to convert the sensor readings to the expected
> > scale.
> >
> > v2:
> >  - Added data validation (scale != 0)
> >  - s/unsigned int/u32/ for the array
> >  - Switched to array initialiser notation
> >  - Introduced scpi_scale_reading()
> 
> gentle ping
> 

Waiting for Rob to provide feedback on the devicetree property.

Guenter
