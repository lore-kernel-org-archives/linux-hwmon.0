Return-Path: <SRS0=SwvS=XH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE59C4CEC7
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 22:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D245206CD
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 22:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+3nrJGH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfILWpx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Sep 2019 18:45:53 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:34871 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfILWpx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Sep 2019 18:45:53 -0400
Received: by mail-pg1-f173.google.com with SMTP id n4so14236611pgv.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2019 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wKXdkliYuX84jC6OXzjmvS7v8H558QDdf/F4+K0FAsY=;
        b=V+3nrJGH6ggUd3+JhsE+YrcpOKyZ+vATyFxQ4EIlycKWCghhSytdvXM2nqQTJUWI4r
         DRH6XLUbVT/lSs7c1MktGVvPjjppTEfsJ+NYo78PSPwsB3d2Tr7rXUf7F2IXTaVjlSFT
         Z+RQJKS5mVj1yrjrS9sKs6VcQY270KL3ssZaJMdtNflOBU5TAuYUptIE2Xf6D4H2HfXu
         KyLPULF31ccpZiXrbpUf+ar2FcE/U6/Rd5k5CoC3PcNzdSHZ+OTaqsJoBg/KY7kleJ2x
         pWL7yODqxyHhhIgrC40LkBNRPLWKceQS0hR0hh+TIrT6k7y5cAm81A96BwGlBPJJKZ9x
         eGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wKXdkliYuX84jC6OXzjmvS7v8H558QDdf/F4+K0FAsY=;
        b=s0z4+V5SStWoVICgfE2fDg2GBRIYISaXSN1LerGNTKrJyxHHjMKIBvGwuo4uwrpno3
         maGNkv8XY5E6XhsD5V1ljn1MYNjBGg4d7T/fSi0R+LYgD3WqCFfP3KKe/Ekhe3nJROsp
         C+80VC+QXwdxW24OJeV1Q8Tsk8dVtjcdO4VrYF47R5FXKh3CU+JfL6NJA0KLtr9Qyyuc
         2RWP+V8qNxubKDWipsL0wXh0n6QlN/+k7e58fnhw6pzZB8Q8wC9vQxkDspnoyVk0OoES
         sHzbxFiLsujQNti0+UmW3gcCPAUIYz0Em/2lpWhzAx7Yw3+841qtPIU+KO7JxnAIoNpX
         40sA==
X-Gm-Message-State: APjAAAVpH30n60dovd38S0hXAfLPr14L2jIX08zW4wx0yWQU0nit7iE9
        7H84RlaSrw2yS1EQmWk4vJ4uoWUl
X-Google-Smtp-Source: APXvYqxZ3m9s9r3/MHPrfIj5GJ2Bprr3NE2Gmx/dbXt2xJb7YnqNCJ2lKNVtNpe3056RLis+HvpkQA==
X-Received: by 2002:a63:30c6:: with SMTP id w189mr39073333pgw.398.1568328352731;
        Thu, 12 Sep 2019 15:45:52 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d20sm37897712pfq.88.2019.09.12.15.45.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 15:45:52 -0700 (PDT)
Date:   Thu, 12 Sep 2019 15:45:29 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
 <20190912220947.GA8072@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912220947.GA8072@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 12, 2019 at 03:09:47PM -0700, Guenter Roeck wrote:
> On Thu, Sep 12, 2019 at 02:09:58PM -0700, Nicolin Chen wrote:
> > Hello Guenter,
> > 
> > On Thu, Sep 12, 2019 at 11:32:18AM -0700, Guenter Roeck wrote:
> > > On Wed, Sep 11, 2019 at 05:28:14PM -0700, Nicolin Chen wrote:
> > > > Hello Guenter,
> > > > 
> > > > Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> > > > (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> > > > 
> > > > I have two registers that I need to expose to user space:
> > > > 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> > > > 
> > > > Right now in[123]_input of INA3221 are for voltage channels
> > > > while in[456]_input are for Shunt voltage channels.
> > > > 
> > > > So can I just use in7_input and in7_crit for them?
> > > > 
> > > Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
> > > If so, the limit should be attached to those.
> > 
> > The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
> > being named as "Critical Alert Limit Registers" in the datasheet,
> > to curr[123]_crit, corresponding to curr[123] and in[456]_input.
> > 
> > And this Shunt-Voltage-Limit-Sum is more related to the reading
> > from Shunt-Voltage-Sum, which we just agreed it to be in7_input.
> > 
> You didn't say Shunt-Voltage-Limit-Sum earlier. You said

Ah....right...it's my fault. Sorry.

> Shunt-Voltage-Limit. I would agree that Shunt-Voltage-Limit-Sum is
> associated with Shunt-Voltage-Sum, but, again, that is not what you
> said earlier. Confused :-(

So, those two should be in7_input and in7_crit?

Thanks!
