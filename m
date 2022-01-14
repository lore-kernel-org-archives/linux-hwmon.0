Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B794C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243414AbiANQfT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243411AbiANQfR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:17 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A404CC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:16 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w188so12819556oiw.13
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akrMpU19OXDdHNyQMFBxyuOUFQYNjsWfLllPfdKrYtU=;
        b=WZrBxUoHwWb540YMLtvBbtF6gA8/yWWPB6imvZBzHIAOoBgcazp0P1h7aLUttuDIq7
         Wf/9oqATz2aEox5GANKEzIaTstpyKG+kxhNSYqtLC7oG5SUI3YoyiklANXQ0W7rKJu8h
         V5UcQs2Modo0JdGtoiFwnqsNrf6+vHpXXK8ssoD9llFDBlOLGsK+I9Gd5ct2awQrPZuJ
         W5w3/5hLw1CPBEAHWBs7TvLn7Smdnt6zRzZ+o58e8KeNtoQpir6c9mdfZHLM/SPj+UJW
         7U+Ia9JCiFAFerU21MtNqcGgw4AxjnWCE2BUxOjXd2dTxaRBBqn07IoZNZESaZwvwpxR
         aCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=akrMpU19OXDdHNyQMFBxyuOUFQYNjsWfLllPfdKrYtU=;
        b=mRR/aCKTkIoQbJxjTj+Iz8iDviROnZiiQd3UNxMJ6+ha5IqHVOL4jpviDGIU94REJK
         CHfps4NgwRm1vQQ13A2U9/WOOQTjRuSFvfLO1MtzUwJ+sAeEN6ez1fD3h+WICL9uqTZS
         hNyLElXUfw+SL7YEULm9KtddnR3Q9GH6I7nHQZ1/MLToix8vtZtcZEon9xiFvH6iDz++
         SFuLEmhZzMr2HW7yhWTBQ+zcM4KmSxWiybV9a1LcExdu+s4FF1KOdfsShITbRxMKCyTb
         2ns5GyVBAWHL5gZXmm+HIl0zEn4D+fEuYBWlAH7i6rlL2rS3h2nBBDiI5CIVyn4BWPSG
         xqWQ==
X-Gm-Message-State: AOAM531umdJGCC0CJFfNUUg7iMyY2xH38wbByB5bSNnzhfcKXI8KtnpP
        MOPghjI4CDHBXbkP9g28RnPx1eq0H2E=
X-Google-Smtp-Source: ABdhPJx652Fi6EZIb4vc1AzCycowJFJ7/vR781Nkm+G4hwKJLyYO+RYRR5I9dwenYZtF9U1TAt1lrg==
X-Received: by 2002:a05:6808:2108:: with SMTP id r8mr5861546oiw.118.1642178115816;
        Fri, 14 Jan 2022 08:35:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m8sm1535971otn.29.2022.01.14.08.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/8] hwmon: (lm83) Cleanup, conversion to regmap and with_info API order
Date:   Fri, 14 Jan 2022 08:35:04 -0800
Message-Id: <20220114163512.1094472-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Clean up driver code, use regmap and with_info API to improve readability
and reduce code size.

----------------------------------------------------------------
Guenter Roeck (8):
      hwmon: (lm83) Reorder include files to be in alphabetic order
      hwmon: (lm83) Move lm83_id to avoid forward declaration
      hwmon: (lm83) Replace new_client with client
      hwmon: (lm83) Use regmap
      hwmon: (lm83) Replace temperature conversion macros with standard functions
      hwmon: (lm83) Demote log message if chip identification fails
      hwmon: (lm83) Explain why LM82 may be misdetected as LM83
      hwmon: (lm83) Convert to use with_info API

 drivers/hwmon/lm83.c | 476 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 284 insertions(+), 192 deletions(-)
