Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C16EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 05:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjGYFR7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 01:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjGYFR6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 01:17:58 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107BA116
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jul 2023 22:17:57 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso49804995e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jul 2023 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690262275; x=1690867075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdYBQaV+B+W4+aCiMpL9r/1YBP0zzFeNmZuGFqRO7n8=;
        b=tG5ewrnXhgQCRFeiRWnMcCjsgApEpjbuSdOkTL7hB2SAj/WVJQN2P2inDFkW7D/qpO
         qsV893U4XBh00IL5lymmHm2zS5g9sqCDSJR0bhLePtb643MS9uNDETDtalyIz7a/eww5
         b0GxSz5Pn3KFSTeCjBCy3vaRJlWR3eopk4c/FsYWzprRibEbJplH/iBOkFMtpopYAcLA
         0T3F/iMA27/nmXaNEQyjrz9wdDcucnHl60JHW6GQkp+yhvFRA2r2joC0Os+B1MuzrwVD
         Ckx8Epm3dfO5t9A86ZXSqyZ46P7j09Caplxm+r0HrLSl9k3XMVQDQ8FnuOZSQF0g3JcG
         Oi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690262275; x=1690867075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdYBQaV+B+W4+aCiMpL9r/1YBP0zzFeNmZuGFqRO7n8=;
        b=EE5LIMn8X72rLrcGKmu+AT3ZV1bEXY3gHpDboyPp0hU9JHYlGegflFufAHVnLUCFfU
         Ocmi1ddOITJNeLuNOIcpW6hMt80bUm3D12D+IkkKMqBm7RmGGWf9ti5q5G7qDfL7Gmf/
         YPEcC/REUpu+Db1Sysho8LLWLUhC/1j60pcmPN7B+TqydYDMqO0wnGTGJeFS4zLHaLdZ
         celdNn+PtDhbtVhxKa9AKCecraOu6hFZLj/82m+fvkL4b1ChnRk4lhRqPKT5jinrphRj
         ScKEqyFOLut0pf63yxXW9wmQi8dJCmVXyZsSO82D33KvUDODX3yIBBWC+6H/jcOQIyu0
         Mc2w==
X-Gm-Message-State: ABy/qLZtcohhXIyEzFwZUOZ4y2P4xo544vJhvcAKjECExWzoh/KshNky
        YEGQNCHrqzTwj9LP3TPxG2mpFw==
X-Google-Smtp-Source: APBJJlFjUl5yK/66NnfzVnOsmThX8KLisxQfjDePt2ItXx6jVjAOXAz1V6FyhTpOQdcs5wJC+h5kqA==
X-Received: by 2002:a05:600c:219a:b0:3f7:cb42:fa28 with SMTP id e26-20020a05600c219a00b003f7cb42fa28mr8925682wme.28.1690262275399;
        Mon, 24 Jul 2023 22:17:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h19-20020a1ccc13000000b003fbcdba1a63sm6630548wmb.12.2023.07.24.22.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:17:54 -0700 (PDT)
Date:   Tue, 25 Jul 2023 08:17:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     james@equiv.tech
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: add HP WMI Sensors driver
Message-ID: <f72c129b-8c57-406a-bf41-bd889b65ea0f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello James Seo,

The patch 23902f98f8d4: "hwmon: add HP WMI Sensors driver" from May
22, 2023 (linux-next), leads to the following Smatch static checker
warning:

	drivers/hwmon/hp-wmi-sensors.c:1937 hp_wmi_sensors_init()
	error: uninitialized symbol 'pevents'.

drivers/hwmon/hp-wmi-sensors.c
    1913 static int hp_wmi_sensors_init(struct hp_wmi_sensors *state)
    1914 {
    1915         struct hp_wmi_info *connected[HP_WMI_MAX_INSTANCES];
    1916         struct hp_wmi_platform_events *pevents;
    1917         struct device *dev = &state->wdev->dev;
    1918         struct hp_wmi_info *info;
    1919         struct device *hwdev;
    1920         bool has_events;
    1921         bool is_new;
    1922         u8 icount;
    1923         u8 pcount;
    1924         u8 count;
    1925         int err;
    1926 
    1927         err = init_platform_events(dev, &pevents, &pcount);
    1928         if (err)
    1929                 return err;
    1930 
    1931         err = init_numeric_sensors(state, connected, &info,
    1932                                    &icount, &count, &is_new);
    1933         if (err)
    1934                 return err;
    1935 
    1936         if (IS_ENABLED(CONFIG_DEBUG_FS))
--> 1937                 hp_wmi_debugfs_init(dev, info, pevents, icount, pcount, is_new);

In this code prevents is uninitialized if pcount is zero.  It's not used
so whether this is a bug or not depends on if hp_wmi_debugfs_init() is
inlined.  If it's inlined then it's not a bug, but if it isn't then it's
still a bug (despite that pevents is not used).

    1938 
    1939         if (!count)
    1940                 return 0;        /* No connected sensors; debugfs only. */
    1941 
    1942         has_events = find_event_attributes(state, pevents, pcount);
    1943 
    1944         /* Survive failure to install WMI event handler. */
    1945         if (has_events && !add_event_handler(state))
    1946                 has_events = false;
    1947 
    1948         err = make_chip_info(state, has_events);
    1949         if (err)
    1950                 return err;
    1951 
    1952         hwdev = devm_hwmon_device_register_with_info(dev, "hp_wmi_sensors",
    1953                                                      state, &hp_wmi_chip_info,
    1954                                                      NULL);
    1955         return PTR_ERR_OR_ZERO(hwdev);
    1956 }

regards,
dan carpenter
