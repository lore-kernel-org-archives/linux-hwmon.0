Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD835C4167E
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 May 2022 06:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiEIGqa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 May 2022 02:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbiEIGeP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 May 2022 02:34:15 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F27760E1
        for <linux-hwmon@vger.kernel.org>; Sun,  8 May 2022 23:30:19 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i5so17921839wrc.13
        for <linux-hwmon@vger.kernel.org>; Sun, 08 May 2022 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPNecKafbRDw+Fkqi9ISd0FBA5h3YIksvwNIY0KCyTA=;
        b=WBuCRLM+UWc6POwKM0IitqNbvaWx79I3cHRDu9rKtkKEP3LSshmP6ZzpFyQIEbjS6w
         +pxeTMtEToYGHaDkpH0KO4l1jt9qVN9Iwh3Js43cEkG4265+HO6HumK/3nA4JCYYwPOt
         8zGj1+yqcLKe0qBPMtmoIVle6c6p3wWlwdZv9sMvShbPo6hn75Vf5I5dnFR36MhKQvN5
         qF4NPvvc6HTqTdjyWof/4rzBt651d0gUI9uFX5ObMbjpTpeiL5XdoSsyXMHJIQEUNO/f
         pSRXhz9s74ibn+76GKAv1cFrVozaEal/SiN5Hi7Qc1sLD0T7JH26LrexLNS87XzRl7cy
         mL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPNecKafbRDw+Fkqi9ISd0FBA5h3YIksvwNIY0KCyTA=;
        b=xWdf2iSkT/UHDCf3L6KaSFXLnOrVzd8vybLe7DHMWL6EfyGLbPF2v8QB3ORFdvTkDS
         W5DSYoPP8qthIi9BwxQpu+WvX8Hu8mAvrc6Nw407DnytrurUmTaC9tLJTiMOq31hLbuM
         Sy/FHLomW/sJVrAp9jD8IhROF5zPAWp2gNLE5ogfGMpK2sj0GZvNEWsBB0TEDxtXq2pE
         hEgkgBfHckplMZd1FufMVEvuxq9SlsTFmAsd8QPkwCjfsUD+EzPvhqdJZx7+BZxJHS9Q
         swVyjcRYuotEvdAwT8ELcoxP9pAoS4oZJldXwcNRLoD7vDLa/t9jkzLx/o+hMt98m1cH
         emKA==
X-Gm-Message-State: AOAM532Urpj84UNQsZeMZn2okcCFQalPvmYfeU160qvRLWaqYuDDQ/os
        U/rA5ff2tLWv9TVsgicgheongQ==
X-Google-Smtp-Source: ABdhPJxu8B88K+1d0U9XCw0Jxtwqb++NySgO1kBYq9LRHkJnnpf1k/fd9klqFI4y4XnJjrL5JgOIBA==
X-Received: by 2002:a05:6000:223:b0:20a:db3a:e761 with SMTP id l3-20020a056000022300b0020adb3ae761mr12040423wrz.43.1652077817042;
        Sun, 08 May 2022 23:30:17 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z18-20020adff1d2000000b0020c77f36b13sm10074833wro.100.2022.05.08.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:30:16 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 0/2] hwmon: acpi_power_meter: convert to new hwmon API
Date:   Mon,  9 May 2022 06:30:08 +0000
Message-Id: <20220509063010.3878134-1-clabbe@baylibre.com>
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

Change since v2:
- fix 32b build by using div_u64()

Corentin Labbe (2):
  hwmon: acpi_power_meter: fix style issue
  hwmon: acpi_power_meter: convert to hwmon_device_register_with_info

 drivers/hwmon/acpi_power_meter.c | 524 +++++++++++++------------------
 1 file changed, 227 insertions(+), 297 deletions(-)

-- 
2.35.1

