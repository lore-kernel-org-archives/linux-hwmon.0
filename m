Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E020C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 22:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA14D206BA
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 22:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5bb5X+k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfDOWAQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 18:00:16 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40251 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbfDOWAQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 18:00:16 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so9241843plr.7
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 15:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GtNA2NXb9+aogYk7zHgOxEpkAOMOyja1Zb2HDuuFKZA=;
        b=W5bb5X+kPGh+TgI75SNTr2da20tDdPXig6kOpQn0w5jLI4OtYjbb5nTNpCHr/X3GJ3
         aWes0Ntrn4RbQyEjpOSKtlhq8Ca4MPBU4mKwTCa1TLUNKsXm6/OPZM8D0ifXqwaqY3Ya
         53Wk9kCNjYPKT2ZPjnN2lPyB0741+GW/gl5CqUXSg5sMYx0wqQAKQrLJrkVYnsYzk47Y
         GFNcTMrgw9YtAleiYafRDLorXDzTLScX863vSXM8V6dY/KiWt6OMLDT97sdKAyusxXXQ
         Y6b+q/N1bZHLbrt+wgJVbzlIZv8BWxvQ1gqVrAL3NxR5K2YH9nANnPvjMFXy3sfUkqBN
         Zv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=GtNA2NXb9+aogYk7zHgOxEpkAOMOyja1Zb2HDuuFKZA=;
        b=Cnbs0DXwUNByr0i82a0ApwrDFHw9uGr0et6iOVFXia+Y+26rDYXvq2E93yKkfwPQqA
         ATygzXxWmTyBWH5AkdxlfdopSs7ixcd5VsT3ZZKBZnHZtkgR/QgK2tbIc3WaRhnb8Zyc
         uEcArMHVjzrWbvZgzIXuHiV/sgL1PsjKIdnJCaVX7wL0yyl+kPgef6NodmPqsCvEDDEa
         e5wCEpZHpj3LPJXwdvNW2fuo/26v0U5zf3vm906tvtmepQ+ZaoXnZu9xXuxFlAirUeDD
         /3bRfqzxj4pTSMewYt0g2yj7qiSo+TOrbKuXu6THOlzOb/JE6GfN3UaqbpITJJSifrPv
         bcCw==
X-Gm-Message-State: APjAAAV69/J0vKkJlyw2NNMNvFPIgsVEoesj5SFbxFacnNPDSaWG0hv5
        c8iTWOD/vXdR4xAy6JftAw/DsAT5
X-Google-Smtp-Source: APXvYqxVItP5EUXVM8ZK/zTn0JS61bNDo98aN7d9h84IKl6Hoai8UWfctUqgMhvHqyF1etCGzxOXsg==
X-Received: by 2002:a17:902:7247:: with SMTP id c7mr78013354pll.255.1555365615524;
        Mon, 15 Apr 2019 15:00:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s79sm119646015pfa.31.2019.04.15.15.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 15:00:14 -0700 (PDT)
Date:   Mon, 15 Apr 2019 15:00:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH] hwmon: Add support for samples attributes
Message-ID: <20190415220009.GB28795@roeck-us.net>
References: <1555360032-31159-1-git-send-email-linux@roeck-us.net>
 <20190415214715.GA11156@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415214715.GA11156@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 15, 2019 at 02:47:16PM -0700, Nicolin Chen wrote:
> Thanks for adding this.
> 
> On Mon, Apr 15, 2019 at 01:27:12PM -0700, Guenter Roeck wrote:
> > Add support for the new samples attributes to the hwmon core.
> > 
> > Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> Will redo my change and test through API later.
> 
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/hwmon/hwmon.c |  5 +++++
> >  include/linux/hwmon.h | 11 +++++++++++
> >  2 files changed, 16 insertions(+)
> 
> > diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> > index 7a8cc06a0d61..7b18a6150a11 100644
> > --- a/include/linux/hwmon.h
> > +++ b/include/linux/hwmon.h
> > @@ -40,6 +40,12 @@ enum hwmon_chip_attributes {
> >  	hwmon_chip_register_tz,
> >  	hwmon_chip_update_interval,
> >  	hwmon_chip_alarms,
> > +	hwmon_chip_samples,
> > +	hwmon_chip_curr_samples,
> > +	hwmon_chip_in_samples,
> > +	hwmon_chip_power_samples,
> > +	hwmon_chip_temp_samples,
> > +
> >  };
> 
> Why add a blank line at the end?

No idea. I'll drop it. Thanks for having a look!

Guenter
