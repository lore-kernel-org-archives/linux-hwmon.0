Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E695BC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240586AbiAKQv2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQv2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:28 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7E9C06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:27 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id t6-20020a9d7746000000b005917e6b96ffso1382868otl.7
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eMQQjcWyxC/slG+JpdjpvXwDi2oVNQYC2xhLo3KL95c=;
        b=Y34JyHdmwd2c8jW6307GMAw2wLOiXj7vz4PjRXZNC186BET5oQZTOahHKcomk1l8wg
         /vw6XoPDI6Tl/GH+Wgiq/TSxnx/2djI7npkTADVUyGR/lkA3ndVtRPRcLuquPlHkK7ks
         qKZ97ymtlMy8lVspPmLIutkEbcqsIfQgFoaSxqNbGxTWnysbsvkVkG2XuuE6Y5/XMbXL
         doe+nMKldALbum7c5f0lCyJfTFFXS5TQNCUihnrg2ekhDya2EVOYzqPYgWzZyJ9ARwSR
         PYiYBRts92engdcMq3KqJIHnLPcipQ5LWq4IEx7LBaO/qHZp6tkRb47TWZKOULHNcGlL
         Ubcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eMQQjcWyxC/slG+JpdjpvXwDi2oVNQYC2xhLo3KL95c=;
        b=3vU2C6sbIONIKvaQTp/Rm7PgpPOhjddVkzrfI9vrlheLJOmfhwxZgHnY/7OEHl9ngF
         Co6egc5OxNZ8AeP9RXVVAnaCgmUbvOULn6ndC1wfc1AIBLmlU9Smkj5nSgy6/547E0+E
         MQQZs18GjTnXrnQPHCk4F/yLNLf6/qZbsYfgXB2FphGId+5mgLwXbsHv3mvFVM0XurIS
         xBuR1eco/V8ipv8EpFoxtNdgnj2SvZS3AbFPvCyZjOlIc2v/WVk7qScd5oSA5Qyl+FZA
         zZqVFcnRmDVcdQS9hMnVgJ2wWp+m5i+ycO1ym1W04UgbT60/+rTJPkuDj0HGeFdwdoRf
         Y3Ig==
X-Gm-Message-State: AOAM531pVD36SjvOCjuJxhlMD/IHhE8x2mR5FgQ4rrGJC2DwLDcDyoVR
        mf9CE6KinD6KARTR632m1fJEL7DbIjE=
X-Google-Smtp-Source: ABdhPJwXbCNaOnezuT5Wz+uzMF27Ck0RDl5OhgJFaezG+QdTK2bJ3/JsEsPXBy+Cdtd5N6qtwbCvRQ==
X-Received: by 2002:a9d:69c3:: with SMTP id v3mr4122938oto.81.1641919886996;
        Tue, 11 Jan 2022 08:51:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c15sm1984990ooq.30.2022.01.11.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Lehan <krellan@google.com>
Subject: [PATCH 3/6] hwmon: (lm90) Mark alert as broken for MAX6654
Date:   Tue, 11 Jan 2022 08:51:13 -0800
Message-Id: <20220111165116.1298459-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Experiments with MAX6654 show that its alert function is broken,
similar to other chips supported by the lm90 driver. Mark it accordingly.

Fixes: 229d495d8189 ("hwmon: (lm90) Add max6654 support to lm90 driver")
Cc: Josh Lehan <krellan@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e4ecf3440d7c..280ae5f58187 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -400,6 +400,7 @@ static const struct lm90_params lm90_params[] = {
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6654] = {
+		.flags = LM90_HAVE_BROKEN_ALERT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 7,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
-- 
2.33.0

