Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408FBC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F21F52054F
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I63aUQ2V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388819AbfDRUzh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:55:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44337 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388710AbfDRUzh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:55:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id g12so1684275pll.11
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VYZoLPGKKsfpLP8RuJ4Zvp8SbgXJ5L3uY1Px/sgmtcI=;
        b=I63aUQ2VPRaPntdxWTUh0gpgVhqkxwonjbWFVhu9arp8pPFtTemqCfyU8H25W9no+1
         05Fwz2chTMivir4U7JVnicJr8LtwaER34yPinvTrBdc9/FddH80ymfyRBuRlVgqlMNnz
         lUIdYX2WIMYe1p35GW3oQDw6qcR/uYXus+8G5lwnW3H2ds5O/CLhEksMoOH6HaHTf9Xw
         IvueU1ROsUmC5OufdP66XoK+PUM+x7Q6FnHUQqSdDmrqsMyhc1OCbq2ei46MwktRyhhM
         6/PnjI81fCJw/IxnU9WSeFTsZtD3d5AHUpyQ5jkJgoADeaKA9AXf5PdZ0MRAbnhJ8dFB
         N1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VYZoLPGKKsfpLP8RuJ4Zvp8SbgXJ5L3uY1Px/sgmtcI=;
        b=iFpITxwc974DENVE05Esut8G5TWMNSM5EI8n6lc0j1zOn2u6XEHRd7j4recq8qKwHs
         t/RvEkkZ2BBWsDYUsfECvjkd9TVJZwaX3xRjchSIlAk4Fhb+nQIwD5/+ZlUkp85Tc1Ga
         pfTjq3n6aGP3Nw8AFk5LhLi+P9ftK34F3serqC6qJJbeE1OQFX1XOufqk6zyyCCx0FxP
         VKY1AHMhXBnvupWvXcJF0LIw/nVkKnrr3xWXJBxIinUdtyJ3+jBIybqbvq/A0rpHehlx
         kHckFmcK6UM1IXjMzH4qqldera30dIRcs8SuQFdbvLXoY0e3Dj/9AUGdo8fbWPfCnwGq
         ys0w==
X-Gm-Message-State: APjAAAWq+V0xI672w7IoFBs5QtI/Wa1aiWTsmNXCJX5qaKzQLKRHDvHR
        54fzxufbAx1MrfIVxlaAXhGy7ceB
X-Google-Smtp-Source: APXvYqxi7UEPt8j8bJDeccS3s1aSAsjMMuxvsyRA3X49lRkVY3+tliwqHVdzYLWGlRihGMFf56aUJw==
X-Received: by 2002:a17:902:2b88:: with SMTP id l8mr93366307plb.262.1555620936631;
        Thu, 18 Apr 2019 13:55:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a24sm2806034pgv.10.2019.04.18.13.55.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:55:35 -0700 (PDT)
Date:   Thu, 18 Apr 2019 13:55:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418205535.GB13496@roeck-us.net>
References: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418200452.5703-1-jeff.dagenais@gmail.com>
 <20190418201327.GA11385@roeck-us.net>
 <386CEABE-23A4-4BB6-968A-738B8D84DE4E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386CEABE-23A4-4BB6-968A-738B8D84DE4E@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 04:45:00PM -0400, Jean-Francois Dagenais wrote:
> 
> > On Apr 18, 2019, at 16:13, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> +	if (IS_ERR(data->cooling_dev)) {
> >> +		err = PTR_ERR(data->cooling_dev);
> >> +		dev_err(&client->dev,
> >> +			"Failed to register as cooling device (%d)\n", err);
> > 
> > As mentioned in my other mail, this message adds zero value. Please drop.
> 
> How does one distinguish the different failures which can occur within a probe
> function then. I know it is only useful for system integrators while debugging
> DTS for example. But I find my self always having to insert these kind of messages
> at each "return" statements of a failing probe implementation. I just think it's
> nice for developers which can use the info to quickly troubleshoot the problem.
> 
> I won't fight this though. You are maintainer of this subsys so...
> 

Yes, I know there are peple who like a lot of messages. I don't - it happend
to me too often that the actual important message(s) get lost in the noise.
Anyway, see below.

> > 
> >> +		return err;
> > 
> > Sorry, I won't accept this.
> 
> You mean, you won't accept v3, but a v4 without the dev_err?
> 
I won't accept v3 due to the error return, which may be considered a
regression for those who don't care about using the driver with the
thermal subsystem.

If you insist on an extra message, I'll accept a dev_warn.

> Perhaps also, we should wait a v4 which would use your new devm_register... ?

Your call, but there is no guarantee that this series will ever be
accepted. The thermal maintainers may object to the new devm function.

Guenter
