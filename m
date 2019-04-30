Return-Path: <SRS0=kUOG=TA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C52C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D17E20645
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG/dbRif"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfD3Q4m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Apr 2019 12:56:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39542 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD3Q4l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 12:56:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id z26so3470429pfg.6
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2019 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cqdrljg14kGOdFIxdlfrD5BcJVkhuueESPjt33hfOf4=;
        b=nG/dbRifrymnVokNc4WmdMeVNN/nTDZlO3rVxkFiZi9ZRwV4m6ms+6vixTes/qyBdE
         pXJuoY/dX8aFAw1jYR1KEg3BHpKs9J/Hag9osvv7arVbWgcLyzwWACpY7c+cKfUvd8rY
         CSiBvNNreIRrau13pB9JZqfVYmodHbLAEmK66aiUwUfPbRQx5cL1i2QCERm+649NsvtW
         +GOJXZr/cRuD2kbHGo97dZg6hBa3rtD8+g037vl8uPyeCoBCAroMDcf7cRChXssO5oL2
         855HIuGRkYgoVJ67sVazNBwxfMxBcckrPvB3pEz3h86ew9kU9My1DrJk/V5F0EWAoD4q
         qPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cqdrljg14kGOdFIxdlfrD5BcJVkhuueESPjt33hfOf4=;
        b=YqAr7lfT0CTIJSa/uRzblhAe5dOV+eoyKITQddNf+Bi60gL1Jyh6eFnbZESbmLTV0Z
         FbZL2fTwNbcv0lFkbbHGyd0PAmEdHfCTorTqkqjLomMJZ+tLD5Zoci1fE7NQMXiIAFEB
         1yKt2DUf43RqpQvHqHKEvshzTreaMVPXJhiZtaDYpth6IstR0LvhNK4n5wfQeYw81JpZ
         jGQyec8bIYkXkZXjSyG7W3DEsTA0KKZ90Jd1+KDPiolFOGrcxmE+M57COLM/kb+mJAdr
         s9WIfndNwEfuZp+Ee/B9xa6A/tFQW+5RccDWCL6Ad9Fb+ceezXiJJB85P5GXWTGDJ+ZA
         RGsw==
X-Gm-Message-State: APjAAAVJb9ATSSxJWJauztDz2mPprqIjegH4tzhZaLA+XLF/3GHqDwUi
        qf+8u6N6+vKA24X/HS3Uxm8NyrlC
X-Google-Smtp-Source: APXvYqzPKYGOjZbAE2OExAZDpkqYeqxnPpssUD+JADwC0MzsUSSixl1ygPtS+GC1gm7rl7wXxB5JuQ==
X-Received: by 2002:a62:1c86:: with SMTP id c128mr16123506pfc.43.1556643401300;
        Tue, 30 Apr 2019 09:56:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f71sm73615467pfc.109.2019.04.30.09.56.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 09:56:40 -0700 (PDT)
Date:   Tue, 30 Apr 2019 09:56:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Version Log
Message-ID: <20190430165639.GB2699@roeck-us.net>
References: <20190430144609.19500-1-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430144609.19500-1-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 30, 2019 at 03:46:07PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> Changes from V2:
>   - Correct bad style:
>     - Bad assigment, missing spaces before and
>        after "=".
>     - Divide in two lines longer than 80 characters.
>   - Separate dt-bindings and driver-documentation into different
>     commits.
> 
> Changes from V1:
>   - Delete empty lines.
>   - Restore replaced tabs by spaces.
> 

FWIW, I would expect the change log in the patch(es).
If you want to add a summary like here, its subject should
describe what the patch series does. "Version log" does not
describe the patch series.

> Iker Perez del Palomar Sustatxa (2):
>   hwmon: (lm75) Add support for TMP75B
>   dt-bindings: hwmon: Add tmp75b to lm75.txt
> 
>  Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
>  Documentation/hwmon/lm75                         |  7 +++++--
>  drivers/hwmon/lm75.c                             | 11 +++++++++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> -- 
> 2.11.0
