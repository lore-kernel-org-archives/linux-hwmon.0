Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59549ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 10:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiH3KEt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiH3KD6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 06:03:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7110F61727
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 03:02:00 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z6so14784013lfu.9
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=c6qafmfYY6lQC4Y0+wZr5Ybx3Q7TmzLJh34bfJvmCdI=;
        b=Ok77HrRnMhSaGYWq/8pRsZBHzp7PAYMdXHsIHQ9Wy4uZWFH/yY3zg1Y5tZbF3KFfVp
         pOMD3ULLmkpicTKMXrdcEQhVwlipMgy4NP4SvVVtF1pgR6svywEvlOuEkUhXEAHCItFs
         youFgtIMSrwuwGMRkGRQW1IfaDuEPg3/BLy8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=c6qafmfYY6lQC4Y0+wZr5Ybx3Q7TmzLJh34bfJvmCdI=;
        b=4G+UMNve0nxi17a0onGfOlM7j7lWPFhhYZa0T1gJYxsyOMDZ68al5569dhg8qecXz/
         Lx9zYgdwmxu8bnVI5dKhAfUQ0N9hm2rZGzz/JTFhUEb/QhJORv0gjL4rbEkQ29V2Br0a
         sPhtHpSOqtfTLcKbtlfknxnOox+HixAmDNrUjwJiwlN4SQaTtWgfD5UPemob5kTgNOG0
         n+z9MpToz2vXlhM61mAGUrhHtDBUrgTso7+VP+QanYLhJVp/SjjJ0Iz+GMDwrXLEwh2h
         +AG/6Jw0mrgVPJhad8/3V51WBY8TazJ/q1u1jV5sy87QTnScGaXckLavzAlu6hyRfP0u
         zHFw==
X-Gm-Message-State: ACgBeo1oGtBCCA1GMtn+5pi4YJus/OvojYZpvaAJWfPqk9NFfC4K+Df0
        dnk8Mv6L87iW9uhel3NH3XtLWg==
X-Google-Smtp-Source: AA6agR7cToP+DF+pA85UXzrPeuxMmB63NydDTabiisThD2OnK4ZcXHq1oCvWh0VUyZ5O6j/UEQyzAw==
X-Received: by 2002:a05:6512:12d3:b0:493:187:e34d with SMTP id p19-20020a05651212d300b004930187e34dmr7204052lfg.402.1661853718784;
        Tue, 30 Aug 2022 03:01:58 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b0048af6242892sm1573435lfg.14.2022.08.30.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:01:57 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/6] rtc: isl12022: cleanups and hwmon support
Date:   Tue, 30 Aug 2022 12:01:46 +0200
Message-Id: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series does a few cleanups of the isl12022 driver,

- removes use of deprecated function
- removes some  redundant code
- switches to regmap API instead of private helpers

and finally hooks up the temperatur sensor to hwmon.

Rasmus Villemoes (6):
  rtc: isl12022: stop using deprecated devm_rtc_device_register()
  rtc: isl12022: simplify some expressions
  rtc: isl12022: use dev_set_drvdata() instead of i2c_set_clientdata()
  rtc: isl12022: drop redundant write to HR register
  rtc: isl12022: switch to using regmap API
  rtc: isl12022: add support for temperature sensor

 drivers/rtc/Kconfig        |   1 +
 drivers/rtc/rtc-isl12022.c | 195 ++++++++++++++++++++-----------------
 2 files changed, 107 insertions(+), 89 deletions(-)

-- 
2.37.2

