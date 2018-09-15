Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33160 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbeIPE6J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Sep 2018 00:58:09 -0400
Subject: Re: Clang warning in drivers/hwmon/scmi-hwmon.c
To: Nathan Chancellor <natechancellor@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20180915051032.GA23900@flashbox>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bb1167c5-d0d7-7d14-d2ba-0df3830ab53a@roeck-us.net>
Date: Sat, 15 Sep 2018 16:37:20 -0700
MIME-Version: 1.0
In-Reply-To: <20180915051032.GA23900@flashbox>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/14/2018 10:10 PM, Nathan Chancellor wrote:
> Hi Sundeep and others,
> 
> A group of us are trying to clean up all the warnings we see with an
> 'allyesconfig' arm64 build done with Clang and this one came up:
> 
> drivers/hwmon/scmi-hwmon.c:59:24: warning: address of array 'sensor->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
>          if (sensor && sensor->name)
>                     ~~ ~~~~~~~~^~~~
> 1 warning generated.
> 
> Would it be appropriate to just delete that check or does the check
> need to be adjusted in some way (such as checking for the first value
> 'sensor->name[0]')? Either option technically solves the warning but I
> don't have the hardware to check if this breaks the driver.
> 

Presumably the check is supposed to validate the content of the data structure,
so dropping the test doesn't seem to make sense. However, one could argue
that, if the _content_ is to be checked, it should be checked earlier,
before the data pointer is stored (ie in scmi_hwmon_probe()).

Given that, I'll be happy to accept a patch to just drop the check; it
does not change the behavior of the driver, after all. If a real validation
is desirable, it can be added (into the probe function) with a separate patch.

Thanks,
Guenter
