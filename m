Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F89C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Nov 2021 02:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhKYCzi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234986AbhKYCxi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Nov 2021 21:53:38 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24841C0698CE
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:47 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f18so12217396lfv.6
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ChSQ7d46IS8qgYtRNkkoUhpzvfDCSo3Yh8HcvM7lKSA=;
        b=p45m2+JHUZ1s4yAYNd2WIDuteh7i3suYGqGUOQr6Tnn/HBl1+nV07bvNxRkemyiYiP
         73HpeXIF9pn8pL+kO9oj5zqgMwI79AcVb1Ou/xX1F9SPYPSY4esaq8tEDXo/YQZ6Tpdz
         5Mgva7G/SJHUSbhGHEf6tQbJemN1hEplXvr2p+lJ+G7fhmz3pxw123SChRtmI3xtZmiv
         ryvIjIqNSs/2FCeWXSVxvjGGOYvNJGtg6S8g2imiurBljXm+N5nFyuZok/6Bt8RrfEra
         vp9P/leQt85LtZhDa+dnTYeM3Vm+5Dd1glSgP2//YlNr2vuxqFh/dMhKkK2q6OD6kazr
         pG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ChSQ7d46IS8qgYtRNkkoUhpzvfDCSo3Yh8HcvM7lKSA=;
        b=ATcpqQgDMBkk+B9IDLh6kyD701YxbZZglomFDoufJExmmIXweok4zt7zWVxiCq600m
         wjp8xpuffEn5J4XgWkDGXRCJHOKQAk/NlPYBR7DcWoPI7mc95yhthoPgJp4HaAEHykUJ
         h+EDzb6W/erEAsTdL+sTBkQEW4WYJeXcQN5P03jNzMebejNRiBWGrp4BS6jjanimFOw+
         VZC0UEh0JdlUTpVx26Z0mP8kjMSDJ5cDxeOhZjT2GIA+16mTWdDWlhG0OStM/bUD4cRn
         NLGZ3nc00KhIe31BOaBJc3q1G6f9znVhwmOwT4JwCaKWNauOqPwDPCBHratzYMlkEIXP
         2QJQ==
X-Gm-Message-State: AOAM532ZCQoINHelL0dJ/e7r5EseEWbQCedCN8Fge2tRJX86AFGvBYDy
        Piu4tPBae5Ii282ECK6FMO/kbQ==
X-Google-Smtp-Source: ABdhPJzajQl3oF7+KbK7NGplC/RbRmgMSko2aGY9aV8sK0FmpIoKBI7DlCjYLWfl/pF2tNbMi7bBYw==
X-Received: by 2002:a05:6512:3b07:: with SMTP id f7mr20188382lfv.567.1637806245434;
        Wed, 24 Nov 2021 18:10:45 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m3sm132507lji.112.2021.11.24.18.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:10:44 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 0/4] hwmon: (ntc_thermistor) Drop platform data
Date:   Thu, 25 Nov 2021 03:08:37 +0100
Message-Id: <20211125020841.3616359-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since this driver was merged in 2011 nothing in the kernel
has ever used the platform data intended for boardfiles.

Drop this support burden: everyone and their dog is using
this with OF and IIO now.

If there are out-of-tree users who need this, this is the
time to start submitting that platform upstream and stop
working in the shadows. (This will invariably involve having
to convert the platform to OF (or ACPI!).)

Linus Walleij (4):
  hwmon: (ntc_thermistor) Merge platform data into driver
  hwmon: (ntc_thermistor) Drop get_ohm()
  hwmon: (ntc_thermistor) Drop read_uv() depend on OF and IIO
  hwmon: (ntc_thermistor) Merge platform data

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>

 drivers/hwmon/Kconfig                        |   5 +-
 drivers/hwmon/ntc_thermistor.c               | 148 ++++++++-----------
 include/linux/platform_data/ntc_thermistor.h |  50 -------
 3 files changed, 66 insertions(+), 137 deletions(-)
 delete mode 100644 include/linux/platform_data/ntc_thermistor.h

-- 
2.31.1

