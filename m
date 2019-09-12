Return-Path: <SRS0=SwvS=XH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B45C4CEC7
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 22:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C7C920856
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 22:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNRrhm7o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfILWJv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Sep 2019 18:09:51 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:42819 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfILWJv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Sep 2019 18:09:51 -0400
Received: by mail-pl1-f182.google.com with SMTP id e5so1308891pls.9
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2019 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YGykySpTOyXydfq0URFcYSz73G89ROr4rzGBM6Xv1Gk=;
        b=HNRrhm7oav/wGECFDjZrRoLw1vK6FmK4dq8KJlM5oDmm0Cdj5uCmel0CFto5fxKNuz
         PJWj2RFCAX60pptMOOtJCoGy0lZW86edDxz+2aicL+8KzBs2wkVUi62tkFIdjhIDmNuc
         rXcDKaUOmXGUp0SQ43g6wT1/XlgL1OpU6NBuDSvgp2y4Hsh9pQNyH4we02vvnv+Hx5Ny
         i1K0gK9fU1zO5FfIs2VPNdzNrVkmsF3F+3nkdKK9zWpgL21NWnMPDYUBKXL0zMeFLTjI
         hRsggwZ9R5QUxxcxz7rBaKXw4BoJyF9VepRt8V1pPYKHo7ovlJzwOBX7AoYVwkHdnibl
         htNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YGykySpTOyXydfq0URFcYSz73G89ROr4rzGBM6Xv1Gk=;
        b=tDbquhYV5oz2n9IXlY1Fk8NquGRVJ/cplKd+B8y3dvvI0jU0GZHEhXs88/ta42lsoS
         /EzoSZQPhllgkEb/E+7XD/NMUtM3flGGH6Fmghi4SpCzVl7r/qvLdZvxQAX+ud0BjiGg
         nHOZ7gzX9uvAxsSOc8SPAHUZ2L1B0DJB1CFSmFaCml/VP+Qp8UAFNY0U+dY2O3ef6593
         WvmBkJr3aeK9XOUX11TboRqZ6PbnbWy7NOvKc7Z17boLhKTwOj4xhd3zMtXtt9P2p2Lu
         X2isQGypgoyJzKICAqQyNvRyY8NGBPg5gq918wcuHddG0pLTplRZYi+lYM0Lz2uWz68l
         eeRg==
X-Gm-Message-State: APjAAAVPq/xszLlTZc5KpUJOGGDVMQYdwEsgDj6cfLobKMq9p+oxjnC/
        N3+uyr4j/3G25ql63HVB7eQ=
X-Google-Smtp-Source: APXvYqwjx2mDoH+d0tvvXoorXrvW3JNG3dDAYRNAi9otQh2hvuZIlAPyM7tG8UxS85mD/EkFtyINAQ==
X-Received: by 2002:a17:902:b598:: with SMTP id a24mr46726262pls.5.1568326190314;
        Thu, 12 Sep 2019 15:09:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x11sm203036pja.3.2019.09.12.15.09.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 15:09:48 -0700 (PDT)
Date:   Thu, 12 Sep 2019 15:09:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20190912220947.GA8072@roeck-us.net>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 12, 2019 at 02:09:58PM -0700, Nicolin Chen wrote:
> Hello Guenter,
> 
> On Thu, Sep 12, 2019 at 11:32:18AM -0700, Guenter Roeck wrote:
> > On Wed, Sep 11, 2019 at 05:28:14PM -0700, Nicolin Chen wrote:
> > > Hello Guenter,
> > > 
> > > Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> > > (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> > > 
> > > I have two registers that I need to expose to user space:
> > > 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> > > 
> > > Right now in[123]_input of INA3221 are for voltage channels
> > > while in[456]_input are for Shunt voltage channels.
> > > 
> > > So can I just use in7_input and in7_crit for them?
> > > 
> > Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
> > If so, the limit should be attached to those.
> 
> The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
> being named as "Critical Alert Limit Registers" in the datasheet,
> to curr[123]_crit, corresponding to curr[123] and in[456]_input.
> 
> And this Shunt-Voltage-Limit-Sum is more related to the reading
> from Shunt-Voltage-Sum, which we just agreed it to be in7_input.
> 
You didn't say Shunt-Voltage-Limit-Sum earlier. You said
Shunt-Voltage-Limit. I would agree that Shunt-Voltage-Limit-Sum is
associated with Shunt-Voltage-Sum, but, again, that is not what you
said earlier. Confused :-(

Guenter
