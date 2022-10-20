Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD2BC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Oct 2022 17:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiJTRJK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Oct 2022 13:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiJTRJE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Oct 2022 13:09:04 -0400
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net (p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C521A5B09
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 10:09:03 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id lZ1WomeHSEbMilZ1WowHpA; Thu, 20 Oct 2022 10:08:02 -0700
X-CMAE-Analysis: v=2.4 cv=X7yUakfe c=1 sm=1 tr=0 ts=63518072
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=VwQbUJbxAAAA:8 a=HEGHCBPgVxO92PmayQYA:9 a=QEXdDO2ut3YA:10
 a=ZXOyfd87I8AR-G90gsrY:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=42178 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1olZ1W-005nja-GP; Thu, 20 Oct 2022 10:08:02 -0700
Message-ID: <bdc8ff0e-9223-36ed-366e-d5675e7c9062@khalifa.ws>
Date:   Thu, 20 Oct 2022 18:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Content-Language: en-US
To:     Denis Pauk <pauk.denis@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>
References: <20221018173428.71080-1-ahmad@khalifa.ws>
 <20221019170627.GA2328901@roeck-us.net> <20221020000421.4511b40d@gmail.com>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20221020000421.4511b40d@gmail.com>
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
X-CMAE-Envelope: MS4xfJthH3kZe1/hBFxl2UOay32UT4apzPNZGo/Yq6LY2dTaAyFnHiGKiYvDKRdcGkU6mSGd2Qy11MUbq0Y923jwJVOmYdUs14GmyD112isI6qZKJUKmPwv6
 wzlhRdtvWX/0+lrkGV0svcn0POJRWtIb/mmjXMHcGh+q5x3VvoCiVCrYTOOght41w1pcfri9s46Fn98Rs76KkFu8tB7gE27FeTbve8QPdPNolNkL2/Qxxauq
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 19/10/2022 22:04, Denis Pauk wrote:
> Hi Ahmad,
> 
> Thank you for your patch.
> 
> I will add mention of you patch in
> https://bugzilla.kernel.org/show_bug.cgi?id=204807 also.

That's an interesting bug. It has loads of ACPI tables in there, which 
could be very useful.

The acpi patch is still a proof of concept and will show wrong values, I 
know the voltages and temperatures are mixed up or could even be pulling 
rubbish data that looks like a temperature.

I just wanted comments on where to go, thanks for the below.
There is definitely lots to fix up first.


> I have added my comments below.
>> +static void superio_acpi_select(struct nct6775_sio_data *sio_data,
>> int ld) +{
>> +	sio_data->ld = ld;
>> +}
>> +
> Could be reused superio_wmi_select here with some more general name?
> e.g rename superio_wmi_select -> superio_asus_select, or some other
> name.
>> +static int superio_acpi_enter(struct nct6775_sio_data *sio_data)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void superio_acpi_exit(struct nct6775_sio_data *sio_data)
>> +{
>> +}
>> +
> Could be reused superio_wmi_exit here with some more general name?

Yes, make them common for both.
Frankly, I replicated them mechanically so the patch is quicker to read 
without lots of +/- lines


>> +		case nct6799:
> Looks as same as for the previous one (nct6798). Have i missed some
> reg difference?

They're a replica, probably should've reused the above case.




-- 
Regards,
Ahmad
