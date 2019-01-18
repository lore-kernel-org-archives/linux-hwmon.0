Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDD5C07EBF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9589B2086D
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2V2n9/P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfARS6r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:58:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44903 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbfARS6r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 13:58:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id t13so6461257pgr.11
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=twcVaJr9Eg/XjduRqQVcKqaoGPl6ROQ5etdd9QeI/7Y=;
        b=L2V2n9/PpdKRUhejPH1I5f0oYQjy5a4IuFVUYgeNi3L2Nus3qQj/AVkPLHebAgXiiv
         oquLPQKnMSgNsT3x/o3PpS2ny6UUnqvSXt6Azjkd+7qJETqiH9HGIvEBnQqUnp5OYBM8
         IqE1IO9SDeN1tACvGJeNeng1zXLIe2XWDrhtYqavtGUhrNqW9UZYGT3nwgeVox+y9JuI
         vyCpnsl2yHDvJVzNI1RoPS8VW1VIwZGagwOuP3LmEZ7I3d/iEFVaWb5b6nBjXqhuZZhG
         a33nENYnJISFuEjNC/8LPQjWVD6ZwBcOllw4BEY9MGkj1m+DiBWFrOxve3958FXZ6V+L
         Z61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=twcVaJr9Eg/XjduRqQVcKqaoGPl6ROQ5etdd9QeI/7Y=;
        b=Rp6jDL0S0DCcViPj8M6gzjW2k5FlRN1cwlWRfSAWwCKafPo0xQZFN5z9OOli7aegh4
         iWj/n7sKk+b8wHcNFkD98s1Amaoh2fzJR6VZmi9LyK4ro4+QhuC5n87HqVpS1F7G1yTy
         uGdKRI4P3sjd39svxuliibRpFc4g3LhVJgWQScHnnKsHr+TRcd5fFmZpFCLPkaCRvFIq
         0objw+r/h0CK2M+iUwIXXD8jvOXtXQR/dP7xeu5OohyM5u7AazuxixGMmRIgZvxhZo3R
         NLhUPNOEMNHViSqrIm1fe+C6v++juEaBB0Pq9WkTVPs3ymdeIWEnMKWoaP6e/gaKXguW
         +1YQ==
X-Gm-Message-State: AJcUukcGVcfYWpFm6NzlhTqVpnf8/AUOQW3u8acIo0B4gZBJwP5WPhKC
        qRiBXf33timpQLcZX3zCwwm8cWcY
X-Google-Smtp-Source: ALg8bN64CAswfo4xxkvOZyCiP1TucNKUu+zVFQ74buamEe0n4/q1M8f8Cg7kMuFNs9sSzOZYQGPH4g==
X-Received: by 2002:a65:520a:: with SMTP id o10mr19417316pgp.276.1547837926234;
        Fri, 18 Jan 2019 10:58:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r187sm19258422pfc.63.2019.01.18.10.58.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 10:58:45 -0800 (PST)
Date:   Fri, 18 Jan 2019 10:58:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20190118185844.GB5284@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
 <20190118182157.GA13374@e107155-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118182157.GA13374@e107155-lin>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 18, 2019 at 06:21:57PM +0000, Sudeep Holla wrote:
> On Fri, Jan 18, 2019 at 09:14:59AM -0800, Guenter Roeck wrote:
> > Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
> > to improve readbility, and to reduce the chance of inconsistencies.
> > 
> 
> s/readbility/readability/
> 
Nice catch ...

> > Also replace any remaining S_<PERMS> in the driver with octal values.
> > 
> > The conversion was done automatically with coccinelle. The semantic patches
> > and the scripts used to generate this commit log are available at
> > https://github.com/groeck/coccinelle-patches/hwmon/.
> > 
> > This patch does not introduce functional changes. It was verified by
> > compiling the old and new files and comparing text and data sizes.
> > 
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> 
> Not related to this patch, just thought of asking. If the intention is
> to avoid using S_<PERMS> macros and have direct values for readability,
> shouldn't you consider the ones as return values mainly in is_visible
> callbacks ?
> 

Not sure I understand. Can you clarify ?

Thanks,
Guenter

> Anyways,
> 
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> --
> Regards,
> Sudeep
