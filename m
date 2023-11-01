Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA063C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Nov 2023 04:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344763AbjKAEem (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 00:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344644AbjKAEei (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 00:34:38 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAE9ED
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 21:34:28 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698813267; x=1698820467; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To:
 To: From: From: Date: Sender: Sender;
 bh=q5KpqLWPVycwNsnjaTgtsoVkMf3hBkudt3wB8Ti8B+o=;
 b=nJ5rFQhbHR/ewN9nwRDxkrS7o+6Yk2ISZCu0ye4S2mr7sZnIXa8YodaxNm5PU1WJQj/TmeXICGxK3A0K1F//FzH7xmLcEIDKuLqSs6weZqN3DEHj6MSkL6yfZl7Ois2gMAyKmX3XMaPNUtoqcMxSHSPXGjGeGECmDP8rUQUtgNwWFL8qFCRHjHAep4qn56snf4EgUb98Aw8Q7mlO1c0OVWHNV6CHGIQ3w+SA04Y0IPsy+XfGvj3qpqeVu2Wk3YYOmaBxY1POB1wK/9iSg32Hc7onI6hQF59dGICAav+1df2sHGE234+CLTRji28mrxZfRWd82B3T+ge84odxuY/bKQ==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by d40475e9c40e with SMTP id
 6541d553da6d5caff52ddc20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Nov 2023 04:34:27 GMT
Sender: james@equiv.tech
Date:   Tue, 31 Oct 2023 21:34:26 -0700
From:   James Seo <james@equiv.tech>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZUHVUkzDfPX16+7P@equiv.tech>
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
 <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
 <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
 <217211fb-ac5c-4b61-911d-4d25b90cddda@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <217211fb-ac5c-4b61-911d-4d25b90cddda@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 11:34:16PM +0100, Armin Wolf wrote:
> Am 31.10.23 um 22:07 schrieb Lukasz Stelmach:
> 
>> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>>> On 10/31/23 12:07, Lukasz Stelmach wrote:
>>> 
>>> [ ... ]
>>> 
>>>>> For what it's worth, I personally don't see much value in doing much
>>>>> more than a machine-limited workaround for now. To me it's clear that
>>>>> this UTF-16 corner case is a BIOS bug and its consequences are minimal
>>>>> once a workaround is in place.
>>>>> 
>>>>> Thoughts?
> 
> I think this is no BIOS bug, but valid behavior since the Windows ACPI-WMI mapper
> converts the ACPI objects into a common buffer format as described here:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-defined-wmi-data-items
> 
Hi Armin,

I did see this link when you mentioned it earlier, and I understand that it's
specifying the packed and internally aligned buffer format that WMI on Windows
expects when a Windows driver provides a WMI data block.

This to me is a different question from whether an ACPI object in the BIOS,
one which will be converted to a WMI object by Windows later, should contain
UTF-16. I didn't find a single other example in all the ACPI dumps in the Linux
Hardware Database [1] of such an ACPI object.

So the answer to the question seems like a "SHOULD NOT". And someone at HP
definitely did a bad copy-paste when it came to this BIOS. I feel comfortable
calling it a bug (the leading "4" makes it one in any case).

> I assume that the mapper converts the ACPI string into a WMI string buffer, and that
> a common ACPI buffer is just passed as-is. In this case, the error lies inside the
> linux WMI subsystem, which does not do such a conversion.
>
> I can try to find out more about this conversion and its rules, and use this to add
> support for that to the WMI subsystem. This would prevent such errors in the future
> and would bring us closer to full ACPI WMI support inside the kernel.

Yes, if the ACPI-WMI mapping driver handles already existing UTF-16 in an ACPI
buffer as we have here, it would be good for us to support that as well.
Hopefully Łukasz can find a Windows machine to help determine if it does.

Earlier, you mentioned converting an ACPI object into the packed buffer format
that Windows expects. But is there some reason I'm missing for us to also pack
things like that in the first place? I assume that this format exists for
convenience (returning multiple values) or space reasons, and such a WMI
buffer is eventually unpacked into its various components according to the MOF
anyway. At least for WMI drivers on Linux, I think it would make more sense to
transparently convert the UTF-16 string to UTF-8 and pretend that the property
was an ACPI_TYPE_STRING all along.

And now I'm thinking out loud, but if WMI doesn't allow arbitrary binary data
(and from the WMI buffer spec you linked, it doesn't), and the Windows ACPI-WMI
mapper can indeed handle UTF-16, then ACPI_TYPE_BUFFER in ACPI objects intended
to become WMI objects can only contain UTF-16.

> This will take quite some time however, so i would suggest adding a quirk handler
> first and replace this with the WMI conversion functions later.

No worries.

[1] https://github.com/linuxhw/ACPI/
