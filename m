Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AD1C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Mar 2022 16:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238359AbiC1Q3h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Mar 2022 12:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbiC1Q3f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Mar 2022 12:29:35 -0400
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.149.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7841560071
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Mar 2022 09:27:54 -0700 (PDT)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id D7F821B7FF
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Mar 2022 11:27:53 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YsDhn2N2X9AGSYsDhnpiOK; Mon, 28 Mar 2022 11:27:53 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wDN9VpzJLwYt/LpVw9pBXbbKy8BbkXAy+je0SIOYHx0=; b=Cax9ptlpBRhAzMgWEOh0rBPvcS
        K5tzDhyEcBrW4gRtr/2NbnIpSjaxRXAXaJpnKLOJpGMkTHEk6+1BjdSxohgyBmUgI4sauOtjOH/cN
        IsP8hmZwDXU8GuX8310rr3YFKG5wldlPEPdzlf9FUN8Ky8ZhBHUaUtIZrrdropCUUyFWHWb0CFxoZ
        ozzBDb0AQX4y2cF/z7uehKc4E9X6xl9KfnZUoN3uHki3ngK+QKfFofeiGdnWSfXHrgy4WrR4jWRUv
        3umBGMIYhqQcaIYpmcDfT9EbIJpSMR/noScFhWGvVy0EeW200Stlt6bqyoeSnWumwQpwWly6Dl2dq
        wEsSeJaw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54526)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nYsDh-001dPE-4p; Mon, 28 Mar 2022 16:27:53 +0000
Message-ID: <ab64105b-c48d-cdf2-598a-3e0a2e261b27@roeck-us.net>
Date:   Mon, 28 Mar 2022 09:27:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/2] hwmon: introduce hwmon_sanitize()
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>, Michael Walle <michael@walle.cc>
Cc:     Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Jean Delvare <jdelvare@suse.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20220328115226.3042322-1-michael@walle.cc>
 <YkGwjjUz+421O2E1@lunn.ch>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YkGwjjUz+421O2E1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nYsDh-001dPE-4p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54526
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/28/22 05:56, Andrew Lunn wrote:
>> I'm not sure how to handle this correctly, as this touches both the
>> network tree and the hwmon tree. Also, the GPY PHY temperature senors
>> driver would use it.
> 
> There are a few options:
> 
> 1) Get the hwmon_sanitize_name() merged into hwmon, ask for a stable
> branch, and get it merged into netdev net-next.
> 
> 2) Have the hwmon maintainers ACK the change and agree that it can be
> merged via netdev.
> 
> Probably the second option is easiest, and since it is not touching
> the core of hwmon, it is unlikely to cause merge conflicts.
> 

No, it isn't the easiest solution because it also modifies a hwmon
driver to use it.

Guenter
