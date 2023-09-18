Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F62C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 17:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbjIRRDn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 13:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjIRRDZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 13:03:25 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A467E7F
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 10:02:57 -0700 (PDT)
Received: from [2a00:23c5:dcb3:cb33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qiHe9-007KGK-KL; Mon, 18 Sep 2023 17:02:53 +0000
Message-ID: <8443061b-7d50-4502-3e5c-cbbdb9eb42c8@khalifa.ws>
Date:   Mon, 18 Sep 2023 18:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-GB
To:     Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        'Guenter Roeck' <linux@roeck-us.net>
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <001501d9e9ac$656a1cc0$303e5640$@telus.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <001501d9e9ac$656a1cc0$303e5640$@telus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/09/2023 22:17, Doug Smythies wrote:
> With the kernel I compiled yesterday for the test patch, the file was not there.

That's the better approach, the file shouldn't exist.
Would you like to submit that patch then? I can test it and reply with a
"Tested-by" tag after. If not, happy to submit one.

-- 
Regards,
Ahmad
