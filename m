Return-Path: <SRS0=SUeP=RA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D73DC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 16:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 351652083D
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 16:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYG2wj+G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfBYQ0h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Feb 2019 11:26:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40181 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfBYQ0h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Feb 2019 11:26:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id h1so4724165pfo.7
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Feb 2019 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LTHdm027Osh8gZbp8Uf3sQqOFz9/w42UWucZWzwWsRU=;
        b=MYG2wj+Ge8vvhT18FcTT4jMEOvl1OgNLle+l37CiHExS2wuDDpPCvdd2jUUe2SvzC2
         wLsPYQF4/5qZUpQHZk1AW07RRw7z/kQKjCEFV24AORhUAY372LeX36XCilyDV5ErsPkk
         +CfjvFqQMoLUwF9yF5jvOuT05bGJTJTcIrGOkmQkKa1tncHi7/TIaGHIWFMiAKeVI2pI
         jZqFI54TYWuDdhDzZ3xZeMQ6hV3k0jZJUDT2sgdIzi3LeO1G1L9fVOGvlY7RyBaKmt5R
         NYdQEHYlKgRGsf7pqfjb/fyFPIbnJVtNLl+ZZPZsOH6g1sUDY4pvhINjlGXqgZqm9tpG
         iXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LTHdm027Osh8gZbp8Uf3sQqOFz9/w42UWucZWzwWsRU=;
        b=BZ7iewfcPJTnkdm8fUiCyTFM8dpLLjT48MiZ+8QCT88kbpWE5Y4sbFTDQw9GGrQRgu
         wvDIZSYLL/GV2BygaXE99v49T+gsAa2kJJ4e0vvB+3oUmJ+sLI7cG5SQgmQ4O/Zm3Bv0
         sATOFiNj6ErdSBkB+zIhnVtBmps6O9amPGAG90jKvEPlPVIeg0OYX4nonC4H+Lf82lnm
         +fZrXoxUhqCnwKUvS2d513VRYA7IOcY252RfuDzZJdCZaJxy3dMWdwfPDb76MuroYuVI
         uF/L38xdDMxzHEVGeOn1phGu+jQuSpmakEBkJZitHMvSq6w0JwbBfjppLBvFVWx3On8u
         1yCw==
X-Gm-Message-State: AHQUAuZNkPP+vM+f8i26T7gPoOkvxR+KxJ5kJ0+Z1KcNdTrFVbJBqDYM
        GEuIDU2Kk556tm1+D+nbJEM=
X-Google-Smtp-Source: AHgI3IaT8LSD9SoOrTFRLFB8kk5k+7YEoCJtiktlsRr6t7pvwaEdn3jRCtWusmduOAZ2U6JG5v4+SQ==
X-Received: by 2002:a63:c345:: with SMTP id e5mr19991847pgd.103.1551111996947;
        Mon, 25 Feb 2019 08:26:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p11sm24837779pfi.10.2019.02.25.08.26.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Feb 2019 08:26:35 -0800 (PST)
Date:   Mon, 25 Feb 2019 08:26:33 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [hwmon:hwmon-next 88/88] FATAL: drivers/hwmon/ad7418: struct
 of_device_id is not terminated with a NULL entry!
Message-ID: <20190225162633.GA8603@roeck-us.net>
References: <201902252359.6qjnq0C3%fengguang.wu@intel.com>
 <CACRpkdZHqX6qXFp1AzyVpfXmqL_YyKaCVYXy_f_ij=u9ApKPKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZHqX6qXFp1AzyVpfXmqL_YyKaCVYXy_f_ij=u9ApKPKQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 25, 2019 at 04:26:56PM +0100, Linus Walleij wrote:
> On Mon, Feb 25, 2019 at 4:08 PM kbuild test robot <lkp@intel.com> wrote:
> 
> > >> FATAL: drivers/hwmon/ad7418: struct of_device_id is not terminated with a NULL entry!
> 
> Grrr why do I always do this silly mistake. Sorry :(
> 
And I didnt see it.

> Guenther, could you poke in a {} as last element of
> ad7418_dt_ids[] or would you like me to send a v2?
> 
No need to resend; I'll fix it up later today.

Guenter
