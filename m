Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6DDC2BA15
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 17:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjIPRp4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 13:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235952AbjIPRpn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 13:45:43 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34087E6
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 10:45:38 -0700 (PDT)
Received: from [2a00:23c5:dcb3:cb33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qhZML-007D3x-2v; Sat, 16 Sep 2023 17:45:33 +0000
Message-ID: <f8f05448-a4b2-d094-47a0-34bd3be7ae20@khalifa.ws>
Date:   Sat, 16 Sep 2023 18:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 16/09/2023 18:04, Guenter Roeck wrote:

> The proper fix should really be in nct6775_in_is_visible(),
> which should drop the attribute if there is no alarm bit for it,
> similar to, for example, nct6775_fan_is_visible().
> Something like
> 
>      int nr = index % 5;     /* attribute index */
> 
>      if (nr == 1 && data->ALARM_BITS[in] == -1)
>                  return 0;

Perfect, that's what I looked for but couldn't figure it out in
a rush. If it's confirmed, I'll convert the fix so it hides the
attribute instead.


-- 
Regards,
Ahmad
