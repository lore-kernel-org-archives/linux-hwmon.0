Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FE9C4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Oct 2023 18:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjJ1SnE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Oct 2023 14:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1SnB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Oct 2023 14:43:01 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 28 Oct 2023 11:42:57 PDT
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE54D9
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Oct 2023 11:42:57 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698518576; x=1698525776; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To:
 To: From: From: Date: Sender: Sender;
 bh=OIoOeo0uJQv0ApGTgBa88fnmqs/BjsWaUHC8I7VpcBw=;
 b=F/dYtx285k5EWwqTLFjxK8MCrlMTitbCFROdDxWnqvejJdIhKaXfNIrj+FqfcMbS+FTlBRhhdcMinfL3fICvNx5Wi9uY5p2pq6Z1sZMbgGV2sbeq2G/a1io84dUJjLTGqdJkMxZeBcN/95HlzitQmqeBnng0GA1mSYpP2MBI4WwJ7tvvM4nH8Y4IBOQmaH0XqdSiAgOSnca+qar7suiU9FLdMiqBG8I0NZjShGS9mRBGRDBEiNfojSkSfTG+UerwLbiFPz7l4O+klH48346Ja+ENzGr3E6sILELcyzQRrlihdMSZIrSksy6odenQEXNi20r0ZQMlNHS0RtAhGY+GWA==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by baf52cbf39b8 with SMTP id
 653d5500bee565f3b19f2935 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Oct 2023 18:37:52 GMT
Sender: james@equiv.tech
Date:   Sat, 28 Oct 2023 11:37:51 -0700
From:   James Seo <james@equiv.tech>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZT1U/zE6cApQKC2h@equiv.tech>
References: <CGME20231027150755eucas1p205057d22989db5c031ea5db27b8d9836@eucas1p2.samsung.com>
 <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 27, 2023 at 05:07:09PM +0200, Lukasz Stelmach wrote:
> Hi,

Hi Łukasz, thanks for the report.

> I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian 12.
> I managed to build the hp-wmi-sensors out of tree. When I loaded it I
> got EINVAL.
> 
>     hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
> 
> I managed to track it down. And it happens in check_wobj() called from
> check_platform_events_wobj() because in the for loop when prop==0 the
> type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass this
> particular check like this
> 
>     if (prop == 0 && type == ACPI_TYPE_BUFFER)
>             continue;
> 
> everything else works like charm and I can read senosrs via sysfs.

I'm surprised that your bypass is working! That check is intended to make it
safe to assume HPBIOS_BIOSNumericSensor.Name is a ACPI_TYPE_STRING. Which the
driver continues to do, of course.

Maybe .Name is being erroneously reported as an ACPI_TYPE_BUFFER on just that
model, but is in reality still a string? Dealing with that string in e.g.
hp_wmi_strdup() would still work because .string.pointer and .buffer.pointer
seem to end up at the same offset in a union acpi_object, at least for now.

> I'd like to perpare a proper patch, but I've got no idea how to do properly
> work this quirk around. What are your suggestions?

Could you share output from acpidump and sensors before we go any further?

Thanks.

-James Seo

> Kind regards,
> -- 
> Łukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics


