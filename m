Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF2CC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 May 2022 10:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348057AbiEDKeR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 May 2022 06:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239092AbiEDKeQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 May 2022 06:34:16 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64D36262
        for <linux-hwmon@vger.kernel.org>; Wed,  4 May 2022 03:30:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p189so590494wmp.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 May 2022 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQyCiJBrdrzMDjwwN9WliekmLw3BxA/T/sUJGfPV2pU=;
        b=GlSoRAhKxTm0wlcNJin4wlKpZWZ27j0xaRomtWuTo11qoIkK5SatGtTSeuR2pnhzvq
         Jbvjfisurf+nK0vZcPH3rGrW413QqMkTSNFOcSGPkoD12pFDlFLSnF7nanmrckdPUvE+
         dOLlPeIL/KZ6LHCF/QaImO5ysxBIrleqqhnmV9vpAxBYM9x3OLTbnk/l5+DxlYqEonpF
         YYeDNCtXe83jOlyEvRi89Cl88cSrxvnHS+x58CAiYxwukFe1TV5DIaD6r4aalyCqgydt
         6sbjEH4XNwArohH2xCES0ZhIz3JH4/3SBc2zldaikLkq74Y9isSEOUm1lmSl9Wys4dtQ
         bLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQyCiJBrdrzMDjwwN9WliekmLw3BxA/T/sUJGfPV2pU=;
        b=EE3I3UHZZl5H3LWmxe/Lct2LPozqCT6VP/TfhFYdPZcjwAwpvQZiA3EYnXnZ4mQnll
         r43kd55ukridDwAyuJPDNFfnvOpNSV/m7xf29WjkSoa0VkTVS1AqA9WUIgdvJoUaSl7R
         jZRVN7rRcw5SBQQWGCHSBeL2EXrr/H2PgIPwwYadhS81jaS/UQarj8tXVoK9zl25DR8Z
         wrb//VY0+RMhg4KxJOZQY434Rl5fLMv4oDxmx0ikKwYBJTpUCsD1TNDCKRPgnkklYoG1
         ArbhuDCZ4M8PESmNbaOpcApHoJciPwzb2AYrW7Py50lFtFy81ua1yWnhlyTCRIj1+2H7
         xqaQ==
X-Gm-Message-State: AOAM53091rk6nQxXmztFsHDOTNB7FSWyX5qOc7gcF9eSthAtMr1EB1c/
        2HA2Yn8XQ9hH2vhAlPwo2BGMjg==
X-Google-Smtp-Source: ABdhPJwyY675il0I7jhl/sTQb/BE8JJS2Vpl0Y6XsNyHUUgFIyouAMieVsl+v2D4vdNsSuoYLwjxjQ==
X-Received: by 2002:a05:600c:1d0f:b0:394:4bd1:e05e with SMTP id l15-20020a05600c1d0f00b003944bd1e05emr7080873wms.103.1651660238441;
        Wed, 04 May 2022 03:30:38 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k6-20020a05600c1c8600b0039429bfebebsm7521395wms.3.2022.05.04.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 03:30:37 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/2] hwmon: acpi_power_meter: convert to new hwmon API
Date:   Wed,  4 May 2022 10:30:26 +0000
Message-Id: <20220504103028.493155-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello

I dont like warning in my boot log such as:
hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
So I did the conversion to the new API.

The patchset was tested with:
- sensors
- cat all values directly in sysfs (for ones not displayed by sensors like oem_info, model_number, etc..)

But due to missing functionnality on my hardware some code path was not
tested. (Like all cap_xxx)

Regards

Change since v1:
- use really the new API

Corentin Labbe (2):
  hwmon: acpi_power_meter: fix style issue
  hwmon: acpi_power_meter: convert to hwmon_device_register_with_info

 drivers/hwmon/acpi_power_meter.c | 524 +++++++++++++------------------
 1 file changed, 227 insertions(+), 297 deletions(-)

-- 
2.35.1

