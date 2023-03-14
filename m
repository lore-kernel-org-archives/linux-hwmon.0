Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04DCC6FD1F
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Mar 2023 09:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjCNJcI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Mar 2023 05:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCNJcG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Mar 2023 05:32:06 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D17113FB
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2023 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=+4UCILJMX6hetnh9PfFKwHCaIzxPwg+LPIyYl++msT4=; b=cEujFaBXtysg+ayoUIv4ww34HX
        qdvOCaijDjE+d6p0tgNbyAoUrFWX31I6chtGRC5vd2PZLqBEZtlLXzf1moqmyy/kvcTcFxYDk0zLS
        KAq4gduFNHK5UH+yNbamAn+X63JWH+unjEf8yV7YFdClakZiUgsprBG28jB2jfjjVVSn4tZSIMsnp
        gtRsIUY62OzjPp5g9VGi2yX7VGCvkr6efYt3M4MRQj6A6NrJHrRXbDDlB5FDJiQUfFXN0+VHDO0rW
        dNPnBWkfEBcVMI/1TLJNSv3t1y4DhNCVTMFROAY3HtAlJJ6alyAmkkkhI/mq1vSxIABSQ/yuK7hbe
        sWgNo6Mg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pc10k-0002pE-AL; Tue, 14 Mar 2023 10:32:02 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pc10j-000TGi-Od; Tue, 14 Mar 2023 10:32:02 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        linux-hwmon@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/2] hwmon: (ltc2992) Set `can_sleep` flag for GPIO chip
Date:   Tue, 14 Mar 2023 02:31:46 -0700
Message-Id: <20230314093146.2443845-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314093146.2443845-1-lars@metafoo.de>
References: <20230314093146.2443845-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26841/Tue Mar 14 08:22:56 2023)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The ltc2992 drivers uses a mutex and I2C bus access in its GPIO chip `set`
and `get` implementation. This means these functions can sleep and the GPIO
chip should set the `can_sleep` property to true.

This will ensure that a warning is printed when trying to set or get the
GPIO value from a context that potentially can't sleep.

Fixes: 9ca26df1ba25 ("hwmon: (ltc2992) Add support for GPIOs.")
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/hwmon/ltc2992.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 88514152d930..69341de397cb 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -323,6 +323,7 @@ static int ltc2992_config_gpio(struct ltc2992_state *st)
 	st->gc.label = name;
 	st->gc.parent = &st->client->dev;
 	st->gc.owner = THIS_MODULE;
+	st->gc.can_sleep = true;
 	st->gc.base = -1;
 	st->gc.names = st->gpio_names;
 	st->gc.ngpio = ARRAY_SIZE(st->gpio_names);
-- 
2.30.2

