Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 2/2] devicetree: Document the max31760 device binding.
From: John Muir <john@jmuir.com>
In-Reply-To: <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
Date: Tue, 11 Apr 2017 06:47:28 -0700
Cc: Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>,
 Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Anatol Pomazau <anatol@google.com>,
 Mark Segal <segal@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <996F9836-F468-4FB5-A16E-2E1FAE8752AD@jmuir.com>
References: <20170404192034.158901-1-john@jmuir.com>
 <20170404192034.158901-3-john@jmuir.com>
 <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

> On Apr 10, 2017, at 8:42 AM, Rob Herring <robh@kernel.org> wrote:
>=20
> On Tue, Apr 04, 2017 at 12:20:34PM -0700, John Muir wrote:
>> +MAX31760 fan controller
>> +-----------------------
>> +
>> +This device supports I2C only. Many properties of this device are =
configurable
>> +thorugh the hwmon interface. See also Documentation/hwmon/max31760.
>=20
> I really think we need to describe the fans as separate nodes and=20
> preferably with a common binding. This is the second fan controller=20
> binding recently[1].
>=20
> Features of the "hwmon interface" are not relevant to the binding.=20
> Bindings describe h/w.

It seems to me that referring to the hwmon interface is only helpful. =
You are suggesting removing those sentences? If so, can I add a link to =
the data sheet?

>=20
>> +Optional node properties:
>> +- maxim,fan1-enabled		- 1 to enable, 0 to disable. =
Default: 1.
>> +- maxim,fan2-enabled		- 1 to enable, 0 to disable. =
Default: 1.
>> +- maxim,fan1-label		- String: Hwmon fan1_label.
>> +- maxim,fan2-label		- String: Hwmon fan2_label.
>=20
> Perhaps 2 fan sub nodes. reg for fan number, status for enabled, and=20=

> label for label.

OK.

Right now a fan=E2=80=99s number of pulses and the PWM frequency are =
configured using the hwmon sysfs interface (which defines standard =
controls for those), but as those are characteristics of the hardware, =
should they also be configured via the device tree binding?

>> +- maxim,pwm-zero-fan-can-fail	- 0: Fan failure detection =
disabled when PWM is
>> +				     ramping to 0%.
>> +				  1: Fan failure detection enabled for =
all PWM
>> +				     values.
>> +				  Default: 0.
>=20
> All these can be boolean=E2=80=A6

OK. The only issue I see is when the default is =E2=80=98true=E2=80=99 =
in the device, but I=E2=80=99ll try to avoid that. Sometimes I wish that =
you could set a boolean to false in DTS files.

>=20
>> +- maxim,temp1-label		- String: Hwmon temp1_label.
>> +- maxim,temp2-label		- String: Hwmon temp2_label.
>> +- maxim,temp2-ideality		- Set ideality factor for the =
remote temperature
>> +				  sensor. Integer with range 0 to 63,
>> +				  representing a multiplication factor =
of 0.9844
>> +				  to 1.0489. Default: 24 (1.0080).
>=20
> No maxim,temp1-ideality?
No - the device only lets you set the ideality of the =E2=80=98external' =
temperature sensor. I guess if there is an ideality for the internal =
temperature sensor, it would be hard-wired as a characteristic of the =
part that was used.

> Not sure what to do with these, but perhaps=20
> also as sub-nodes. Surely we have some bindings already for devices =
with=20
> multiple temp sensors. Don't invent something custom here.

I=E2=80=99ll look into it.

What is the best way to distinguish between =E2=80=98fan=E2=80=99 and =
=E2=80=98temp=E2=80=99 sub-nodes? Do I require a =E2=80=98compatible=E2=80=
=99 string?

Thanks!

John.
