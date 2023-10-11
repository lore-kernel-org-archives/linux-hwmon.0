Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691B2CD6E7D
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Oct 2023 15:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjJKPJp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Oct 2023 11:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbjJKPJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2023 11:09:39 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE4A92
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2023 08:09:38 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7b91faf40so29905957b3.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2023 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697036977; x=1697641777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6/37qPn/Fd3bF8TBSbd7C4AdE6tXRAZgqlQstEkwSc=;
        b=f95eufyqgY3+Sdp3UeVcs0bskmvT+mls8B7PdrUHzSYv9Dce4JG4WNDh9SZO2qhJhi
         +bDzvC9PejQBJJcOG1FdN/tsaJQRmhgee9GNC6mjT3GCbKOIgahBja5RG/IqvWIP/lhw
         YANqPDtyETwMIafNko2xqfdedmfo+VgJ/85beoY8Q29tQQOKtl4rnrtUM1xsyhAoEJie
         xo/u8Jg/2jzONJvN8Tye8VeAv0UAmUj9nX5Fi3dflJ9t+h8A9MsoxF353j+VL940FNUY
         3L/LuNQ/gqDXHHg/BOXj4lWCc3VOixhUgcJRA5a/8lU87wXv46RdDI/CKWfSRncDlZmo
         IGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036977; x=1697641777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6/37qPn/Fd3bF8TBSbd7C4AdE6tXRAZgqlQstEkwSc=;
        b=T2USz+R3Q0defiwRZZzBvRvmgzitQDizmjI8ZRih1QYjtO9NDl8KzzqcKBk5TCQhcl
         VpUJNq5YLnl3DlTLLBZO0pmpl96xk42dnfHlOfBSoxdUH9TdaKbAXvxQarMTVSYBGCdv
         Plc68zAWTsACxsGpq9qxOApLw7gXgxqOCoSCEpIbGrx/Tv02QMCfuxkZbj2K+feow0N1
         yqeNwma86qCe7PCZecAt/g8R5bHVa+syAwapPhHZJcUvLqcNCCPbmAtqKY9In95zqN3B
         YC7H0BetRckZ8g77TY3ePpy7ehAg17FKPAwpW5Nef9SmaB3NICPc1EqO/j7nE8MxhtOy
         08eQ==
X-Gm-Message-State: AOJu0YwpEevzQ3rHmPLINfT+Xsj2C9n1Aq3c5d0JLE8HeGKW7Pwi5H3l
        8k9Q9h51hSSaww83/8HD2picIzkS+Os=
X-Google-Smtp-Source: AGHT+IHslpdyzrBX3Wa6FFJoN32UbrXOgefICGZ6HNcvsqfooOCnhjskyV32/A73MZZ4VWlZBTQyYg==
X-Received: by 2002:a81:6cc9:0:b0:5a7:c641:4fd2 with SMTP id h192-20020a816cc9000000b005a7c6414fd2mr4828718ywc.10.1697036977448;
        Wed, 11 Oct 2023 08:09:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e15-20020ac5c98f000000b0049971fc9efcsm2496647vkm.29.2023.10.11.08.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:09:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Oct 2023 08:09:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Ben Shaul, Almog" <almogbs@amazon.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Shenhar, Talel" <talel@amazon.com>
Subject: Re: HWMON periodically collection
Message-ID: <2d22df1b-f5a8-4161-b4e3-a3fcba6b3308@roeck-us.net>
References: <B8B37F39-A91A-4925-8100-4818FDA202DC@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B8B37F39-A91A-4925-8100-4818FDA202DC@amazon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 11, 2023 at 10:45:03AM +0000, Ben Shaul, Almog wrote:
> Hi all,
> 
> We'd like to collect hwmon sensors and get their min/max/avg for our platforms.
> 
> Those sensors doesn't support min/max by HW and only support reading current values (they also don't support avg but that is likely the case for all other devices).
> 
> For that goal of getting min/max/avg we have two options:
> 
> 1. Write userspace service that will constantly read the values and do the calculations (and later report to our database)

Yes, this is what you'll have to do.

> 2. Extend HWMON subsystem/library so each registering hwmon device will ask the subsystem to do it for you.
>     Then kernel will create workqueue and constantly read the values and make the calculations (which shall later be readable via hwmon sysfs)

No. This would add runtime overhead to each hwmon device even if the
information is not used (which would be the case for almost every user).

Guenter
