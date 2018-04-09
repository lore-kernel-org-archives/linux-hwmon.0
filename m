Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([91.232.154.25]:39389 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750759AbeDIOh1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 9 Apr 2018 10:37:27 -0400
Subject: Re: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Rajkumar Rampelli <rrajk@nvidia.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Timur Tabi <timur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Alex Elder <elder@linaro.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
 <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
 <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi>
 <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <615d6771-00c3-a4a7-a99f-ec4f6e667c8f@kapsi.fi>
Date: Mon, 9 Apr 2018 17:37:09 +0300
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 04/09/2018 04:21 PM, Rob Herring wrote:
> On Mon, Apr 9, 2018 at 12:38 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>> Rob,
> 
> Please don't top post to lists.
> 
>> this binding is for a specific IP block (for measuring/aggregating input
>> pulses) on the Tegra186 SoC, so I don't think it fits into any generic
>> binding.
> 
> What is it hooked up to to measure? You only mention "fan" five times
> in the doc.

In practice, fans.

> 
> You have #pwm-cells too, so this block has PWM output as well? If not,
> then where's the PWM for the fan control because there is no point in
> having fan tach without some control mechanism.

It doesn't provide a PWM output. The (Linux) PWM framework provides 
functionality in both directions - control and capture. But if the 
device tree #pwm-cells/pwms properties are only for control, we may need 
to introduce a new #capture-pwm-cells/capture-pwms or similar.

The idea is that the generic fan node can then specify two pwms, one for 
control and one for capture, to enable e.g. closed-loop control (I'm not 
personally familiar with the usecase for this but I could imagine 
something like that). The control PWM can be something completely 
different, maybe not a PWM in the first place (e.g. some fixed voltage).

> 
> There's only so many ways to control fans and types of fans, so yes,
> the interface of control and feedback lines between a fan and its
> controller should absolutely be generic.

I'm not quite getting what you mean by this. Clearly we need a custom 
compatibility string for the tachometer as it's a different hardware 
block with different programming than others. Or are you complaining 
about the nvidia,pulse-per-rev/capture-window-len properties?

Thanks,
Mikko

> 
> Rob
> 
>>
>> Thanks,
>> Mikko
>>
>>
>> On 03/27/2018 05:52 PM, Rob Herring wrote:
>>>
>>> On Wed, Mar 21, 2018 at 10:10:38AM +0530, Rajkumar Rampelli wrote:
>>>>
>>>> Supply Device tree binding documentation for the NVIDIA
>>>> Tegra186 SoC's Tachometer Controller
>>>>
>>>> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
>>>> ---
>>>>
>>>> V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
>>>>       Renamed dt property values of clock-names and reset-names to
>>>> "tachometer"
>>>>       from "tach"
>>>
>>>
>>> Read my prior comments on v1.
>>>
>>> Rob
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
