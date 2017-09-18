Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33524 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbdIRUPb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 16:15:31 -0400
Date: Mon, 18 Sep 2017 13:15:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, mspinler@linux.vnet.ibm.com,
        msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add Maxim MAX31785
 documentation
Message-ID: <20170918201528.GA27615@roeck-us.net>
References: <20170908043919.6924-1-andrew@aj.id.au>
 <20170908043919.6924-2-andrew@aj.id.au>
 <20170918192638.4xqszyj466lrnpbz@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170918192638.4xqszyj466lrnpbz@rob-hp-laptop>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 18, 2017 at 02:26:38PM -0500, Rob Herring wrote:
> On Fri, Sep 08, 2017 at 02:39:17PM +1000, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 158 +++++++++++++++++++++
> 
> I think this needs to be located by what it does (fan control), not what 
> interface it has (pmbus).
> 
> I'm not all that happy with hwmon either because things here seem to 
> just be based on being Linux hwmon devices which is sometimes arbitrary. 
> 
The chip also measures temperatures. Other PMBus chips may do fan control,
measure temperatures, measure and/or control voltages, current, power ...
Strictly speaking pretty much all PMBus chips are multi-function devices.
I personally don't really care if the documentation is spread across
several directories, but even here this is already challenging.

Only solution I can think of would be to create separate documents for each
functionality, ie here one for the device itself, one for fan control,
and one for temperature control (if that needs separate bindings). That
would be similar to mfd. But then we would still have to sort out where
to store the various bindings. Like iio, in subdirectories ? Like mfd,
in the matching subsystems ? If so, what to do if there is no matching
subsystem ?

Lots of questions. I'll be happy to spend some time sorting it out,
but I would need some directions.

Thanks,
Guenter

> >  1 file changed, 158 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> > new file mode 100644
> > index 000000000000..af9578e7742c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> > @@ -0,0 +1,158 @@
> > +Bindings for the Maxim MAX31785 Intelligent Fan Controller
> > +==========================================================
> > +
> > +Reference:
> > +
> > +https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> > +
> > +Required properties:
> > +- compatible     : One of "maxim,max31785" or "maxim,max31785a"
> > +- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
> > +- #address-cells : Must be 1
> > +- #size-cells    : Must be 0
> > +- #thermal-sensor-cells  : Should be 1. The device supports:
> > +                           - One internal sensor
> > +                           - Four external I2C digital sensors
> > +                           - Six external thermal diodes
> 
> You should define the IDs here, not just how many of each type.
> 
> > +
> > +Optional properties:
> > +- use-stored-presence    : Do not treat the devicetree description as canon for
> > +                           fan presence (the 'installed' bit of FAN_CONFIG_*).
> > +                           Instead, rely on the on the default value store of
> > +                           the device to populate it.
> 
> Boolean? Please be explicit.
> 
> Needs a vendor prefix.
> 
> > +
> > +Capabilities are configured through subnodes of the controller's node.
> > +
> > +Fans
> > +----
> > +
> > +Only fans with subnodes present will be considered as installed. If
> > +use-stored-presence is present in the parent node, then only fans that are both
> > +defined in the devicetree and have their installed bit set are considered
> > +installed.
> > +
> > +Required subnode properties:
> > +- compatible             : Must be "pmbus-fan"
> 
> "pmbus" is a property of the controller, not the fan, right? We should 
> have compatibles along the lines of the type of fan like 4-wire, 3-wire, 
> etc. 
> 
> > +- reg                    : The PMBus page the properties apply to.
> > +- #cooling-cells         : Should be 2. See the thermal bindings at [1].
> > +- maxim,fan-rotor-input  : The type of rotor measurement provided to the
> > +                           controller. Must be either "tach" for tachometer
> > +                           pulses or "lock" for a locked-rotor signal.
> > +- maxim,fan-lock-polarity: Required iff maxim,fan-rotor-input is "lock". Valid
> > +                           values are "low" for active low, "high" for active
> > +                           high.
> > +
> > +Optional subnode properties:
> > +- fan-mode               : "rpm" or "pwm". Default value is "pwm".
> > +- tach-pulses            : Tachometer pulses per revolution. Valid values are
> > +                           1, 2, 3 or 4. The default is 1.
> > +- cooling-min-level      : Smallest cooling state accepted. See [1].
> > +- cooling-max-level      : Largest cooling state accepted. See [1].
> > +- maxim,fan-no-fault-ramp: Do not ramp the fan to 100% PWM duty on detecting a
> > +                           fan fault
> > +- maxim,fan-startup      : The number of rotations required before taking
> > +                           emergency action for an unresponsive fan and driving
> > +                           it with 100% or 0% PWM duty, depending on the state
> > +                           of maxim,fan-no-fault-ramp. Valid values are 0
> > +                           (automatic spin-up disabled), 2, 4, or 8. Default
> > +                           value is 0.
> > +- maxim,fan-health       : Enable automated fan health check
> > +- maxim,fan-ramp         : Configures how fast the device ramps the PWM duty
> > +                           cycle from one value to another. Valid values are 0
> > +                           to 7 inclusive, with values 0 - 2 configuring a
> > +                           1000ms update rate and 1 - 3% duty respective duty
> > +                           increase, and 3 - 7 a 200ms update rate with a 1 -
> > +                           5% respective duty increase. Default value is 0.
> > +- maxim,fan-no-watchdog  : Do not ramp fan to 100% PWM duty on failure to
> > +                           update desired fan rate inside 10s. This implies
> > +                           maxim,tmp-no-fault-ramp
> > +- maxim,tmp-no-fault-ramp: Do not ramp fan to 100% PWM duty on temperature
> > +                           sensor fault detection. This implies
> > +                           maxim,fan-no-watchdog
> > +- maxim,tmp-hysteresis   : The temperature hysteresis used to determine
> > +                           transitions to lower fan speed bands in the
> > +                           temperature/fan rate lookup table. Valid values are
> > +                           2, 4, 6 or 8 (degrees celcius). Default value is 2.
> > +- maxim,fan-dual-tach    : Enable dual tachometer functionality
> > +- maxim,fan-pwm-freq     : The PWM frequency. Valid values are 30, 50, 100, 150
> > +                           and 25000 (Hz). Default value is 30Hz.
> > +- maxim,fan-lookup-table : A 16-element cell array of alternating temperature
> > +                           and rate values representing the look up table. The
> > +                           rate units are set through the fan-mode property.
> > +- maxim,fan-fault-pin-mon: Ramp fans to 100% PWM duty when the FAULT pin is
> > +                           asserted
> 
> In general, I think a good portion of these should be either implied by 
> a fan compatible string or be part of a common fan binding.
> 
> > +
> > +Temperature
> > +-----------
> > +
> > +Required subnode properties:
> > +- compatible    : Must be "pmbus-temperature"
> > +- reg           : The PMBus page the properties apply to.
> > +
> > +Optional subnode properties:
> > +- maxim,tmp-offset      : Valid values are 0 - 30 (degrees celcius) inclusive.
> > +                          Default value is 0.
> > +- maxim,tmp-fans        : An array of phandles to fans controlled by the
> > +                          current temperature sensor.
> 
> Is this a feature of the Maxim chip or just a mapping of temperature 
> sensors to fans. The latter should be a common property.
> 
> Rob
