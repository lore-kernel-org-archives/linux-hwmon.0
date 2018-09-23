Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35047 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbeIWLmG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 07:42:06 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-2-nicoleotsuka@gmail.com>
 <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
 <20180923053151.GB9960@Asurada>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ce76fdf2-2894-96ad-d2f5-b2c25f197ee4@roeck-us.net>
Date: Sat, 22 Sep 2018 22:45:49 -0700
MIME-Version: 1.0
In-Reply-To: <20180923053151.GB9960@Asurada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 10:31 PM, Nicolin Chen wrote:
> On Sat, Sep 22, 2018 at 10:19:42PM -0700, Guenter Roeck wrote:
>>> +2) child nodes
>>> +  Required properties:
>>> +  - input-id: Must be 1, 2 or 3
>>> +
>>> +  Optional properties:
>>> +  - input-label: Name of the input source
>>> +  - shunt-resistor: Shunt resistor value in micro-Ohm
>>> +  - status: Should be "disabled" if no input source
>>> +
>>> +  Example:
>>> +
>>> +  input1 {
>>> +          input-id = <0x1>;
>>
>> We'll have to find a better name for this. Feel free to look up examples in the
>> existing devicetree descriptions. The one that seems to be used most of the time
>> to indicate a channel index or id is "reg". It should also start with 0 - there
>> is no real reason for it to start with 1; it only makes the code more complex.
> 
> The reason is that the port start from 1 in the datasheet.
> 

Maybe, but for me I'll want to have something that we can reuse for other chips.
Having the index start with 0 for one chip and with 1 for another would be
confusing. It is bad enough that we have in[0..n] for voltages and temp[1..n]
for temperatures. I would not want to see the same in devicetree files,
and much less so on a per-device basis. It is also pretty common to start
channel numbers with 0 in devicetree files.

> I don't mind using reg or count it from 0, will look up to
> see if I can find something solid; otherwise, I'll wait for
> binding doc maintainers' opinions before sending v5.
> 
Sure, no problem.

Guenter

>>> +          status = "disabled";
>>> +  };
>>> +  input2 {
>>> +          input-id = <0x2>;
>>> +          shunt-resistor = <5000>;
>>
>> I would suggest shunt-resistor-micro-ohms as per
>> Documentation/devicetree/bindings/property-units.txt.
> 
> Will change it.
> 
> Thank you
> Nicolin
> 
