Return-Path: <SRS0=f3EG=RV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C379CC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F43320872
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=vincit.fi header.i=@vincit.fi header.b="fhJDzxbP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfCRO36 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:29:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36211 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfCRO35 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Mar 2019 10:29:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id v10so14243649lji.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2019 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=svXXeREfeTX4qlN+iIHUPUEmFED9zpCSqHMd3qwWAtQ=;
        b=fhJDzxbP2dZ4bw5f2FtD3a5TKiuw/3OfhyY7nTLAIueKOtAJ2GwYH8Mc1Uwrp16iJE
         sK7EAcMe1FNiNL6vz9lWOQxepECPO8pRr1iSmeSbTlCAHo2xXQQo+q1Q1a8OAzjIMAwz
         w3rIETgzZSB/lKv2E4mQZeqq/ZRutdIkoaC4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=svXXeREfeTX4qlN+iIHUPUEmFED9zpCSqHMd3qwWAtQ=;
        b=b2qe6U7Q/xVBXtXnXNvl+ji7hLoT2gupl6pjiMzh3+AH6qUbm2NWrtg56LaIJsN2/w
         k4t7KVzkAaKpSy8XZ65U5IbMFzMasG/YVzg8S48FE68SBrohufn5hNnkbHRymwjDTXLO
         fK2xfaXqSaAswoaKQNEGFJnisw+3zKfU9I3hn8nAqxRURTUNgIv1yJCht44IP5cuGCvM
         f6bsJDYwfDjqZPWx52fdXe6SSEluYcU6UlAL9Fpq5USBSms2PFxdCqJ/6s1SmnNtjO0C
         5/35teIjrTVF/Weg6uTWWjm5LPenJtSsKJ2nfzGbgwmsKJIOIDy9mfIK71QZJ5lBAp/g
         6+Eg==
X-Gm-Message-State: APjAAAVwfahFayEnsRmziQyeHhnwmRE4AilVi7gjLRlTIZzCyBdaFEPJ
        YUHshNgq3JKdvdy+9Tkp1uJ4LpAs3CLBBXvlFSDmTIEMVXGeZopYLNG+S2vFVQ/TfOYaJQJjIUy
        VxWQuZrzE8rh7JMIM9dfy+L4baMQOqRRpztbCsWGielkINR02JaHkb0jYOsns5VZbaIsapvZJ+4
        TJ
X-Google-Smtp-Source: APXvYqwc2ovHRzGO7Hf2auBXeG4WNXglyxDgUK2rQLLEtdjs+5pHJMa0KGHG7fLnnb+hPSUQ9h1jvg==
X-Received: by 2002:a2e:9703:: with SMTP id r3mr4079732lji.88.1552919395677;
        Mon, 18 Mar 2019 07:29:55 -0700 (PDT)
Received: from samu-ThinkPad-T480s (gw.vincit.cloud. [195.60.252.249])
        by smtp.gmail.com with ESMTPSA id v12sm2030157lfd.20.2019.03.18.07.29.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2019 07:29:54 -0700 (PDT)
Date:   Mon, 18 Mar 2019 16:29:53 +0200
From:   Samu Nuutamo <samu.nuutamo@vincit.fi>
To:     linux-hwmon@vger.kernel.org
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (da9052) Synchronize access with mfd
Message-ID: <20190318142953.GA23692@samu-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When tsi-as-adc is configured it is possible for in7[0123]_input read to
return an incorrect value if a concurrent read to in[456]_input is
performed. This is likely caused by a concurrent manipulation of the mux
channel without proper locking as hwmon and mfd use different locks for
synchronization.

Switch hwmon to use the same lock as mfd when accessing the TSI channel.

Fixes: 4f16cab19a3d5 ("hwmon: da9052: Add support for TSI channel")
Signed-off-by: Samu Nuutamo <samu.nuutamo@vincit.fi>
---
 drivers/hwmon/da9052-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 8ec5bf4ce392..af136a638065 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -249,9 +249,9 @@ static ssize_t da9052_tsi_show(struct device *dev,
 	int channel = to_sensor_dev_attr(devattr)->index;
 	int ret;
 
-	mutex_lock(&hwmon->hwmon_lock);
+	mutex_lock(&hwmon->da9052->auxadc_lock);
 	ret = __da9052_read_tsi(dev, channel);
-	mutex_unlock(&hwmon->hwmon_lock);
+	mutex_unlock(&hwmon->da9052->auxadc_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.17.1

