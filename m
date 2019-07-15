Return-Path: <SRS0=yb4f=VM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534CFC76191
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jul 2019 17:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BF50205ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jul 2019 17:48:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSDPUG5L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731735AbfGORsk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jul 2019 13:48:40 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35325 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbfGORsj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jul 2019 13:48:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id s1so1753961pgr.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2019 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ut+pWG4KnXSK61KwfPaHfke8B2wVgyzrvSHNkRnlmgQ=;
        b=pSDPUG5LPC1HatVicAvoN1RczBbeWAifC/s1tqxjchdysAdfaspnm0MxqxefxWTsuG
         OF9WEogukfBAF4ht/V5ie6nI9+ZQs5jLIKmDhWakrCmk24j2UULtlfPAfXOKtVGs+0cd
         IdmTLmpnfmBV4GKKcRYQ9YcFKRI+Pjmk1NzGO19GUH+K9JK3wojQ/eX7MI62GSUwwvbj
         9bzUBqn0x/Ex2OoH3VgASLQAbJODk3dN+YbM6SzzZ0kycSFRRcbl0H9HLCNRIFquU9JF
         mlt6PrlsbzJ4tT3qJ/SKQaeaoEsbgykYPpLXiB111hgVocbkEOsnEc4VMgsQejW6MQTO
         JWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ut+pWG4KnXSK61KwfPaHfke8B2wVgyzrvSHNkRnlmgQ=;
        b=RZFt+pbYjLX41X4UlQN+8sy8Ve6INj8COFiuRGzcfGiovkKlOl85dZPo678aLr0j9j
         pPiqGU66apkB5LUtcypBs16d/YyxZ1FyX3GuXTsx6/rOKoQMkPg1IemC3yxuopXlOqII
         QljYTqECbr0FGVJRbPv+KKIn6Ub0Wea00TuxL8tY6zq8J6Wg707HNLIP18ynYvQhAiPo
         WNmRuteMERxj47sVzi/WLaQ+KSDN2ecYJsjslAdjgwQfGgqLjexL20VSX+HM2RrlYQ05
         dcdwDce6nZU2tSvt/Uz8WYF+nUO0hUSkvOAVNlW+bjPrErIXzltc1r2KBqFNjt2Qt0lf
         JA1Q==
X-Gm-Message-State: APjAAAWJ5s4iF9MmdpQEWw5X58r/6hVafSd5wXozbYHTbrsexmzwl53b
        VaSxBn45MzAVLIJnzDzJioI=
X-Google-Smtp-Source: APXvYqwAk7cZfUFVn6zgs5Y7Z+CoIkJQSw0LKKyuEe58rF/fcp6wNHI1EeNm3V6C4HQ78X/0zXFZhA==
X-Received: by 2002:a65:4103:: with SMTP id w3mr16885481pgp.1.1563212919113;
        Mon, 15 Jul 2019 10:48:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d8sm13606293pgh.45.2019.07.15.10.48.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 10:48:38 -0700 (PDT)
Date:   Mon, 15 Jul 2019 10:48:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Fix register address and added missed
 tolerance for nct6106
Message-ID: <20190715174837.GB21635@roeck-us.net>
References: <C4783F82-7655-4997-AE0E-496683FE1C8B@posteo.de>
 <872AC4B8-6930-47CF-AE4B-32F449135507@posteo.de>
 <20190715174622.GA21635@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190715174622.GA21635@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 15, 2019 at 10:46:22AM -0700, Guenter Roeck wrote:
> On Mon, Jul 15, 2019 at 06:33:55PM +0200, Björn Gerhart wrote:
> > Hi Guenter,
> > 
> > the patch was created against kernel 5.1.15. Is the corresponding „baseline“ 5.1 then?
> > 
> The patch doesn't apply against v5.1.15 either. Do you have other
> local changes to the same file in your branch ?
> 
Never mind - I had to adjust path names, then it worked.

Guenter

> Thanks,
> Guenter
> 
> > - Fixed address of third NCT6106_REG_WEIGHT_DUTY_STEP
> > - added missed NCT6106_REG_TOLERANCE_H
> > 
> > Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
> > —
> > Index: nct6775.c
> > ===================================================================
> > --- nct6775.c	(revision 16326)
> > +++ nct6775.c	(working copy)
> > @@ -866,7 +866,7 @@
> >  static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
> >  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
> >  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
> > -static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x17c };
> > +static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
> >  static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
> >  static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
> >  
> > @@ -3778,6 +3778,7 @@
> >  		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
> >  		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
> >  		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
> > +		data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
> >  		data->REG_PWM[0] = NCT6106_REG_PWM;
> >  		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
> >  		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
> > 
> > 
> > 
