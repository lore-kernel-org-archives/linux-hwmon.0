Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33894 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbeHBSGG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Aug 2018 14:06:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id y5-v6so1442070pgv.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Aug 2018 09:14:16 -0700 (PDT)
Subject: Re: [PATCH] hwmon: rpi: add module alias to raspberrypi-hwmon
To: Guenter Roeck <linux@roeck-us.net>,
        Peter Robinson <pbrobinson@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>
References: <20180720230212.26006-1-pbrobinson@gmail.com>
 <48b9e013-b1f2-4f11-d70d-9b13e69c639f@roeck-us.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <98bb172f-4e88-7eee-f958-f54ee544be96@gmail.com>
Date: Thu, 2 Aug 2018 09:13:47 -0700
MIME-Version: 1.0
In-Reply-To: <48b9e013-b1f2-4f11-d70d-9b13e69c639f@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 07/20/2018 09:24 PM, Guenter Roeck wrote:
> On 07/20/2018 04:02 PM, Peter Robinson wrote:
>> The raspberrypi-hwmon driver doesn't automatically load, although it
>> does work
>> when loaded, by adding the alias it auto loads as expected when built
>> as a
>> module. Tested on RPi2/RPi3 on 32 bit kernel and RPi3B+ on aarch64 with
>> Fedora 28 and a patched 4.18 RC kernel.
>>
>> Fixes: q3c493c885cf ("hwmon: Add support for RPi voltage sensor")
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> CC: Stefan Wahren <stefan.wahren@i2se.com>
>> CC: Eric Anholt <eric@anholt.net>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Florian, I think the driver is in your tree - can you take this patch ?

Yes, now applied to drivers/next, thanks for your patience, I was on
holiday for quite a while.
-- 
Florian
