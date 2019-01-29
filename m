Return-Path: <SRS0=NJdv=QF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2682DC169C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jan 2019 21:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D90A02087E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jan 2019 21:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sweptlaser-com.20150623.gappssmtp.com header.i=@sweptlaser-com.20150623.gappssmtp.com header.b="wM1NavwZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfA2V3b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Jan 2019 16:29:31 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:38128 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbfA2V3b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Jan 2019 16:29:31 -0500
Received: by mail-it1-f193.google.com with SMTP id z20so7005374itc.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Jan 2019 13:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=jyGeuZdc33uN3Y2UHU7KUY8NrBL/9m1Ao71O/HzCaGE=;
        b=wM1NavwZOrfvMJjQWqjBkM+xRasHVLFyPGWDDCIDqEbUlIG5MTppDx9Kc6jDcjcAyr
         ioJStNW8mHzgBIUvOWOmwIsIaZPEeEjTOxXgWzzYbxuroVs8wFUTVzpbesrX+jWAyeL2
         P1GA9TR6Qw9KUrZ92cnpwjrOYYWcFUIunYTbEPB44B9tHZUc6EoRaCrAnFblAzFKz4Vn
         YuAme6fccf6fe5y8gTyguNfGtRtlhDye9hS9VvBprsp+jI504qL4ULuqwgEUu8zM9+xm
         pFAxC8HNd0Tpb+pQt7jMJPqGG1Cwqq1r8iMyi7FqBhg9wSznKKBRBGqqSCfeespJRthS
         XrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=jyGeuZdc33uN3Y2UHU7KUY8NrBL/9m1Ao71O/HzCaGE=;
        b=gwir3Dez2nr9C0v6e6Vts7Q0YUzSzJmgjYfQ2LXxEiPm1CNcqUXhnWk6KIAGiPqmDN
         aGc1qMOMd1AhqCkrBlGt0q6e2r8Ii76tRzxmFidSJEFbCMR9bBQBtkzXnmZWRURxKA9F
         Cs4eVeFsWDXUrv1yU393/KeX1Urd1xDCPhcUbm8ilYSVfZOUqkq2vykjv+ZFCpMc9pU/
         URqvBQYoowxeiYAbjwcmrWsvHgAeuhBO186zbyztaAt5oxHYvAPWVigMXqcZfrD5+ERl
         wZkrwaT1h0kMVOZ4A3k4afe81L/8PoiiyDuLrnO8RVkV09vd9nbUz5JCVWRVYVdrOlpH
         4uHA==
X-Gm-Message-State: AJcUukdUx7gdsD2p12+lz99nX0uVgw7PYsBCTxoVlrqVwdSQ6I0o01//
        20yOoNfVzOYOJKkWkQHLSAm+FQ==
X-Google-Smtp-Source: ALg8bN7HQ46tFTjavDwgXDr7N9rbhp/wahuFvv6g6da6slw6MOYbVqku1Y+7WUxGEvXjEv7r/yjbiw==
X-Received: by 2002:a05:660c:a50:: with SMTP id j16mr12631034itl.52.1548797370380;
        Tue, 29 Jan 2019 13:29:30 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id n16sm14787776iom.58.2019.01.29.13.29.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 13:29:29 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: (lm85) add LM96000 high freqency pwm support
Date:   Tue, 29 Jan 2019 14:29:17 -0700
Message-Id: <20190129212920.27921-1-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

This patch adds support for the PWM frequencies from 22.5 to 30 kHz
available on the LM96000.

It looks like this chip has been supported for a long time, but wasn't
mentioned in the docs (which I have updated).

Also, it has been using the generic 'lm85' prefix, which I have not
changed to avoid breaking userspace or device tree files. AFAICT,
lm85_detect() will only return 'lm85' for LM96000 chips, so it doesn't
look like you can get a bare 'lm85' prefix with any other chips.

I stumbled on to a 10 year old thread discussing a patch which looks
like an early attempt to add support for this chip, which may be of
interest:
https://lm-sensors.lm-sensors.narkive.com/1SIwaMDT/patch-hwmon-lm96000-support

Thanks for reviewing,

Jeremy


Jeremy Gebben (3):
  hwmon: (lm85) remove freq_map size hardcodes
  hwmon: (lm85) Document the LM96000 as supported
  hwmon: (lm85) add support for LM96000 high frequencies

 Documentation/hwmon/lm85 |  9 ++++++++-
 drivers/hwmon/lm85.c     | 32 ++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 11 deletions(-)

-- 
2.17.1

