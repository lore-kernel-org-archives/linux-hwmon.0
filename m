Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC31C4167D
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 14:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjJaOFo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 10:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjJaOFd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 10:05:33 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 07:05:29 PDT
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1F310B
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 07:05:29 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698761127; x=1698768327; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=+1gn/IUWoHGcPjndPkMsv0KKO+2s33RhJw8LVCk/5Sc=;
 b=MAhVAG2xt5EanTkGZnwqb3uIckhVUVojWxXw9iqvHUmK0okU/gdpiTK0F6jtOl0mev8z4I1G50sEwEmE64bK+wBI8z5k13jpsNPkg/9bnJ4rkbaQiTE8iHN3aJ4os2oHIiUxdnGJ4JgYP3XIsDzh0jf916K1v9Bkbpu39talXA8jBMNel2nLK68UItwWpUPi3uGGYWNgZSpScLO7NxiI6ckfZkdMZkTwlSaR5u4FTtbyG0FXkAE267gWTXhapNil6+nVW3Qa9DcYjOkfaiqE49WHPUxFpXvtIiOORgF57ElvHUpbsjfFwza1R7sOZWxW15evA6GW5wTQ/8FDExCCCw==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 4f51a5dd470e with SMTP id
 6541087288eacfcb84bd7327 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Oct 2023 14:00:18 GMT
Sender: james@equiv.tech
Date:   Tue, 31 Oct 2023 07:00:16 -0700
From:   James Seo <james@equiv.tech>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZUEIcOBpVzxC/+c1@equiv.tech>
References: <ZT1U/zE6cApQKC2h@equiv.tech>
 <CGME20231031102014eucas1p2f377b89cd0381231b5c7f321e2902fe8@eucas1p2.samsung.com>
 <oypijd5y2nf60f.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <oypijd5y2nf60f.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 11:20:00AM +0100, Lukasz Stelmach wrote:
> I am attaching dsdt.dat. It is the only file that contains the
> "HPBIOS_BIOSEvent" string and the above UUID.

OK, I think I've figured it out.

Earlier, I focused on "probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed"
(the GUID of HPBIOS_BIOSNumericSensor), and missed it when you said the failure
is happening when check_wobj() is called from check_platform_events_wobj().
So the issue is actually with HPBIOS_PlatformEvents.Name, since any instances
of that WMI object are examined during driver init as well.

After using iasl to decompile the DSDT you sent to ACPI Source Language (ASL),
everything looks fine with HPBIOS_BIOSNumericSensor. Not that I'm particularly
familiar with ASL, but search for "Name (SEN1, Package (0x06)" and read on to
the "Method (_INI, 0, NotSerialized)" and the "Method (WQAE, 1, Serialized)"
lines below. It certainly looks like that's how the BIOS on that system is
generating HPBIOS_PlatformEvents instances at runtime.

For HPBIOS_PlatformEvents instances, that BIOS seems to generate them in two
places. The driver is interested in those from "Method (WQBC, 1, Serialized)",
which rely on the section above that beginning at "Name (EVNT, Package (0x0D)".
There are also some generated in "Method (WQPE, 1, Serialized)", relying on:

        Name (CBWE, Package (0x02)
        {
            Package (0x05)
            {
                Unicode ("4BIOS Configuration Change"), // Oops.
                "BIOS Settings", 
                0x04, 
                0x05, 
                0x02
            }, 

            Package (0x05)
            {
                "BIOS Configuration Security", 
                "An attempt has been made to Access BIOS features unsuccessfully", 
                0x04, 
                0x0A, 
                0x06
            }
        })

So yes, Armin was right, UTF-16 is the culprit. And it's only for this one
instance of HPBIOS_PlatformEvents on this one system's BIOS.

Can you find the wonky object instance in the debugfs interface? I imagine
its name shows up as either "4" or an empty string, depending on the UTF-16
byte order.

I'm also curious how it looks in Windows (I used WMI Explorer [1] during
development). The WMI namespace should be "\\.\root\HP\InstrumentedBIOS".

> The readings of hp_wmi_sensors-virtual-0 look sensible and they change
> reasonably under load.

Good. I guess that part working wasn't so surprising after all :)

Regarding how we proceed from here, I think the main question is whether a
workaround should be limited to only specific machines (maybe detected using
DMI data), and if so, to specific WMI object types and instances (cf.
hp_wmi_get_wobj(), though limiting on instance number would be fragile if
BIOS updates change instance numbering). Other questions are how thoroughly
to validate UTF-16 in a buffer and whether to convert to UTF-8 internally.

For what it's worth, I personally don't see much value in doing much more than
a machine-limited workaround for now. To me it's clear that this UTF-16 corner
case is a BIOS bug and its consequences are minimal once a workaround is in
place.

Thoughts? Also, if you'd prefer to let me handle it, I'd be glad to write a
patch myself.

[1] https://github.com/vinaypamnani/wmie2
