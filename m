Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58B0C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbhLJUFQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:15 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852DCC061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:40 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id r26so14680584oiw.5
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=750pTVYiXcxSjxL34M5Vq/ZPmaHiFurOIujax41xWnA=;
        b=i7rbEEx0DV5vKrKGoY6cfJX2ETVdq+ApmSGG6EpXPS0RrBEFM9JVqDnscJbBCbEH1R
         vWNwOGl3AJs7/Zi8qCgPek8pNjEOVVIb4xkGTWYdAk75NW9/By/s6NgKOi8Qeqwoqx4l
         qcItXBZOwBPupB0TB/V4KoexHvQtYVHoxZAkLSxZFtC50yrlf86MfZFYK0/uOygQGQxZ
         3RSnjGj+3gsbq4VYVY0bC16LwRZi4ufShGbC0aYrXwFq0ebRdng2wbITCN0DfNWdj8Xz
         f/+0yBkqKcggnusAawKepoBcR3hPW99iA5FaA4hl60ty5XrneSD7onNR666ya0LqfS6z
         HLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=750pTVYiXcxSjxL34M5Vq/ZPmaHiFurOIujax41xWnA=;
        b=RAFedUyaEeosH3R3eU4wD1zAgqj3dRBXRHYtodN1nOLlU4Dbt90gbYUjbAeOh9RuwZ
         FyQA7J4peBZEUjkPksNoqrJuFKysQDfrO/bClzUZOnUYCnEcTqsEwrx3xiv1hFJhj03P
         l8LHLJF5PtBuR31/98aMfFekBzw1ZIO8r/AY9hnNjE5K9m4QU5SzTKcLdYRcW3DasGPF
         YM6RPSnDPkrk1pUBET4kApkKesx8EqUvALgclXHchLonkroX5TmNeX0hU+72eFAnGVix
         gBQ0vmJMizcVYLO4U7LLDpKiPUzlBbtaC37j3Xyl7wa29aZfHZvIZvGZ6DEZdQ4TIZU5
         2WdA==
X-Gm-Message-State: AOAM531PfYBLO8aNTKvsEb7ij5OQyLb53HDopDmOnvTTcBCazFfH2jEU
        kjZPMp9uAvr3yBw4jrdaZfFOUi+cRvE=
X-Google-Smtp-Source: ABdhPJzhfb4Kd6nUSpyMxPCQN7klzT+EKb1+b8oQEMzVGWfC74oHC6QkSI070K0+G8ktA9Mhq7fhbQ==
X-Received: by 2002:aca:2b0f:: with SMTP id i15mr14645316oik.114.1639166499676;
        Fri, 10 Dec 2021 12:01:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w29sm764848ooe.25.2021.12.10.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon: (lm90) Various fixes
Date:   Fri, 10 Dec 2021 12:01:31 -0800
Message-Id: <20211210200136.1662127-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series of patches fixes various issues found while
experimenting with and improving the lm90 driver. 

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (lm90) Fix usage of CONFIG2 register in detect function
      hwmon: (lm90) Prevent integer overflow/underflow in hysteresis calculations
      hwmon: (lm90) Drop critical attribute support for MAX6654
      hwmom: (lm90) Fix citical alarm status for MAX6680/MAX6681
      hwmon: (lm90) Do not report 'busy' status bit as alarm

 drivers/hwmon/lm90.c | 106 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 44 deletions(-)
