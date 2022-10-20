Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17955C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Oct 2022 21:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJTVyj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Oct 2022 17:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiJTVyd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Oct 2022 17:54:33 -0400
Received: from p3nlsmtpcp01-03.prod.phx3.secureserver.net (p3nlsmtpcp01-03.prod.phx3.secureserver.net [184.168.200.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625BF2ED49
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 14:54:27 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.96])
        by : HOSTING RELAY : with ESMTP
        id ldThollgUZTrZldThotohZ; Thu, 20 Oct 2022 14:53:25 -0700
X-CMAE-Analysis: v=2.4 cv=IuPYMpzg c=1 sm=1 tr=0 ts=6351c355
 a=2X41b4ieGfoJAKBLAMfEgQ==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=iihcBN-LAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=3pv5mfjUoTvD2ZcA8DUA:9 a=QEXdDO2ut3YA:10 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=51156 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1oldTg-00BiZ9-PI; Thu, 20 Oct 2022 14:53:25 -0700
Message-ID: <2fff1941-25eb-63be-3061-f1f750bf6b7b@khalifa.ws>
Date:   Thu, 20 Oct 2022 22:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Content-Language: en-US
To:     Denis Pauk <pauk.denis@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>
References: <20221018173428.71080-1-ahmad@khalifa.ws>
 <20221019170627.GA2328901@roeck-us.net>
 <efce6e7f-b83c-eb4c-f410-662af2cb5f88@khalifa.ws>
 <20221020230419.6d80feb2@gmail.com>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20221020230419.6d80feb2@gmail.com>
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
X-CMAE-Envelope: MS4xfG5OEa2bSZgTFhrWY0/9K8QAnndC1nZtSdxG63o6se+r+3+myWr0Vwa/MsS5tvcyYBninmglddRb1vm1uDnGPv+vzN5t4eh9lvWhsG0jLmQf6FciKudi
 BTg4xwVpqKrUut/7eGH6d8HaGGZTB3XXYj97VedGe/puaPgwdFIN3dQfLYO3De4sbPcVRIlE2LGn90xl4euIGnWPmn3ACocuwtkMBXkltjWO+GhJY2iHjGG7
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/10/2022 21:04, Denis Pauk wrote:
> On Thu, 20 Oct 2022 18:08:00 +0100
> Ahmad Khalifa <ahmad@khalifa.ws> wrote:
> 
>> On 19/10/2022 22:04, Denis Pauk wrote:
>>> Hi Ahmad,
>>>
>>> Thank you for your patch.
>>>
>>> I will add mention of you patch in
>>> https://bugzilla.kernel.org/show_bug.cgi?id=204807 also.
>>
>> That's an interesting bug. It has loads of ACPI tables in there, which
>> could be very useful.
>>
>> The acpi patch is still a proof of concept and will show wrong values, I
>> know the voltages and temperatures are mixed up or could even be pulling
>> rubbish data that looks like a temperature.
>>
>> I just wanted comments on where to go, thanks for the below.
>> There is definitely lots to fix up first.
>>
>>
> 
> You also can use https://github.com/asus-wmi-boards-sensors/asus-board-dsdt, I
> have collected DSDT from bugs and asus support site. I suppose
> that all ASUS X670 bioses will have same dsdt definitions.

This is massive, extracted and all. I'll need to go through this for 
sure. Many thanks for this repo.

I don't think the X670 platform motherboards will have the same ACPI 
tables. For example, ATX vs ITX, STRIX vs CROSSHAIR, different 
peripherals/configurations.


> Some of dumps contains register definition like in P8H67-ASUS:
> 
> ```
> IndexField (HIDX, HDAT, ByteAcc, NoLock, Preserve)
> {
> 	Offset (0x04),
> 	CHNM,   1,
> ....
> 	VCOR,   8,
> 	V12V,   8,
> 	Offset (0x23),
> 	V33V,   8,
> 	V50V,   8,
> ....
> }
> 
> ```
> 
> On Tue, Oct 18, 2022 at 06:34:29PM +0100, Ahmad Khalifa wrote:
>> New Asus X670 board firmware doesn't expose the WMI GUID used for the
>> SIO/HWM methods. The driver's GUID isn't in the ACPI tables and the
>> GUIDs that do exist do not expose the RSIO/WSIO and RHWM/WHWM methods
>> (which do exist with same IDs).
>>
> 
> Have you caught differences in DSDT definition that broke WMI call?
> I see similar definition of WMI methods in X570 and X670 dsdt and by first look
> everything should be good.

It looks like WMI, but the GUID below is pointing at WMBC only, whereas 
you'd expect the 'BD' characters to be in there to access it through the 
WMI bus.

The hwmon drivers point at:
nct6775:             466747A0-70EC-11DE-8A39-0800200C9A66
asus_wmi_sensors:    466747A0-70EC-11DE-8A39-0800200C9A66

but the new board (from below) has:
X670 :               97845ED0-4E6D-11DE-8A39-0800200C9A66

The change in the first 2 segments might be indicative here, hence why I 
didn't think they just 'forgot' the GUID in this firmware

Anyway way, Geunter's idea from the other thread about reaching for the 
read/write methods directly might just be better here. No need to 
struggle with GUIDs that can change if Asus will always expose the 
methods. I'll go through your repo and see if I can confirm that.


> 
> Like:
> X670
> ```
> ....
> Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)
>   // _HID: Hardware ID
> Name (_UID, "AsusMbSwInterface")  // _UID: Unique ID
> Name (_WDG, Buffer (0x3C)
> {
> 	/* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,  // .^..mN..
> 	/* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,  // .9.. ..f
> 	/* 0010 */  0x42, 0x43, 0x01, 0x02, 0x72, 0x0F, 0xBC, 0xAB,  // BC..r...
> 	/* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9, 0x06,  // ........
> 	/* 0020 */  0x29, 0x10, 0x00, 0x00, 0xD2, 0x00, 0x01, 0x08,  // ).......
> 	/* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
> 	/* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
> 	/* 0038 */  0x4D, 0x4F, 0x01, 0x00                           // MO..
> })
> .....
> Method (WMBD, 3, Serialized)
> {
> 	Local0 = One
> 	Switch (Arg1)
> 	{
> ....
> 		Case (0x5253494F) +
> 		{
> 			Return (RSIO (Arg2))
> 		}
> 		Case (0x5753494F) +
> 		{
> 			Return (WSIO (Arg2))
> 		}
> 		Case (0x5248574D) +
> 		{
> 			Return (RHWM (Arg2))
> 		}
> 		Case (0x5748574D) +
> 		{
> 			Return (WHWM (Arg2))
> 		}
> ......
> 		Default
> 		{
> 			Return (Zero)
> 		}
> 
> 	}
> 
> 	Return (Local0)
> }
> ```


-- 
Regards,
Ahmad
