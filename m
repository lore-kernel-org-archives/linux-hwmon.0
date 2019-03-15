Return-Path: <SRS0=+5Hs=RS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454A7C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 18:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BFDF218A1
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 18:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJZ2bEw7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfCOS3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Mar 2019 14:29:49 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:43916 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfCOS3t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Mar 2019 14:29:49 -0400
Received: by mail-pg1-f182.google.com with SMTP id l11so7017849pgq.10
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2019 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ysEhYMmwdjYv5T4glGn5JRum6IOvMyiLPAE2JFoGvxA=;
        b=HJZ2bEw7/IE+m5rKGO2w2pUliBYrCWEEdPTBEuRYWJAGU6RILFVEtnIe3El6daQ1lN
         3OSu5mXNyHo19G4QPsmXkt1KbZsZ5RzbKo13mmCofswKCovOKViAyD++uiaPXvL/oq/Q
         D+t44iwDPZ2HqDpiUwOOk9bGIpNWLzl9/mwUZYFYG+kXhAnV8nurcRrrLLzBAHgY3bin
         1FP1YDoVuxPzLfQPlicEVqvAehLELLRDZhNjN4QEeUPNaoohZm2jPLHJ4GKKhJXixBpF
         A/Fr/L/aCb7wCCGpUvJguIvJutdTlGel+Zmiz0sHodOEI4vmdSMdqZKhOHRJ1lAtbe+d
         8U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ysEhYMmwdjYv5T4glGn5JRum6IOvMyiLPAE2JFoGvxA=;
        b=b8FsJyrbx2865GOwrISbyb/MaHohpws2fhmoaVRBByxElwrdzTwnNt8JvafuoNXfBg
         jf/7Rn9MyrirrAdLg6Fgch0d1cfoKbF7aHh6QralPEEQXDl68oE7mgqVKNVA3JTS1pEl
         JaTS5UFFawokaliZCkadpmIRjufeSwY8B+4TfR1oeTMSP8cpMuf/WsZ6mYdGaJQ1UIFw
         ydUM4wTXzVS5k3hCssYr/UrqTFObsAoJQveEtxNilV+eNB3GH9KqhnF7v/FCypWM5JG+
         Sq1BoH8mfWsEHX+MMdvXWetTnjVFBpIUrPEgnFnST4yryMn/7KR2Ydck65aRI5X/i7L5
         6M1Q==
X-Gm-Message-State: APjAAAV/Ui5U2DM4IGe9jV8fonqt0JbHArwA8srWKOQpbMG6CHUVTWSV
        707QjcnbBR7K2klfAjE+Bhh/2SGV
X-Google-Smtp-Source: APXvYqxaHnDmK8zk+KdVG3FUudLZwTdwgeRCqKl7NvVJ2KrEae2MVE95EchgS+X5eLqBhz2fGfPhkQ==
X-Received: by 2002:a65:60cb:: with SMTP id r11mr4840753pgv.143.1552674588013;
        Fri, 15 Mar 2019 11:29:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6sm3413154pfm.94.2019.03.15.11.29.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 11:29:47 -0700 (PDT)
Date:   Fri, 15 Mar 2019 11:29:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190315182945.GB4313@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
 <20190314165308.GA14159@roeck-us.net>
 <c1b60322acda43caa9e334841a83778a@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1b60322acda43caa9e334841a83778a@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 15, 2019 at 10:19:33AM +0000, Grönke, Christian wrote:
> Hello Guenter,
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> > Gesendet: Donnerstag, 14. März 2019 17:53
> > An: Grönke, Christian <C.Groenke@infodas.de>
> > Cc: linux-hwmon@vger.kernel.org
> > Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> > values (LINEAR11 vs LINEAR16)
> > 
> > Hi Christian,
> > On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> > >
> > > The framework code seemed to work fine. I used your code for the
> > conversion:
> > >     linear11 -> 'scaled integer' -> ieee754 It provided a way to test
> > > the code and was easy for me as my tries to do some other bit magic
> > > weren't successful. That means I partly tested the code from
> > > pmbus_data2reg_ieee754 as my read_word function uses this for the
> > > conversion. Of course not the module local function...
> > >
> > 
> > Wondering ... I would have thought that it should be possible to
> > implement a simplified linear11 <--> ieee754 conversion, without
> > converting to a scaled integer first. Have you tried that ?
> 
> There might be a more efficient and elegant way. I toyed around with
> the conversion for a moment but didn't figure out a working way 
> quickly.

This should work.

u16 lin2ieee(u16 lin11)
{
	s16 mantissa = ((s16)((lin11 & 0x7ff) << 5)) >> 5;
	int exponent = (((s16)lin11) >> 11) + 25;
	u16 sign = 0;

	/* simple case */
	if (mantissa == 0)
		return 0;

	if (mantissa < 0) {
		sign = 0x8000;
		mantissa = -mantissa;
	}

	while (mantissa < 0x400 && exponent > 1) {
		mantissa <<= 1;
		exponent--;
	}

	/* boundary checks */
	if (exponent > 30)
		return sign | 0x7bff;
	if (mantissa < 0x400)
		return sign | 0x0400;

	return sign | (exponent << 10) | (mantissa & 0x3ff);
}

Guenter
