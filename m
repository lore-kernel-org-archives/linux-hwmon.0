Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:39334 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751590AbdHNPIj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2017 11:08:39 -0400
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        ALKML <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Roy Franz <roy.franz@cavium.com>,
        Harb Abdulhamid <harba@codeaurora.org>,
        Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Loc Ho <lho@apm.com>, Alexey Klimov <alexey.klimov@arm.com>,
        Ryan Harkin <Ryan.Harkin@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 16/18] hwmon: add support for sensors exported via ARM
 SCMI
To: Guenter Roeck <linux@roeck-us.net>
References: <1501857104-11279-1-git-send-email-sudeep.holla@arm.com>
 <1501857104-11279-17-git-send-email-sudeep.holla@arm.com>
 <20170804193231.GA18153@roeck-us.net>
 <20e0a388-79a1-a7f1-57b4-fa5993eed9bf@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <c695dc09-fc28-518f-f287-bf74e0a2f87e@arm.com>
Date: Mon, 14 Aug 2017 16:09:18 +0100
MIME-Version: 1.0
In-Reply-To: <20e0a388-79a1-a7f1-57b4-fa5993eed9bf@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On 07/08/17 13:25, Sudeep Holla wrote:
> 
> 
> On 04/08/17 20:32, Guenter Roeck wrote:
>> On Fri, Aug 04, 2017 at 03:31:42PM +0100, Sudeep Holla wrote:
> 
> [...]
> 
>>> +	platform_set_drvdata(pdev, scmi_sensors);
>>> +
>>> +	hwdev = devm_hwmon_device_register_with_groups(dev, "scmi_sensors",
>>> +						       scmi_sensors,
>>> +						       scmi_sensors->groups);
>>
>> Can you rework this to use devm_hwmon_device_register_with_info(),
>> and if possible let it handle the thermal registration ? 
>>
> 
> Thanks for the pointers. I will check on the possibility and use it if
> possible.
> 

I had a look at devm_hwmon_device_register_with_info. It mostly deals
with constant structures where all the attributes are known at the boot
time. In case of SCMI, the firmware presents all the sensors and all the
information(type, scale, name/label, ...etc). Unless I create those
structures dynamically and typecast as const during probe, I can't get
it working. Are you OK with that ? If so, I can try making those changes.

-- 
Regards,
Sudeep
