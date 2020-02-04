Return-Path: <SRS0=BD+L=3Y=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76C5C3524A
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Feb 2020 08:06:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4CD12087E
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Feb 2020 08:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaE+b8dV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgBDIG5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Feb 2020 03:06:57 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39506 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgBDIG5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Feb 2020 03:06:57 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so2288450wme.4
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Feb 2020 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RTEOWP+xe8TUPuYEAOrJ9gQCtbYNgXT2+1bMgsB1ISA=;
        b=UaE+b8dV0NZYV994SfQTg2EGqtQACVtCB7OhWTVdbkgUjNwxy8lCsf8Tg1HUcJ1CVB
         urkCm1xbbjndloHsuCegoR006jGZJp79K/PK6MNLT1b2+kxJ2jozX8W5KWY/GFlwUmH/
         XntdXcK/lBI3MHVf0T3GRKMWzoaXMN4fOVXoOpck7cxxOkKCt/b3BPhsbVGgGG6B96dJ
         oZu91igNIPkclOtTtib2m9WT30rNKR9JBb0xhdy/RyB9dz0EDvFCg2TXq4aVuj9vjLLi
         uLgn4dLl89ktFFUpaJMp/N1cjLoSCBKCCDvFo0XkEvnglzbFDDQEDYtJhYHnwvFStw8r
         rTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RTEOWP+xe8TUPuYEAOrJ9gQCtbYNgXT2+1bMgsB1ISA=;
        b=laxseJBLgrIDIZcKmW4pg56/tPnnd6lPySHTSDKaqOTQ5JC4R0SkUWBBEb6m4WpPPB
         1XXNRm52T6qNDNBaWbOQEUQ8ShpwPVTJyJL5Op7giCARU4tCer4WDaqePQSUtrHxolGI
         1rdhfFeXOn5G+jmAdfnpWO6w5+ddbOl37V1ImjDRKfjC2bvq+7m5AlO88XxPKzVL+MdC
         lbOGI/W78ILyH5mBY8Gvbx2mQ4vR4YZpTBTqu4GW1Jeu7Hjp9sJuYbEMJCwuShrO85nI
         OB+mZz0pCpxCcXT/hVSF3tlde5pZqGc/SZeDDXI7NVQnKppBtj1s3I2VVao2iHk78l/i
         AcYw==
X-Gm-Message-State: APjAAAVTeb0v774pqkYsZmNQVc6JHkNBD8JmaKg+6NiQY/4JHid3o0A9
        CQnwZURj2HC4VPS2nulTA6U=
X-Google-Smtp-Source: APXvYqyxPrK5npeEOZYRRRW5pxGyqbIu5GZlOtz1sD6xVKL94KtgYClwytb/9srmmJfXWefkffz9mw==
X-Received: by 2002:a05:600c:149:: with SMTP id w9mr3956690wmm.132.1580803613675;
        Tue, 04 Feb 2020 00:06:53 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id v17sm28546566wrt.91.2020.02.04.00.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 00:06:53 -0800 (PST)
Date:   Tue, 4 Feb 2020 09:06:52 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Haochen Tong <i@hexchain.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCH v2 0/2] dell-smm-hwmon: Add XPS 13 9360 to supported
 devices list
Message-ID: <20200204080652.awdiu7qbkzu3kvpj@pali>
References: <20200202233151.1840067-1-i@hexchain.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200202233151.1840067-1-i@hexchain.org>
User-Agent: NeoMutt/20180716
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Monday 03 February 2020 00:31:49 Haochen Tong wrote:
> This patch adds Dell XPS 13 9360 to supported devices list in
> dell-smm-hwmon.
> 
> I have tested this on one such device and verified that the fan speed is
> correctly reported, and can be controlled through pwm1{,_enable}.
> 
> Haochen Tong (2):
>   dell-smm-hwmon: add XPS 13 9360 to supported devices list
>   dell-smm-hwmon: add XPS 13 9360 to fan control whitelist
> 
>  drivers/hwmon/dell-smm-hwmon.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> 
> base-commit: 46d6b7becb1d5a8e697db786590c19e4067a975a

Hello, both patches now look good, you can add my:

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
