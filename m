Return-Path: <SRS0=dNLM=RT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA759C43381
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Mar 2019 15:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D92220693
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Mar 2019 15:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqzK7+Sm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfCPP1W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Mar 2019 11:27:22 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:39436 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfCPP1V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Mar 2019 11:27:21 -0400
Received: by mail-pg1-f178.google.com with SMTP id h8so8452848pgp.6
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Mar 2019 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4/AU7z8oCISJCriL97mXhuNiH2NpgUrU8HjpYjYaPR4=;
        b=GqzK7+SmS2S6b9iWnJWW6F1vMCJfZ56w8+7XOYCU1DyL1Umf3XrvN4at9waZ5jw94n
         TU6ZQ4f9A/agjaiHXqHjcDWOrgppq09PHTiJ3g6XK6YrNrXl/bTN4cGzMVAY1rMrLRpE
         LaiFjJpGYBcNy5kJNgb3UMy5Vnpsstt1DcdrpWbwliJBt0eLFBTXwpDuqVzdizYewxIZ
         FfhD0kSFTXMZQKuVfgGE1g01rLPqvlBmKsRmC6GLPyeAoAnDIOqiiO19Vo/msoCkXQGZ
         OikxpsJgOp2CKS8wZNzWRi+cbPfGCQkedATXKUu8RugIPuAn/JCGTlo38pZDcfFBqyt3
         T2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=4/AU7z8oCISJCriL97mXhuNiH2NpgUrU8HjpYjYaPR4=;
        b=NMriK5b0KhELw7BXMJJ/a9Jt4dsWm5BZkthoja1hRfIhRqRk8PUdOvod7w8C4TMaho
         qLsF2xre7cXkpJKpLbk5yUGFaYl1wp3Sbbl0icei55cecI+hvVxX7QR44zuGB39ATLzM
         yrR82BNZQQsQKloaFNGWl8ryivS+yIL53/DnRavQl5McqLYK/JVzTHDTVPiE9P0pP6pu
         OKEkMvari31X3mgKDRdeQwXz9u0YSLG62tsa1RTDzzgPGE7PMfM171G8GW6E1iOFcl7T
         c9M4qSxzRP+uiyqrXjVUILlx6zRDOv620hPIqdlHVNl1TeWrLqzX4aDFTLIplpb/GXId
         p+uw==
X-Gm-Message-State: APjAAAXTi7EgyPIGgpbHB2vZD+q2KSuk2wEXfk/FPjXdUChnVVDqNG51
        Pg/RurIMXP1vW/8hmXWXDKxraLEj
X-Google-Smtp-Source: APXvYqzFNT9BM3lczr769zcjQ8on+FTzm1tMBhCMuCaW3XyhIJl0AyTQHIroaVGgnDTKC6NWmx6hxg==
X-Received: by 2002:a63:68c9:: with SMTP id d192mr9210807pgc.264.1552750040797;
        Sat, 16 Mar 2019 08:27:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6sm8601968pfn.63.2019.03.16.08.27.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Mar 2019 08:27:19 -0700 (PDT)
Date:   Sat, 16 Mar 2019 08:27:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190316152718.GA27218@roeck-us.net>
References: <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
 <20190314165308.GA14159@roeck-us.net>
 <c1b60322acda43caa9e334841a83778a@infodas.de>
 <20190315182945.GB4313@roeck-us.net>
 <20190315193859.GA10792@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190315193859.GA10792@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 15, 2019 at 12:38:59PM -0700, Guenter Roeck wrote:
> On Fri, Mar 15, 2019 at 11:29:45AM -0700, Guenter Roeck wrote:
> > On Fri, Mar 15, 2019 at 10:19:33AM +0000, Grönke, Christian wrote:
> > > Hello Guenter,
> > > 
> > > > -----Ursprüngliche Nachricht-----
> > > > Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> > > > Gesendet: Donnerstag, 14. März 2019 17:53
> > > > An: Grönke, Christian <C.Groenke@infodas.de>
> > > > Cc: linux-hwmon@vger.kernel.org
> > > > Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> > > > values (LINEAR11 vs LINEAR16)
> > > > 
> > > > Hi Christian,
> > > > On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> > > > >
> > > > > The framework code seemed to work fine. I used your code for the
> > > > conversion:
> > > > >     linear11 -> 'scaled integer' -> ieee754 It provided a way to test
> > > > > the code and was easy for me as my tries to do some other bit magic
> > > > > weren't successful. That means I partly tested the code from
> > > > > pmbus_data2reg_ieee754 as my read_word function uses this for the
> > > > > conversion. Of course not the module local function...
> > > > >
> > > > 
> > > > Wondering ... I would have thought that it should be possible to
> > > > implement a simplified linear11 <--> ieee754 conversion, without
> > > > converting to a scaled integer first. Have you tried that ?
> > > 
> > > There might be a more efficient and elegant way. I toyed around with
> > > the conversion for a moment but didn't figure out a working way 
> > > quickly.
> > 
> > This should work.
> > 

Somewhat optimized versions, with additional boundary checks, kernel types,
and one less while loop.

Guenter

---
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

u16 ieee2lin(u16 ieee)
{
	s16 mantissa = (ieee & 0x3ff) | 0x400;
	int exponent = ((ieee >> 10) & 0x1f); 
	u16 sign = ieee & 0x8000;
	int shift;

	/* 0 or too small */
	if (ieee == sign || exponent == 0)
		return 0;

	/* NaN */
	if (exponent == 0x1f)
		return sign ? 0xffff : 0xfbff;

	exponent -= 25;

	/* map into lin11 number space */
	mantissa >>= 1;
	exponent++;

	shift = -15 - exponent;
	if (shift > 0) {
		exponent = -15;
		mantissa >>= shift;
	}

	/* boundary checks */
	if (mantissa == 0)	/* number too small */
		return 0;

	if (sign)
		mantissa = -mantissa;

	return (exponent << 11) | (mantissa & 0x7ff);
}
