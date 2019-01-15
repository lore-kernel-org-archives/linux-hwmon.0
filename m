Return-Path: <SRS0=MMlZ=PX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71D3C43387
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Jan 2019 11:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68D4020656
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Jan 2019 11:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Q0wXaWBv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbfAOLLE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Jan 2019 06:11:04 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:40754 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbfAOLLD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Jan 2019 06:11:03 -0500
Received: by mail-wm1-f50.google.com with SMTP id f188so2729033wmf.5
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Jan 2019 03:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=cc:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=DDjritEZ1Ool0fGFQS6eJpZSyUgxdCU3ynPI7nO3IXw=;
        b=Q0wXaWBveHJNnRsOP84o3+nmw5ZdMQSd1Z28gHmak+SDfx6DTM9JobF4+A4w6xyyjS
         b9gJLNDrtTRBB7UaZ2A30Lx0C4YTNqCHLfHEK4TIpCls+JTKDZ/YWRFapw2EkpMgYXhz
         aCdgIvvxzKzg9gwmpT0pXXJBAdZEdJitQkTxHXiIjBFCpZkx9ZFwqzq7j0pTWrTAh/P4
         AZzqR0PIJGZe1T/rfE9uXw3iS7kCsyHaCjPtlP2228F8GiXwqz3kuAqb4KZ1uN9VCTGX
         ArBs4Da8VZJXaStpZihpXQRCGawwrW6xzfAMmLfj7FGd1fFiRa7TGyWr7o2dPQWvNbVG
         ysKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=DDjritEZ1Ool0fGFQS6eJpZSyUgxdCU3ynPI7nO3IXw=;
        b=RxxH4kpP6TZ6P4hmZmg5jVpWV7DWsw3xqXX7CAS4OK2VrrX8HKI6eAfOkobWwhZMOt
         tXeS882++LygbNjpYfwOEK0ey7lvOOXz+jexbOF7Qe9+HEP5Mdlh8nNFVh8gbUxKo6TH
         I0y4lcOzVstc6KNHrOyL6EU4bVHkWqfYjOzjYqDDI12ldQoe7gWvszW/WYvVjm8Y/V+Q
         tQLNjmgvwb4W9rpwyp/wns2icg4GGdB1sttxwwM6opVWUmAZHZhzYhT/EDBmtpLJRceg
         +ZznjFGH7gE2ad0z3NKPFY2Hnoyh8PdbLqtMYxhZVGp6E9Y25qpOecdF8Kn4pwZPC9bj
         NDjw==
X-Gm-Message-State: AJcUukd0fIH9SVxBb7OJtDxH65proTpX5iA1BsRmZ7gwjvgUYLdz0A4n
        67IFy3beUZMr3QZmAegAJiSOOcLjPRQ=
X-Google-Smtp-Source: ALg8bN7+9fzPy5iKzvmMyh7JiU4AHcUv6qHHA/GYQV46xOxUVvMflry8CJIy8KaCf77u1c8zbl+JPw==
X-Received: by 2002:a1c:888d:: with SMTP id k135mr2998560wmd.137.1547550661712;
        Tue, 15 Jan 2019 03:11:01 -0800 (PST)
Received: from [192.168.178.171] (p50974f1f.dip0.t-ipconnect.de. [80.151.79.31])
        by smtp.gmail.com with ESMTPSA id a12sm82848374wro.18.2019.01.15.03.11.00
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jan 2019 03:11:01 -0800 (PST)
Cc:     linux-hwmon@vger.kernel.org
From:   Steffen Kothe <steffen.kothe.gc1993@googlemail.com>
Subject: f71882fg: Add support for Fintek F81804 & F81966
Message-ID: <ffb8c467-1ebc-c07d-7e16-cc8fbb0b2d9d@googlemail.com>
Date:   Tue, 15 Jan 2019 12:11:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D4746913E5E6D42607318E27"
Content-Language: en-US
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.
--------------D4746913E5E6D42607318E27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------D4746913E5E6D42607318E27
Content-Type: text/x-patch;
 name="0001-f71882fg-add-support-f81804-f81966.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-f71882fg-add-support-f81804-f81966.patch"

From 3b088a08348a18f6791526e92e5042d137287f1d Mon Sep 17 00:00:00 2001
From: Steffen Kothe <steffen.kothe.gc1993@googlemail.com>
Date: Tue, 15 Jan 2019 11:27:22 +0100
Subject: [PATCH] f71882fg: add support f81804 & f81966

Support for Fintek F81804 & F81966.
Enumerate chip and use Fintek F81866 as template,
because implementation is the same.

Signed-off-by: Steffen Kothe <steffen.kothe.gc1993@googlemail.com>
---
 drivers/hwmon/f71882fg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index ca54ce5c8e10..8a2bc1ecf991 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -62,6 +62,7 @@
 #define SIO_F81768D_ID		0x1210	/* Chipset ID */
 #define SIO_F81865_ID		0x0704	/* Chipset ID */
 #define SIO_F81866_ID		0x1010	/* Chipset ID */
+#define SIO_F81804_ID		0x1502	/* Chipset ID, same for Fintek F81966 */
 
 #define REGION_LENGTH		8
 #define ADDR_REG_OFFSET		5
@@ -2685,7 +2686,8 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
 		sio_data->type = f81865f;
 		break;
 	case SIO_F81866_ID:
-		sio_data->type = f81866a;
+	case SIO_F81804_ID:
+		sio_data->type = f81866a;	/*correlates to Fintek f81866a*/
 		break;
 	default:
 		pr_info("Unsupported Fintek device: %04x\n",
-- 
2.17.1


--------------D4746913E5E6D42607318E27--
