Return-path: <tthayer@opensource.altera.com>
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
 <20160425125514.GA5100@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
CC: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <pawel.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<dinguyen@opensource.altera.com>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <571E3160.60702@opensource.altera.com>
Date: Mon, 25 Apr 2016 10:01:52 -0500
MIME-Version: 1.0
In-Reply-To: <20160425125514.GA5100@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>



On 04/25/2016 07:55 AM, Rob Herring wrote:
> On Fri, Apr 22, 2016 at 10:33:29AM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> The Altera Arria10 Devkit System Resource chip is a Multi-Function
>> Device with a GPIO expander and power supply alarm.
>
> An alarm with no interrupt? Are the GPIOs interrupt capable?

The alarms have no interrupt but the GPIOs are interrupt capable (not 
implemented with interrupt capability in this patch series).

>
>> This patch adds documentation for the Altera A10-SR DT bindings.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>>   .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>>
