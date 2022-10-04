Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DD5C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Oct 2022 16:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiJDQ0b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 12:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiJDQ0K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 12:26:10 -0400
Received: from p3nlsmtpcp01-01.prod.phx3.secureserver.net (p3nlsmtpcp01-01.prod.phx3.secureserver.net [184.168.200.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51F11EC4F
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Oct 2022 09:26:02 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id fkj6ojxUFYH5ofkj6oAWgL; Tue, 04 Oct 2022 09:25:00 -0700
X-CMAE-Analysis: v=2.4 cv=aOc1FZxm c=1 sm=1 tr=0 ts=633c5e5d
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=7YVYimkLkubkvvIPbcMA:9 a=QEXdDO2ut3YA:10
 a=ZXOyfd87I8AR-G90gsrY:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=46176 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofkj6-00B8YR-D0; Tue, 04 Oct 2022 09:25:00 -0700
Message-ID: <eeacbfb8-1e28-072d-2428-931e3270ddb8@khalifa.ws>
Date:   Tue, 4 Oct 2022 17:24:58 +0100
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
 <b493e629-c6a5-e705-6574-060550f5c977@khalifa.ws>
 <3d2815ae-00f5-5333-9ce0-8f6d5f1e5887@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <3d2815ae-00f5-5333-9ce0-8f6d5f1e5887@roeck-us.net>
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
X-CMAE-Envelope: MS4xfGxdawDqQx78Z/D5yQCQYQP/BVEU8vhzb4jjCnBV1Jy2/FhNd6WnfaHeaoc0B/tJLyBoFA1ds6/+tvtgu94Q2ROFr6gfD4MWiNu6jokVwbdGkdxzKO1R
 6GM9T4VnV5V7GbMc8tj/9+ez0AYugHfsmd+vlSFqrn8MlOT4VV33aghCL0GF32da3VO8ZGyuwn8CUhjA7dzpa8oAknRHz3uRr6VQwUf8gqvz0UcCNDRCFkfu
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/10/2022 21:50, Guenter Roeck wrote:
> On 10/3/22 13:30, Ahmad Khalifa wrote:
>> On 03/10/2022 19:10, Guenter Roeck wrote:
>>> On Sun, Oct 02, 2022 at 06:43:00PM +0100, Ahmad Khalifa wrote:
> They are unrelated, period. You only consider systems where a resource
> conflict exists. Also, you could (try to) use acpi_enforce_resources=lax
> instead.
> 
> Everything else is just a coincidence that applies to _your_ system.
> 
[...]
> That isn't the point here. The problem is not with the patches, it is with
> the rationale for the patches.
> 
Fair point.

The force_id change is warranted on its own, even without the 
ignore_resource_conflict because:
  - Chipsets will reply with all 1s if no LPC peripheral is connected
    Useful for lots of systems with a single device
  - IT87 will reply with all 1s if you don't enter config space correctly
    Useful for those who override with a known id, but the device is
    quite different
  - The driver supports 2 sio devices, but the use of force_id is
    mostly a single-device use case. It doesn't support forcing two
    different devices, so it's safe to assume a non-existent device
    is not expected for those users.

My systems run mostly tainted Kernels and I can even grab the temps with 
a shell script, so I'm not worried about my systems, but they're the
only ones I can test with :)

The kernel parameter is an option that works, but it's a bit more
technical for general users to update their bootloader and change
modprobe config at the same time. This whole patch is about making
the it87 more usable with less compile/install work.


I can prep v3 with both changes if that's still a good approach.


-- 
Regards,
Ahmad
