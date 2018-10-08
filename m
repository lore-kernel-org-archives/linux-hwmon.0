Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58454 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725842AbeJHNTD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 8 Oct 2018 09:19:03 -0400
Subject: Re: [PATCH v5] scsi: Add hwmon support for SMART temperature sensors
To: Linus Walleij <linus.walleij@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
References: <20181007204949.19628-1-linus.walleij@linaro.org>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <3b6774e6-dab1-0adc-69b6-225b9b9a275b@suse.de>
Date: Mon, 8 Oct 2018 08:08:58 +0200
MIME-Version: 1.0
In-Reply-To: <20181007204949.19628-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/7/18 10:49 PM, Linus Walleij wrote:
> S.M.A.R.T. temperature sensors have been supported for
> years by userspace tools such as smarttools. This adds
> support to read it from the kernel and adds a temperature
> zone for the drive.
> 
> The temperature readout is however also a good fit for
> Linux' hwmon subsystem. By adding a hwmon interface to dig
> out SMART parameters, we can expose the drive temperature
> as a standard hwmon sensor.
> 
> The idea came about when experimenting with NAS enclosures
> that lack their own on-board sensors but instead piggy-back
> the sensor found in the harddrive, if any, to decide on a
> policy for driving the on-board fan.
> 
> The kernel thermal subsystem supports defining a thermal
> policy for the enclosure using the device tree, see e.g.:
> arch/arm/boot/dts/gemini-dlink-dns-313.dts
> but this requires a proper hwmon sensor integrated with
> the kernel.
> 
> With this driver, the hard disk temperatur can be read from
> sysfs:
> 
>   > cd /sys/class/hwmon/hwmon0/
>   > cat temp1_input
>   38
> 
> If the harddrive supports one of the detected vendor
> extensions for providing min/max temperatures we also
> provide attributes for displaying that.
> 
> This means that they can also be handled by userspace
> tools such as lm_sensors in a uniform way without need
> for any special tools such as "hddtemp" (which seems
> dormant).
> 
> This driver does not block any simultaneous use of
> other SMART userspace tools, it's a both/and approach,
> not either/or.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net> # HWMON
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
Hmm. I might be getting something wrong here, but the main problem with 
SMART values is that they are _not_ really standardized; plus any drive 
is free to implement whatever they want.
Plus there are tons of SMART attribute values, and decoding just one 
seems to be a bit poor. At the same time having them in the kernel will 
just require us to implement lots of decoding, which I really would 
leave to userland.
So overall I'm not sure if that the right approach.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		   Teamlead Storage & Networking
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: F. Imendörffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG Nürnberg)
