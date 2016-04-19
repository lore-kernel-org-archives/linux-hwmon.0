Return-path: <tthayer@opensource.altera.com>
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1> <57111E8B.1040503@opensource.altera.com>
 <20160418074540.GB3346@x1> <5714F942.5040309@opensource.altera.com>
 <20160419072358.GB3222@x1>
To: Lee Jones <lee.jones@linaro.org>
CC: <linus.walleij@linaro.org>, <gnurou@gmail.com>, <jdelvare@suse.com>,
	<linux@roeck-us.net>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<dinguyen@opensource.altera.com>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <571642DA.2060903@opensource.altera.com>
Date: Tue, 19 Apr 2016 09:38:18 -0500
MIME-Version: 1.0
In-Reply-To: <20160419072358.GB3222@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>



On 04/19/2016 02:23 AM, Lee Jones wrote:
> On Mon, 18 Apr 2016, Thor Thayer wrote:
>
>> Hi Lee,
>>
>> On 04/18/2016 02:45 AM, Lee Jones wrote:
>>> On Fri, 15 Apr 2016, Thor Thayer wrote:
>>>> On 03/30/2016 06:35 AM, Lee Jones wrote:
>>>>> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
>>>>>
>>>>>> From: Thor Thayer <tthayer@opensource.altera.com>
>>>>>>
>>>>>> The Altera Arria10 Devkit System Resource chip is a Multi-Function
>>>>>> Device, it has two subdevices:
>>>>>>       - GPIO
>>>>>>       - HWMON
>>>>>>
>>>>>> This patch adds documentation for the Altera A10-SR DT bindings.
>>>>>>
>>>>>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>>>>>> ---
>>>>>>   .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
>>>>>>   1 file changed, 35 insertions(+)
>>>>>>   create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..564c761
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>>>>>> @@ -0,0 +1,35 @@
>>>>>> +* Altera Arria10 Development Kit System Resource Chip
>>>>>> +
>>>>>> +Required parent device properties:
>>>>>> +- compatible : "altr,altr_a10sr"
>>>>>> +- spi-max-frequency : Maximum SPI frequency.
>>>>>> +- reg : the SPI Chip Select address for the Arria10 System Resource chip
>>>
>>> [...]
>>>
>>>>>> +		a10sr_hwmon: a10sr_hwmon {
>>>>>
>>>>> Device type only please.
>>>>>
>>>> I need to revisit where this will live (hwmon does not seem to be
>>>> the correct place) so it will change but I can follow the format
>>>> above if it is correct.
>>>
>>> BTW, "hwmon" is a subsystem in Linux, therefore is a Linuxism and is
>>> not allowed in DT.  What does the device *actually* do?
>>>
>>
>> OK. I'll be careful not to introduce the Linux subsystem name.
>>
>> This module indicates whether the power supplies are at the correct
>> voltage. It uses a boolean instead of giving an actual voltage value
>> as required by HWMON. In other words it is a comparator instead of
>> an Analog-to-Digital Converter.
>>
>> I could call it a power supply supervisor or voltage status monitor
>> but it only acts in a passive role. There is no output to trigger an
>> error - only polling, so supervisor doesn't seem like a good name.
>>
>> Maybe something like this?
>>
>> 	power_supply_status {
>> 		compatible = "altr,a10sr-hwmon";
>> 	}
>>
>> Thanks for reviewing and helping me figure out the device tree naming.
>
> Does it have its own address space?  How complex is the device?  Not
> very, by the sounds of it.  In which case, does it really need its own
> driver?
>
Yes, you are correct that the voltage status is not very complex but I'd 
need a driver to expose these signals.

I initially started with an MFD because it was similar to the other MFD 
drivers. The device has GPI, GPO, voltage status, device enables, device 
present indications, and device resets.

There is a discussion now on where the voltage status driver should live 
(iio/ , hwmon/, misc/). It isn't clear to me where the device enables, 
device present indications and voltage status would go. I'm leaning 
toward a driver in the misc/ directory that would cover all of these. In 
that case, this wouldn't be a MFD driver.

Any thoughts or suggestions?

Thanks,

Thor
