Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A0C25B48
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Oct 2023 18:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbjJ0SvF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Oct 2023 14:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbjJ0SvE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Oct 2023 14:51:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAB09D
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1698432641; x=1699037441; i=w_armin@gmx.de;
        bh=YFu+ijPPHsPl2+iOs7x+jHW6xZWwNh2dnqoX0qwtgpE=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=IbmwRzoI4lcnQKqpvQPcHCYbky+drTocA5DAczCBXbgvwhSaDjX+iOtUO8peEShn
         Erpxw7XMbpn8BJm2qIk1Z4gUcxazQyyXX8L9bPxVc7mt/oU92DhGNDasjo6P+FMoK
         DinjPfNvI5932Mozj2OvJMfiRu+nCS0GL5VDd1Xp33J5SColV4CI6JpRd05jNUCS+
         d5Xq+JvqzU7kfMp1so+AbNp1k5aAIyayb5xen2SNz5K3FrT5EzcmyZj9BpVrPKmpl
         yOmqzV50mtNyL08pvVDZ24K7uhE7er/DbCUJcYCSAw409VBQjyKdC7iStA5Hb1N22
         StwO1JZFeQ5l44iW0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1rcUnJ2ABc-0120xa; Fri, 27
 Oct 2023 20:50:41 +0200
Message-ID: <e0f8a499-5b90-45ef-98be-4513c1d2d912@gmx.de>
Date:   Fri, 27 Oct 2023 20:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
To:     Guenter Roeck <linux@roeck-us.net>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        James Seo <james@equiv.tech>
Cc:     linux-hwmon@vger.kernel.org
References: <CGME20231027150755eucas1p205057d22989db5c031ea5db27b8d9836@eucas1p2.samsung.com>
 <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
 <7850a0bd-60e7-88f8-1d6c-0bb0e3234fdc@roeck-us.net>
Content-Language: en-US
From:   Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7850a0bd-60e7-88f8-1d6c-0bb0e3234fdc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:la5yuBIv593ZKfNuxA7zO9RzxLOoGP87ZZ4wV+gSQLqP+TVng9r
 r+H7AvRSGhT0LLN7p4VqolXMI9n5RHRsUDPfYobVhLOki2sOVDqoDgx9zGxdlBF9q6cUiHL
 pwfqC7e8g6kB25AtuyhAdzR/JEwSa1TM59+6PhZs9BQ1ltmjeU81OgTWl/pa+koszn6H6gy
 hWX0XXaPN62TlKGcFodog==
UI-OutboundReport: notjunk:1;M01:P0:Ue+dYCKpM2Y=;WmwRXJc0xbrUgxj86Rn2J03G+3w
 mVGgb6d61pkBy/k89N04zmtH5V0bzUx2WBtTJGR8FkuGn4Beeec3fNltN1pfn9E569378kp7n
 +LtAOQ5OGX6aTpGTjb56VFVVi6O9m+aQb1T8MDkkKw9yvbfwzfQmCTAWC4rQPKiUzv3l0puqT
 0acZOjw6xVggjwiUfYM0nHGxR3b2I05zA1MtzKm7BS7xpwGhAcc0n+WoKyacLw7Jahjce3oSI
 kosuPwMpDFaWN0Z9svtlzvpZJgwtPY+zkcsET8MWtx33eIlzaJwrSO7gPcqgfXdcdnM88XnpT
 E59dl5my3/UU09E+lFc4l5CgLbsx9t4onNU9tkKzxD+DAYGl7n3M0ArSEm9pjCTY66wr6/ouW
 Bxs/d9UCWcjUrha95bYsMtxwsUPEhzPww5sBDr6v6ex0GJPuwgfk4pDBXg+Fim1X9OIBemYnn
 nqKkTKWTJq3X7kd8pw2LTdIFIrPjWJkaH3+LrDc7OcIrp0M/KZYaOMgdX8i3u8SYwg0nPLqeR
 kELKwtV+m5Hrq3GruyERk4Au20LPfcYY4w1yPjZOGOEYSS5BqNpLYl3iVWGXbQvd4CFZ60abx
 clRILwAWVeYJbmPRfCmVepecE8kps37/uwcS5BWvaQ67Ck6JDn1n7/uhV/Sj4J9BV1wTuJ8X8
 krOxWPswuaC8MjP+f/r9WCAikfFz2tddtsPiQKboWtvsGLu3SGLjRQZf09v/jx15jrSiNs3Du
 R6lOc/Qo9bl5kP9vb5bWRDUSmj0FVowfFqGxijEUbHAQYnA69/HmMQiRkTUD48QM7ZIplU8EZ
 kk5yN7PO3f2krHqsgjcgsmusc5CAep5dt4lnNgt69DMk6Um+zfyfKnhG1Kjls2s+34eTMOUPv
 HBX289pbEJqQRiIy+JMGP+tJRXKNNoCn5nvECs9Iu+xmw7ma84i/ULJf9V3sd8gNxwQrTCffw
 gh+859CzhGu/QG8/CpfcZkyHlB0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 27.10.23 um 19:07 schrieb Guenter Roeck:

> On 10/27/23 08:07, Lukasz Stelmach wrote:
>> Hi,
>>
>> I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian=C2=
=A012.
>> I managed to build the hp-wmi-sensors out of tree. When I loaded it I
>> got EINVAL.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BA=
DC-0E9424F20C9A
>> failed with error -22
>>
>> I managed to track it down. And it happens in check_wobj() called from
>> check_platform_events_wobj() because in the for loop when prop=3D=3D0 t=
he
>> type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass thi=
s
>> particular check like this
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (prop =3D=3D 0 && type =3D=3D ACPI_TYPE_BUF=
FER)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
>>
>> everything else works like charm and I can read senosrs via sysfs. I'd
>> like to perpare a proper patch, but I've got no idea how to do properly
>> work this quirk around. What are your suggestions?
>>
>> Kind regards,
>
>
> I really don't know if that is a bug in the driver or a bug in the WMI
> description on that system. Given that, I have no idea how to handle
> this.
> I also don't know the impact of ACPI_TYPE_BUFFER vs. ACPI_TYPE_STRING;
> from the code in the kernel it seems that those values have a distinctly
> different meaning. Is the returned value, when extracted, a string ?
> Is it ok to accept ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING for
> property names ? I simply don't know.
>
Hi,

could it be that this ACPI buffer object containst UTF16 characters? If ye=
s, then
the reason for this could be that on Windows, the ACPI-WMI mapper convert =
the whole
ACPI object into a buffer first, take a look at this:

https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-d=
efined-wmi-data-items

Since the mapper does not know anything about the higher-level content of =
the ACPI object,
i assume there are conversion rules on how to convert an ACPI object into =
an WMI buffer.
Maybe the mapper converts an ACPI string object into such a buffer per def=
ault?

> Are the type checks really needed ? What do other drivers do when
> interpreting
> WMI data ? Could extract_acpi_value() be more flexible and also accept
> ACPI_TYPE_BUFFER, or would that potentially create other problems ?
> Lots of questions that at least for my part can not answer.
>
> Guenter
>
It would be helpful if i had access to the output of acpidump and the BMOF=
s of this notebook.
If it is indeed possible to find out which conversion rules the Windows dr=
iver uses, then
i could create something like this:

	int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id, u8 *input, size_t input_size, u8 *output);

It would basically wrap wmidev_evalue_method() and convert the resulting A=
CPI object into
an general WMI buffer.

Armin Wolf

