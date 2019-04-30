Return-Path: <SRS0=kUOG=TA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1488C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B5842075E
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwAraLRp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfD3Q6i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Apr 2019 12:58:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36696 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfD3Q6i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 12:58:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id 85so7125572pgc.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2019 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EhazD1ALEjdmt8Akep7caLGwCkVt40vY7TmZX7/IFkE=;
        b=WwAraLRpPVOFKF0twWfdKDmitfJ5BU5B6DT0C7cHvNbTFl710D18swumtcE2gNvvIs
         2GcAl0FykwoGhxzaBhRicClo91+zss4buLKBTXtGg0sadW3plqAcEeVZ6d9abHDstHMb
         Nq5L1n2iFvNa9NVOFdO6p5qUvS5+C0p4rUW1kkV545Ez3HqSfV/VIiCU1SS7xvaFOn8O
         2DuXpGS4uXJE/ivv0gP3f3Y8k92Vwc1K2k7CzESCZGt/tbYKmUG4QPwG3eRGxhMiYIzt
         6NPENnk+Ut/8ejecm52NG2glhv3ZXYnYuvPNhGbIFpbFBKb1qwX2squKphDt08gbA5Rl
         2mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EhazD1ALEjdmt8Akep7caLGwCkVt40vY7TmZX7/IFkE=;
        b=c8obaK+VyG5PYdD9Ymtp1ZW4r6mvtnEyHYO28IpMKvCmdisDwKh8htUngrIwl5SUNQ
         sohDSa/VWz3FfxG7+LyRJcJwhGSzGnLZjgfGHaZhSQqhQ1ZkCw0BA5JGzqvyXMN4ibtQ
         zvCNX4HOSgBDxRxKvoo0QSdh+mXxsNIylcX8pf72WiHcFnhehFYeOGWdSPwOtlzVteGO
         HCK2VQe05hxAjrkXZ+COZXOOHfJWQYZOWZdCfqOqFW1Rh765OSsSG0xsP6lSMrov4csV
         iOmRXqD/x4DN9Hm87MEOcrCIdYtpILCTFWXcHqCnG3cUhhtzBT4iFV0b1qs3fBnPBtBi
         NCRw==
X-Gm-Message-State: APjAAAWJicRTfmOitxpVMI1gqEtTMD885jWsfogJDaBBMdYO6ezdSN+M
        u6DiwMXiLVm71IxwrcQJ51QGyHg2
X-Google-Smtp-Source: APXvYqzYSXVTadMqllbjlsoGEBFQijAcaILi0eGDAF72RYfG/bLBLOoUCKGj65xhb/YcFyY13+Zu+g==
X-Received: by 2002:a62:6490:: with SMTP id y138mr73149242pfb.230.1556643517573;
        Tue, 30 Apr 2019 09:58:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g24sm5075321pfi.126.2019.04.30.09.58.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 09:58:36 -0700 (PDT)
Date:   Tue, 30 Apr 2019 09:58:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add tmp75b to lm75.txt
Message-ID: <20190430165836.GA3186@roeck-us.net>
References: <20190430144609.19500-1-iker.perez@codethink.co.uk>
 <20190430144609.19500-3-iker.perez@codethink.co.uk>
 <20190430165719.GC2699@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430165719.GC2699@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 30, 2019 at 09:57:19AM -0700, Guenter Roeck wrote:
> On Tue, Apr 30, 2019 at 03:46:09PM +0100, Iker Perez wrote:
> > From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> > 
> There should be some description / rationale for the patch here.
> 
... and, if it is a separate patch because it touches devicetree
documentation, you should copy the DT maining list and DT maintainers.

> > Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> > ---
> >  Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> > index 12d8cf7cf592..586b5ed70be7 100644
> > --- a/Documentation/devicetree/bindings/hwmon/lm75.txt
> > +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> > @@ -25,6 +25,7 @@ Required properties:
> >  		"ti,tmp175",
> >  		"ti,tmp275",
> >  		"ti,tmp75",
> > +		"ti,tmp75b",
> >  		"ti,tmp75c",
> >  
> >  - reg: I2C bus address of the device
> > -- 
> > 2.11.0
> > 
