Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AA5C43217
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Oct 2022 16:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiJTQzy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Oct 2022 12:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiJTQzy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Oct 2022 12:55:54 -0400
Received: from p3nlsmtpcp01-03.prod.phx3.secureserver.net (p3nlsmtpcp01-03.prod.phx3.secureserver.net [184.168.200.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C593139C1F
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 09:55:52 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.96])
        by : HOSTING RELAY : with ESMTP
        id lYolojVXWZTrZlYolorp0f; Thu, 20 Oct 2022 09:54:51 -0700
X-CMAE-Analysis: v=2.4 cv=IuPYMpzg c=1 sm=1 tr=0 ts=63517d5b
 a=2X41b4ieGfoJAKBLAMfEgQ==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=5HviTnQ1Hhqoc250sf4A:9 a=QEXdDO2ut3YA:10
 a=ZXOyfd87I8AR-G90gsrY:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=44778 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1olYol-005WeW-C5; Thu, 20 Oct 2022 09:54:51 -0700
Message-ID: <efce6e7f-b83c-eb4c-f410-662af2cb5f88@khalifa.ws>
Date:   Thu, 20 Oct 2022 17:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>,
        Denis Pauk <pauk.denis@gmail.com>
References: <20221018173428.71080-1-ahmad@khalifa.ws>
 <20221019170627.GA2328901@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20221019170627.GA2328901@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl1062.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - khalifa.ws
X-Get-Message-Sender-Via: p3plcpnl1062.prod.phx3.secureserver.net: authenticated_id: ahmad@khalifa.ws
X-Authenticated-Sender: p3plcpnl1062.prod.phx3.secureserver.net: ahmad@khalifa.ws
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfMkOjcm2DajhdsT6wT8CVMBAxVZ8axfsrmj0ylgTu6rE2mv7mob2R622EZx0D5Nu9ZFNynevqJyhWAr0LTfqgFfX3sRP2eDVOfixMxmN5/EVKsQbm503
 W2aw52c8ZplgiUmSgR5OS1ODs3UCsxHb9asHC8w8JssBIQTah0OPbj2syeh/PriRFc11Jw2r0iBxO/ANL7MSmtZrj0k2Yc+qu5GKwlrMn2kXEqyTr54L05FT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 19/10/2022 18:06, Guenter Roeck wrote:
> On Tue, Oct 18, 2022 at 06:34:29PM +0100, Ahmad Khalifa wrote:
>> * Finally, adds the NCT6779 device support as a replica of NCT6778
> NCT6799 / NCT6798 ?
>> Reading the device sensors is quite accurate for the first 2-3 sensors,
>> but further up the index, it needs more work as it's not the same map
>> as the 6778.
> 6798 ?

Correct, those were typos. Adding the 6799 based on closest number.

>> What would be the best approach to enable support for those boards?
> First, as I think you suggested as well, this needs to be (at least)
> two patches, one to add support for the new chip using existing methods,
> and another to enable accesses through ACPI.
> 
> Second, I don't have access to the chip datasheet. Historically it is
> unlikely that the chip is indeed a clone/replica of NCT6798.
> The comment above suggests that the chip is indeed not the same,
> so this will have to be resolved before anything can be accepted.

Ok, I'll focus on figuring out the registers for the connected sensors 
or finding a datasheet.

> Since the actual methods are the same, what is the benefit of keeping
> wmi access methods around ?

In theory, ACPI access is faster because WMI is an extra translation
layer on top, but at the same time nct6775 doesn't have to worry about 
finding the right device or registering with ACPI.

Did you mean to skip the WMI path, skip the WMBD control method and go 
straight for the read/write methods themselves? That's possible.

The tricky bit would be narrowing down which PNP0C14 device has those 
methods and then trying not to compete with the other WMI/EC drivers for 
Asus sensors (too many: asus-wmi-sensors, asus_atk0110, asus-ec-sensors)

I know the _UID for the board I have, but this probably shouldn't rely 
on _UIDs and have to cover all 50 boards that are already there.

Let me have a look at this.


> Last but not least, please run your patches through checkpatch.
> Couple of additional comments inline.

Thanks, I didn't know that was there.



-- 
Regards,
Ahmad
