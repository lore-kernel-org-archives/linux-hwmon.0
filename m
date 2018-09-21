Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40925 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbeIUSot (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 14:44:49 -0400
Subject: Re: [PATCH 2/2] hwmon: ina3221: Get channel names from DT node
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
 <20180921000753.21846-3-nicoleotsuka@gmail.com>
 <21a6e8f3-c95d-43d0-ca3f-3f91ddfeff07@roeck-us.net>
 <20180921012038.GA23354@Asurada-Nvidia.nvidia.com>
 <20180921091813.GA21564@Asurada-Nvidia.nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <75741ce9-80a3-9277-b8e3-2d3c3e003797@roeck-us.net>
Date: Fri, 21 Sep 2018 05:56:00 -0700
MIME-Version: 1.0
In-Reply-To: <20180921091813.GA21564@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/21/2018 02:18 AM, Nicolin Chen wrote:
> Hi,
> 
> On Thu, Sep 20, 2018 at 06:20:38PM -0700, Nicolin Chen wrote:
>>> So if there are no devicetree entries, the user now gets a sequence of
>>> "unknown" sensors ? I don't think so. Please keep in mind that there are
>>> users of this chip who don't have devicetree systems, and other users
>>> may not want to specify any specific name properties (or they use sensors3.conf
>>> to do it).
>>
>> Being enlightened by your comments below, maybe adding a
>> separate group for channel names by attaching is_visible
>> to it could be acceptable? Then, name nodes can hide from
>> those who don't want to specify.
>   
>>>> +		/* Log connected channels */
>>>> +		ina->attr_group[g++] = &ina3221_group[i];
>>>> +		ina->channel_name[i] = str;
>>>> +		ina->enable[i] = true;
>>>
>>> I also don't see the need for defining the group dynamically. The
>>> is_visible callback is very well suited for handling optional sysfs
>>> attributes.
> 
> I tried is_visible but it looks like it won't be that neat to
> implement as some attributes of this driver don't really pass
> the channel index to the store()/show() but some other indexes.
>

The channel index is not the only means that can be used to determine
the channel index. Many drivers use the position in the attrs[] array
to determine the channel index. I don't see why this would not be
possible here.

> If you are very against the dynamical group, I can drop it to
> leave the sysfs node as it was.
> 
> And for the name nodes that I was talking about above, I will
> add an sysfs store() function so non-DT users can set them,
> and I also removed the confusing "unknown" default name.
> 

The label attributes are RO. Please follow the ABI.

temp[1-*]_label Suggested temperature channel label.
                 Text string
                 Should only be created if the driver has hints about what
                 this temperature channel is being used for, and user-space
                 doesn't. In all other cases, the label is provided by
                 user-space.
                 RO

Guenter
