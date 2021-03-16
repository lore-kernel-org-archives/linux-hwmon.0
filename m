Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F73C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 18:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A44765131
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 18:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhCPSNG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 14:13:06 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:44220 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239895AbhCPSMK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 14:12:10 -0400
Received: by mail-ej1-f42.google.com with SMTP id ox4so58100597ejb.11;
        Tue, 16 Mar 2021 11:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wogD9XPUnroYU9Ue50JM1tKqinHzQ303gftWHDor5A=;
        b=l7Jvg13TxEnAA8YmpXIkzQcYjIuRsUpkk3Pwhz/p7Yh1y10LvwjY9Wj2ALpG3e9Hl9
         2GWZF6Lu6K6fsXNzZyGl9c7+ySPftXllWmSl4N/pLsk8sT4Inh2Nd0Tz9yIEMDlIlMkr
         sFlCsmsw3n1UcSTnkOleI6j2bxvCCE/lRnwYRBZiHH5CAYQjBcCr63pxQo56hk7dq96C
         DqH7Urpr+NvqDFK5ssk0LoidBOg11bne79s9dQYvxf8PNJzbCvK+HaoDWqQMd3KpRoOH
         cc//+rC0SGthmHvw2CYQWXKwmyhFoyFNVj/T9WqG4uob3C/hjK3ba6etYejRHV4qeNVZ
         B4CA==
X-Gm-Message-State: AOAM533teu5E/ykhHXk6acTzmFk62694hy6DZGjQM2eaCqT3K2AGJhka
        /IEGukNpPAzXU7hHjMqbiN1RTM1p1AtW626S
X-Google-Smtp-Source: ABdhPJwDu7T1Db/kHzLsRYwp84hawyltkAMbRc5pRl+zrCw524KbTVvKoZPMPTTkduYFx5j9yCjFow==
X-Received: by 2002:a17:906:ca02:: with SMTP id jt2mr31122143ejb.312.1615918328061;
        Tue, 16 Mar 2021 11:12:08 -0700 (PDT)
Received: from localhost ([2a02:8308:387:c900:a7b5:b859:9449:c07b])
        by smtp.gmail.com with ESMTPSA id t6sm11017025edq.48.2021.03.16.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 11:12:07 -0700 (PDT)
From:   =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>
Cc:     =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] hwmon: (max31790) Rework to use regmap
Date:   Tue, 16 Mar 2021 19:11:34 +0100
Message-Id: <20210316181134.1009226-1-kubernat@cesnet.cz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316175503.1003051-1-kubernat@cesnet.cz>
References: <20210316175503.1003051-1-kubernat@cesnet.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenther,

I'm posting v2 of my series on max31790. These are the changes from v1:
1) The driver uses regmap caching instead of local caching.
2) I got rid of the "refactor" patch and also the "pulses" patch.
3) I got rid of unnecessary whitespace changes.
4) fan*_input now returns -ENODATA when fan*_enable is 0.
5) Changed the argument of bits_for_speed_range to long.

Vaclav
