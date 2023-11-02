Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D847C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 05:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348414AbjKBFMN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Nov 2023 01:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348509AbjKBFMA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2023 01:12:00 -0400
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61B0112
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Nov 2023 22:11:40 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698901899; x=1698909099; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=UkbZ3Qs2kr5pctHWBi/TJFfC46c9h9PoPGk8f9Laoic=;
 b=sVR6iqMCseAAU7CiMV1lOcnlQoNisJpuaE7Ti08Wy77yCv+uB8FH/puPp4f0Y+u5rfBLoeCux9Ub/bKdgpthszkYW/LGVQtaawobFWTgeQPHNQONEPV2winRneBU8hAYNlHfwQI8i811LRuEo8a+1RInRNKEuUI3+cNnQrlHpOv6oO07ftucpkl3ydVpao3zn7+sM8ai4OM5gDXBOCMkXXqzDEsL50qKRJROmmt2U9LOvwc3cwYRE7/TkV7ArthvuJ45puPUHidbP3H3OY22yIybel3DzzX8hjFbFy18Ww8xVlKf6httYEYXssJT20eHreHfovbW195XzNkbFxthNA==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 4880619ba52c with SMTP id
 65432f8b879a348f4fb5f1bf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Nov 2023 05:11:39 GMT
Sender: james@equiv.tech
Date:   Wed, 1 Nov 2023 22:11:39 -0700
From:   James Seo <james@equiv.tech>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Lukasz Stelmach <l.stelmach@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZUMvi04zAanimaV2@equiv.tech>
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
 <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
 <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
 <217211fb-ac5c-4b61-911d-4d25b90cddda@gmx.de>
 <ZUHVUkzDfPX16+7P@equiv.tech>
 <2c1e7789-bce3-4652-a290-bd8ddbe26df8@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c1e7789-bce3-4652-a290-bd8ddbe26df8@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 02, 2023 at 02:11:49AM +0100, Armin Wolf wrote:
> Am 01.11.23 um 05:34 schrieb James Seo:
> 
>> On Tue, Oct 31, 2023 at 11:34:16PM +0100, Armin Wolf wrote:
>>> Am 31.10.23 um 22:07 schrieb Lukasz Stelmach:
>>> 
>>>> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>>>>> On 10/31/23 12:07, Lukasz Stelmach wrote:
>>>>> 
>>>>> [ ... ]
>>>>> 
>>>>>>> For what it's worth, I personally don't see much value in doing much
>>>>>>> more than a machine-limited workaround for now. To me it's clear that
>>>>>>> this UTF-16 corner case is a BIOS bug and its consequences are minimal
>>>>>>> once a workaround is in place.
>>>>>>> 
>>>>>>> Thoughts?
>>> I think this is no BIOS bug, but valid behavior since the Windows ACPI-WMI mapper
>>> converts the ACPI objects into a common buffer format as described here:
>>> 
>>> https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-defined-wmi-data-items
>>> 
>> Hi Armin,
>> 
>> I did see this link when you mentioned it earlier, and I understand that it's
>> specifying the packed and internally aligned buffer format that WMI on Windows
>> expects when a Windows driver provides a WMI data block.
>> 
>> This to me is a different question from whether an ACPI object in the BIOS,
>> one which will be converted to a WMI object by Windows later, should contain
>> UTF-16. I didn't find a single other example in all the ACPI dumps in the Linux
>> Hardware Database [1] of such an ACPI object.
>> 
>> So the answer to the question seems like a "SHOULD NOT". And someone at HP
>> definitely did a bad copy-paste when it came to this BIOS. I feel comfortable
>> calling it a bug (the leading "4" makes it one in any case).
> 
> Not exactly, the leading "4" is a hack:
> 
> The string "4BIOS Configuration Change" get converted to "\u0034 \u0042 \u0049 \u004f \u0053 \u0020 \u0043 \u006f \u006e \u0066 \u0069 \u0067
> \u0075 \u0072 \u0061 \u0074 \u0069 \u006f \u006e \u0020 \u0043 \u0068 \u0061 \u006e \u0067 \u0065 \u0000",
> so without the leading "4", the utf16 string is 52 bytes long.
> 
> Since WMI want the utf16 string prefixed with its length (52 = 0x34), the leading "4" was added
> since the letter "4" gets converted to \u0034 (0x34 = 52).
> 
> So for WMI, the leading "4" gets interpreted as the length of the following utf16 string,
> so it is not displayed to WMI data consumers.

I see. So the ACPI-WMI mapper doesn't really "handle" UTF-16, then. Not in the
same way it does UTF-8.

I can't remember where, but I know I've dealt with these length-prefixed
UTF-16 strings before when touching other Microsoft offerings. So maybe this
string was originally inserted as 'Buffer (0x00,0x34,0x00,0x42,...0x00,0x00)'
and 'Unicode ("4BIOS...")' [1] is just how iasl decompiles it.

Either way, someone at HP realized all of this, and instead of just changing
this one string back to a regular string like every other similar string in
the same BIOS - and probably every other BIOS they'd ever seen - kept it.

On purpose.

Sigh.

>> And now I'm thinking out loud, but if WMI doesn't allow arbitrary binary data
>> (and from the WMI buffer spec you linked, it doesn't), and the Windows ACPI-WMI
>> mapper can indeed handle UTF-16, then ACPI_TYPE_BUFFER in ACPI objects intended
>> to become WMI objects can only contain UTF-16.
> 
> On my machine (Dell Inspiron 3505), an ACPI WMI method uses a ACPI_TYPE_BUFFER
> to pass an array of u32, so assuming ACPI_TYPE_BUFFER == utf16 is false.
> 
> This shows why linux should do this preprocessing too, because WMI marshals
> the _converted_ buffer using the MOF definitions, not the ACPI bobject.
> 
> According to Microsoft documentation, the ACPI-WMI mapper converts the ACPI object
> without having _any_ knowledge of the corresponding MOF definitions. This means
> that after conversion, the contents of the WMI buffer are only "normalized" so
> the WMI core does not have to know about ACPI data types.
 
Interesting. These HP machines represent a WMI array of strings as individual ACPI
String elements in an ACPI Package, so I assumed arrays of other types would be
individual elements as well.

> If linux would also do this "normalization" step, then we would also be able to
> operate on this "normalized" WMI buffer without relying on the ACPI data types,
> which (like in this case) can use different ways to express the same WMI data
> (string as ACPI string vs string as utf16 buffer).

Thanks for your work on the WMI subsystem side. Looking forward to when this,
BMOF decoding, and an unmarshaling mechanism are in the kernel and drivers can
work with WMI data types only.

[1] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/19_ASL_Reference/ACPI_Source_Language_Reference.html#unicode-string-to-unicode-conversion-macro
