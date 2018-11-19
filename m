Return-Path: <robh@kernel.org>
Return-path: <robh@kernel.org>
MIME-Version: 1.0
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
 <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz> <20181117152949.GA31247@bogus>
 <f3a29bc9-dbfc-bfb8-8707-2b67d96c2e04@roeck-us.net>
In-Reply-To: <f3a29bc9-dbfc-bfb8-8707-2b67d96c2e04@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Nov 2018 15:40:20 -0600
Message-ID: <CAL_JsqKgBkR4WN+aTKdHSfCZ8EH39yLCeLwXwmf+nd0_cAy+mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for adt7475
To: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Jean Delvare <jdelvare@suse.com>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Nov 18, 2018 at 4:56 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/17/18 7:29 AM, Rob Herring wrote:
> > On Fri, Nov 09, 2018 at 11:56:06AM +1300, Chris Packham wrote:
> >> With the addition of the invert-pwm property the adt7475 needs its own
> >> binding documentation rather being captured under trivial-devices.txt.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >> Changes in v2:
> >> - use pwm-polarity attiribute to indicate normal or inverted polarity.
> >>
> >>   .../devicetree/bindings/hwmon/adt7475.txt     | 24 +++++++++++++++++++
> >>   .../devicetree/bindings/trivial-devices.txt   |  4 ----
> >>   2 files changed, 24 insertions(+), 4 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> >> new file mode 100644
> >> index 000000000000..d9212b5e9036
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> >> @@ -0,0 +1,24 @@
> >> +*ADT7475 hwmon sensor.
> >> +
> >> +Required properties:
> >> +- compatible: One of
> >> +    "adi,adt7473"
> >> +    "adi,adt7475"
> >> +    "adi,adt7476"
> >> +    "adi,adt7490"
> >> +
> >> +- reg: I2C address
> >> +
> >> +optional properties:
> >> +
> >> +- pwm-polarity: This configures the polarity of the PWM. 0
> >> +            (PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle. 1
> >> +                (PWM_POLARITY_INVERSED) uses logic low for 100% duty cycle.
> >
> > So we're using part of the PWM binding, but none of the rest of it? What
> > is the PWM connection here?
> > The chip has a built-in PWM controller to control fan speeds. PWM frequency
> as well as PWM polarity are configurable. I had suggested to use the terminology
> from Documentation/devicetree/bindings/pwm/pwm.txt. Other than terminology there
> is no connection to a standard pwm controller.

Ah, a fan controller. Please make that clear.

The fan related bindings need a bit of work IMO. We have the start of
something somewhat common with aspeed and npcm bindings, but they
could use a bit more work. We need the fan and controller bindings to
be somewhat separate where a fan node for a given type of fan doesn't
depend on the controller node.

AIUI, all fans are not the same, so does this controller only work
with 1 type of fan and not need any more board level config? Isn't fan
speed not linear with PWM duty cycle and need some sort of map.

> Another option/possibility would be to use a boolean, such as pwm-polarity-inverted.
> We are open to suggestions.
>
> > It sounds like this is common for sensors, so this should be documented
> > somewhere common.
> >
> Sure, no problem. Any suggestion where ?

hwmon/fan.txt (that doesn't exist yet.)

Probably all of bindings/hwmon/ should be split up by class of device.

Rob
