Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9DDC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3D02214DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDG0aKwB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732981AbfDRUuM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:50:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35658 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbfDRUuM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:50:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id t21so1640253pfh.2
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eY0B77Ij71z2STg1ehuIorlFukLPkjJFDkpwcEfxkxc=;
        b=JDG0aKwBTt2mHnse3x9uOsh7RrKx/376gQIUKUX0dNg7WwLzQItAtYFFcGg0APMMtw
         1m1SSVlH52qArOApJ+IzlaGF+9tnLDP7GC3CAYCBPyOHiZ4MFA+pCmOkXqKKlp2JIL3a
         +GiiBay0zXu0LI+eevGem68wY7fNhxdv50k9nTyHxary+Xj3l7YxKywROpTqnaviGDU3
         D7EFBrCvyStPKxFbqvEoNkQRfkCjGonNb2ipaodb1Bk+ffUloiQQS1iklIBbSIxV+8jy
         N2eOY2S8wK0HLIQEQXbvckE+A7HScqb+n+sAP2fv3lmW2EbR8e9QeaLYngY75uRafyNv
         IeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=eY0B77Ij71z2STg1ehuIorlFukLPkjJFDkpwcEfxkxc=;
        b=K1InaXeItGEknL6Fs5lZ6FA2K/WJHuYQPu1WUlQ2UzEDJfpF+qTXqXREVUdDetkGX3
         z6RPD82dQpZB56k32wBH4h5obHBOz8fm+vnaY69aKJLQQANfuyukTuTUtcE1d5Pkz64m
         PRW0FVBcCOt2c3wP/Aaw38PzLSEo3w31dNe0cavRzcTrWH/cvVDABz+A2kyuYgq3V1ep
         zGWx71nkP+R3Rpaau2/vOQA3cv/sgu3FkCJ6QkmOHB8FAn3yzn8IbR/LMJmDN9qZrnoY
         fYu9H9gQIi1NRopF9PF5VtyexaNprf7XaL5/6cLwNBS3pzkikn6rF31tSyCWvji/FH+J
         vPVw==
X-Gm-Message-State: APjAAAVTW147g0QJmqk5Vrr+VOQMl9QWBMEMdWBiHuic8dpzqyXjmROm
        BVGa1OopGwHvQQLaOHtuG6Q=
X-Google-Smtp-Source: APXvYqy6LNgAwiUQHeF5EOBFAowv0xBvHemnvSmM0z0wPNhGv0ip/eizUG84nq/M05ueVGhXhQoAJg==
X-Received: by 2002:aa7:8c84:: with SMTP id p4mr99344484pfd.164.1555620611217;
        Thu, 18 Apr 2019 13:50:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13sm3434889pgb.37.2019.04.18.13.50.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:50:10 -0700 (PDT)
Date:   Thu, 18 Apr 2019 13:50:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418205008.GA13496@roeck-us.net>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
 <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418201208.GA10459@roeck-us.net>
 <A7D38D52-8643-481D-AE6F-5F61DBE04108@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A7D38D52-8643-481D-AE6F-5F61DBE04108@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 04:39:35PM -0400, Jean-Francois Dagenais wrote:
> 
> 
> > On Apr 18, 2019, at 16:12, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > That explains why the other drivers don't generate an error message.
> > You might want to reconsider the dev_err() above; it appears it adds zero
> > value.
> > 
> >> If I am wrong, then pwm-fan.c should also be visited since my max6650_probe code
> >> was copy-pasted from it.
> >> 
> > 
> > You are correct, that should not fail either. But two wrongs don't make it right.
> 
> So you think any fan chip driver probe function in hwmon should succeed even if
> (devm_)thermal_of_cooling_device_register fails?. Mmmh... perhaps I am missing
> something, but I tend to disagree. That means that for example my system boots
> normally without any errors, yet the thermal-zone I defined, which is there to
> prevent my system from burning out, would remain incomplete (without required
> cooling device) and yet no errors came out of the kernel.
> 
> I just tested it and that's exactly what's happening! Yikes.
> 
You would still get a warning message. Better than failing to load
the driver completely. On top of that, this used to work before.
Plus, you said it only happens in severe situations, ie if the kernel
is out of memory, and in thact case there would be a traceback.
Sorry, I don't get your point.

Guenter
