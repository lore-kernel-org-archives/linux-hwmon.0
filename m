Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:43727 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbeEFV4r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 May 2018 17:56:47 -0400
Received: by mail-pg0-f67.google.com with SMTP id k11-v6so17718925pgo.10
        for <linux-hwmon@vger.kernel.org>; Sun, 06 May 2018 14:56:47 -0700 (PDT)
Subject: Re: hwmon: How should we represent Apple SMC's temperature sensors?
To: Cengiz Can <cengizc@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Nicolas Boichat <nicolas@boichat.ch>,
        Henrik Rydberg <rydberg@euromail.se>
References: <alpine.LNX.2.21.99.1805062318450.8088@nostromo>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3364a42c-3f84-b6b1-a014-65e00b76ba22@roeck-us.net>
Date: Sun, 6 May 2018 14:56:45 -0700
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.21.99.1805062318450.8088@nostromo>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/06/2018 01:36 PM, Cengiz Can wrote:
> Hello,
> 
> As Mr. Roeck knows, I've been refactoring applesmc into a MFD driver and
> cells for a while now.
> 
> Refactoring attempt is almost ready to be reviewed however there's a
> question that's keeping me from further progress.
> 
> As I read in hwmon api docs, most drivers are not constructing sysfs
> attributes by themselves. They're using helpers like SENSOR_DEVICE_ATTR
> and delegating sysfs management.
> 
> And as I read in `drivers/gpu/drm/nouveau/nouveau_hwmon.c` this API
> abstracts sysfs creation/permission tasks. (I assume that nouveau_hwmon is
> a properly implemented example).
> 
> However, as you know, applesmc is constructing its sysfs attributes
> manually. (`drivers/hwmon/applesmc.c#L1108`)
> 
> I don't have much context (and this is my first hwmon patch attempt) but I
> think this is due to the dynamic nature of
> Apple SMC temperature and fan control values. Not all Apple devices have
> same temperature values nor same number of fans.
> 
> For those who don't know, `drivers/hwmon/applesmc.c` queries an LPC device
> during init and creates sysfs files according to the result that query.
> 
> What I would like to know is:
> 
>    1) Should I try to implement a solution that's using SENSOR_DEVICE_ATTR
> or similar helpers to provide sysfs attributes in my refactored Apple SMC
> driver? Is there an example for that?
> 
>    2) Should I just keep the manual sysfs creator method?
> (`drivers/hwmon/applesmc.c#L1108`). Is this acceptable?
> 

The best solution would be to not create any sysfs attributes in the hwmon
driver, but to use the new API (hwmon_device_register_with_info). If that
doesn't work out for some reason (if so, please explain), 2) is fine.

Guenter

> Thank you
> 
> 	Cengiz Can
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

