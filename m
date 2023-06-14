Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EE4EB64D8
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jun 2023 16:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbjFNQg0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbjFNQgL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2023 12:36:11 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92251FDC
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:09 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-66643830ab3so899486b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686760569; x=1689352569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/sTLX4qo+doLCbLUW+MFtbtEIfVvjE8HYYbgfCM8QRU=;
        b=ACUQuZ15ThSgnROWvO9hnRijafc4ibNt7gMLEaA8y1quYxOHBjkZiqYzX7tvPJ0WGp
         z0X5scP7Adpr+FYo47zLUS4RvKGmM+VVv40up6DNooc0rsspx4clDOA+ymV9SU67pcFa
         3j/7FhbCBeCc7gI1Eg4YKKBVpNWIp1EWyoJl7QCCVlgbnwGk639p3J+ZVgaumQe4lFG9
         hPc3K6Qksvi2J6TcT9NP+0VSdWE0gIkLciG0p428rKu5xynnHR92KIMiVTGdT+6zuvjk
         duGEX+3P/wRA/X6W7fE++Pn0SMvjBJBD6TaRpVF8SjFOq3lM/VwDSEXXkXBFiibF5Xep
         rjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686760569; x=1689352569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sTLX4qo+doLCbLUW+MFtbtEIfVvjE8HYYbgfCM8QRU=;
        b=PZGIqMTD1ysWVndBB3vvClQcGhPux5o4+5qeDWxiv/PeRVM5kXEVZ0zWxptzkrg696
         ypB8iUD6UUOZl7/ivxGD2uO/4cIvJIt4yj4KbWlmIvxpRf4QuZ7YoBvQ/CNcmglL/NZk
         tiZIYKPVakBomUFIFNXloiI99Q9DRgWoZgQCR72fGfaqECISdKOS69HqrFyi1a9JdqQt
         2EvHc7mZt/aiS++MGtd3evPBqiuSzjwXtzWh3h53YtZQ939wQFVrwZJ8Kvzj5wy4apiY
         RICUgaHIheWhYIGjqhs9lcdPwCPtZUz01Zxcowc+/MiHuobxURP5A1dyAKuNRCw0NcYk
         qdTA==
X-Gm-Message-State: AC+VfDyo+N28VNt+9E3hTS4wu5MffwlfRxj5kE/1umT7hnnNtoO27kT2
        83+4Qvg30HdgR36e83er8l8L9oQxKBE=
X-Google-Smtp-Source: ACHHUZ5iE2uYg4FRtZoR+0gQkvaysYKACu+rfq3LhL87VNjBlPvMFZTCMD2GOMx2CiK+Ou6/oM0rTg==
X-Received: by 2002:a05:6a00:390a:b0:665:c700:54bf with SMTP id fh10-20020a056a00390a00b00665c70054bfmr2903552pfb.4.1686760568691;
        Wed, 14 Jun 2023 09:36:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78288000000b006328ee1e56csm10542212pfm.2.2023.06.14.09.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:36:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Arthur Korn <akorn@google.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [RFT PATCH 0/2] hwmon: (pmbus/adm1275) Protect writes to PMON_CONFIG
Date:   Wed, 14 Jun 2023 09:36:03 -0700
Message-Id: <20230614163605.3688964-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to ADI, changing PMON_CONFIG while ADC is running can have
unexpected results. ADI recommends halting the ADC with PMON_CONTROL
before setting PMON_CONFIG and then resume after.

The first patch of the series cleans up the code to prepare for the
functional change. The second patch implements stopping the ADC
while writing into PMON_CONFIG.

This series depends on patch 'hwmon: (pmbus/adm1275) Fix problems with
temperature monitoring on ADM1272' submitted earlier at
https://patchwork.kernel.org/project/linux-hwmon/patch/20230602213447.3557346-1-linux@roeck-us.net/
