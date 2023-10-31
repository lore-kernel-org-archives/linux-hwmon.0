Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4373DC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 22:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346930AbjJaWez (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 18:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346931AbjJaWev (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 18:34:51 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC804102
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1698791657; x=1699396457; i=w_armin@gmx.de;
        bh=XdICAIcPadgbB+SErMvn3kD2Bjp0pGj7LMZTHbOvBb4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=JE/1uVhN4EJkotYPsxqwMAmr2JgGI7brwrLNm6finWJg/qWbdGqXnlxAa+hLU91V
         oYVthHWEfnBss9FpvzDimUgmz2q3ZhtFSSmeSyEewenpLQey1VJimNBBSpBPh0QOb
         Fi6tR2UWh20/vqREYnPqsQuC/9M96wa0MZ/Ow9FcT//DbVYL1CuO9XAudcvD2KhHx
         Gg7AdQ9hRn+5zVPVImZrl51xzLc4+W5kvpbPQk6j/UztF5pfVE7mkLKafyqsUdvxo
         d475Ty7yzW8dj+f0oaeDDaR579TNjatePt3/KG3VXsbannoTT8za+VYutLeh6recb
         m861A4oKFC73SbfDgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1rbz6B34q2-00eLRI; Tue, 31
 Oct 2023 23:34:17 +0100
Message-ID: <217211fb-ac5c-4b61-911d-4d25b90cddda@gmx.de>
Date:   Tue, 31 Oct 2023 23:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
To:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
 <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
 <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
Content-Language: en-US
From:   Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gsYuL/bhW1BTQ0hiXVa6KyD1XRoRlHumu2e4RgWbuY7+irTIbq4
 YAlsSwopODEdSZTQpD3Ae7Du6F+rHVJ02UfZ92b01hvAGZHSfU0HXBkPX6NfyVeu4G+wWFC
 Fh1G7t91VbqDnNr6Ww3MRTzjSSG6nSxAlPgCUFb2e6nd8zSlPyu+etSgPgu92tJZSBOYb7I
 FuZR8Faez8wLOJ7leJHUg==
UI-OutboundReport: notjunk:1;M01:P0:S3ERPqSzlcc=;rhE0okC0kRR5x2WbDNAJyfm04/A
 j/OOeuUqjcOk4elF+SxBk0XvT0I1i+PhtZvKpmzc22EW4oem/b20ofR+ak7DRjJXEkNh3BtOG
 Kwkjq/KNngZiRIixpFtXCfC05eKCLiG48jKyWnsbkUhbznQ1dCskaUcceBu7+sGat72qA1k80
 zQmKm7gXd/lXNCXfl4m7L2R8HBzP/aSwMaWWuG/dEIxDutK8PVpJUU/nsixXCZ2z4JvLGp7Cp
 YhDn2TqZlFWKhfRFbTXCDhrkiRZ6o3ZF7BWkuCtGZR1iLivfejjKIpohrT4RF169GC8zOqMq2
 p7hvkmNzzWRJxSZuztir6x0Hhps9u1f3wtyRChfvG4q5RsRHGHJMmr+ETsLa3oC/EvDSy5wyL
 ovLTxb+4q6cS5m0ojG5XArv997N/p4V7EdGXrvUo9Q2zxgLA87MkHbdC+FcYs1qACG8IWTNQ+
 M4NVAQ+WY5plkv/qjxjzHh+1MhIMkOowKvqexLNmNmO7ti9xCG/yGjSzoO68w+I5erLIBIUbk
 4mcpwvU4ySVlYrSHRRV2XaW5AaYxT2NIsbsJGxEogc+igPBzLrhTi/6SnYuA/dCODSevAXVqJ
 iR1mBi40KYT6HnxEpPzMKFu6jKVtavWKz10FZ5Yi5gHDX4FpfW6XNYBUd8KQgBOqt6rPYjNph
 tiBmzQBrZlrmv5fIn5RvHhzmUR9SeIPbnVVvkJe6EFkci1QjsFeJACnpTJ5JjkScf3l3nuOKW
 xu2BT7UxEN7VsbHrfiEYohNwumNdw9ZyI5muBKVaOAmRBspOEQ4k18gzZ4uYKkv3KVhsVRrf9
 N5rqojn/0WkRXUdFIWLjwuzLMTFmNfl1cblk7cnaVYoo4C6DT53vw4cptADo0AiDPm0F3ZoaN
 EOo8LWiYfMwhl3krPuoNAXGqcrFw5pgWOXGYVEWNC61P8+NCzpdsyjdontNTdEXpcD7RwEz/8
 pahlV2ZgvVrTjgLR/uNypy4rn/4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 31.10.23 um 22:07 schrieb Lukasz Stelmach:

> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>> On 10/31/23 12:07, Lukasz Stelmach wrote:
>>
>> [ ... ]
>>
>>>> For what it's worth, I personally don't see much value in doing much
>>>> more than a machine-limited workaround for now. To me it's clear that
>>>> this UTF-16 corner case is a BIOS bug and its consequences are minima=
l
>>>> once a workaround is in place.
>>>>
>>>> Thoughts?

I think this is no BIOS bug, but valid behavior since the Windows ACPI-WMI=
 mapper
converts the ACPI objects into a common buffer format as described here:

https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-d=
efined-wmi-data-items

I assume that the mapper converts the ACPI string into a WMI string buffer=
, and that
a common ACPI buffer is just passed as-is. In this case, the error lies in=
side the
linux WMI subsystem, which does not do such a conversion.

I can try to find out more about this conversion and its rules, and use th=
is to add
support for that to the WMI subsystem. This would prevent such errors in t=
he future
and would bring us closer to full ACPI WMI support inside the kernel.

This will take quite some time however, so i would suggest adding a quirk =
handler
first and replace this with the WMI conversion functions later.

Armin Wolf

>>> I am no expert regarding x86 platforms and I don't know how often
>>> bugs
>>> like this happen and if making it more generic makes sens. Maybe.
>>>
>> That really depends on the system vendor, less on the CPU architecture.
> Of course it's not architecture but rather vendor landscape.  My point
> is that most embedded platforms I work with can be fixed at this level
> by patching device-tree, which is much easier (at least for me) than
> patching BIOS/UEFI. And I've seen a number of broken BIOS-es over years
> which vendors didn't care to fix. At the end of the day my *impression*
> is that x86 platform users more often have to live with quirks like this
> that require fixes at higher levels. But this is just my impression.
>
>>> My solution would be to add a module option, let's name it `quirks` an=
d
>>> make it a bit field for future use, that enables the workaound. Plus a=
n
>>> additional error message when probe fails to suggest user to add the
>>> option to kernel command line or whatever file that contains module
>>> options. A nice touch would be to detect if the workaround is still
>>> required.
>>>
>> Please no module option. Use DMI data or similar.
> DMI data is fine when can you identify broken systems upfront. In this
> case we don't know which systems are or will be affected by this bug.
>
> For example, eariler this year I fixed a different quirk in the same
> machine[1] but luckily there was a way I could apply the fix without
> waiting for the patch to be merged and pulled downstream. In my case
> I=C2=A0could use ALSA features to make my machine work before I got a pa=
tched
> kernel.
>
> Maybe both?
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3Dea24b9953bcd3889f77a66e7f1d7e86e995dd9c3
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217008
