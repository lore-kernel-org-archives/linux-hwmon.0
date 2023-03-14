Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74442C6FD1C
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Mar 2023 09:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjCNJcH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Mar 2023 05:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCNJcG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Mar 2023 05:32:06 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27054CC24
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2023 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=pES8mZHXSxbK2BvC4Qr7y9uvsY4rADK0w2Sjwwt5Vt4=; b=ci42UaZKoZze0TwIBb9hH1Q52B
        MpMqaHP1vEFocvAuz0M1Ie52jRFi5NseGpoS/KPCPNgsLe2WpZ3wfOw4LpI4DhtLgAt6IpfESKW6Y
        4JmUfLbAbCvHjoW8OQtHjtVfA4Z7g7DonUR1NApBfBNurwfjRY+2+c9dVquSrI0hokoBcDeMXZCkG
        3DECvHhlloqnxEyGScdMh7n0eNsh/gHqyKicmpUlKa8irsEsRaDEE8yObJeKC/HlH4KduJJ8+QPMV
        bQPUfLQLUGPuy2cIQzbeZyavjrUdUvBk4bsAUwl5dXwhGY91aJVkyRlxZStlmWaGI4xD3vKDdtuCH
        H0SRB/pA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pc10i-0002oe-NN; Tue, 14 Mar 2023 10:32:00 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pc10i-000TGi-5a; Tue, 14 Mar 2023 10:32:00 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        linux-hwmon@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] hwmon: (adm1266) Set `can_sleep` flag for GPIO chip
Date:   Tue, 14 Mar 2023 02:31:45 -0700
Message-Id: <20230314093146.2443845-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26841/Tue Mar 14 08:22:56 2023)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The adm1266 driver uses I2C bus access in its GPIO chip `set` and `get`
implementation. This means these functions can sleep and the GPIO chip
should set the `can_sleep` property to true.

This will ensure that a warning is printed when trying to set or get the
GPIO value from a context that potentially can't sleep.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/hwmon/pmbus/adm1266.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index ec5f932fc6f0..1ac2b2f4c570 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -301,6 +301,7 @@ static int adm1266_config_gpio(struct adm1266_data *data)
 	data->gc.label = name;
 	data->gc.parent = &data->client->dev;
 	data->gc.owner = THIS_MODULE;
+	data->gc.can_sleep = true;
 	data->gc.base = -1;
 	data->gc.names = data->gpio_names;
 	data->gc.ngpio = ARRAY_SIZE(data->gpio_names);
-- 
2.30.2

