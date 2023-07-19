Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB93EB64DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 02:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjGSCuG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 22:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjGSCuF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 22:50:05 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A888D130
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:50:00 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-563531a3ad2so3639826eaf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689735000; x=1692327000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99e5u4wGRzFUUqsEuUxH9+94FpeZVcqRezjSlQQJxoA=;
        b=i7/MvAcVEZ26WUS18n3rzCwJ52besMJeOQ+t0+2q/56UY9Xm3ttNhB8bCWeOwkPmR1
         64fCEdKhyYEa0biBdZ+1IOwt30TmnLgAJfKfhDOGJCxkas2Z5dNrBkBFP13TNtWNPmET
         8vLn8LWGWWRLO9/hVf4e0GTgS9jmWvIMxw9XpCHy264AwNvQnWxZ8ojrf55D/S+vL3ul
         5rSL+KuyLox0F3grSxhYuHLPAthKadLJc+vafre89FBoGaUci5JekYQqoPMAR4ZRRvcg
         fzaGcPuM3Q6gSSZ/kTpWQysATFWvruUjdJXN+RU5Pje6TOtKyJpKhhYeqPb/i7p3VNLe
         mSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735000; x=1692327000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99e5u4wGRzFUUqsEuUxH9+94FpeZVcqRezjSlQQJxoA=;
        b=fnF7CJh2i6dBSWWyLLzCwlfkAASxBmABHdLmd3LeacZ8p1WEnUH199CkcjIXTDN6lE
         9U8QiPVVIIoy+WIoGilS6KVfQkW7NANMweFgYsLKPy688BwH6BooNxrRUOOHFweifX+V
         lvKp6knvYGjIFnLk7Pp9DhBws2X69Gn2bJnqHCZnHIRN2CcLh+qGfxoiq+WCz6CKo839
         3STu/6VNVa5blmPAqxa0vaCxO60PGvsJSD2FiEtkVE4xp/9hkK6waK9+nVgVlqotl7fr
         IUSff/Zh9/3jTgBb5bayHF5/Nk2A7IXBBhackIFjQzD8ssX0g0F+Ze2NAYpKkp2CDhCy
         cHkA==
X-Gm-Message-State: ABy/qLZwjrLZjaSSDOC15dw96Cnv42SRkSm8KXdHgNJuFGOQS086DNni
        aN2ylU317cbbIC1RSLIMXYs=
X-Google-Smtp-Source: APBJJlGjswXpeDNXi6WWqlKiq+2xB7rYDMo54dejwRl/5nsqBjQXqpvm/ka/H829A+ZBj9TgKpcw6A==
X-Received: by 2002:a05:6808:1287:b0:3a4:1484:b3eb with SMTP id a7-20020a056808128700b003a41484b3ebmr1341681oiw.12.1689734999914;
        Tue, 18 Jul 2023 19:49:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k18-20020a63ff12000000b0055fec4c165dsm2216572pgi.78.2023.07.18.19.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 19:49:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Jul 2023 19:49:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Message-ID: <ed576af2-8fb8-415b-87db-a30b025096e3@roeck-us.net>
References: <20230718182912.1746384-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718182912.1746384-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 18, 2023 at 07:29:12PM +0100, Ahmad Khalifa wrote:
> * Add additional VIN/IN_MIN/IN_MAX register values
> * Separate ALARM/BEEP bits for nct6799
> * Separate scaling factors for nct6799
> 
> Registers/alarms match for NCT6796D-S and NCT6799D-R
> Tested on NCT6799D-R for new IN/MIN/MAX and ALARMS
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
> 
> Notes:
>     v2 changes:
>     * Rebase after increased BITS with same registers
>     * Assign missing ALARM_BITS and add BEEP_BITS
>     * Add separate scaling_in and pass it through data as they were
>       missing in v1 and the factors differ with other chips

The scaling change is really a bug fix; it should be a separate patch
marked as Fixes:. It also affects NCT6798D.

Please split the patch into two so I can apply the bug fix for v6.5.

Thanks,
Guenter
