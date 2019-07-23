Return-Path: <SRS0=cQ/s=VU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0722DC76186
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 16:23:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC06820838
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 16:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4OnWCys"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbfGWQX5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jul 2019 12:23:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39311 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732258AbfGWQX5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jul 2019 12:23:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so20838931pls.6
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2019 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vjiZzqNIXEGeiOzsa2NSVvdqYK7bc9DMVcyhQfzT2og=;
        b=m4OnWCysRqSyNU3QiVnUqTfA3KrdNrS/G0+cm8KFV/89GTaut70za8yMyE0V9gQInr
         Gg1YvlOcfVs4/b8z3yG+GdHlbqqifM4kYdUfGH6h2P/j+nFDdSFF2ZFpE34k7pPi5R2f
         XvLZoKRtm1PIsSnNxMYK8qWUOIE1KUCASZng4ZYVJd4tlvAIoTVer82lEs+McAXQr3sp
         N1i9BwXeovRJaGFGI6CSov4BUgz26VPNjLs6Yf+g7wwCWry8Q1YnStEE+VXlWXBHR21W
         O7MHXVKdcp8PW6jc5iM6ZVQnyAIfzidVWz25wDPumHghPWuF6CEUsF63uY6T3gdGT45H
         h3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=vjiZzqNIXEGeiOzsa2NSVvdqYK7bc9DMVcyhQfzT2og=;
        b=lJpNLSvnx0E6g0yWthtJLskYM3+7A1h/1gpjnOEy8LMsqEE3O6XxCXNaM1N5yXPmKD
         DrcF3q88OUvflXjC5A/WSrZe3TC6SULEYrOOQUaB4Re86msTVWZ+alSLXWTtvmcxs0Kz
         vhR+xx4c+PCMDfnPQyJLeLell7qY8KPKLZzGLAOuwh6Vct017Z5G2ARTVBP4x3XGJmhv
         ci7tzAOVbDfyjN4Tq8iZdOrn/rTTc5FqOfJeHVqvs3p9GqE6GeZytYsGQ6vXrZ8ojeY/
         +PokobngSGsOkVl8q1wZO+9JX587K4HqvITHhQORSobybLDN5NRa6kWoMj52QB3NfI1W
         2Fxw==
X-Gm-Message-State: APjAAAWjnmQfkjokZftqYRo2PtlECxyPj9sMRnJdQNTMT4A5rhhg5PkL
        +JyOwTx37xJBFCKb3/7wiOpGZGs4
X-Google-Smtp-Source: APXvYqzj8uZQMB7k5Scq1+/OHwC5S9WxOonfE21zK7IUBCdmgZmoTsAFqUNeDDE7/Pwr9bh0wC1I9A==
X-Received: by 2002:a17:902:a612:: with SMTP id u18mr79015620plq.181.1563899036675;
        Tue, 23 Jul 2019 09:23:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a3sm37057638pfc.70.2019.07.23.09.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 09:23:55 -0700 (PDT)
Date:   Tue, 23 Jul 2019 09:23:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
Message-ID: <20190723162354.GA16388@roeck-us.net>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
 <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
 <ABE6F128-F3AC-42F3-A970-BAF90A7A4727@posteo.de>
 <1940BFD4-9943-4E7F-B78A-8A15AA868C57@posteo.de>
 <20190719193752.GA17575@roeck-us.net>
 <4E88FC5F-6A72-49B9-A168-9D4B0BB56BB2@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4E88FC5F-6A72-49B9-A168-9D4B0BB56BB2@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 23, 2019 at 06:06:46PM +0200, Björn Gerhart wrote:
> Thanks for the review Guenter, I checked your proposals. Here comes an update of the patch, and I hope this time the format fits as it should.
> 
> Changes:
> - simplified differences in register addresses
> - although kept NCT6116_REG_TEMP_SOURCE, because otherwise the module
>   throughs „Invalid temperature source“ messages on loading for each
>   register not available
> - fixed fan enablements
> - simplified case statement (fall through)
> 
> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>

This version looks good. Applied to hwmon-next.

Thanks!

Guenter
