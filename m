Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EF8C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 20:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiJCUaS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 16:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJCU3x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 16:29:53 -0400
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net (p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE64DF5E
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 13:29:44 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id fS3PowskN3gBFfS3PomNaN; Mon, 03 Oct 2022 13:28:43 -0700
X-CMAE-Analysis: v=2.4 cv=Yeh4Wydf c=1 sm=1 tr=0 ts=633b45fb
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10
 a=sCYMkZJ_nKMA:10 a=Y4u6WrIR8EBYffvzX2kA:9 a=QEXdDO2ut3YA:10
 a=ZXOyfd87I8AR-G90gsrY:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=46508 helo=[192.168.1.118])
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofS3P-002LxI-02; Mon, 03 Oct 2022 13:28:43 -0700
Message-ID: <74c19038-6170-03d5-2578-f208c70b5448@khalifa.ws>
Date:   Mon, 3 Oct 2022 21:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] it87: check device is valid before using force_id
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20221002174259.14609-1-ahmad@khalifa.ws>
 <20221002174259.14609-3-ahmad@khalifa.ws>
 <20221003180157.GB1023056@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20221003180157.GB1023056@roeck-us.net>
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
X-CMAE-Envelope: MS4xfAnLIHyao0HtaEb3F8NeZZcr0uTdo5cPJww7TmPeppm7xjLZlkLLWBNfFHw/JX4+HhePAV6XN3m8lS4W4S8XWcMzhvp7mgYd14Dl/UUYhvKCU9mDJ9qb
 RXSGDxIaRG5E3FlJcZE5cc6Rnn/8dSHAI9uXJ6nwz07M0hAazJKqGQON4hw3XJ+AaMFo46Nq7tixxGolkIFETOV0GHiznu750mRXWuP+BEEuigAIVJfaLTPU
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/10/2022 19:01, Guenter Roeck wrote:
> On Sun, Oct 02, 2022 at 06:43:02PM +0100, Ahmad Khalifa wrote:
>> Check if there is a valid device before using force_id parameter value
>> in order to avoid registering two devices.
> For the subject, please use "hwmon: (it87) ..."
> in the future.

Will do with v3 of the patch.

>> +	/* check first so force_id doesn't register a second empty device */
> 
> The reasoning is wrong: the ID is checked to avoid registering a
> non-existing or a completely incompatible device. It doesn't matter
> if the skipped device is the first or the second device.

Non-existing is more accurate than empty, I can change to that in v3
The physical device doesn't exist, but the platform device is registered 
with no attributes.


-- 
Regards,
Ahmad
