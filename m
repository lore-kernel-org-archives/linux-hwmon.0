Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88A3C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 22:42:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F7C207D8
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 22:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COOFVwbH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgE0Wmz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 18:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgE0Wmy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 18:42:54 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A9EC05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 15:42:54 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t16so10710014plo.7
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NUCCWccvfA9dTNBgEiNPZqhPBHmwS4RgLd7HIzWYLrE=;
        b=COOFVwbHXf331YDk2EMl3pXU4UaspODUH6wo7+p1wCZUORjx6tV5pQsqYqFRBBtumL
         4185wFvESAbE4NfRd5iZD91NsbpPKk6kH7o48/ImClD7LSL/v+x+ig2ZtwZAgIEiaxdn
         fe/JR/WnVwhnKfhq7xww0yO41RTxmESGjIsUQy4D6udlxrsmyVRxzM0aZec3V81ivqhy
         9ur5DT1O9GRqgGEQKXnwCO7SC9j2AtWfXFgQCEe+sA/1BNFxlF+UlPpXmKEWvyX+Lk/v
         uvbX6nM3JauVk+gjLmLVDW3hNKQI+nbgGjMixPbJYIki8SF+OzTGf7+GyyumF0bvR/QQ
         jJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NUCCWccvfA9dTNBgEiNPZqhPBHmwS4RgLd7HIzWYLrE=;
        b=f9iSIFBJLp9cMfBFfx8t1SggeKr73cnTiTEYSwEQ2JmJ176CIeryzXcGykyYDcSqPa
         8CAYxkl/GY0X/P3pQIFRsQilpgikXVolhr89lwF3abcaoevCBWogQuYmZ7uDI6Faa3Lq
         vsuhOEMwfHrHlyB4nhGvBgxiDlRViWeKX/kfzBibEfGNEiIg4DRxcSIabVNyyLHHjYSr
         odAvgZ4gXN7+UVv95oGG8xchEbkmOa+kK3kiQs32pvjOluWal8NunyerzqGpyhrjRgLz
         Vu7/U1aMVM5H2E+zJmHXNTKhKrkY1ytyLSIF8XIwu00sJ/XNNG90GXmKVmeoj8wtLhhk
         mLRA==
X-Gm-Message-State: AOAM532VFxr1cKgTFVcB6GzRebdHyAEBLrryOyOFizI6Z+qWiQJg63Ja
        Q9xhPH8Q8T6l/2S6wr42HG4=
X-Google-Smtp-Source: ABdhPJxV+IZCS1BWqjOW+H1wB4AkP5o4gtuYd9nuLYJhsbCfbzCNWSqZHy1dbetfJKjnnv+Z3KFUeg==
X-Received: by 2002:a17:902:7847:: with SMTP id e7mr582569pln.157.1590619373863;
        Wed, 27 May 2020 15:42:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r18sm2857055pfq.201.2020.05.27.15.42.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 15:42:53 -0700 (PDT)
Date:   Wed, 27 May 2020 15:42:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200527224252.GB89212@roeck-us.net>
References: <20200526112259.4356fb2f@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526112259.4356fb2f@endymion>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 26, 2020 at 11:22:59AM +0200, Jean Delvare wrote:
> Hi all,
> 
> In the context of bug #207771, I got to look into the adt7470 driver.
> I'm slowing understanding the logic of the background temperature
> registers update thread, still there are 2 things I do not understand:
> 
> 1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
> however this value seems to be only used to limit the wait time of
> future calls to the same function. In the general update function we
> still read ALL temperature sensors regardless of its value:
> 
> 		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
> 			data->temp[i] = i2c_smbus_read_byte_data(client,
> 						ADT7470_TEMP_REG(i));
> 
> Shouldn't this loop be bounded with data->num_temp_sensors instead of
> ADT7470_TEMP_COUNT?
> 
Guess so.

> 2* Function adt7470_read_temperatures() also sets
> data->temperatures_probed to 1, and this boolean is then used to skip
> further calls to that function. But do we really need a separate
> variable for this, given that num_temp_sensors >= 0 matches the same
> condition as far as I can see?
> 
Agreed. On the other side, those are optimizations. I am not really sure
if that driver is worth spending time on, given the age of the chip.

Guenter
