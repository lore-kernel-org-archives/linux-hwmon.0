Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350A6C388F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C51BB2225D
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="M/ZWOhl0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgKMPJf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPJf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:35 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB2CC0613D1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:35 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id s13so8764729wmh.4
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baCErcbE3soaUBy5li1RWE5HHwEvUnefLnc3iQT2Mb8=;
        b=M/ZWOhl0Ik8AUmBNDlu0cE2r3Mn3CdeH3zMUw6DcrW14qGTpky9w1G9GAfLWgUYIsY
         gIStj3CYm0aFmDqq7BH+ZQQc9sadinouoGaJvAMhXHDb/wQOWM1okQLiED1ZgwvXj4+H
         K7pLY1UTEXIFpcxR+VzUgdDoGvGfVVGxPI2N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baCErcbE3soaUBy5li1RWE5HHwEvUnefLnc3iQT2Mb8=;
        b=czpi2ApczfpvMjZ78uBXpHA8w1ebq4VjrAs8P4oPYJfcYvNVP+4lBkqzDOtBzzIgp8
         R0Y0Wc1zjwKTrtzoXiWT5XlZsYodpPZES9xKjDArz29OCtWlAJT9ZpbM8NLSKs+SvBaC
         Tf3UaotkLg0LPT0sJo4tSWqdWPSWhONYhanyntqoXp0sUcbAdhirD7QudMeXPsc2Y8xZ
         NX9KLgX4PQx7pm4pzYrmJR1puQpwU8jJ8sAkdHfz4sf1dH9pzmMw13Ij8XCmWWkMzavM
         zaq7ckqOWGJLcRuSQFLG/+RwBbqQ+9g7KqNri8BJOFMQd/mq4KxFC7WKBIphwV5vjwx9
         BM0w==
X-Gm-Message-State: AOAM5314EHeawGajVrkz+9Tw7HX3r25Df0MndFsbZ83uXmb21m7pgI5t
        iNmdQOldAaQ5/j+FwXW9xal7kA==
X-Google-Smtp-Source: ABdhPJzQ0GGjHv7EEj0M59PHz6hdsdcC3OF8QcEPbtaOtN8kJ0q7IqaTIBKi3YjnvgZrVZiW0nH2xg==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr3161440wmd.12.1605280173249;
        Fri, 13 Nov 2020 07:09:33 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id v2sm11368221wrm.96.2020.11.13.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:09:32 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/4] pwm-fan: Support multiple tachometer inputs
Date:   Fri, 13 Nov 2020 15:08:49 +0000
Message-Id: <20201113150853.155495-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These changes were made to support a custom board where one PWM output
is routed to two fans, each of which has a tachometer signal routed to a
GPIO input on the SoC.

As the custom board doesn't currently support the latest mainline kernel
I've tested these changes on a SanCloud BeagleBone Enhanced using an
oscilloscope to check the PWM output and a signal generator to simulate
the fan tachometer signals. I've tested variants of the device tree with
0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
probe function is correct.

The device tree bindings changes have been submitted in a separate
series:
https://lore.kernel.org/linux-devicetree/20200920180943.352526-1-pbarker@konsulko.com/

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-hwmon/pwm-fan-tachometers-v2_2020-11-13

Changes since v1:

  * Split RPM calculation fix into a separate patch which has now been
    accepted.

  * Break the changes down into smaller patches so they're easier to
    review.

  * Rebased changes on hwmon-next.

Paul Barker (4):
  hwmon: pwm-fan: Refactor pwm_fan_probe
  hwmon: pwm-fan: Dynamically setup attribute groups
  hwmon: pwm-fan: Store tach data separately
  hwmon: pwm-fan: Support multiple fan tachometers

 drivers/hwmon/pwm-fan.c | 155 ++++++++++++++++++++++++----------------
 1 file changed, 95 insertions(+), 60 deletions(-)


base-commit: 414920a4a5d5613e4aa77c89944f9c1dc86b06c4
-- 
2.29.2

