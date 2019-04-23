Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F67CC282DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F41022077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hah/BTLv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfDWNdW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37353 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id e6so7629540pgc.4
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LeFMqufZ1aNyR/ECVgA8MKG1sr/7G1G8j4FK204c/FI=;
        b=Hah/BTLvvCdpSfWPZyFDGIrNtenau67HRF7oBEBwGJYIQpoHQ2hg7O39nTuukl1AD2
         X8rJdm5hdA58pTiP/bSJD1sAc8+WZ5lvWv0IizGgu3hMwrqOMlhUl6+w27VheQwCPi1g
         TLssOml5RdnbjW0tsXKuTwHuULIsGSCAh+iS91sJMRH1+5S2jV8Zyuz8ypWJf/l2v21D
         1wInQ/uM31gzl981/aXMHG5JKP59fzxJ3CdjQfqbfIef93yAdEpZ2VqUe/eTf3UjCE3U
         b11dbE+WaCPQAllRh86E0VJfSFJhIiKtAWms/5jXmsMnye0JusFxhMFc2N6U0gidwt8E
         Lf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=LeFMqufZ1aNyR/ECVgA8MKG1sr/7G1G8j4FK204c/FI=;
        b=di0wHAKrN1MZ4KMkxewBfgSshbJT3+QjV3x8RtMzKuN8nOhFbH5F76ccfa7LtfbaiX
         JYAZUya+3dyFmk8LaPs2pqsMCQ/2SvQlbTchVogfnuqMtflQuKH2/5Pdtvno11DHlFfq
         a8s21Hd2AB1FmPkZ8YbCP3/ebnUpclJDjyPKw0nLFWdkojJDMr/nCIg0DA8iHqqQ5HSR
         qwpuxROPLxPY7cBOSC3YIW3DW2dPM5NTRtZSxVk7cHTEkNoze67E3eUqn1spT6kJqvD2
         7Yl0gxEEb0F5PdeYpM8MI9m8NXyX/TC5rzInd9ey7hnOx95fEZ2rrUjoLsnfq0hUARFM
         X9sg==
X-Gm-Message-State: APjAAAWsiMRz8zutl1qdZvyiO5lPgW6W6jPgt6MGzDCgKvpsp/A0hYsV
        CHd5gWWxGKCKJCiWneFdXD23BunY
X-Google-Smtp-Source: APXvYqyep9D2flkkhKSyoNorSisYlmbirJh5a/VscBkvUvLGbcGo55yUykuBG58JYMXktRNz5Q2AuQ==
X-Received: by 2002:a63:171a:: with SMTP id x26mr25303235pgl.438.1556026401728;
        Tue, 23 Apr 2019 06:33:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j12sm19757432pgg.79.2019.04.23.06.33.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:20 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 04/11] hwmon: (max6650) Declare valid as boolean
Date:   Tue, 23 Apr 2019 06:33:04 -0700
Message-Id: <1556026391-15360-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Declare valid as boolean to match its use case.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index ac05cc5627d7..8fa888b57efa 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -118,7 +118,7 @@ struct max6650_data {
 	struct thermal_cooling_device *cooling_dev;
 	struct mutex update_lock;
 	int nr_fans;
-	char valid; /* zero until following fields are valid */
+	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
 	/* register values */
@@ -197,7 +197,7 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 							MAX6650_REG_ALARM);
 
 		data->last_updated = jiffies;
-		data->valid = 1;
+		data->valid = true;
 	}
 
 	mutex_unlock(&data->update_lock);
-- 
2.7.4

