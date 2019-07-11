Return-Path: <SRS0=3Vjf=VI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC26C742A2
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 22:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F4D820872
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562884031;
	bh=tQFKtoUGZDUkBNVo9Jg231OrdTcR/F6eH+PiMlkNLx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=HyjZ8OuKITpJn3ipSgaqf7Xqv2XApu6qNJKyqPLN5PpOQbgl1kFR1y562pXNGMfDD
	 v2I0ygMMBc800D+++wNFwyBiH3YdMwQr1G2HLL3XJ3gD8u3LJtcDhPXJAKVLjifqFy
	 IBKYaP/dQ+pTAnI3lyz7+rghI1L3M8b4SwIG1X3I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbfGKW1L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Jul 2019 18:27:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45663 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbfGKW1K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Jul 2019 18:27:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so5093007lfm.12
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jul 2019 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8EpXie+ptmasVVNdO8s7zWM0edWI+2s7AgvaLi9GlkM=;
        b=AchHtqaoZUJyesaLgpDv5jgEPOgym/QoazHvg2D8ktNHn0YGKOl1SymrQeoIlsdS4O
         xEpD8sp181zYoV3+9XKNaeRqflFVPpanXlK9/k5ZGp/P8u3USwHYx841H8aVaW1RS8Et
         64istFrP3hmxKs7rTJCuBLgjzCmF5myPsmmSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8EpXie+ptmasVVNdO8s7zWM0edWI+2s7AgvaLi9GlkM=;
        b=RGa/htX56TMr7iiesU7hbdso7N0ZctRGaCIAPhDEJweIvmhOpRKfgUBLoFKdO6zxUe
         jVy9Im7j9HbJGQ/6KWJwfVjGBaFzPLYG9+lq/HJiY7J2pdXTNph54W51ALuJTVw4g474
         vv/bL6TH6cTpVVjfyIh2JKZXpExWHfkk0KZPZGfyFe7IToEfx9z0G2xrlEOtVCaxz+HH
         72nubKnjMeh8bC/2Yzl9CteRNwn/hkAxPG1yeKFbZjtg1peM5EoRfbPSYYd0epmgsFkd
         RW05GpXylTcpaqFG+tSk0r0fLpaXJLNZFp8hHbPk6UPPZF1Sz+so+1jxjKpA+5znzBsK
         iOKQ==
X-Gm-Message-State: APjAAAWlIwekwQK5agqSzCp4+Qb2upEy0XvnWlbe7darTPBd5JMwGQGX
        KCFXnjK/Q94A0pYDtJ0WKiQKwxcKmqw=
X-Google-Smtp-Source: APXvYqzZkFItrm0k0x2wHO2kGBfPCOnaix2LvLDmZkHT5tFBs82CBbX2K68zxqHJx8QSikzMrq7+Wg==
X-Received: by 2002:ac2:5601:: with SMTP id v1mr3066348lfd.106.1562884028453;
        Thu, 11 Jul 2019 15:27:08 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id v22sm887459lfe.49.2019.07.11.15.27.07
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 15:27:07 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id r9so7389727ljg.5
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jul 2019 15:27:07 -0700 (PDT)
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr3907527ljj.165.1562884027307;
 Thu, 11 Jul 2019 15:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <1562696588-26554-1-git-send-email-linux@roeck-us.net> <20190711221948.GA16140@roeck-us.net>
In-Reply-To: <20190711221948.GA16140@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 11 Jul 2019 15:26:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4B5D2nd66iqCTzbY9bhtDn3WxpZCNc4hM9zOL+iJGBQ@mail.gmail.com>
Message-ID: <CAHk-=wh4B5D2nd66iqCTzbY9bhtDn3WxpZCNc4hM9zOL+iJGBQ@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for hwmon-for-v5.3
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 11, 2019 at 3:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> I have been sending out those odd messages ever since v5.1 because
> my script was checking for v4.x, not for v5.x. Oh well.
> Should I resend with better subject and text ?

I nbever even noticed any oddity.

As long as I see "git" and "pull" in an email that is directed to me,
it gets caught in my filter for pull requests. The rest is gravy,
although I'll complain if it doesn't have the expected diffstat and
explanation for my merge commit message.

The "for hwmon-for-v5.3" instead of just "for 5.3" difference I didn't
even notice before you just pointed it out.

And I've actually already merged your pull request., it just hasn't
been pushed out yet. It was just delayed by (a) my normal "merge
similar subjects together as batches" and then by (b) the 24-hour
merge hiatus as I was fighting my machines not booting due to a couple
of independent bugs this merge window that just happened to hit me.

                Linus
