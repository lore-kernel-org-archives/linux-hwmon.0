Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CFCC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Nov 2023 05:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjKAFxE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 01:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjKAFxA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 01:53:00 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA43AC2
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 22:52:47 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698817966; x=1698825166; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To:
 To: From: From: Date: Sender: Sender;
 bh=vgdJ0L1e+3RV4MwRThrz1SH4UZ3ZFWPlmv2SEAKtShs=;
 b=ZtBddZ8ioE6sRyiZLm9ILCNEkl/RSfpq6La8P+VXCprSPOIzL+lh+OEPQEUo3CMXQOkYJN+zEuVZ81SgEdokkEhoH2154HY7kpmKKocGGktkZDi4PIvbWdwCn/ej9uRKoGLY9thnyN5wuiJiKHhieeHscthKELhevRf6zyWHlL5qSHiOoFIZZ1pV5LwJrdl5sCLyumo+a2biRlAN/BSpjuMY6Gv5Z9HWQUTCPsgc230+qgkFmWzjqs7k+cBlST/4UqzzSVaadtwxbiHpqR58nDKn/bLs/q/R/78/mCuTme0xgOrucKfW5Z4TTxfkVFa38VOCkNIehHwYVsI1KpBH1A==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 4f51a5dd470e with SMTP id
 6541e7ae245fb0ff5db60154 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Nov 2023 05:52:46 GMT
Sender: james@equiv.tech
Date:   Tue, 31 Oct 2023 22:52:45 -0700
From:   James Seo <james@equiv.tech>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZUHnrYOvIGeH1oH9@equiv.tech>
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
 <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
 <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 10:07:26PM +0100, Lukasz Stelmach wrote:
> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>> On 10/31/23 12:07, Lukasz Stelmach wrote:
>>
>> [ ... ]
>>
>>>> For what it's worth, I personally don't see much value in doing much
>>>> more than a machine-limited workaround for now. To me it's clear that
>>>> this UTF-16 corner case is a BIOS bug and its consequences are minimal
>>>> once a workaround is in place.
>>>>
>>>> Thoughts?
>>> I am no expert regarding x86 platforms and I don't know how often
>>> bugs
>>> like this happen and if making it more generic makes sens. Maybe.
>>> 
>>
>> That really depends on the system vendor, less on the CPU architecture.
> 
> Of course it's not architecture but rather vendor landscape.  My point
> is that most embedded platforms I work with can be fixed at this level
> by patching device-tree, which is much easier (at least for me) than
> patching BIOS/UEFI. And I've seen a number of broken BIOS-es over years
> which vendors didn't care to fix. At the end of the day my *impression*
> is that x86 platform users more often have to live with quirks like this
> that require fixes at higher levels. But this is just my impression.

Must be nice being able to patch this sort of thing in devicetree.

>>> My solution would be to add a module option, let's name it `quirks` and
>>> make it a bit field for future use, that enables the workaound. Plus an
>>> additional error message when probe fails to suggest user to add the
>>> option to kernel command line or whatever file that contains module
>>> options. A nice touch would be to detect if the workaround is still
>>> required.
>>> 
>>
>> Please no module option. Use DMI data or similar.
> 
> DMI data is fine when can you identify broken systems upfront. In this
> case we don't know which systems are or will be affected by this bug.

This particular bug seems extremely rare in general, which means I'm further
inclined towards treating it as a one-off. As Günter said, we can always add
more later.

Can you provide the output of `dmidecode -s baseboard-product-name` for now?

