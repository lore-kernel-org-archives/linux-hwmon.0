Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35716 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1042654AbdDUVss (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2017 17:48:48 -0400
Date: Fri, 21 Apr 2017 14:48:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        linux-hwmon@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
Message-ID: <20170421214845.GA29008@roeck-us.net>
References: <20170421042505.20403-1-sam@mendozajonas.com>
 <20170421205523.5jqqroooeqmfzl36@asimov>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170421205523.5jqqroooeqmfzl36@asimov>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Apr 21, 2017 at 03:55:23PM -0500, Patrick Williams wrote:
> Sam,
> 
> On Fri, Apr 21, 2017 at 02:25:05PM +1000, Samuel Mendoza-Jonas wrote:
> > IR35221 is a Digital DC-DC Multiphase Converter
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > - Tested on a ppc64 system which includes several of these devices.
> > - This patch re-implements the linear reg2data/data2reg functions from
> >   pmbus-core like some other drivers in order to scale some results. Is
> >   this something that would be better off being made generic for pmbus
> >   drivers to call?
> > - The resolution of iout0 is apparently configurable between two values,
> >   however the documentation I have access to does not specify how this is
> >   actually configured - currently it is left at the default resolution in
> >   the driver.
> > 
> >  Documentation/hwmon/ir35221   |  87 ++++++++++++
> >  drivers/hwmon/pmbus/Kconfig   |  11 ++
> >  drivers/hwmon/pmbus/Makefile  |   1 +
> >  drivers/hwmon/pmbus/ir35221.c | 322 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 421 insertions(+)
> >  create mode 100644 Documentation/hwmon/ir35221
> >  create mode 100644 drivers/hwmon/pmbus/ir35221.c
> 
> Thanks for working on this.
> 
> Would it be possible to enhance it in a follow up to support an
> 'inN_target' also?  I see this is not documented by the sysfs-interface
> for hwmon but we likely need support for this.  There are voltage
> slewing operations we do in system manufacturing.  Without an hwmon
> interface for programming the target voltage we're going to have to
> unbind the device and manually do the i2c operations.
> 
> 
> Guenter,
> 
> I mention 'inN_target' to match 'fanN_target'.  Do you have
> any opposition to either formally adding that as an option for voltage
> readings or adding it to this specific driver?
> 

Please keep in mind that this is a hardware monitoring driver.
Are you looking for regulator functionality ? If so, it might make sense
to improve regulator support (ie support more than enable/disable
when registering with the regulator subsystem) in the pmbus infrastructure.

[ You don't have to unbind the driver to access the i2c interface directly.
  If this is for manufacturing only, you can also access the i2c interface
  directly using I2C_SLAVE_FORCE. ]

Thanks,
Guenter
