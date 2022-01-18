Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1A4C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jan 2022 15:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242732AbiARP41 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 10:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiARP40 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 10:56:26 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5949C061574
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jan 2022 07:56:26 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id m8-20020a9d4c88000000b00592bae7944bso21624092otf.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jan 2022 07:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hCMYoca1gx8QQkVR6nNLIIDqG5isgiaV/ZfhJpvXDQ=;
        b=hEujCmaMn4X0TRf2AfSpPDNNukjUM2OPI9zEbhtK5oKewuA/qIhDX+rc2nIFcPuWr8
         2pCUze22IQo8VpQipjMHhhmDUnCszg454xZzBHNNxaKAguPZGIItvdkZlE6ySB5XIha4
         dPkfC018D9IRIKTsiAfLzT9CNxVJCktVyv0otDF8+DmbdO7Rd/JWJE57yyCkw1oFjsiF
         C0tYwhqDlkKPaYZF1kfCRZ6JiakpPJw9ZEc+DK+tYSfiUGANineDGtRv0ZupjLKMH1hT
         O98bzmpn3loTvB9VV8LGLoTf1B7+pY07YUb0nXTVyrALFAgirPkJHVlDS8EsRnZk2kL0
         YiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=7hCMYoca1gx8QQkVR6nNLIIDqG5isgiaV/ZfhJpvXDQ=;
        b=JbRMjBVCY4m5nNXNsUJCYLxv4xdoj8cJyluwVcOwzt8nxJ6CkB6bCZCO3pH3J1cdxY
         7DiCziy/k8Gx/fup2zGPedZItaMrW6Z3+pA37keU2YWjNgTLNwqC+MAxei9coQRQuetj
         pE6pp2oKg4NPA+ap4Xsj7ajbvs/bvKOgyWuA3NBlWJnPPoB5UW5+Q221VZUvL7MGnVgK
         /AA8PkEfAFNxHM5wKtmrG9IKwSYz02BSAZKU13CnkVE+zGhRaHtnfBbOXFxn9z/p4BuA
         J6x4x3azqaG5WiHCT2qCU+RSvs1ePrkTM29g0XCjyARFNxK9rLKsYmrNY59B7h1OXy9n
         e9fg==
X-Gm-Message-State: AOAM531BsHYqJG9X9YoS1od6Jj+BxaSTryxK8e3z6r9Zlm6FIO5g+Q0U
        cE6d0IpyROiQ6F3Q3zDAcg1OWoWwCRk=
X-Google-Smtp-Source: ABdhPJwq3kOP8Rt+S8a4y3B6cU2mKhg48MDJMj1TYfOT6/TQjNIDxVhQCNEiH6hIBMYeC4z9RjUNFg==
X-Received: by 2002:a05:6830:1e99:: with SMTP id n25mr9001025otr.344.1642521385837;
        Tue, 18 Jan 2022 07:56:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s14sm2386436otd.0.2022.01.18.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 07:56:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        kernel test robot <lkp@intel.com>,
        Arthur Heymans <arthur.heymans@9elements.com>
Subject: [PATCH] hwmon: (pmbus/ir38064) Mark ir38064_of_match as __maybe_unused
Date:   Tue, 18 Jan 2022 07:56:22 -0800
Message-Id: <20220118155622.4112829-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_PM is not enabled, the following warning is reported.

drivers/hwmon/pmbus/ir38064.c:54:34: warning:
	unused variable 'ir38064_of_match'

Mark it as __maybe_unused.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Arthur Heymans <arthur.heymans@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ir38064.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 0ea7e1c18bdc..09276e397194 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -62,7 +62,7 @@ static const struct i2c_device_id ir38064_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, ir38064_id);
 
-static const struct of_device_id ir38064_of_match[] = {
+static const struct of_device_id __maybe_unused ir38064_of_match[] = {
 	{ .compatible = "infineon,ir38060" },
 	{ .compatible = "infineon,ir38064" },
 	{ .compatible = "infineon,ir38164" },
-- 
2.33.0

