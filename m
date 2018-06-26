Return-Path: <robh@kernel.org>
Return-path: <robh@kernel.org>
MIME-Version: 1.0
References: <20180624124155.82412-1-tmaimon77@gmail.com> <20180624124155.82412-2-tmaimon77@gmail.com>
 <20180625171417.GA16379@rob-hp-laptop> <CAP6Zq1h-M6YDS67pkgHy-GMmiVk1D-RScLgDyG65JQM+S35rEQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1h-M6YDS67pkgHy-GMmiVk1D-RScLgDyG65JQM+S35rEQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 26 Jun 2018 09:03:41 -0600
Message-ID: <CAL_JsqJCYPLw+jqx+7Cy=cXFFb-CNp=Ezew7FNT=cfAndqWe5A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Avi Fishman <avifishman70@gmail.com>,
	Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
	Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Jun 25, 2018 at 4:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Rob,
>
>
> On 25 June 2018 at 20:14, Rob Herring <robh@kernel.org> wrote:
>>
>> On Sun, Jun 24, 2018 at 03:41:54PM +0300, Tomer Maimon wrote:
>> > Added device tree binding documentation for Nuvoton BMC
>> > NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
>> > The PWM controller can support upto 8 PWM output ports.
>> > The Fan tach controller can support upto 16 tachometer inputs.
>> >
>> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> > ---
>> >  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 84 ++++++++++++++++++++++
>> >  1 file changed, 84 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>> > new file mode 100644
>> > index 000000000000..a9eacda34f92
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>> > @@ -0,0 +1,84 @@
>> > +Nuvoton NPCM7xx PWM and Fan Tacho controller device driver
>>
>> Bindings are for h/w, not drivers.
>>
>> > +
>> > +The NPCM7xx has two identical Pulse-width modulation (PWM) controller modules,
>> > +Each PWM module has four PWM controller outputs, Totally 8 PWM controller outputs.
>> > +
>> > +The NPCM7xx has eight identical Fan tachometer controller modules,
>> > +Each Fan module has two Fan controller inputs, Totally 16 Fan controller inputs.
>>
>> Have you looked at other fan ctrlr bindings?f This looks like similar
>> h/w to ASpeed. Really, I'd like to see a common doc that describes the
>
>
> We do not have the same H/W as Aspeed, I believe in the near future we will need to add
> more DT properties that will used only in the NPCM7xx module.

I didn't say it was the same. Both are multi-channel PWMs with tach
inputs. Presumably, they can attach to the same types of fans as there
are only a limited number of types of fans and none of them are
specific to any fan controller.

>> structure and common properties.
>
>
> what do you mean by common structure and common properties?

When we have multiple bindings for the same class of device/hw, we
define all the common parts in a common binding doc. This often
doesn't happen at first, so we end up with a variety of bindings until
we see some commonality.

In this case, for structure, having sub-nodes for fans. As fans are
not specific to the controllers, their node should not be defined by
the controller binding. It's also how you describe the fan type,
number of fans, the PWM connections, the tach connections, etc.

Rob
