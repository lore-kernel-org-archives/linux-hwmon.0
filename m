Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED10C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F58961462
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhENVVK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 17:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhENVVK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 17:21:10 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C89FC06174A
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:19:57 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso430019otg.9
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ZZ0HtIGVXXIJ1f+/Bs/fdp/ZY9GKmcbcO6YHDzt1hWM=;
        b=PW9jNfdBsdFsi54f0YqydXeAf9zSYBB1Tpy5HcCsjNsTAT9C/zTCz2RwsYh1cvtDh5
         CzKV6yF509ogk6Syy54A29O6weowMpFstd/W26Nd8P7HGOqCNIBb0hrl/TfM2Ccz/FXC
         buySBoTJUb0rWtXK7HIr0kgGzpC4qwDYE4oiVxq+xrJeEkrvWTwS4Ky0LVFWDrqXBt/9
         JNKTOgR9gNYA/1nNbAWN2DE3aXaaVlxRfNuThzmU3wwwqZ1kVJrK8J8mX6SSDuxZbilS
         n07FcSx1JeqWtt5S5Zwt3VrRqBAIs9ZHFr25YiWlhW3PxgjB08czDIzv7eWXDXdPfD1u
         CraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ZZ0HtIGVXXIJ1f+/Bs/fdp/ZY9GKmcbcO6YHDzt1hWM=;
        b=g0JQY/ukfWESmXm2wjefJo8DB3nhPXwKYXXwboHY6/9zNMN18oQx4IhDCJC1z326EC
         f0x+g05aSMq8XdUfKBTbxmFWZGkcbVhGZh+B8ShOW75eSdDmT25bz1kK5DUveUvC0Igz
         QB0yaEKQCE4pUeg80yByh5OwwhtZWFhtNiMjQsfak/3noMXbcQV7AIonP4uP6zwDkQit
         ty0LuU490ieFYsBILow3IXraylx9TP1ZCW7Tyx2luB7AVfncsS/kOlV7aELk2VwykO67
         MageeAzhe8PVDhXbfTAYxRSZszNigSJm7qQ1jkJj0a07Z+UDkKVKt1NQ9IobKBlxG1UE
         2uGQ==
X-Gm-Message-State: AOAM531v/zotsr8jRvpg/+CR2bO2/aSFbOd94ePqfK4ZjrjBOvG8HYFg
        qU6aqDoXUNW6r5Krz3k1DsjCe2IllMGoEA==
X-Google-Smtp-Source: ABdhPJwwliRGaGYZprEh0JxY38r3crMTEBeh+3f2v6c4+esGdGXBKqet6jAo259eAY0qAKEMI63jdg==
X-Received: by 2002:a9d:459a:: with SMTP id x26mr42191280ote.337.1621027196777;
        Fri, 14 May 2021 14:19:56 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::23])
        by smtp.gmail.com with ESMTPSA id h20sm1414401oie.33.2021.05.14.14.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 14:19:56 -0700 (PDT)
Date:   Fri, 14 May 2021 16:19:55 -0500
From:   Grant Peltier <grantpeltier93@gmail.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, grant.peltier.jg@renesas.com,
        adam.vaughn.xh@renesas.com
Subject: [PATCH] hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for
 RAA228228
Message-ID: <20210514211954.GA24646@raspberrypi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The initial version of the RAA228228 datasheet claimed that the device
supported READ_TEMPERATURE_3 but not READ_TEMPERATURE_1. It has since been
discovered that the datasheet was incorrect. The RAA228228 does support
READ_TEMPERATURE_1 but does not support READ_TEMPERATURE_3.

This change fixes an error introduced in commit:
51fb91ed5a6fa855a74731610cd5435d83d6e17f

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 40597a9e799f..1a8caff1ac5f 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -244,8 +244,8 @@ static int isl68137_probe(struct i2c_client *client)
 		info->read_word_data = raa_dmpvr2_read_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
-		info->func[0] &= ~PMBUS_HAVE_TEMP;
-		info->func[1] &= ~PMBUS_HAVE_TEMP;
+		info->func[0] &= ~PMBUS_HAVE_TEMP3;
+		info->func[1] &= ~PMBUS_HAVE_TEMP3;
 		fallthrough;
 	case raa_dmpvr2_2rail:
 		info->pages = 2;
-- 
2.20.1

