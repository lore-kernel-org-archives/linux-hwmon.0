Return-Path: <SRS0=QRh7=ZW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B73C43215
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 02:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B249324649
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 02:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoANUg0e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfK3CL0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 21:11:26 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46575 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfK3CL0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 21:11:26 -0500
Received: by mail-qk1-f196.google.com with SMTP id f5so8848546qkm.13
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=kkHE6WkNb9tafXn7nAFEDzDmbwdGeyFPfTCVaL58wNQ=;
        b=IoANUg0e4Ef3rMDdCcb6x69tmC95n0kXSTHIi6/31Mo970L2F/plyybWROOoMM37ms
         auXL4pR+XpkOml9tVSN32ksPcfVeygGK7/7mb+syjYAM68DjVpCY1YeZCbqM4/xOKDCJ
         KoSiHLwF+Nf/TYqLW3jTJe/Ao/5GG6Ys3IyX0v8VuInEkkLZ5n9Py7X8oiX8JFYtbrOd
         QYoNA0V5nVKQuyhYJPnxeeXJj5eZYnfTHUfjVz+6IOQiCEEH3p6PftCftbTfGLRnsGsK
         7sxjBxJseUssvrwf4prfPADuuuDqPMjtcS//eByJlxeoxvJzbfRQVw8ar/E0YFzZ/7q3
         hLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kkHE6WkNb9tafXn7nAFEDzDmbwdGeyFPfTCVaL58wNQ=;
        b=ZbZJyom19KOavFD92QVX5q1wXKKURohWE4hjaz/39Adpycre+MDsTXIscJbmoc98Il
         LcUZtb6EOCX/pOMpqDnfBKgaQ7tKMQzzd8yevjX81vhM2aZbQoD4lajpVZuuRZYZehH4
         Tg4P5cxfuXcGwuVQNpAGihpM0sWH2xh2ihbU42KLGHGwiwzIzoEdcHux7yGAo4kRfsb3
         RooY1tTQbraUSvrBZUHoNO0sqvvDHROhcElGR9WbbuLbFBDwEm3Z8ccDDh8lE0aMsdD7
         90Iss+XPyZs166nCxUpuBZESxqs+t6ivOz2Ebx56QPvPz5SqoMJGi+F/S2oXOQHiZK3u
         HMVA==
X-Gm-Message-State: APjAAAWEJkINooBd+AyTVdsYG+erIi558F3N7yvLD6Wsj33g6leugTLb
        j6igdIVTFbdDwSWjWG039boEoUhho8ckGggWKA2eEdOp
X-Google-Smtp-Source: APXvYqw98qwBRc5HZ5wyoCzOSg//M3vRJ039u8a/5E+Bg87CRlAQjSZ00GC24lxlw5zU8xx7UfnQiGyIvZFwUU/D0WI=
X-Received: by 2002:a37:7cc7:: with SMTP id x190mr16957463qkc.10.1575079884697;
 Fri, 29 Nov 2019 18:11:24 -0800 (PST)
MIME-Version: 1.0
From:   Corey Ashford <yeroca@gmail.com>
Date:   Fri, 29 Nov 2019 18:11:14 -0800
Message-ID: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
Subject: [RFC] hwmon: add support for IT8686E to it87.c
To:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello folks.  I am running a newly-built system that uses an IT8686E
chip.  Currently, the latest kernel from kernel.org doesn't have code
in drivers/hwmon/it87.c to support it, however, I found some source on
the net which has added support for quite a few more variants of that
brand of Super I/O chip:
https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
I tried it out by building the module and "insmod"ing it into my
running system, and it appears to work fine.

It seems the original developer had a difficult time pushing the
changes upstream, so he abandoned the project.

My thought was that I could add support for just the IT8686E chip as a
single patch, and since I can test it locally I would have a better
chance of getting the patch accepted.  The changes to the source at
the above git tree have quite a number of changes that aren't really
necessary for supporting the IT8686E chip, so I think the patch could
be pretty small, but will still credit the original author.

What are your thoughts on this?  Is there a better path to go?

Thanks for your consideration,

- Corey
