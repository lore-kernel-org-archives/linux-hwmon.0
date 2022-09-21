Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB261C6FA8E
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 11:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiIULqh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 07:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiIULqd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 07:46:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D9191D34
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 04:46:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f9so8763164lfr.3
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PVynUZPTeDZvOWrl2DsqOeTAiiR8Z1VCqef0N17kBRA=;
        b=HoYTCsg8KkmNDgYwVfCqS5mwsgFGCQ9eUYjDfqRbglUByZ+Q2wIbXrRGdn4C2X9WQa
         eQwo90ETqZS5inSxJptZuB4KZRRtfHbk/1pPnmkZhtDuRoybIY3jG+OmGYFa6csRxNu0
         reei1M4idZ8rOekerYwvLNJuIIyt4RZP+Iulk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PVynUZPTeDZvOWrl2DsqOeTAiiR8Z1VCqef0N17kBRA=;
        b=AUNxRvVfssYjUjoMQEdnqg1scGYbrqsD8vt1jE6lqwTtwNtzO8/I+FvdlSQl/4mYYg
         tWs8nUhkyVZaTeAtfFXY0Dtcmk7fzy7muFz1B1wCHnK+W7/m/hyqdpiQ1/CJDsa22lFQ
         D3UwqD1TIt2iHU0zAnRwWuz1G4m01h21QPT40gdwSJ33CbOtx6MJ1vv9bvlDtWUWkFNo
         RnCg3BXDF0KgFE2KjhBjZcVasRgtQa+elN9YQ8X6VUKts3uIet1MhupStjsgTQdxgE/F
         +5AvH3YvTWDsINuEU8+GedPepdhSs1vPxImbAN46dJYxXNK+lPRaLJ9E5udHb2SmOEs9
         Zzzw==
X-Gm-Message-State: ACrzQf2Q9I90ebblXZTq9Sx/QBg8gQkdFWUYCHiM9JAxVhullDpgIspL
        loVkcnXY9BfqpXKmf2e5U0qmQQ==
X-Google-Smtp-Source: AMsMyM78ZuudZyneRMKz5lzq02tswtaF+BZuG4jff9Kcg31x6yedBHkEBZ8dz7R55jrUH37Ml90YHg==
X-Received: by 2002:ac2:51b8:0:b0:497:ac71:736a with SMTP id f24-20020ac251b8000000b00497ac71736amr10690217lfk.510.1663760790692;
        Wed, 21 Sep 2022 04:46:30 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:29 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/9] rtc: isl12022: cleanups and hwmon support
Date:   Wed, 21 Sep 2022 13:46:15 +0200
Message-Id: <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series does a few cleanups of the isl12022 driver,

- removes use of deprecated function
- removes some redundant code
- switches to regmap API instead of private helpers

It also provides range_min, range_max values and finally hooks up the
temperatur sensor to hwmon.

Changes in v2:

- Use devm_hwmon_device_register_with_info() (Guenter), and use the
  opportunity to also expose an update_interval with the constant
  value 60000.

- Convert some dev_dbgs to use %ptR, remove a dev_info() (Alexandre)

- Add patch setting range_min, range_max (Alexandre)

Not changed in v2: For now, I've kept the low-battery
dev_warn(). Implementing support for the ioctls RTC_VL_READ/RTC_VL_CLR
is on my radar, but I will need some more time for reading up on and
deciding on the details of what the chip provides and how to map that
information to the various defined RTC_VL_* bits. I also need to
figure out a good way to reliably trigger a low-battery condition so I
can test the ioctl support. So I hope these patches can go in for now
and not be blocked on the series expanding even further.

Rasmus Villemoes (9):
  rtc: isl12022: stop using deprecated devm_rtc_device_register()
  rtc: isl12022: specify range_min and range_max
  rtc: isl12022: drop a dev_info()
  rtc: isl12022: simplify some expressions
  rtc: isl12022: use %ptR
  rtc: isl12022: use dev_set_drvdata() instead of i2c_set_clientdata()
  rtc: isl12022: drop redundant write to HR register
  rtc: isl12022: switch to using regmap API
  rtc: isl12022: add support for temperature sensor

 drivers/rtc/Kconfig        |   1 +
 drivers/rtc/rtc-isl12022.c | 237 ++++++++++++++++++++-----------------
 2 files changed, 131 insertions(+), 107 deletions(-)

-- 
2.37.2

