Return-Path: <SRS0=mQrJ=RR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA86C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9916C2184C
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl26AnPS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfCNQXB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Mar 2019 12:23:01 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45628 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfCNQXB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Mar 2019 12:23:01 -0400
Received: by mail-pf1-f176.google.com with SMTP id v21so4161149pfm.12
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Mar 2019 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MjzAKyq8LO6U81CDxWzMLKGH0lrPNkLtmm+P3YnaNa0=;
        b=cl26AnPSTeluHb9DoVetATOyzYdoJxav+MdMMmKkRVQF4XUvOqYQim1anC4KpHDold
         tB1CtWqyHWQ/rIzaXJTu+S2dBnfcO0AhZHOkXS8lyJkFbHRF9Mk41Hn7GZtRdxeX3BEm
         kuKAF8GW7vuJIwMqx4GuNRuMUFcUEHpa6sXnWnqKSowFxbhu3JcpMpIb/LpYUFeageIk
         wj6765sXurx0Eo+5hgw/egnd1F7DVy50KEHL4V0W5wXO/vp9oLh6oUNeZVZIHVRZNBfT
         C7ORRagqVHOCDoiVGh6mGifAZyi1w6YKiESHDfVR2gm5AXbL9KbuIVvw7Pe5w96CTvZt
         p5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=MjzAKyq8LO6U81CDxWzMLKGH0lrPNkLtmm+P3YnaNa0=;
        b=VTzHd6WHAeLDbC9MpQVGD8dptZfIslM7Y1xLLUDdcGnhDvfyeJR6D3XSCpVXNJhXep
         vqKJS3TXyMiKoUnZIuyeRhc+0Bonpb3MA7OytxfcxecQxFVnB0/74sYv4nbDPy8+9O2+
         fV5dqGeMAYK3nVZxfSCLYu8omVf++ijKj4lSo26quWEb+2WmJsSO750lKXIgkUhF9Dm4
         GwuIBvEI2SeSHauhveSXc867VamsIOv72UWjrooqgg9CEn4V0bmUnarxDnhTDWtZa7m5
         oHq7CggxYxSEwI8698CcPladpYLxYHxDIG7RE8+1nQUmayTbHB+k+TMfaV3dHhsZdQ6N
         i4zg==
X-Gm-Message-State: APjAAAWZlHSf2n1BC3jijFVZWEzIzZTOt8jWZ9X/pd6ZexfYKUyRRUIH
        VyTqzPyHv/x503dQtlT3189Rdom+
X-Google-Smtp-Source: APXvYqwxwGzY0hLbnxYusR+D6lBMWuWO4CHh+bDPzHhaCLyjJEtBPcYScNriFEIRW+KGHj6DNAr2EQ==
X-Received: by 2002:aa7:8019:: with SMTP id j25mr50038357pfi.82.1552580580169;
        Thu, 14 Mar 2019 09:23:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k12sm20531716pfk.109.2019.03.14.09.22.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 09:22:58 -0700 (PDT)
Date:   Thu, 14 Mar 2019 09:22:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190314162256.GA21090@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25260e7b0f3d43588253791046440a64@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> Hello Guenter,
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> > Gesendet: Donnerstag, 14. März 2019 04:19
> > An: Grönke, Christian <C.Groenke@infodas.de>
> > Cc: linux-hwmon@vger.kernel.org
> > Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> > values (LINEAR11 vs LINEAR16)
> > 
> > Hi Christian,
> > 
> > On Wed, Mar 13, 2019 at 05:35:38PM +0000, Grönke, Christian wrote:
> > [ ... ]
> > > >
> > > > Our last e-mails overlapped; can you explore what it would take to
> > > > add support for ieee754 half precision floating point ?  We would
> > > > need a new set of conversion functions in the core (ie
> > > > pmbus_reg2data_ieee754 and pmbus_data2reg_ieee754), and your driver
> > > > would have to implement the
> > > > linear11 <-> ieee754 conversion. That may be a bit more work, but it
> > > > would also be cleaner, and it should not affect precision.
> > >
> > > I give it a look tomorrow. If this presents a proper and clean way, to
> > > avoid adding the hack in the generic code it might be worth it.
> > >
> > 
> > Please use the attached patch as starting point. Obviously I could not
> > do much testing, but unit testing returned reasonable results. Note that
> > we don't have to follow the pmbus spec to the letter - it is sufficient
> > to declare the VOUT values to be in ieee754 format for your driver.
> 
> Thanks a lot for the patch. It did indeed help.
> 
> The framework code seemed to work fine. I used your code for the conversion:
>     linear11 -> 'scaled integer' -> ieee754
> It provided a way to test the code and was easy for me as my tries to do
> some other bit magic weren't successful. That means I partly tested the code
> from pmbus_data2reg_ieee754 as my read_word function uses this for the
> conversion. Of course not the module local function...
> 
> I have question wrt to the code:
> [...]
> > +static u16 pmbus_data2reg_ieee754(struct pmbus_data *data,
> > +				  struct pmbus_sensor *sensor, long val) {
> [...]
> > +
> > +	/* Ensure that resulting number is within range */
> > +	if (mantissa > 0x7ff)
> > +		mantissa = 0x7ff;
> > +	else if (mantissa < 0x400)
> > +		mantissa = 0x400;
> 
> Setting the mantissa to 0x400...
> 
> > +	/* Convert to sign, 5 bit exponent, 10 bit mantissa */
> > +	return sign | (mantissa & 0x3ff) | ((exponent << 10) & 0x7c00); }
> 
> ... would mean it is cut to 0 here. I am not sure this is the intention.
> I guess it should be 0x3FF then. Or in case it is supposed to be 0, then
> 'mantissa = 0;' would be easier to understand.
> 

It is supposed to end up being 0 at the end. The valid range is
0x400..0x7ff, where bit 10 represents the '1' in the normalized number.
Bit 10 has to be removed when applying the value to the final ieee754
representation. I thought that was easier to understand than setting
the values to 0x3ff and 0x0 (which would look even more confusing
to the casual reader). I think I'll add a comment at the top
explaining the logic.

Thanks,
Guenter
