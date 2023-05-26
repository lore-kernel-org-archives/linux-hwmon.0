Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB72C77B73
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 May 2023 16:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjEZQj7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 May 2023 12:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjEZQj6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 12:39:58 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F17D9
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 09:39:57 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso894457b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685119196; x=1687711196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhb/vOFF2NqgnJM1Rv40XPvcXse6tdFjLG2Lqc9aS7A=;
        b=ELa+Z/oqn7//d9oMW6QBYham0tHrixc3lsUFhz/y9kXbcJYuCACIj3318IBPpO4uNX
         dKBgleJxx0WKCEG9o7FhIZpNUZbN04AON6qj/Z3t3wd4lJORIAFgIIlww1OMWeiVAIhX
         dZxc4n/Pp5iOv+pkphMrgySJ20Bl4eTQaTNvEAIWP7cZ8xjhZQwBI8HFwbfT6dlGtpUS
         I+nnugGvKqYrI5NVHEFsaNuqlEDmj2zfFFg6JwMJ/ZdCJyT+H4Fi0L9jRzunCse5IOGF
         +OLgf+5uRqtzwFerzlOwrbU1YCavSLVvcfPou/G8upt1NrhIArCBW/8E6NSr4S8d/Jyd
         VmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685119196; x=1687711196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qhb/vOFF2NqgnJM1Rv40XPvcXse6tdFjLG2Lqc9aS7A=;
        b=eP8nUYTn8joi8IExMm9SqKTFBzt6XH1C6ACHbUyvWm0ZZs5k5ldd4VtbJfxMt/5hg7
         bGP0SVU4rHUZ1/HMhXtr7CygTxBXo6iUtjSojLqkNXWmysLhnZvIwcVzXXbyAWwLO1h9
         jrpINLaiiYbfEbG29ueeXRi96qlg6lQx0ScecaJjRFB2dgYiSXHITcSv8uRywuSAq8zu
         eRFMuNy4R0PBwZ+qdhL3JCVsdgaz6L8PfvjJzkPSgIoalZrt43xUoLBcfglZo9Amnbdx
         ZM3HxuQ+e5Cf1W3DmaqU4FlTGfulQbWVQ0/EgSkFP2e4sOsbSIqS8I+ulFZO150G4G53
         3HKw==
X-Gm-Message-State: AC+VfDzmFaeDHYik1nM4ZaXkU0BdpdLPLo/GRnbzAhrua29WaA1F9ur3
        hDBGyBn/Un1qUyA1zO4fLbM=
X-Google-Smtp-Source: ACHHUZ7B9auA1927/suqZVkD02v6JHlUMPqmsO/ObWj/baaaCUPp6nES00AZCvXBctnR+X9y47NTuA==
X-Received: by 2002:a05:6a20:12c7:b0:10c:80a:47fd with SMTP id v7-20020a056a2012c700b0010c080a47fdmr3266308pzg.36.1685119195860;
        Fri, 26 May 2023 09:39:55 -0700 (PDT)
Received: from Osmten.. ([103.84.150.92])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78710000000b00627ed4e23e0sm2933731pfo.101.2023.05.26.09.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:39:55 -0700 (PDT)
From:   Osama Muhammad <osmtendev@gmail.com>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, Osama Muhammad <osmtendev@gmail.com>
Subject: [PATCH v3] hwmon:(pmbus/adm1266): Drop unnecessary error check for debugfs_create_dir
Date:   Fri, 26 May 2023 21:39:38 +0500
Message-Id: <20230526163938.9903-1-osmtendev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch removes the error checking for debugfs_create_dir
in adm1266.c. This is because the debugfs_create_dir() does not
return NULL but an ERR_PTR after an error.
The DebugFS kernel API is developed in a way that the
caller can safely ignore the errors that occur during
the creation of DebugFS nodes.The debugfs Api handles
it gracefully. The check is unnecessary.

Link to the comment above debugfs_create_dir:
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L565

Signed-off-by: Osama Muhammad <osmtendev@gmail.com>

---
changes since v2
	-Added more descriptive commit message.

changes since v1
	-In v1 the IS_ERR was used for error checking which is dropped now.
---
 drivers/hwmon/pmbus/adm1266.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 1ac2b2f4c570..184d75269d2b 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -340,8 +340,6 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 		return;
 
 	data->debugfs_dir = debugfs_create_dir(data->client->name, root);
-	if (!data->debugfs_dir)
-		return;
 
 	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
 				    adm1266_state_read);
-- 
2.34.1

