Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10943C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239436AbiAKQvY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQvY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:24 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3E5C06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:24 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id s21-20020a05683004d500b0058f585672efso19271730otd.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nDLdRvmB3dM6G7qkWrksPE++6DCBZiL1lfTPNl7o1NY=;
        b=ZDYcSC50n35hJYdATnR4gvNcRW4hvG3xW8yBuC564F8wN1OYAiHY2f2yJyvBAF6+U9
         HfAcxuhBdZ6UEpefYadnbr1VFw9Cj11zI3tGz8CXN34SCBs3MdP7qaiCTGuYghhtCF3Q
         vyMD3o2dClPK/4znMtEGnH9TNSeWsV8xme3lcgB0yR+nzbLR/I7IW9cRFxO/ROj0iXdQ
         qLnxQ9V728p/cV6lnZyZ9jwfm61uAZUEcqChfKWIvOQCEk2+mvEFHW+Ra8ebo6NaMxtG
         BJrhMTf2CsbI1lhyqeST4qy215iBferaesykf37B2YHHPxgJ0lKu5ayVrB0Yp4mPloBv
         dRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nDLdRvmB3dM6G7qkWrksPE++6DCBZiL1lfTPNl7o1NY=;
        b=KJdtEPsPpKMuWSq0KOYqKyfEyBRdHAdU6M38KTgt/kshyso510GRgq8fSUehuq92AE
         4G263tfMbV4GfncVsOXqRiOaJQLnpJLxc54PRH4pfJlCNxdsfiSMqUHdNkgDJ/EhY/D4
         Fl4AH3iz3pw+rG7cehqO6gw27ofWwa4f2THJ4aaQWkeCN2mYXbe2NfRfgJlOGR3LRRHw
         5MbooRJmdih04BDmSY1iG6cE7I3dLvYsKUaSes0y5y6cBu153wB+/mG1YE7rwreqoiaO
         NTeloe5yTZ1tn3ThGyubQbDtwvsMc+90TOMhuK3MCIp4PQQpsEnpm8plfe8dPMhdb1yp
         82NA==
X-Gm-Message-State: AOAM531GlyQbq6LZpUxBjf8aAix8QtpfP6oxq2KXIToyfR0twsIAs5Ia
        XMoFMvEtTb9Vs9D+w5fi4LQCgs2fsnE=
X-Google-Smtp-Source: ABdhPJwbSd9WWx6fZCF0hdjF/KdeJt3a/6Hy1r4F/kBSctX/3lRqBHQe/1EYIFfRGYUEXbrnKviqmg==
X-Received: by 2002:a9d:3603:: with SMTP id w3mr3979988otb.59.1641919883327;
        Tue, 11 Jan 2022 08:51:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c4sm2030636ook.16.2022.01.11.08.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm90) Reduce maximum conversion rate for G781
Date:   Tue, 11 Jan 2022 08:51:11 -0800
Message-Id: <20220111165116.1298459-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to its datasheet, G781 supports a maximum conversion rate value
of 8 (62.5 ms). However, chips labeled G781 and G780 were found to only
support a maximum conversion rate value of 7 (125 ms). On the other side,
chips labeled G781-1 and G784 were found to support a conversion rate value
of 8. There is no known means to distinguish G780 from G781 or G784; all
chips report the same manufacturer ID and chip revision.
Setting the conversion rate register value to 8 on chips not supporting
it causes unexpected behavior since the real conversion rate is set to 0
(16 seconds) if a value of 8 is written into the conversion rate register.
Limit the conversion rate register value to 7 for all G78x chips to avoid
the problem.

Fixes: ae544f64cc7b ("hwmon: (lm90) Add support for GMT G781")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 74019dff2550..cc5e48fe304b 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -373,7 +373,7 @@ static const struct lm90_params lm90_params[] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
 		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
-		.max_convrate = 8,
+		.max_convrate = 7,
 	},
 	[lm86] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-- 
2.33.0

