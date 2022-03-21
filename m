Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58069C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Mar 2022 00:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343865AbiCUASz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Mar 2022 20:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243388AbiCUASx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Mar 2022 20:18:53 -0400
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.148.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1CF81646
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Mar 2022 17:17:29 -0700 (PDT)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id DE76413AB0
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Mar 2022 19:17:28 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id W5jknFJUedx86W5jkn3EeV; Sun, 20 Mar 2022 19:17:28 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ecO3yvU1sN9BhHnDS+OAnk2gdWyz05j+mGunBoVxdsw=; b=kC7pxC+BHUygbCM6s0B4FdDa7t
        exmZuZIxlRbH7isY4UI/kaWTiOB4E9r5eU+OecS7lZsHFazZ+mChDqZhpaAyzFAIQ3O+GSuqD3KWU
        al8na3h3EQPI3cXaFHhGLuqxA8VGNCMPQbbuioHSgtAltTUPvpvtWQXO6wdwws6X2r92q/qmL5P4k
        /VnXWnuMTrsCf2+a6pcZDi9FfonAqFJlse44eMw3JrfzgHSn9ejtYOOkmokMB6DP3KqUfXQPWc7eh
        teTlHJ8Ek0up3yavxbcthCM0pObdscdI7j92KewltzYpU1D/KbNZ3uGsvCeOE7eB//mCUbRHVyweR
        Nxf7j/FA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54386)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nW5jk-003Wxe-Gm; Mon, 21 Mar 2022 00:17:28 +0000
Message-ID: <6b25c446-6df3-c90c-7e22-b6af9758ee89@roeck-us.net>
Date:   Sun, 20 Mar 2022 17:17:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] hwmon updates for v5.18
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220320231317.2171300-1-linux@roeck-us.net>
In-Reply-To: <20220320231317.2171300-1-linux@roeck-us.net>
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
X-Exim-ID: 1nW5jk-003Wxe-Gm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54386
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/20/22 16:13, Guenter Roeck wrote:
> Hi Linus,
> 
> Please pull hwmon updates for Linux v5.18 from signed tag:
> 
>      git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.18
> 

I forgot to mention:

there will be a conflict against spi-next. from Stephen Rothwell:

 > Today's linux-next merge of the spi tree got a conflict in:
 >
 >   drivers/hwmon/adt7310.c
 >
 > between commits:
 >
 >   9c950b125f78 ("hwmon: (adt7x10) Remove empty driver removal callback")
 >
 > from the hwmon-staging tree and commit:
 >
 >  a0386bba7093 ("spi: make remove callback a void function")
 >
 > from the spi tree.
 >
 > I fixed it up (I just used the former version) and can carry the fix as
 > necessary. This is now fixed as far as linux-next is concerned, but any
 > non trivial conflicts should be mentioned to your upstream maintainer
 > when your tree is submitted for merging.  You may also want to consider
 > cooperating with the maintainer of the conflicting tree to minimise any
 > particularly complex conflicts.

Guenter
