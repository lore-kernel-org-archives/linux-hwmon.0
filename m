Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0649BECAAD2
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Aug 2022 14:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiH1Ovj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Aug 2022 10:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiH1Ovh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Aug 2022 10:51:37 -0400
X-Greylist: delayed 500 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 28 Aug 2022 07:51:36 PDT
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net [83.102.40.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E855F2A952
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Aug 2022 07:51:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 4201B28874;
        Sun, 28 Aug 2022 17:43:14 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
        by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
        with ESMTP id c8DHOLzE7O2K; Sun, 28 Aug 2022 17:43:14 +0300 (EEST)
Received: from oliivipuu2.dnainternet.net (oliivipuu2.dnainternet.net [83.102.40.53])
        by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 1230629831;
        Sun, 28 Aug 2022 17:43:14 +0300 (EEST)
Received: from 82-181-17-0.bb.dnainternet.fi (82-181-17-0.bb.dnainternet.fi [82.181.17.0])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by oliivipuu2.dnainternet.net (Postfix) with ESMTPS id 62BB19A;
        Sun, 28 Aug 2022 17:43:09 +0300 (EEST)
Received: from [IPV6:2001:14ba:4465:aa01:692:26ff:fed3:d163] (ryoko.home [IPv6:2001:14ba:4465:aa01:692:26ff:fed3:d163])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by 82-181-17-0.bb.dnainternet.fi (Postfix) with ESMTPSA id D6616EA017;
        Sun, 28 Aug 2022 17:43:08 +0300 (EEST)
Message-ID: <9f3cef03-6efd-138e-8552-e3078ed9b4f7@iki.fi>
Date:   Sun, 28 Aug 2022 17:43:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Matti Kurkela <Matti.Kurkela@iki.fi>
Subject: [PATCH] hwmon: (nct6775) Add Asus PRIME Z390-A to WMI monitoring list
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@roeck-us.net
Cc:     Matti.Kurkela@iki.fi
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Asus PRIME Z390-A (and presumably other Asus Z390 motherboard versions) 
also requires the nct6775 chip to be accessed by the WMI method. Add it 
to the asus_wmi_boards list.

Tested-by: Matti Kurkela <Matti.Kurkela@iki.fi>
Signed-off-by: Matti Kurkela <Matti.Kurkela@iki.fi>
---
Should apply to any kernel version that includes the commit 
c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd
(hwmon: (nct6775) Split core and platform driver).

--- linux-5.19.4/drivers/hwmon/nct6775-platform.c.orig  2022-08-25 
12:45:54.000000000 +0300
+++ linux-5.19.4/drivers/hwmon/nct6775-platform.c       2022-08-28 
16:28:09.531738685 +0300
@@ -1054,6 +1054,7 @@ static const char * const asus_wmi_board
         "PRIME H410M-R",
         "PRIME X570-P",
         "PRIME X570-PRO",
+       "PRIME Z390-A",
         "ROG CROSSHAIR VIII DARK HERO",
         "ROG CROSSHAIR VIII FORMULA",
         "ROG CROSSHAIR VIII HERO",


-- 
Matti.Kurkela@iki.fi
