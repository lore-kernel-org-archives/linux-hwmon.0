Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35613 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbeIWFwV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 01:52:21 -0400
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180921223216.634-1-nicoleotsuka@gmail.com>
 <20180921223216.634-2-nicoleotsuka@gmail.com>
 <3c117b80-f671-1e57-6eab-3d9801b4b889@roeck-us.net>
 <20180922180348.GA9092@Asurada>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b29cff36-b6c0-e9df-475b-f5138cff06c4@roeck-us.net>
Date: Sat, 22 Sep 2018 16:56:55 -0700
MIME-Version: 1.0
In-Reply-To: <20180922180348.GA9092@Asurada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 11:03 AM, Nicolin Chen wrote:
>>> +2) child nodes
>>> +  The names of child nodes should indicate input source names
>>> +
>>> +  Required properties:
>>> +  - input-id: Must be 1, 2 or 3
>>> +
>>> +  Optional properties:
>>> +  - shunt-resistor: Shunt resistor value in micro-Ohm
>>> +  - status: Should be "disabled" if no input source
>>> +
>>> +  Example:
>>> +
>>> +  input1 {
>>> +          input-id = <0x1>;
>>> +          status = "disabled";
>>> +  };
>>> +  VDD_GPU {
>>> +          input-id = <0x2>;
>>> +          shunt-resistor = <5000>;
>>> +  };
>>>
>>
>> Using child nodes is a good idea. However, you are converting the node name into
>> the hwmon 'label' attribute which I can not accept. First, it is undocumented,
>> second, it effectively creates an undocumented property (if one wants to configure
>> the shunt resistor value, one has to configure a child node which is converted
>> into a label), and third, it violates the hwmon ABI ('input1' is not a "hint
>> about what this voltage channel is being used for").
> 
> Oh. I see the point here now. Then a child name could be just input[123],
> and I will add a separate optional child property to indicate the label.
> 
Exactly. "label" is quite widely used as property name, so that should be acceptable.
I am not sure about index; we'll see if Rob has any comments.

Thanks,
Guenter
