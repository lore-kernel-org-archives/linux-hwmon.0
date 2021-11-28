Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC12AC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Nov 2021 18:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhK1SHc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Nov 2021 13:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhK1SFc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Nov 2021 13:05:32 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B05EC06175D
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Nov 2021 10:00:14 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id r26so29987753oiw.5
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Nov 2021 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GHbK5Dx2JyMK6mOdwr12f4CnjyUtU2RRgSN1G9XuXlU=;
        b=UHE5x91DbyIoOLQVTOEl1TggPcgx3EKPwUeXubBlnaigyCZofZRYe2f3VTQQhwKAwz
         eA6qUgddpPo7faT2q+ySuLgcz9PlnXiUmIk+pCivj2JlbNFVHmS463D65eElIHOHQVu8
         p6rZvZi0nqHKmXyg/6s70t3N/z1VHH/iqURC6Q6D+em/ufneFUH7kSlXqtsIvE3b1zZE
         QghRF23ZJO9bMLREfRLgyrrwBU8TMD/vse2EG8XLDOBqgEVpvdGpaIum3aUzn4imNC6a
         9VVJB5PcLP3GV9WY7MYkyOuktnucjnRqxb8UGq0h0QJfxO6BEkCeMaOQRK9zXvwEKlmg
         ifBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=GHbK5Dx2JyMK6mOdwr12f4CnjyUtU2RRgSN1G9XuXlU=;
        b=LovfCGzfVPDTgflucC/ddqlQk4a79zscxbln7CGFfsLdLdn/J/lQke8s0G0HfB3RHg
         JO+zjPxcC8sGdG1sOqNekjekfTHbeDywlmNgqyLahLanxHBazAMzc5VYWmLfSGXiILd4
         1HchkbOeETa4FgaCNddvTd9YJK7+6OsSxk7BB130mOIG4RbgpFm4dP8fUX7jWbHtkgYg
         0tqmu5B9jtz2Fid7pVRKEkPpcFhMHepzZaATrpbBeq1+AbzRWulxwV0E3lB/oYM3f4lF
         Mlo+VsqSlo5IO9Lb6TNVegz6AIitnhIH4K8PhMbTmj2y36SaGaTSCpjLVPh6WjZo4S9z
         Y0Og==
X-Gm-Message-State: AOAM530jayzVp1HxQXndYD5LMI2J2wKf+yCnwo4VK9bJwSTfdWAGTlkY
        wrL8DRu2LmE+00xoG+73fEbb963gdrU=
X-Google-Smtp-Source: ABdhPJy2NVjEAt+y1xqcTH+dh0y4qPRqbNx1PQe/y92EfLs1syqLRirnJ6H7DsSxfe+r7JTtzEj78g==
X-Received: by 2002:a05:6808:ec3:: with SMTP id q3mr35885245oiv.57.1638122413954;
        Sun, 28 Nov 2021 10:00:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm2502931oic.39.2021.11.28.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 10:00:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 28 Nov 2021 10:00:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: Re: [PATCH 0/4] hwmon: (ntc_thermistor) Drop platform data
Message-ID: <20211128180012.GA12247@roeck-us.net>
References: <20211125020841.3616359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125020841.3616359-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 25, 2021 at 03:08:37AM +0100, Linus Walleij wrote:
> Since this driver was merged in 2011 nothing in the kernel
> has ever used the platform data intended for boardfiles.
> 
> Drop this support burden: everyone and their dog is using
> this with OF and IIO now.
> 
> If there are out-of-tree users who need this, this is the
> time to start submitting that platform upstream and stop
> working in the shadows. (This will invariably involve having
> to convert the platform to OF (or ACPI!).)
> 
> Linus Walleij (4):
>   hwmon: (ntc_thermistor) Merge platform data into driver
>   hwmon: (ntc_thermistor) Drop get_ohm()
>   hwmon: (ntc_thermistor) Drop read_uv() depend on OF and IIO
>   hwmon: (ntc_thermistor) Merge platform data
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> 
>  drivers/hwmon/Kconfig                        |   5 +-
>  drivers/hwmon/ntc_thermistor.c               | 148 ++++++++-----------
>  include/linux/platform_data/ntc_thermistor.h |  50 -------
>  3 files changed, 66 insertions(+), 137 deletions(-)
>  delete mode 100644 include/linux/platform_data/ntc_thermistor.h
> 

The series looks reasonable to me. I'll apply it to hwmon-next.

Guenter
