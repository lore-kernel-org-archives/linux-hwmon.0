Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10E2C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8078160D07
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJUSiu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:38:50 -0400
Received: from mout.gmx.net ([212.227.15.18]:45219 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUSit (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634841377;
        bh=L5bteFld+4vYcadtPiOsLmSIdeTyqtdupRRHxM1tFgw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=HyYGWTzm4TrLjZCtUKtCCGj5Uv5k0biC0bbYVa1C9wuwulV+kAg6mlUeBGnoZJ6Uy
         jcSdB4LP2aM/VHg3odKloJMDwZM4dOa56OhTHWrnXkIEOt/4dPCOdQyBusbCgRt+jY
         Azs2gYeo3Txjqwwk6OVLIc1/D9SZzzmHurAKns6I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCb5-1m8ZPN3Ng1-00V7fq; Thu, 21
 Oct 2021 20:36:16 +0200
Subject: Re: [PATCH 4/5] hwmon: (dell-smm) Add Dell Inspiron 3505 config data
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-5-W_Armin@gmx.de> <20211021180521.a5l2shvor4qwesfe@pali>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <02f9b445-cc5d-0699-7bac-cbd28d1ea35f@gmx.de>
Date:   Thu, 21 Oct 2021 20:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211021180521.a5l2shvor4qwesfe@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:RXER3/W0YNN2ArSLTtHX/dl7tS1UpYHOzLX/PFH+AugwsADn2VN
 7O2IVXuT36evvLv5Dob40iATutmZjZzahv9hnd/phyUMb9wrCmnrctgNAp0cDq0bGM2m0mS
 QA82B6YDQ27hsnzUhwjS6/hHHIM0xTSGCkl40/odbef0vrSWS1HCNEyRIGKnmosDc6ylL4r
 edSRpTPRFwVjLlcU7X1Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mJqn8c+6G5M=:8BwkIKzCzwxFf/hPSSg44C
 173kwyAtQr/QSvn5fzWNvdHr0q0nPUfTB6duM0qEZoNAccaPIB4nD4vMkSKVlK4kl7q91kgdk
 kAewh1QL8JKgI81+WDbW/qWqeCMjJiVVUH1MYtecgW6mN4XF2uzqCZ1WqGLWP1u4W4BvqEyvt
 yjmzPVjtoM7jRk0H1AyqdCi1G+ZmqE2vXfeS0i550UUGopED2r+SdeNCwntvCVunlN92cg1D0
 2TPb86k1lNco1Ug7bwbVL14invt7seBLrjRiZsVDQWn/r2XlD0twRw7PUa/kIOU7/NJ4A9nFx
 1AtgpTos3wrGVPZ+rfyD8a/gcRBZ+4KbVHYxXOEib5LZhFucQydOnpRkWcJfT2pJbxBYDLSKw
 k/icYCbTm2t4tbqSA9LDkDupNUSS3MVQBeP2iakNBMVFg7Al39MKF+aHZwBh92BED44Q1mlg1
 UaiZ81xikac5m/dnKG4/8Bg0RMargzmIYZtwmpUysbo99lvYVEe65wOQTH2c4Bn9UcYetoyII
 7iLydpvhhSfSCyIzwmPLWzvA8worLuc8ouJbkaDJiDH0QdbWXnIW9ksNKTPbqSX02TK5EKSbt
 1f8eDY2foOI4AoiLQFWkpUQWAW3LA5Keb0u5joc9/1mOMa67Md5h8h8uEheVLkuTrlWjWcqoJ
 GZIyuDahsoRLSuCX044E8Z3hO+5dSYandV9BhQdluQDbtBCoxyS7oPF8N//sn94qTRqBPAXpU
 S88QVZhh0VGAQIbLMj1Kto7KxYcqo8Nr3Y6jj6VAGhDCRIjldX08RNJaZTK1clHIBb5a6Pd2p
 henxhLYnCJFdFPjt7SEXeJ5L0TbG4/BmaDqKX5jtHd1lUz5hzQ/LAFT3GZlqxDDvkSvWwm6qK
 joR4UmaitFiOEY6rRsnIC8rKWhfmKsdFaPQd0eZ7tNQ5+wsiuGhysozfVDZ2SSPIzWmZeIP+w
 1RgjjjTj4sa4STL+VNdc3y8S0pQorhFfK5BDS7TQ1rJvldb9BUnc3P6/BpLMkOStQHYgC6LwO
 EvJCzqv856/utfwhykbh3to+o9agobjgrbkJPmetcvme+GdaltzJK9HiDQnWr3bZs451HjgG1
 rpj3oPOhDmFujk=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 21.10.21 um 20:05 schrieb Pali Roh=C3=A1r:
> On Thursday 21 October 2021 19:54:46 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> After checking the fan speeds reported with the
>> Dell Diag UEFI ROM, its safe to permanently
>> set fan_max to I8K_FAN_HIGH and fan_mult
>> to 1 for the Dell Inspiron 3505.
>>
>> Tested on a Dell Inspiron 3505.
> Hello! Are there any issues without this change on Dell Inspiron 3505?
> Because i8k_config_data[] array is there for machines which need some
> hooks and do not work correctly (e.g. allowing to use I8K_FAN_TURBO).
The Inspiron 3505 works fine without this change. If i8k_config_data[]
is only there for applying
device specific quirks, then this change can be removed.
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
>> index 5f0338b4a717..2579dd646b20 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -990,6 +990,7 @@ struct i8k_config_data {
>>   };
>>
>>   enum i8k_configs {
>> +	DELL_INSPIRON_3505,
>>   	DELL_LATITUDE_D520,
>>   	DELL_PRECISION_490,
>>   	DELL_STUDIO,
>> @@ -997,6 +998,10 @@ enum i8k_configs {
>>   };
>>
>>   static const struct i8k_config_data i8k_config_data[] __initconst =3D=
 {
>> +	[DELL_INSPIRON_3505] =3D {
>> +		.fan_mult =3D 1,
>> +		.fan_max =3D I8K_FAN_HIGH,
>> +	},
>>   	[DELL_LATITUDE_D520] =3D {
>>   		.fan_mult =3D 1,
>>   		.fan_max =3D I8K_FAN_TURBO,
>> @@ -1030,6 +1035,14 @@ static const struct dmi_system_id i8k_dmi_table[=
] __initconst =3D {
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude"),
>>   		},
>>   	},
>> +	{
>> +		.ident =3D "Dell Inspiron 3505",
>> +		.matches =3D {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3505"),
>> +		},
>> +		.driver_data =3D (void *)&i8k_config_data[DELL_INSPIRON_3505],
>> +	},
>>   	{
>>   		.ident =3D "Dell Inspiron 2",
>>   		.matches =3D {
>> --
>> 2.20.1
>>

