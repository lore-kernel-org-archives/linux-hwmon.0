Return-Path: <SRS0=6S3t=7O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52453C433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 19:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F225206E2
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 19:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL6eH0uP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgFAT4E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Jun 2020 15:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgFAT4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Jun 2020 15:56:04 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D4C061A0E
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Jun 2020 12:56:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id f3so3944606pfd.11
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Jun 2020 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H2yzmuY/cIj04QzeFLVoKwdW1BhRC5KukP6SO54zAsk=;
        b=IL6eH0uPzvtBEtNtZZeXX6lEma6myFrq1FxXfDUL5kI1Ni93wD4iF8T35aA+chSRzk
         aVyB8y0QZ6oQFCyqp11DZCQ9Kvzh3hXRzTAWBch+TvuhdGzDz0rnT5IbRNKP+YWvQGjw
         vzNr8XA9MeUDGDTe3CpwsAZNRZ0DRHhk7e4o8AMrR6inZgOx4vBFcOzq5kMPPoCqbfAA
         klIf4ii+zy+6ixj3CF9mHsqbROx7ZTjbEHbVUsBmPqqLnRp9umXbfJ3kq503b5fLJbS6
         f8kdmTQfgNWJkDOAyd7QeKM8faFVQQMzCmJz0CeD0f6D/wtZh7yskMeOIVphMHwkaELa
         cWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=H2yzmuY/cIj04QzeFLVoKwdW1BhRC5KukP6SO54zAsk=;
        b=B7aTVwrecm5xPOmmgHgI2OvEBlQuY+SFK3nrlCPrJgzz3cMqMKD3SaerkrzpeaD+Rs
         vMCrvT2FtRKDJwnQNwi5bJBCU8OuJzw+r4Ef6rp062rcLJuVac61mdRdfiqxyp+MGTR/
         QclQFJvqwKsQm9gbQkCphuu5aHQI9X533y0EaGn3U1XEyCcIR7P9S5aaixszGhnq67xZ
         kdW6rCPNZ3wtL96Uzc7gP8cJ2aCN2NOvg9p1RKBZGpGlgSF/2FQlShsED7YWW+xa+cdq
         eo53g3Hy3kZPGqjrxvN5wT2BwUhAg1OeW3Z9ZDN/YT7vqOvKzLJa7JG16BZ/Y40tySkB
         mujw==
X-Gm-Message-State: AOAM5314A9L+Ah8S6xGtKS92cY9mNiyobg4wQMHUO9aWyDZ9i3pHVx/l
        shrvIyxD5M2HlBraZBPk8AN1O3oc
X-Google-Smtp-Source: ABdhPJwhe4Hid9D8R6wwxuUvVAQtevDO1PbnjXQD6FNth80881F2CgAO1cRfdCzSZoqM0g2uNFNtEg==
X-Received: by 2002:a63:1323:: with SMTP id i35mr20987375pgl.311.1591041362372;
        Mon, 01 Jun 2020 12:56:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e26sm265071pgl.27.2020.06.01.12.56.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 12:56:01 -0700 (PDT)
Date:   Mon, 1 Jun 2020 12:56:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: hwmon/pmbus MAX20796 driver update
Message-ID: <20200601195600.GA34110@roeck-us.net>
References: <MWHPR11MB16615721BF15D489619D81C7FD8A0@MWHPR11MB1661.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB16615721BF15D489619D81C7FD8A0@MWHPR11MB1661.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 01, 2020 at 10:53:57AM +0000, Ugur Usug wrote:
> Hi Guenter,
> We want to add new device specific functionalities to existing support with common pmbus.c on MAX20796. We want to cover some Maxim specific features and registers. We would like to take your suggestions on this? Could we create a separate pmbus/max20796.c file for this and retract the existing common support from pmbus.c?

Yes, I guess so. Before you do that, though, it might make sense
to let me know what you plan to do. Adding debugfs entries would
be ok, but not setting any of the chip specific parameters (those
should not be settable during runtime, at last not through sysfs /
debugfs).

Thanks,
Guenter
