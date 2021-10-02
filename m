Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCCAC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 660A1615A4
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhJBOGl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Oct 2021 10:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbhJBOGk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Oct 2021 10:06:40 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F7CC0613EC
        for <linux-hwmon@vger.kernel.org>; Sat,  2 Oct 2021 07:04:54 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id e24so15295643oig.11
        for <linux-hwmon@vger.kernel.org>; Sat, 02 Oct 2021 07:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZbRKNJW7C7f73NBYgjzodUMDPgrzWXalxajimfQpoSU=;
        b=cdpgJ9L/G6PIZMfEl+vxHn9/QQh5v7BAcyrRNhVGv/CLK9j2AYpXd1j+aimDb90fmW
         xCpJpm2Y3Ubcge7NUQtovRP2TP6eaElJdaMsx0T/9VWG0UqTk0mBg9pgOsRZVcjOzclf
         MyQllSYmH2zMqix0CbDm1edDOee9gvnVebcV1quaPbHtLtWJYBYS5wWryx2N7S45fcfc
         OqQeQk1JsRy540daGyVE+AoUFVwkdGyi0qduGC1OAvG1xrguIzWklltSSI8TaonlBpn5
         60bFyM87Weu1aEvu3iw14BUDAN3fCqSZMAPhHqG5q5JOY6Zy2JVR8Nw5vONG7fVjKe7d
         vMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZbRKNJW7C7f73NBYgjzodUMDPgrzWXalxajimfQpoSU=;
        b=fjT9bBxbq8hN+rYJ/a6HDhNSMv/jG8DZArDEgNLGK96iKPSYV1J+qut2x6JhBulD2I
         3cGLp/e3HcA7QprXAzeomfctkta5LhZYfD9G8X/cUnsLg29Xkx8Mf9BTXmKlIEVsR7HN
         TUDstHkMsk4q5sEVHyGqT/M/W2LjX5EULwLNrmasLx49HYdDQTxsWme9HgWFPwH/nY6Z
         +11iUiGa+sJ+elJdwB9xPhp7xt/Kqj6Vcb70PZ+AyQ/3TWrPNJ+JgoEvpXlZOOPZvNzd
         pXfRCbBA9fn0Q/KFHRFgdG39HvNhos62cWmC8/qQy3b+I2wqV+FwoK1feBvOJm+oSzbG
         5WSA==
X-Gm-Message-State: AOAM533tKwQS/GW5oGy5nfG6CcrjqC7uylSy+EXtWlUECBxWxeS2tFk4
        D/P4shdjSiANZ7tJstEb7eU=
X-Google-Smtp-Source: ABdhPJyyIKIM6TOSVj7z7xO/LUrI6fE970xqDnFJqX8tU2q+MweKiL1ry8PunJZF6LsekV9ZnZJAwQ==
X-Received: by 2002:a05:6808:3a6:: with SMTP id n6mr7905990oie.13.1633183493792;
        Sat, 02 Oct 2021 07:04:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm1750350otp.36.2021.10.02.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 07:04:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 07:04:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: i5k_amb temp_mid replacement
Message-ID: <20211002140451.GA34532@roeck-us.net>
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
> Hello,
> 
> while trying to convert i5k_temp to the new hwmon API to resolve
> https://bugzilla.kernel.org/show_bug.cgi?id=208693,
> i was asking myself whether or not temp_mid could be replaced with a
> standard sysfs attribute?
> Since afaik temp_mid and temp_max are both temperature limits, they
> could potentially be replaced with
> temp_max and temp_crit.
> 

Quite likely. Unfortunately, the chipset documentation is not available
to the public, so it is difficult to determine what those temperatures
actually mean.

Guenter
