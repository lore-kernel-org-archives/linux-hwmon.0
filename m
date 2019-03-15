Return-Path: <SRS0=+5Hs=RS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9909FC43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 19:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52FAA21871
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 19:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmYHfIcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfCOTjD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Mar 2019 15:39:03 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:41397 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfCOTjC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Mar 2019 15:39:02 -0400
Received: by mail-pf1-f172.google.com with SMTP id d25so7018385pfn.8
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2019 12:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C+dFsfiidiFKa5mrnyJY1Pbs81KEls+Q8rWDGnpX7k8=;
        b=YmYHfIcPSki5smlRVsymc4YOZ5Pd+30xY/Pud5qPuaFpFSpwSro0JFYYjyKs+aQvjg
         FDUKFe0w2mByEzCGnBJZ4BL+gAk8If109Uv2hrt0LUBhgzb65rZpWYPQ+m1O1vHe4DxT
         V6RSsrQLGRdxRvA3PK0CKgQBYH2L2iW6/GtEPWNTTAEaLAHedEnAlsdjk0jEiiv2Qu63
         UB2p+uGGUn8wDtNRQ7qZKpM+qWjUZFJE++cJRuKyP1xpJnpmQwjPa6ABct9JOcxFKBCQ
         sabKXC63SNfE5BveQ+/oAbwN3VQPMVduxE9bvEGmqsQwnhjh9TJ2KkWPrSpsh3kMIGAF
         oodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=C+dFsfiidiFKa5mrnyJY1Pbs81KEls+Q8rWDGnpX7k8=;
        b=choVNPjlNsDaRO9hccOp6XoUAdLIORIL4ST3y5zvf8LTo0C4DA/vyNDbkIyg5MwD/7
         75lZV3Jpejz6RUNw63oQ07edtJ0sOGUfJal4wpy8lwA95sWTNduJhruYZGnDfafZ71Ro
         etH+SVrIbr42rvsbmDcEMOAW2lG1l7HXtAOLx4Eij21MEeobol36RTtA8etI13k2pxPy
         0W6uOiwB/WEwc4lfUbzkGJ5UTIsZpWdOmxYyfg8i3pTzg8Ldc/tebbrkB7RQOeqIX1xK
         FZWOR6EpftrODmQtdg9vzVLteEFd2fo+HZwPJwjjwpy2w8Dkv1s4peyNVfFQcpcBPxiu
         AGOw==
X-Gm-Message-State: APjAAAW05XXFBNJCMwEZon/aIP15oFW8J0DApBtUtNIgfhBjN6dpsXu4
        XedeWHyb7+AvJp3W2IrhXBlf5zPr
X-Google-Smtp-Source: APXvYqxo/V9h85GSKBvsycVt2eJlKQohIgKWpQaDZsI2MZ/zqlBkq9NpAuQtsiyMQJ3Btr1iRP1zcQ==
X-Received: by 2002:a17:902:f302:: with SMTP id gb2mr6100543plb.51.1552678741491;
        Fri, 15 Mar 2019 12:39:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v186sm4836845pfv.184.2019.03.15.12.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 12:39:00 -0700 (PDT)
Date:   Fri, 15 Mar 2019 12:38:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190315193859.GA10792@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
 <20190314165308.GA14159@roeck-us.net>
 <c1b60322acda43caa9e334841a83778a@infodas.de>
 <20190315182945.GB4313@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190315182945.GB4313@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 15, 2019 at 11:29:45AM -0700, Guenter Roeck wrote:
> On Fri, Mar 15, 2019 at 10:19:33AM +0000, Grönke, Christian wrote:
> > Hello Guenter,
> > 
> > > -----Ursprüngliche Nachricht-----
> > > Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> > > Gesendet: Donnerstag, 14. März 2019 17:53
> > > An: Grönke, Christian <C.Groenke@infodas.de>
> > > Cc: linux-hwmon@vger.kernel.org
> > > Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> > > values (LINEAR11 vs LINEAR16)
> > > 
> > > Hi Christian,
> > > On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> > > >
> > > > The framework code seemed to work fine. I used your code for the
> > > conversion:
> > > >     linear11 -> 'scaled integer' -> ieee754 It provided a way to test
> > > > the code and was easy for me as my tries to do some other bit magic
> > > > weren't successful. That means I partly tested the code from
> > > > pmbus_data2reg_ieee754 as my read_word function uses this for the
> > > > conversion. Of course not the module local function...
> > > >
> > > 
> > > Wondering ... I would have thought that it should be possible to
> > > implement a simplified linear11 <--> ieee754 conversion, without
> > > converting to a scaled integer first. Have you tried that ?
> > 
> > There might be a more efficient and elegant way. I toyed around with
> > the conversion for a moment but didn't figure out a working way 
> > quickly.
> 
> This should work.
> 
> u16 lin2ieee(u16 lin11)
> {
> 	s16 mantissa = ((s16)((lin11 & 0x7ff) << 5)) >> 5;
> 	int exponent = (((s16)lin11) >> 11) + 25;
> 	u16 sign = 0;
> 
> 	/* simple case */
> 	if (mantissa == 0)
> 		return 0;
> 
> 	if (mantissa < 0) {
> 		sign = 0x8000;
> 		mantissa = -mantissa;
> 	}
> 
> 	while (mantissa < 0x400 && exponent > 1) {
> 		mantissa <<= 1;
> 		exponent--;
> 	}
> 
> 	/* boundary checks */
> 	if (exponent > 30)
> 		return sign | 0x7bff;
> 	if (mantissa < 0x400)
> 		return sign | 0x0400;
> 
> 	return sign | (exponent << 10) | (mantissa & 0x3ff);
> }
> 
Plus, just in case, the other direction.

u16 ieee2lin(u16 ieee)
{
	s16 mantissa = (ieee & 0x3ff) + 0x400;
	int exponent = ((ieee >> 10) & 0x1f) - 25; 
	int sign = ieee & 0x8000;

	/* simple case */
	if (ieee == sign)
		return 0;

	/* map into lin11 number space */
	mantissa >>= 1;
	exponent++;

	while (mantissa && exponent < -15) {
		exponent++;
		mantissa >>= 1;
	}

	/* boundary checks */
	if (exponent < -15)	/* number too small */
		return 0;

	if (sign)
		mantissa = -mantissa;

	return (exponent << 11) | (mantissa & 0x7ff);
}

Guenter
