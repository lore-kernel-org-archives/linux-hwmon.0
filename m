Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96C4C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Oct 2022 10:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJKKrt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Oct 2022 06:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJKKrr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Oct 2022 06:47:47 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B568B83F05
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 03:47:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r14so5180989edc.7
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bm0vCUvRXUXTyPVG9rvtYJqDscULcDdbAZsk07pw+2w=;
        b=XCUnxajqQljKqLb2FP32MTUIhwkvknmybifA0uRJFNKIYtKYH/Gd3+ImmaPri98VBS
         WqzjDq1+O0POLeP0bBXldSD0zBOPmrTenK740BgQYqtqdD9KVF6YpaHJNHkln5nAfw6g
         LOaUCJJL08lwbMR00kKLrIy8AL5MhRHSJzHn0RKtRVg0/VTExdvjfe8gpz7b9GZDOxaP
         B3awjICHjZAZ0hXQEtgUGiIkha/c+XcmhB67YVqoNgmz09Ttc75e3Atb1mqizlw4zMzU
         ttg4HcVqgN8KoSd4fzmkrpsRYpW5YMmibs5QBR3odsBC+CQ3NlX4A/xQaHqLhpS+KE8z
         iTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bm0vCUvRXUXTyPVG9rvtYJqDscULcDdbAZsk07pw+2w=;
        b=CoAwjloGvDmsiSf4atpxx5EIDuCJKDISP2CV0K1IF8LgUYHjLDJcabGb055L3Tyl1g
         crnEv/dZpsLKrFcIZsdFDisAkGVcmUZiwBQ9F/hKoYHwnI7GvNrPK4nnQSsPvIzJn89p
         CNFnWXzl+bSULkboIgITj4KrIiFhlKttx1AbtMneeCBfBnh6CNzZseOPbnATSw8yo9eT
         ug2nP5gp2t0I0jVP3Kmpuh2m35PDF58TKKedWMIGIwaKYwvWOijUVhbfRWMRebNJZC0F
         2NkRSCI2ekOf9S6Lb37hY89KUflMD+b4HKr3I59nT45Z4iktt4w6JbqEriLJx0kzqMaO
         ZUkA==
X-Gm-Message-State: ACrzQf1RcAbQ5nkSjnikA27IOYOxAz7+TL+Ejjg+fbSeDgMaHQQn8m+6
        Bn8TM1FLHP6cz9Qh/V3KEo1PMT0oS1PuzAQC
X-Google-Smtp-Source: AMsMyM5/D6rPX8LK9LxJ5BGCLc9jZc1399KPD5dP8bLjM0/WJX5PlwEzbZqhR+4a71FmqG+rnQHL4g==
X-Received: by 2002:aa7:d5d3:0:b0:458:814c:6d57 with SMTP id d19-20020aa7d5d3000000b00458814c6d57mr22456276eds.186.1665485265305;
        Tue, 11 Oct 2022 03:47:45 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id mf22-20020a1709071a5600b0074136cac2e7sm6753081ejc.81.2022.10.11.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:47:45 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 0/3] Add devicetree support for max6639
Date:   Tue, 11 Oct 2022 12:47:36 +0200
Message-Id: <20221011104739.53262-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches adds devicetree support for MAX6639.

Changes V2:
- Fix dt schema error.
Changes:
- Add fan-common dt schema.
- add dt-binding support for max6639
- add max6639 specific property

Marcello Sylvester Bauer (2):
  dt-bindings: hwmon: Add binding for max6639
  hwmon: (max6639) Change from pdata to dt configuration

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../devicetree/bindings/hwmon/fan-common.yaml |  80 ++++++
 .../bindings/hwmon/maxim,max6639.yaml         | 116 ++++++++
 drivers/hwmon/max6639.c                       | 255 +++++++++++++-----
 include/linux/platform_data/max6639.h         |  15 --
 4 files changed, 388 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

