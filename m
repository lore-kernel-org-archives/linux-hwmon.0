Return-Path: <rlippert@google.com>
Return-path: <rlippert@google.com>
MIME-Version: 1.0
In-Reply-To: <91322e5e-23e3-ea6a-04bd-1c23fedadbf7@roeck-us.net>
References: <20171122220728.17861-1-rlippert@google.com> <20171122232816.GA4615@roeck-us.net>
 <CAFRv3wz0GDBNSBDFu_aYdrHJCQ6dwSXxW85JVJdA++c0_yDxAQ@mail.gmail.com> <91322e5e-23e3-ea6a-04bd-1c23fedadbf7@roeck-us.net>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 27 Nov 2017 13:51:35 -0800
Message-ID: <CAFRv3wy0yL704Y1=v3yOJtPMEjObPHcQuHaETh2FRmEHgpTi6A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Swap low/high current coefficients
 for LM5066(i)
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	linux-kernel@vger.kernel.org, Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 22, 2017 at 5:17 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi Rob,
>
> On 11/22/2017 03:39 PM, Rob Lippert wrote:
>>
>> On Wed, Nov 22, 2017 at 3:28 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>>
>>> On Wed, Nov 22, 2017 at 02:07:28PM -0800, Robert Lippert wrote:
>>>>
>>>> The _L low-current mode coefficient values should reference the
>>>> datasheet rows with CL=VDD but it seems were mistakenly pulled from
>>>> the rows with CL=GND.
>>>>
>>>> This causes the current/power to be reported as approximately double
>>>> the actual value when CL=GND and half the actual value when CL=VDD.
>>>>
>>>
>>> This would affect all chips supported by this driver. Hmm, and I was sure
>>> I tested this. I'll have to dig out my hardware and confirm.
>>
>>
>> I'm still not 100% convinced this commit is correct as I haven't been
>> able to validate the measurements against an external probe yet (and
>> my test board uses a non-standard sense resistor which means it needs
>> additional massaging of the data anyhow).
>>
>>>
>>>
>>> The code currently only uses bit 4 of the DEVICE_SETUP (D9h) command
>>> to determine which current limit setting to use. Looking into the
>>> datasheet, it looks like it also has to evaluate bit 2, and I wonder
>>> if there is a means to determine CL if bit 2 = 0. Any idea ?
>>
>>
>> On my test board CL=floating (equivalent to GND) and the value of
>> register 0xD9 is all zeroes.
>>
> Are you sure that floating is equivalent to GND ? I didn't check the
> datasheet, but it is more common for chips to have an internal pull-up.
>
>>>
>>> Does bit 4 report the CL pin value if bit 2 = 0 ?
>>
>>
>> I can't tell by reading the datasheet that 0xD9 bit4 will ever report
>> the pin value as the language is difficult to parse :)
>
>
> Same here.
>
>> But I don't have any hardware setup with CL=VDD to test...
>>
>
> I do have various evaluation boards, so I should be able to do some testing.
> I hope I'll get to it over the weekend.

Actually turns out my board does tie CL=VDD as recommended by the
LM5066i datasheet to improve the current/power reporting accuracy.
But the value in 0xD9 is always zero so it seems there is no way to
read this CL pin setting from the device.

I think my commit is technically correct but it seems will likely
break the readings for most boards that follow the datasheet typical
circuit which recommends CL=VDD.

Would it make sense to remove the code trying to read the CL setting
and default the coefficient values to the "low current limit" CL=VDD
setting?  (and maybe something in devtree or module param to pick the
other coefficients?)

-Rob
