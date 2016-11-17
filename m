Return-path: <prvs=0129eb5c62=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
To: Guenter Roeck <linux@roeck-us.net>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-3-git-send-email-tom.levens@cern.ch>
 <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net>
 <582DEB81.6050806@topic.nl> <20161117185654.GA19338@roeck-us.net>
CC: Tom Levens <tom.levens@cern.ch>, <jdelvare@suse.com>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <582E0A6C.5010307@topic.nl>
Date: Thu, 17 Nov 2016 20:52:12 +0100
MIME-Version: 1.0
In-Reply-To: <20161117185654.GA19338@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

=EF=BB=BFOn 17-11-2016 19:56, Guenter Roeck wrote:
> On Thu, Nov 17, 2016 at 06:40:17PM +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 17-11-16 17:56, Guenter Roeck wrote:
>>> On 11/17/2016 04:10 AM, Tom Levens wrote:
>>>> Updated version of the ltc2990 driver which supports all measurement
>>>> modes available in the chip. The mode can be set through a devicetree
>>>> attribute.
>>>
> [ ... ]
>
>>>>
>>>> static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>>                   const struct i2c_device_id *id)
>>>> {
>>>>      int ret;
>>>>      struct device *hwmon_dev;
>>>> +    struct ltc2990_data *data;
>>>> +    struct device_node *of_node =3D i2c->dev.of_node;
>>>>
>>>>      if (!i2c_check_functionality(i2c->adapter,
>>>> I2C_FUNC_SMBUS_BYTE_DATA |
>>>>                       I2C_FUNC_SMBUS_WORD_DATA))
>>>>          return -ENODEV;
>>>>
>>>> -    /* Setup continuous mode, current monitor */
>>>> +    data =3D devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data),
>>>> GFP_KERNEL);
>>>> +    if (unlikely(!data))
>>>> +        return -ENOMEM;
>>>> +    data->i2c =3D i2c;
>>>> +
>>>> +    if (!of_node || of_property_read_u32(of_node, "lltc,mode",
>>>> &data->mode))
>>>> +        data->mode =3D LTC2990_CONTROL_MODE_DEFAULT;
>>>
>>> Iam arguing with myself if we should still do this or if we should read
>>> the mode
>> >from the chip instead if it isn't provided (after all, it may have been
>>> initialized
>>> by the BIOS/ROMMON).
>>
>> I think the mode should be explicitly set, without default. There's no w=
ay
>> to tell whether the BIOS or bootloader has really set it up or whether t=
he
>> chip is just reporting whatever it happened to default to. And given the
>> chip's function, it's unlikely a bootloader would want to initialize it.
>>
> Unlikely but possible. Even if we all agree that the chip should be confi=
gured
> by the driver, I don't like imposing that view on everyone else.
>
>> My advice would be to make it a required property. If not set, display a=
n
>> error and bail out.
>>
> It is not that easy, unfortunately. It also has to work on a non-devicetr=
ee
> system. I would not object to making the property mandatory, but we would
> still need to provide non-DT support.
>
> My "use case" for taking the current mode from the chip if not specified
> is that it would enable me to run a module test with all modes. I conside=
r
> this extremely valuable.

Good point.

The chip defaults to measuring internal temperature only, and the mode=20
defaults to "0".

Choosing a mode that doesn't match the actual circuitry could be bad for=20
the chip or the board (though unlikely, it'll probably just be useless)=20
since it will actively drive some of the inputs in the temperature modes=20
(which is default for V3/V4 pins).

Instead of failing, one could choose to set the default mode to "7",=20
which just measures the 4 voltages, which would be a harmless mode in=20
all cases.

As a way to let a bootloader set things up, I think it would be a good=20
check to see if CONTROL register bits 4:3 are set. If "00", the chip is=20
not acquiring data at all, and probably needs configuration still. In=20
that case, the mode must be provided by the devicetree (or the default "7")=
.
If bits 4:3 are "11", it has already been set up to measure its inputs,=20
and it's okay to continue doing just that and use the current value of=20
2:0 register as default mode (if the devicetree didn't specify any mode=20
at all).

The reason I wanted the property to be mandatory is to trigger users=20
like me (probably I'm the only other user so far) to update their=20
devicetree. But I'd notice quickly enough if it defaults to something=20
else. So that's not very compelling.

>>> Mike, would that break your application, or can you specify the mode in
>>> devicetree ?
>>
>> I'm fine with specifying this in the devicetree. It will break things fo=
r
>> me, but I've been warned and willing to bow for the greater good :)
>>
> I should have asked if your system uses devicetree. If it does, the probl=
em
> should be easy to fix for you. If not, we'll need to find a solution
> for your use case.

I'm using devicetree. I planned to 'mainline' the boards some time this=20
year...

>
> Thanks,
> Guenter
>


--=20
Mike Looijmans


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
