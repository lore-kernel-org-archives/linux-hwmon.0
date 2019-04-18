Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDCDC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 22:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC4DD205ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 22:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie6fJbev"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfDRWCO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 18:02:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44046 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfDRWCO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 18:02:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id y13so1687616pfm.11
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=18k/Om8h1qagM+YGm2gJEYER3fXE8f/30rhXHPwMtxM=;
        b=ie6fJbev3T7B43yHm3Zew814t16/tBXlRZO0NskZk3NGFJ5Eu/sZRNDQIJbxMXZv1V
         +EjSFKDYO9gSzKrqquoshfcw4beNTXv4vmO9q32cOQ2nYhqmYlTfZHqxNihH3yUo2Skw
         JfifitPCSfIvgKOxXzOUE35reoTH8MN7NH3L2Z4eDo4YsvENyjVlcXbyMOqHTJqottBf
         UzjfRxB8i5nKa0SPWCRIU71A+DR0Vxq6jsuLV7mrlXUlrordB/V+gnC0ersGTLRvHYzU
         lI6YtdAzNJByej6W+lja+Fok3QXbwsruYHxFUyTIMbIlPu2M2G7sHZ9yEGhLIlgOphDQ
         tspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=18k/Om8h1qagM+YGm2gJEYER3fXE8f/30rhXHPwMtxM=;
        b=lsjjduuSKC6zBOLLsgaEB5fWok3QcRtAWXZ784pfXShqkH/+OcNnf6TCIw/usYbGxV
         KT45Ki7Y5NmFedO0ZB8pbf1FiEq7p5BBvFWR4L5h8aBIvtliaTpFxk5iBLkqbnQKZ33H
         u0NcVkI75tT/wypbLcaSGHCiN011eznxodTB35Q1d8ngH20HQwcmKHde1DRM8YfsKfNA
         fM9UYdg180RCIRcIAI4CP8PkkqCtLSLyDZhrwpGYvvmknhPuy9i0lMgIXArxQ5J43nAn
         2ZGIayG4xg5AffscKiZamBZGdA0JXy5NZltv3HhqzbY8HKUFSCYsS9B+e7vdsgV34YdK
         9psg==
X-Gm-Message-State: APjAAAVQvWiynwX5PbEb4tWoM/I3/FjqnkbF4aYQ38m5rn/K0hJvki8g
        ZgOvomCDqxyU3gvDHmoljNPvCJpU
X-Google-Smtp-Source: APXvYqxhK2T1zWZFDEXF2tJehH4n3xlOkzGC3liVIyT+yPQVGzkEU84wRkDlQUklkptUumIje2YeNQ==
X-Received: by 2002:a65:424d:: with SMTP id d13mr311599pgq.318.1555624933386;
        Thu, 18 Apr 2019 15:02:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l184sm5663448pfc.98.2019.04.18.15.02.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 15:02:11 -0700 (PDT)
Date:   Thu, 18 Apr 2019 15:02:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418220210.GA17561@roeck-us.net>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
 <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418201208.GA10459@roeck-us.net>
 <A7D38D52-8643-481D-AE6F-5F61DBE04108@gmail.com>
 <20190418205008.GA13496@roeck-us.net>
 <41DB8327-5AE7-4A57-990C-02A94FFEFF50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41DB8327-5AE7-4A57-990C-02A94FFEFF50@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 05:33:13PM -0400, Jean-Francois Dagenais wrote:
> 
> > On Apr 18, 2019, at 16:50, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> normally without any errors, yet the thermal-zone I defined, which is there to
> >> prevent my system from burning out, would remain incomplete (without required
> >> cooling device) and yet no errors came out of the kernel.
> >> 
> >> I just tested it and that's exactly what's happening! Yikes.
> >> 
> > You would still get a warning message. Better than failing to load
> > the driver completely. On top of that, this used to work before.
> > Plus, you said it only happens in severe situations, ie if the kernel
> > is out of memory, and in thact case there would be a traceback.
> > Sorry, I don't get your point.
> 
> Ok, I see. We're having the same discussion than on the v3 submission then.
> 
> If I change the dev_err to a dev_warn, but still return 0 on
> thermal_of_cooling_device_register failure, you would apply the patch. It sounds
> like a compromise.
> 
> Completely failing the probe call or partially succeed it results in the same
> behaviour for thermal cooling use cases. But the dev_warn definitely becomes
> important though.
> 
> I will v4 with that if you agree and leave the devm_ thermal register for
> another day since I agree the series might be delayed too long (or
> indefinitely).
> 
Ok.

Guenter
