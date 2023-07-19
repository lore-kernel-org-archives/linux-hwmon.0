Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14A3C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 19:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjGSTlj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjGSTli (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 15:41:38 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCBF11C
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:41:36 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qMD3G-003DY2-AN; Wed, 19 Jul 2023 19:41:34 +0000
Message-ID: <738f50ee-c463-bdce-026c-bf97ae34108b@khalifa.ws>
Date:   Wed, 19 Jul 2023 20:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230718182912.1746384-1-ahmad@khalifa.ws>
 <ed576af2-8fb8-415b-87db-a30b025096e3@roeck-us.net>
Content-Language: en-GB
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <ed576af2-8fb8-415b-87db-a30b025096e3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 19/07/2023 03:49, Guenter Roeck wrote:
> On Tue, Jul 18, 2023 at 07:29:12PM +0100, Ahmad Khalifa wrote:
>>      * Add separate scaling_in and pass it through data as they were
>>        missing in v1 and the factors differ with other chips
> The scaling change is really a bug fix; it should be a separate patch
> marked as Fixes:. It also affects NCT6798D.

Missed checking 6798 voltage, thought it was only temps missing.
But now that I checked, I can see the 17th voltage and it's the
same as 6799.

Not sure if to add that with the 6799 or leave it safely with 15
as it is. Adding it alone, too risky, I can't test that.


-- 
Regards,
Ahmad Khalifa
