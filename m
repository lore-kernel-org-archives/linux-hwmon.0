Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39331 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbeIWLVz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 07:21:55 -0400
Subject: Re: [PATCH v3 2/2] hwmon: ina3221: Read channel input source info
 from DT
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180921223216.634-1-nicoleotsuka@gmail.com>
 <20180921223216.634-3-nicoleotsuka@gmail.com>
 <a7e6c311-eba4-e9b2-df64-9d02882a1dcb@roeck-us.net>
 <20180922184650.GB9092@Asurada>
 <f8e017c4-10dd-2d0d-84df-b05d3ed03bbf@roeck-us.net>
 <20180923003841.GA10071@Asurada-Nvidia.nvidia.com>
 <80510b08-0e89-03ce-7d69-fe51f8b6a7b5@roeck-us.net>
 <20180923033300.GA5736@Asurada>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5c102fee-202e-e5cb-18a0-be08b82dd461@roeck-us.net>
Date: Sat, 22 Sep 2018 22:25:42 -0700
MIME-Version: 1.0
In-Reply-To: <20180923033300.GA5736@Asurada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 08:33 PM, Nicolin Chen wrote:

>> No. If the chip was configured by the BIOS/ROMMON, it is supposed
>> to be that way. We can not just override that.
> 
> For this driver, it does soft reset in the probe() so we're
> sure that all channels are enabled at the moment of calling
> this regmap_update_bits. So there's no assumption anymore.
> 

Good point.

> But the case that you mentioned is a good one. It does give
> me some insight about the use case and the things that will
> need to be careful when adding in[123]_enable. Just it'd be
> also possible that BIOS could disable a channel that is not
> explicitly disabled in the DT -- then the driver should not
> enable it.
> 

Not necessarily. Again, we can not assume that everyone has DT
(or that it and/or the BIOS is correct, for that matter).

Nevertheless, adding the enable attribute is not required at this
point, so it is ok for me to skip it. Please note that I'll accept
a patch adding it, though, if it is ever submitted (with a use case).

Thanks,
Guenter
