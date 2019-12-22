Return-Path: <SRS0=7+HN=2M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7E8C2D0C0
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CD4A20665
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuRT9Fop"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLVOKx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:53 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39705 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLVOKx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Dec 2019 09:10:53 -0500
Received: by mail-pj1-f66.google.com with SMTP id t101so6304947pjb.4;
        Sun, 22 Dec 2019 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=814BTk/L0iDRXw/rhLXQMNOV1fosSV7rD9UHif3vpVY=;
        b=JuRT9FopP2EEsJFprskl8hSX3GWW2Un0HHelK6DBp9o8hiLwpxC7bwoc94k12Lmdso
         b+kz3j1RfVI6FuPpBn+5gayCndU9ncisa6HRajcHdjNJaksdmqvF0qayAfxYyl2WGLrb
         q02hPaqn+wg34kmvjrNYBvtvzeQVHGy6l+4EbcuGEAtE19OgkdP5LOGQReoCG2gBKz9h
         dHqdVzxf6N09eUKpbMFd8+Cgk7Z5PwASxiLtZlDqvQIXIigCAYX5yUWTugU9MUZRTWAm
         k0BUeSkOOxPZL4H74Sv7z6Q4X+UH3witBkHgAh8rZJKd0SKN9LJJceoiRCW6Ou+O+rdj
         /qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=814BTk/L0iDRXw/rhLXQMNOV1fosSV7rD9UHif3vpVY=;
        b=CdMiZBqFUImleeVlmfvfSj2lLVlQWPv6q3Gp2C8Vk2lvBMnPj1BvmbSwM4+oizC7Nw
         KmtGX0E2EyV1A2LEuFdH7/4ft5ILD6j3bePmf0ARuGCUCDyytw61NHeWovIr5MyDMm05
         eBfiZ0Ap+m5IeSdpeCzzqz/K+7zJVEjVmh9BzM8a8D1/na5Bj4prYFt8G25i0CteYaQV
         LretpcIUGYjBaA68Sr5USEvfkFBaNz6B/eOwmLMO1zRvN2z/yMNOWo5y/6DEuUc1hRtK
         mXqF+pdBf+NTknLqePj7pU5oKJhgx70RyhTyAHWAZ1Lwo4W1PL9ZsEh2OwrzdWpSNpsU
         ylBA==
X-Gm-Message-State: APjAAAU9ARzelI5A+q2dwU7AtUNOYSdNcfHVSTv9h7jApECvsXrH54Wu
        kmJ84hiM+jnpqlZjWtSnQVbaeSrMMy8=
X-Google-Smtp-Source: APXvYqx9IgirQ91Y6HfU8ZfcWDOeIcYiq7FgqmvZOrqmwHqKuGk2qVXZWLC6Bq9NQP34wgYMdILrEA==
X-Received: by 2002:a17:90a:b30b:: with SMTP id d11mr27707591pjr.22.1577023852076;
        Sun, 22 Dec 2019 06:10:52 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id x33sm18320073pga.86.2019.12.22.06.10.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 22 Dec 2019 06:10:50 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/2] hwmon: (pwm-fan) add option to stop fan on shutdown
Date:   Sun, 22 Dec 2019 23:10:21 +0900
Message-Id: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pwm-fan driver leaves the fun running when shutting down the system.
(On the other hand the gpio-fan driver stops it.)

This adds an optional property "disable-state-shutdown" in case someone
wants to stop the fun running when shutting down the system.

Akinobu Mita (2):
  hwmon: (pwm-fan) add option to stop fan on shutdown
  dt-bindings: hwmon: (pwm-fan) add disable-state-shutdown property

 .../devicetree/bindings/hwmon/pwm-fan.txt          |  2 ++
 drivers/hwmon/pwm-fan.c                            | 24 ++++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kamil Debski <kamil@wypas.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>
-- 
2.7.4

