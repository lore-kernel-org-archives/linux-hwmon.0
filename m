Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581F2C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 20:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiJCUbZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 16:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiJCUbY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 16:31:24 -0400
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net (p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532AD33345
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 13:31:23 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id fS50owtb43gBFfS50omOLv; Mon, 03 Oct 2022 13:30:22 -0700
X-CMAE-Analysis: v=2.4 cv=Yeh4Wydf c=1 sm=1 tr=0 ts=633b465e
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=YLYsR77EshHDh1doXDcA:9 a=QEXdDO2ut3YA:10
 a=ZXOyfd87I8AR-G90gsrY:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=37698 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofS4z-002NqM-O3; Mon, 03 Oct 2022 13:30:21 -0700
Message-ID: <b493e629-c6a5-e705-6574-060550f5c977@khalifa.ws>
Date:   Mon, 3 Oct 2022 21:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] it87: Add param to ignore ACPI resource conflicts
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20221002174259.14609-1-ahmad@khalifa.ws>
 <20221002174259.14609-2-ahmad@khalifa.ws>
 <20221003181002.GC1023056@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20221003181002.GC1023056@roeck-us.net>
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
X-CMAE-Envelope: MS4xfEbwNc4eoioVAmhPkba/yg+tK2j4TyoyrCRN1MdXWETT9t4PiAtZpI7X1mHZaZnwm7x/4vhdQieXQAm1s6dnH3RDRNPo1+/xeL5JkQsYuWijEqDUcu5p
 up6hRKayJpGgss/O8W9Hpp10vmtx1JXvH9WfR8yqZJuYb/6YWwyBnC4My8IHGTdSDansLLiljm1j72VDHfsPQMsWM6teJ0jFgWw4dZGnQv8P/AZ6q/RUsbKO
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/10/2022 19:10, Guenter Roeck wrote:
> On Sun, Oct 02, 2022 at 06:43:00PM +0100, Ahmad Khalifa wrote:
>> Add in the parameter to ignore ACPI resource conflicts so that modprobe
>> can use the force_id parameter when ACPI has the same address mapped.
> force_id and ignore_resource_conflict are orthogonal / unrelated to each
> other. Why create a dependency or correlation where none exists ?
> 
> The reason for introducing ignore_resource_conflict in the driver was that
> some systems didn't like the system wide parameter (acpi_enforce_resources)
> to ignore resource conflicts and failed to boot if it was set to lax
> or disabled.

They're unrelated in their purpose, but adding ignore_resource_conflict 
creates an unusual situation that doesn't make it safe to use on its 
own. Because the driver registers two platform devices, the second one 
will start probing a random base address (0xFFF8).

It's not random though, because 0xFFFF & ~7 gets you there. But frankly, 
I don't know what normally lives there, so my initial opinion was that 
both changes should be a single commit to stop it87_find() from 
confirming that a device exists.

Just to be clear, currently, without the ignore_resource_conflict param, 
the driver just unregisters itself after the first of the 2 registers 
gives the ACPI conflict. So the issue of the second non-existant device, 
is not an issue.

Could separate the two patches completely, but ideally they're still 
together. What are your thoughts here?

> The third parameter is the access permission. It should be 0 or maybe 0000.
> Why "false" ?

My mistake, out of tree convention. Missed that the param right above it 
uses a 0 convention.

>> +	if (err){
> Formatting: Space between ) and { required.

Will fix in v3.


-- 
Regards,
Ahmad
