Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B489FC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 01:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347628AbjKBBMZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 21:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347564AbjKBBMY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 21:12:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182F2FC
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Nov 2023 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1698887513; x=1699492313; i=w_armin@gmx.de;
        bh=awJn+ahfcbmLMaq9kjd7rQh/H7IzGRa+RIFGO48VvAc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=Xne7YEiVW5EYZGkP2k2LA7YvT0llLOO79C87AGnJpRvWONWz+nXxwjZ2afGqSLTL
         U5rXnYWEQmA+Y7K8VwyFQFUgGpHaEl0Rfj7E/GeHxRXMF3HS9jimpYoSDuTndgCli
         FPLdGJs7ekM/vLmwFiCNFLAbsFeQFC2a5x52Lwg/jBcy3HrLIZTbjScifXD1e0t0g
         2j6d8QFf3AfIMwDNHGR07mqYiuPjxstrVCkJpBEwmFEoTpgSGFZ9B6a2tJsHepWSa
         8xy/pOsrnf8iNZgcty4gxp5bmA2e/5FKJilRTm+poK258c7p5woYaZwVHhSeZLfh3
         dCqetuQ2e72E2jzNNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1qou3H2Ify-00R0he; Thu, 02
 Nov 2023 02:11:53 +0100
Message-ID: <2c1e7789-bce3-4652-a290-bd8ddbe26df8@gmx.de>
Date:   Thu, 2 Nov 2023 02:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
To:     James Seo <james@equiv.tech>
Cc:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
 <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
 <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
 <217211fb-ac5c-4b61-911d-4d25b90cddda@gmx.de> <ZUHVUkzDfPX16+7P@equiv.tech>
Content-Language: en-US
From:   Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZUHVUkzDfPX16+7P@equiv.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1XK8S3R/9Qr3sBmS5JHrQirDpeJBd8MrNOd9qLCX5BnRcqqOb9y
 PYL4DYoA8fp5TtL7Pdi4iDmzkuvVg+tfzhVnrTad3klvyvjTcboWCVMYgEmOyCvOh0XZm5G
 ArpC02qNgHOVSYIu0bxJnM3NDCd04513U6ObYMZWgEYgvy14NTRIqABBuaNtdeYZRll/VZS
 KfzkVdyJDgRxiyCXw6CwQ==
UI-OutboundReport: notjunk:1;M01:P0:AQRNNHTPX/w=;/02OoMKhAcj1E3FnpRZOm1SLrF4
 OoFesNIxMdew+YlWMqukEEdkHXy1vFQizQAArqqNSPQ2LcVurgfCv9oCsVMcp43iZd3YnB4u6
 XavHncOpuabGsPj++ujRied5mPPu4HHNkqqcfbQ3u7nOuavNK3v5Nz1fzw7ST0avh97+ekv5B
 dnqBBWaX1nT/90bMWNs6AdlGaOYCmWE8FueZCRmBqrDYdjAm/4hN2jgYAK67TydOFUjELJfCQ
 EOcHVXRQKCtv8MkGq1cfEvMVRgpbOhhgugd3ifVfJ+Y5W0j4OwsjraefKiTjNAVexoGT0SgV4
 zAzHer/m59153KnaniYO1si6LxCpmA/IBNLb9fOIcLFCaM8jJfCFFTZWp2rgN1qJ6U+vsXpCD
 h4UCPx/HzeoNNx5WzPmSdjPj9Y4fmqKXsXzDxVUytIfBmDQcCypqqwoBVoCrmwYwjasCuZyLS
 7WulZo1LO0X+1tzdkW66k97RTv+DrtjD1ZXKfhWBgsvQ8IGOUKb6ZB5PA/yp7rfrwIbhXYhZI
 VONYFuMce+k3T1o9ogKUOF7EQxTRuzprXGmbAaBMM5xkwQIBZqj3UkzESb+CEMfNUc+StgsiR
 I0F/bXh7/B8mG9zOH96KxZPfoUeLuYaPQ6ogQUKGA+a0YD0ROEVEkytFsUse2IwwKHgMiAwcp
 0xWOZuVGCfvEPtUxZgrvCkr98K6n3PyAefRZ7IH49FNmOHMIy+4F0eQHIc/BAemTygfRPpP19
 w+y1AIvhqfM7/ZCd23KTeGdbuFLjUL5op1wpT4nYHNv8QM5lWyCJcZOrBqdByWUTuJmZ346Fa
 fZiUBFMBF4VZ+FvyGbV47nK637z1dnL+oim0IwbwP7xcigXvRR39fiuiVimJ7EYGZzwR8Rgct
 a1Z49FJJt4oNVoZ8nPTCcqDhx6MhqxarP9VmCb4HFBTM9DvmWsGuQGj617N3bVciJE15ehxu5
 xV5nGZmpll+YCAX8jNPFnbhcrfc=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 01.11.23 um 05:34 schrieb James Seo:

> On Tue, Oct 31, 2023 at 11:34:16PM +0100, Armin Wolf wrote:
>> Am 31.10.23 um 22:07 schrieb Lukasz Stelmach:
>>
>>> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>>>> On 10/31/23 12:07, Lukasz Stelmach wrote:
>>>>
>>>> [ ... ]
>>>>
>>>>>> For what it's worth, I personally don't see much value in doing muc=
h
>>>>>> more than a machine-limited workaround for now. To me it's clear th=
at
>>>>>> this UTF-16 corner case is a BIOS bug and its consequences are mini=
mal
>>>>>> once a workaround is in place.
>>>>>>
>>>>>> Thoughts?
>> I think this is no BIOS bug, but valid behavior since the Windows ACPI-=
WMI mapper
>> converts the ACPI objects into a common buffer format as described here=
:
>>
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/drive=
r-defined-wmi-data-items
>>
> Hi Armin,
>
> I did see this link when you mentioned it earlier, and I understand that=
 it's
> specifying the packed and internally aligned buffer format that WMI on W=
indows
> expects when a Windows driver provides a WMI data block.
>
> This to me is a different question from whether an ACPI object in the BI=
OS,
> one which will be converted to a WMI object by Windows later, should con=
tain
> UTF-16. I didn't find a single other example in all the ACPI dumps in th=
e Linux
> Hardware Database [1] of such an ACPI object.
>
> So the answer to the question seems like a "SHOULD NOT". And someone at =
HP
> definitely did a bad copy-paste when it came to this BIOS. I feel comfor=
table
> calling it a bug (the leading "4" makes it one in any case).

Not exactly, the leading "4" is a hack:

The string "4BIOS Configuration Change" get converted to "\u0034 \u0042 \u=
0049 \u004f \u0053 \u0020 \u0043 \u006f \u006e \u0066 \u0069 \u0067
\u0075 \u0072 \u0061 \u0074 \u0069 \u006f \u006e \u0020 \u0043 \u0068 \u00=
61 \u006e \u0067 \u0065 \u0000",
so without the leading "4", the utf16 string is 52 bytes long.

Since WMI want the utf16 string prefixed with its length (52 =3D 0x34), th=
e leading "4" was added
since the letter "4" gets converted to \u0034 (0x34 =3D 52).

So for WMI, the leading "4" gets interpreted as the length of the followin=
g utf16 string,
so it is not displayed to WMI data consumers.

>
>> I assume that the mapper converts the ACPI string into a WMI string buf=
fer, and that
>> a common ACPI buffer is just passed as-is. In this case, the error lies=
 inside the
>> linux WMI subsystem, which does not do such a conversion.
>>
>> I can try to find out more about this conversion and its rules, and use=
 this to add
>> support for that to the WMI subsystem. This would prevent such errors i=
n the future
>> and would bring us closer to full ACPI WMI support inside the kernel.
> Yes, if the ACPI-WMI mapping driver handles already existing UTF-16 in a=
n ACPI
> buffer as we have here, it would be good for us to support that as well.
> Hopefully =C5=81ukasz can find a Windows machine to help determine if it=
 does.
>
> Earlier, you mentioned converting an ACPI object into the packed buffer =
format
> that Windows expects. But is there some reason I'm missing for us to als=
o pack
> things like that in the first place? I assume that this format exists fo=
r
> convenience (returning multiple values) or space reasons, and such a WMI
> buffer is eventually unpacked into its various components according to t=
he MOF
> anyway. At least for WMI drivers on Linux, I think it would make more se=
nse to
> transparently convert the UTF-16 string to UTF-8 and pretend that the pr=
operty
> was an ACPI_TYPE_STRING all along.
>
> And now I'm thinking out loud, but if WMI doesn't allow arbitrary binary=
 data
> (and from the WMI buffer spec you linked, it doesn't), and the Windows A=
CPI-WMI
> mapper can indeed handle UTF-16, then ACPI_TYPE_BUFFER in ACPI objects i=
ntended
> to become WMI objects can only contain UTF-16.

On my machine (Dell Inspiron 3505), an ACPI WMI method uses a ACPI_TYPE_BU=
FFER
to pass an array of u32, so assuming ACPI_TYPE_BUFFER =3D=3D utf16 is fals=
e.

This shows why linux should do this preprocessing too, because WMI marshal=
s
the _converted_ buffer using the MOF definitions, not the ACPI bobject.

According to Microsoft documentation, the ACPI-WMI mapper converts the ACP=
I object
without having _any_ knowledge of the corresponding MOF definitions. This =
means
that after conversion, the contents of the WMI buffer are only "normalized=
" so
the WMI core does not have to know about ACPI data types.

If linux would also do this "normalization" step, then we would also be ab=
le to
operate on this "normalized" WMI buffer without relying on the ACPI data t=
ypes,
which (like in this case) can use different ways to express the same WMI d=
ata
(string as ACPI string vs string as utf16 buffer).

Armin Wolf

>> This will take quite some time however, so i would suggest adding a qui=
rk handler
>> first and replace this with the WMI conversion functions later.
> No worries.
>
> [1] https://github.com/linuxhw/ACPI/
