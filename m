Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35833 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752414AbdLGXeD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Dec 2017 18:34:03 -0500
Received: by mail-pf0-f195.google.com with SMTP id j124so5863994pfc.2
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Dec 2017 15:34:03 -0800 (PST)
Date: Thu, 7 Dec 2017 15:34:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Marques Mota <paul@marquesmota.pt>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: your mail
Message-ID: <20171207233401.GB12517@roeck-us.net>
References: <20171207213201.rorchhbd63gzlekb@marquesmota.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171207213201.rorchhbd63gzlekb@marquesmota.pt>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 07, 2017 at 09:32:01PM +0000, Paul Marques Mota wrote:
> From: Paul Marques Mota <paul@marquesmota.pt>
> To: HARDWARE MONITORING <linux-hwmon@vger.kernel.org>
> Date: Thu, 7 Dec 2017 20:04:22 +0000
> Subject: [PATCH] add stack trace to deprecated hwmon_device_register()
> 
> Hi,
> 
> hwmon_device_register() in drivers/hwmon/hwmon.c prints the unhelpful
> message below on my machine:
> 
> (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> 
> Therefore, this patch dumps the stack at that point. In my case it is
> then obvious in the resulting dmesg, available at
> 
> http://www.marquesmota.pt/dmesg.txt
> 
> that thermal_add_hwmon_sysfs() in drivers/thermal/thermal_hwmon.c needs
> to be converted to the new API.
> 
> This patch is against 4.15.0-rc2
> I believe it is also needed in Bugzilla bug #195843
> https://bugzilla.kernel.org/show_bug.cgi?id=195843
> 
> Signed-off-by: Paul Marques Mota<paul@marquesmota.pt>

Nack, this is not needed. The thermal subsystem is the only subsystem
which doesn't pass a device pointer, and I don't want to have logs
clogged up with unnecessary tracebacks because of it.

If it wasn't for thermal, I would actually let hwmon registrations with
NULL device pointer fail completely. Unfortunately there is no easy way
to convert the thermal subsystem to use hwmon_device_register_with_info(),
since even though thermal_zone_device_register() registers a thermal zone
device, it does not have a notion of 'struct device *'.

Maybe someone can step in and convert the thermal code to use
hwmon_device_register_with_groups(). That doesn't really solve the problem,
but at least the symptom would be gone, and the thermal code would be
a little cleaner.

Guenter
