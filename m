Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24E3C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E9AA20795
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="rhGeC6hg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbgKJL3B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 06:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgKJL2w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 06:28:52 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB14C0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:52 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so2652934wmd.2
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2EziOOsEap8Moamv1P6cOC+MsPpUizuY4V0WesjnsA=;
        b=rhGeC6hgRXv+4h+ZPZTX7pR4LHGQkHu67hjKJkQcIkMe2+TqTTiOBuT8WbdqJBZv4P
         z554CXIyrdl00ne3Ee+arhQOwg3ozFpiq4CSuv3q9tUvIQyhG+Ab6yts6BvwBs+Q/reO
         hDuStzDP6rhgLn3pnW7n2cgDpejKBrRo26Ze0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2EziOOsEap8Moamv1P6cOC+MsPpUizuY4V0WesjnsA=;
        b=NfqevCgovkFv0393Vx6VEUztL0UG388FcngaQiy5I3UuGRGpvnSfh+xYfl1JIpbeML
         XucTnVQkPOAfo7V/79vSU5OmcLglYAChKMcmoyndcI7neGPDRyYHQWRpv12YDUBk7vtN
         7hFO4BuOcz/gCFNLE2m1+08hErwRfFNcmqSzYxonl54QymF31grNo9yF6tpv13VYYXgt
         gKWuD4VzZmohiaO1UlC6GIZt588VUvH/jND3IV8YNcp9yH+h52PgzKocC6QQkeMOfgoH
         XdhdmosaFMvglCwTqLGlvbIu94M7dnSBjK+SV8Mk2iAB/94ORRG3A8LH3Gl7dFsWNzsv
         R3DQ==
X-Gm-Message-State: AOAM533hHZIQkgG8LuUfLa4YDpGcZn4JkILU5jUGxZqJMCQ3J8OlbjFh
        147q3mzIWJzwPO13lB90QQYDZQ==
X-Google-Smtp-Source: ABdhPJwh2kKcxRo+kKq/cdSMB685jXTNsZ0og8YuBgocIcCkEnxFI3sdUZzasul43Bvb7stF5ujsVQ==
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr4159785wmg.93.1605007730803;
        Tue, 10 Nov 2020 03:28:50 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id c64sm2575608wmd.41.2020.11.10.03.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 03:28:50 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] Fix RPM calculation in pwm-fan
Date:   Tue, 10 Nov 2020 11:28:15 +0000
Message-Id: <20201110112817.52549-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix inaccuracy and inefficiency when calculating fan RPM in the pwm-fan
driver.

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-hwmon/pwm-fan-fix-rpm-v3_2020-11-10

Changes from v2:

  * Handle the case where delta=0 to avoid potential divide-by-zero
    exceptions.

  * Store a device pointer in pwm_fan_ctx so we can print an error
    message.

Paul Barker (2):
  hwmon: pwm-fan: Store device pointer in pwm_fan_ctx
  hwmon: pwm-fan: Fix RPM calculation

 drivers/hwmon/pwm-fan.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)


base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
-- 
2.29.2

