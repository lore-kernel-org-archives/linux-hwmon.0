Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE24C32771
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 22:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiIUW2F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 18:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIUW2D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 18:28:03 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0079AA8308
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 15:28:01 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c198so7368518pfc.13
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 15:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=w8fMXphg5BaLYQfHSXzeIymQmLF+9cb3n83YbMLjXgY=;
        b=dZxstFGVSyzb9IwNzlzn1g5kxZkKv2rxFkJON9O83SFgxkmd1PRIgVIxNqMD6ADgQ0
         JgVDXGk1XOfIaGDjnA4L4Ye/u48IKi3LHcSedZyWwwSzt474FHp/eknYlz2JEj1j/wey
         IqXCVruIh0+U6WQlKWTmBv0CprNf562MBm3qIPVH2M0RvKXu26NFxZviOt+1oEgThC78
         KDrmEkFY1m4ZzPZ7UVb5uO5i7MYBIkptQbUejnlikD9u0ZXOnBwC8i2mRB/TBXeLB5w3
         2vCEey9NV865XTT/KDRbA5nvLYFpmxU0IEZkOXi42wYqdTY6CFFjbd2/jyUGanvjPJT5
         yLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=w8fMXphg5BaLYQfHSXzeIymQmLF+9cb3n83YbMLjXgY=;
        b=Hsr5NiLyn0BoPnIGZjRvSw48XHAiCSu0OjZD7xyfELakbsH+A9QkWCeN/tODHVeT1r
         wy3QOxPRAGM36biVnVii2v8RtP1qyNudxd/sDu4lsQO4Yr/1Mpm65d4ivzAiOxtbJWN9
         MSa236VOOALjVogj2Pc3LwHkBWzXeUjP86y+oFJPF5JZdwsEkaJ+/a4rts2wlKMWIxaz
         Kg5d0IAycLwUGPlQXtOV+zD4S6pqDFqQ5csW3Mr3d+n9lgELq77xykedaT4B1mdomJ5w
         5WRH24ae3h+iM5nUxHTeBQJ+q0VaJRCKBfnHYdrSkHQUE4PJ4XV4GNpOaTloz8Pv+AsO
         NscA==
X-Gm-Message-State: ACrzQf2632ZuzMM/79MUpGmmjrc9bJyrPTWXK/a5jSOJImA5+LNjtdxp
        VbcYLaUcKYn/YTAtQVManqETEYKKY5grmg==
X-Google-Smtp-Source: AMsMyM52ndpRbty4LkfKTyjkjz4PJh0ySjggwXMvWls/8jcb4C1a9uATX9DE5Q+xNx+uxN13y+zUUg==
X-Received: by 2002:a63:cd03:0:b0:439:ae52:3fbd with SMTP id i3-20020a63cd03000000b00439ae523fbdmr337587pgg.393.1663799281108;
        Wed, 21 Sep 2022 15:28:01 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id q17-20020a170902f35100b0016f1ef2cd44sm2424109ple.154.2022.09.21.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 15:28:00 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v1] drivers: adt7470: check the return value of adt7470_read_temperatures
Date:   Wed, 21 Sep 2022 15:27:48 -0700
Message-Id: <20220921222748.1667190-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

adt7470_read_temperatures() fails and returns error when operations on
regmap fail. adt7470_update_thread() currently does not check for it and
propagate the error.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/hwmon/adt7470.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index c67cd037a93f..0aadb2dc067f 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -289,12 +289,16 @@ static int adt7470_update_thread(void *p)
 {
 	struct i2c_client *client = p;
 	struct adt7470_data *data = i2c_get_clientdata(client);
+	int err;
 
 	while (!kthread_should_stop()) {
 		mutex_lock(&data->lock);
-		adt7470_read_temperatures(data);
+		err = adt7470_read_temperatures(data);
 		mutex_unlock(&data->lock);
 
+		if (err)
+			return err;
+
 		if (kthread_should_stop())
 			break;
 
-- 
2.25.1

