Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A06C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjGOQoB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGOQoA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:44:00 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D001720
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:43:59 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKiNC-002vEJ-Au; Sat, 15 Jul 2023 16:43:58 +0000
Message-ID: <3e2862d4-c686-7a25-a898-32a1e3683b0e@khalifa.ws>
Date:   Sat, 15 Jul 2023 17:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (nct6775) Flip Caseopen alarm as 1 is OK
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20230715153234.1307325-1-ahmad@khalifa.ws>
 <d1307352-7b13-6064-25e2-b7504f55569e@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <d1307352-7b13-6064-25e2-b7504f55569e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 15/07/2023 17:33, Guenter Roeck wrote:
> On 7/15/23 08:32, Ahmad Khalifa wrote:
>> +    /* nc6796d-s datasheet states: CASEOPEN0_STS. CaseOpen Status.
>> +     * 1: Caseopen0 is detected and latched.
>> +     * 0: Caseopen0 is not latched.
>> +     * so we flip intrusion alarms, 1 is OK
>> +     */
> Ok, I am lost here. 1 means that case open is detected and latched. That
> is no different to all other chips of the series. Why would you want
> to return 0 (no alarm) in this case for nc6796d-s ?

I read it as 'latched' vs 'not latched', but if it's the same for all
of them, then I take this patch back.
My mistake.


-- 
Regards,
Ahmad Khalifa
