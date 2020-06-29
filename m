Return-Path: <SRS0=iNK7=AK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C17C433DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 19:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91232065F
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 19:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eupqY2KT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732317AbgF2T1u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732754AbgF2T1t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Jun 2020 15:27:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34999C031400
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2020 09:59:54 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o22so3223118pjw.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2020 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ipBm7l0xCbDF5JmnRDA2GTE5VaA4tfJ0uNXAyKG1p0=;
        b=eupqY2KToj+52e4xOEpy2/OjhFxemonGdyxvP/iXLGcaguOqjgfmj/m+w5DeiV6uoq
         r6tbJ+gbaP0+3uyFxbO699ihdsXnDMbF8/d91ie1ZN1reMKJxWlbgKHuC5F6CR5RDGT6
         3i2fi6J4FOyNTZe0JT9OYNGRisQF68FcQ+W9d9+vpnqscmmIsu6uQ0V6e6ON+aDAJJ1X
         ZlHVem7OpgVdNiyf3lcekomsUyWDQtaJoqZwyMZjPpgvMeAvAo8m/64Z0P0eBYbGtPxq
         YaXvVMLZv8uYEO+AetnHKR/5rh5pX4TCvzURWD4R46or3tkGT8P1V1OyWR12V8ImmsIY
         u/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ipBm7l0xCbDF5JmnRDA2GTE5VaA4tfJ0uNXAyKG1p0=;
        b=Jg8H7rXpHdXbXaDJ6lvP/uMhG5P/RcsUlgByLsQu7DBN1tJhAvxlqP08UO17fgZRlk
         ZBjxEViI0fT5+NtsmKaENXJz6HhR73NL1DSL7LH7pvATiEfqF3SfiZodDPBNruIiQ4HQ
         8flb1Yqg0U6zJv4BmG1lF1i5FS3qAzkB8b+flzvUtLDoQs9kFDH1wMQfURA7/zcxNJRa
         l261SKs5nKWSDkNqe7JiAekzAyd8UV7IjzNOo96zM7h+4Vy1rOMyciBS+qsp6K5vMIyH
         zznJb55Uq5Mk1w4tdyfOUDyThGS4juQvMnjjxkPlqzB1a1V6fL2ikdOqGeQVBD73/xZ+
         f+bw==
X-Gm-Message-State: AOAM530t9OJLVJmNVLs9ua1rjyxLToUPp41+Fjgjs6wXB80dysB4GpXP
        uSBwtyE/USA4bxMv2p1cPNMMUgFW
X-Google-Smtp-Source: ABdhPJzfTl3WkyUZXrj23Ar+Nc47uqStlzYySnhgn01oV/VXUZh5XONKBEMRHXL13RROwV+OsXaGUw==
X-Received: by 2002:a17:90b:705:: with SMTP id s5mr11698438pjz.11.1593449992472;
        Mon, 29 Jun 2020 09:59:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c27sm232096pfj.163.2020.06.29.09.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 09:59:51 -0700 (PDT)
Date:   Mon, 29 Jun 2020 09:59:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     zlukwins <zbigniew.lukwinski@linux.intel.com>
Cc:     jae.hyun.yoo@linux.intel.com, lukasz.tuz@intel.com,
        linux-hwmon@vger.kernel.org
Subject: Re: Maximum rate value of input power for pmbus device
Message-ID: <20200629165950.GB113813@roeck-us.net>
References: <ddcb240a-5444-ba46-ecdf-70350d27125f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcb240a-5444-ba46-ecdf-70350d27125f@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

+ linux-hwmon@vger.kernel.org

On Mon, Jun 29, 2020 at 08:31:11AM +0200, zlukwins wrote:
> Hi,
> 
> 
> I am OpenBMC FW developer working currently on some power measurement stuff.
> 
> I would like to have maximum rated input power for pmubus device available
> in hwmon sysfs. This value is read by MFR_PIN_MAX command:
> 
> /MFR_PIN_MAX//
> //The MFR_PIN_MIN command sets or retrieves the maximum rated value, in
> watts, of//
> //the input power./

Interesting typo in the PMBus specification. Yes, it really does associate
MFR_PIN_MIN - which doesn't seem to exist - with the maximum rated output
power.

> 
> And I wondering which attribute shell be used to expose that value in sysfs.
> I went through documentation
> (https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface) and found
> the following:
> 
> power[1-*]_max			Maximum power.
> 				Unit: microWatt
> 				RW
> 
> But it looks like it is already occupied by PIN_OP_WARN_LIMIT.
> 
> Maybe new attribute shall be used? If so how to call that?
> 

None of the standard attributes reports (or is supposed to report) rated
values, so we can not just use any of those.

Also, we can not just add a single attribute to handle this situation,
for the simple reason that there are many more similar attributes.
PMBus specifies (this is from version 1.3.1):

MFR_VIN_MIN
MFR_VIN_MAX
MFR_IIN_MAX
MFR_PIN_MAX
MFR_VOUT_MIN
MFR_VOUT_MAX
MFR_IOUT_MAX
MFR_POUT_MAX
MFR_TAMBIENT_MAX
MFR_TAMBIENT_MIN
MFR_MAX_TEMP_{1,2.3}

All those report rated values. I do see the need/desire for reporting such
information. The only real solution I can see is to add a new set of
attributes to the hwmon ABI. Something like:

	currentX_rated_min	# for consistency
	currentX_rated_max
	inX_rated_min
	inX_rated_max
	powerX_rated_min	# for consistency
	powerX_rated_max
	tempX_rated_min
	tempX_rated_max
plus maybe, for consistency:
	humidityX_rated_min
	humidityX_rated_max

Those would be read-only attributes.

Thoughts, comments, feedback anyone ?

Thanks,
Guenter
