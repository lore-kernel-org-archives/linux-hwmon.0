Return-path: <tthayer@opensource.altera.com>
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
To: Lee Jones <lee.jones@linaro.org>
CC: <linus.walleij@linaro.org>, <gnurou@gmail.com>, <jdelvare@suse.com>,
	<linux@roeck-us.net>, <robh+dt@kernel.org>, <pawell.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<dinguyen@opensource.altera.com>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <56FD6A8E.7030208@opensource.altera.com>
Date: Thu, 31 Mar 2016 13:21:02 -0500
MIME-Version: 1.0
In-Reply-To: <20160330113532.GI3323@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Lee,

On 03/30/2016 06:35 AM, Lee Jones wrote:
> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>

[..snip..]

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>> @@ -0,0 +1,35 @@
>> +* Altera Arria10 Development Kit System Resource Chip
>> +
>> +Required parent device properties:
>> +- compatible : "altr,altr_a10sr"
>> +- spi-max-frequency : Maximum SPI frequency.
>> +- reg : the SPI Chip Select address for the Arria10 System Resource chip
>
> DT bindings are much easier to read in the following format:
>
> - compatible		: "altr,altr_a10sr"
> - spi-max-frequency	: Maximum SPI frequency.
> - reg			: the SPI Chip Select address for the Arria10 System Resource chip
>
> ... also, sentences start with an uppercase char.
>

OK.

>> +The A10SR consists of this varied group of sub-devices:
>> +
>> +Device                   Description
>> +------                   ----------
>> +altr_a10sr_gpio          GPIO Controller
>> +altr_a10sr_hwmon         Hardware Monitor
>> +
>> +The LEDs are implemented entirely in the device tree using
>> +the gpio-led framework.
>
> This is a Linuxisum and should not live in DT bindings.
>

I was following the format of other mfd binding documents such as 
Documentation/devicetree/bindings/mfd/da9055.txt so I'll need your help 
understanding this.

I'm not familiar with the phrase Linuxisum. A Google search turns up 
several threads referencing Linuxisum but I can't seem to find the 
definition. One thread seems to imply that an existing driver such as 
GPIO is a Linuxisum and should not be re-defined. Am I understanding 
correctly?

>> +Example:
>> +
>> +        a10-sr: a10-sr@0 {
>
> Nodes should be named after their device 'type'.
>
> Does this device really start a address 0?

OK. If I understand, this should be named after mfd then?
>
>> +		compatible = "altr,altr-a10sr";
>> +		reg = <0>;
>> +		spi-max-frequency = <100000>;
>> +
>> +		a10sr_gpio: a10sr_gpio {
>
> Device type only please.

And this would be a gpio?

Thanks for your comments and for reviewing!

>
>> +			compatible = "altr,a10sr-gpio";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			ngpios = <16>;
>> +		};
>> +
>> +		a10sr_hwmon: a10sr_hwmon {
>
> Device type only please.
>
>> +			compatible = "altr,a10sr-hwmon";
>> +		};
>> +	};
>
