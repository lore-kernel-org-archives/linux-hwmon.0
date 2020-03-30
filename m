Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31625C43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 19:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08BDA20784
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 19:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kks9WPE4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgC3TtC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 15:49:02 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:41311 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgC3TtC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 15:49:02 -0400
Received: by mail-pf1-f178.google.com with SMTP id a24so2279926pfc.8
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2020 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JPu+IpOjU/Kx3yVEKv7N1F7UbMvGb5qI/xqXfNzcpzQ=;
        b=kks9WPE42ABmVyKSi2WG+bdoONqNwS5+kcaf+2+Evje1Vv+eMsP/7j+LkLi2dY5+ql
         bev/GxVOjDAseAErmKSyqmH32X0opxT0MhpPPl/hPBEWa4NlMlOP8Lko3G+f+luSEH6Y
         jUpIPmS77G1Jo6PZuZpxbDxNjSjajTJTq3dPtntFOz4ddQu7mlJSoLs1fhz15bCnRYE7
         xUkTDOLpJ3ffb3byDydo9V5YsnOUNF2M++PgVkvvE8y7B3vJZq5BKRaTZY1Uqb3qfvp8
         wpko0RY8dTC/drtqRLRUEYs7WhpnomfuSdFRM6dyan8v5geyYKvxf0wi5eRZSfUdrA31
         x/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=JPu+IpOjU/Kx3yVEKv7N1F7UbMvGb5qI/xqXfNzcpzQ=;
        b=E1y69qUes3C0AjnfhNDCRFcsf4MBdtKaLFsKrk35dVq6PgNLOD7gI4Zwc+H/yhjmgl
         nc5+rsTirmacenndw0LL0soFau93V5JTJdUYfu+DQ4HUwyTy+mfqxVndW+eitTaWaPl4
         ic5GgwZO6MRLWc8pO2No+Dq44vqH72QRsJu5bIemK7IUqrm//MsPndn93HswjOGJd7tz
         4SIa92tQoBWn1LCFesqbYSj2KzATpX+uIGTCQJ1x4y/XnpNQFYw9+HCQ9pgDMo2lUQf1
         K6rTkYL6CUxoWbVGwVxjIzZdxr4EYzMfvaJUBSnYfIcUWpIGKH6lUbDfV8R5MWHBvD88
         gEOA==
X-Gm-Message-State: ANhLgQ1Sy1VShMs5FpgmIbwjD4fQrScHl6d2GCrF72F7Em7L9wIpfuTn
        oltJfe+ovyju4AOccMlM0GQ=
X-Google-Smtp-Source: ADFU+vvAFnprF88Aex0NH7BFQ7eQ23SZVpj4pjOLWBPysyY1M8AsTSgTG3Lixm6+08KjLce3FoYo6A==
X-Received: by 2002:a63:2e49:: with SMTP id u70mr13947238pgu.202.1585597741256;
        Mon, 30 Mar 2020 12:49:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m29sm9965978pgl.35.2020.03.30.12.48.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 12:49:00 -0700 (PDT)
Date:   Mon, 30 Mar 2020 12:48:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-hwmon@vger.kernel.org
Subject: Re: Linux driver for IRPS5401 - status reg not found
Message-ID: <20200330194859.GA12459@roeck-us.net>
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 30, 2020 at 01:09:56PM -0600, Robert Hancock wrote:
> On 2020-03-30 12:48 p.m., Guenter Roeck wrote:
> > On 3/30/20 8:42 AM, Robert Hancock wrote:
> > > On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
> > > > On 3/30/20 4:33 AM, Michal Simek wrote:
> > > > > Hi Robert and Guenter,
> > > > > 
> > > > > Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
> > > > > I have checked that u-boot can detect that devices and read it.
> > > > > 
> > > > > ZynqMP> i2c probe
> > > > > Valid chip addresses: 0C 13 14 20 43 44 74
> > > > > ZynqMP> i2c md 13 0 10
> > > > > 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
> > > > > ZynqMP> i2c md 14 0 10
> > > > > 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
> > > > > ZynqMP> i2c md 43 0 10
> > > > > 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > > > > ZynqMP> i2c md 44 0 10
> > > > > 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> > > > > ZynqMP>
> > > > > 
> > > > > Here is DT fragment which I use (it is under i2c mux)
> > > > > 
> > > > > 185                         irps5401_43: irps5401@43 {
> > > > > 186                                 compatible = "infineon,irps5401";
> > > > > 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
> > > > 
> > > > Does that mean the mux is at 0x13 ?
> > > 
> > > These chips have two I2C addresses with two separate interfaces: the standard PMBus-compatible interface at an address between 0x40-0x4f, which the irps5401 driver supports, and another proprietary interface at an address between 0x10-0x1f. The specific addresses in those ranges is configured by the value of a resistor on one of the pins.
> > > 
> > 
> > Ah, sorry, I didn't get that part earlier. Unfortunately, the datasheet
> > doesn't seem to include a description of the proprietary interface
> > registers/commands, or maybe I am missing it.
> > 
> > The chip datasheet does talk a lot about various MTP registers.
> > Part of that register set is Write_protect_section and
> > Read_protect_section. Maybe the PMBus registers are all read
> > protected ?
> 
> There is a programming guide and register map on the Infineon site under
> "Additional Technical Information" here:
> 
> https://www.infineon.com/cms/en/product/power/dc-dc-converters/integrated-pol-voltage-regulators/irps5401m/
> 
Based on that my best guess would be that either the chips are not at the
expected addresses, or that the registers are indeed read protected.

Guenter
