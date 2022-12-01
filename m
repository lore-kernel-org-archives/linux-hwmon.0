Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A95C4708E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiLAT3w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiLAT3t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:29:49 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15844C82E8
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:29:49 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id b2so6610646eja.7
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7p4ZRoKY8KyAbeLZ3D9FFno3zQClogoAoc0aT3MOswk=;
        b=cmKp5+osxcEKb3tLLjX5pcnFM5ol/fAQnZO4HPmZBJJzl0r8kVyCNT/d9/wiRLPgnR
         80vh9xs1IGdIvR61A03RKhTL8jlZ3bQRWCAWgF4C++Etw+u+eFH0dBZo34pp2Prtzccq
         zcsPUfNnHLHl5JDlxhSJenqQtFCU6UVADMotPapVRkIrv+jGSvGyuiJqFIybgavAE5dT
         xA1lxEi/f+1Zb7yEulIgSaPBBLbL57ElIiwUSt0nETKM1WyyZXxUjen8RuYherN6QjYo
         VF7e31ZTseFdg+2zPJgcv83oYFY0etQ4O8ZMa1jQPAMwCOEiSf9e78OT32ZjS8l+NvwG
         o45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p4ZRoKY8KyAbeLZ3D9FFno3zQClogoAoc0aT3MOswk=;
        b=h5mBS9BZObTPRdqVb9kqoSZ9JHxvjrIfE4N9bcevWj8QEqrZa4kNGHnGqt3FHDvlzn
         D2la8fd+nbdDCWr02wnjCgek6WKavhl/BIpoNwaVGSfqiFen8YW0+PiAXh78aJg8uROJ
         a+fR+fg1Dai1Lp5F5yNsXN2QQhxtr43LnspECDnmQ3DjhOpab0+elNlukt8/DUVae84P
         Cf4FmyvGVuwwujOTXXG9ayQjWhtgvBvRg5LVSB0484RaVm8Jr9ITh9EymTq67oCT9NM2
         MA/FmZ7XxOOoqxRFtwTl5+b2EGJGXGf75K3iV7YLE0lFUg29HMbFUUgZybtdh+Ynl8JV
         bnzA==
X-Gm-Message-State: ANoB5pkYKnwE/855t2dsCcO69D38T5LVz1l73iIH8TpHFtmj/wJlewxw
        97lrWL6U/jc+loq0jgCWwBwbWg==
X-Google-Smtp-Source: AA0mqf6wJMguBRZ+3RDQjOzLIrbL3+wV5RnCVYcQsQFAXhVegf130StesPXX9DTehUn93DFb09aOCA==
X-Received: by 2002:a17:906:c259:b0:7b5:9670:ae0 with SMTP id bl25-20020a170906c25900b007b596700ae0mr42906077ejb.321.1669922987667;
        Thu, 01 Dec 2022 11:29:47 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090639cd00b0073022b796a7sm2141380eje.93.2022.12.01.11.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:29:47 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v4 5/5] hwmon: (pmbus/core): Notify regulator events
Date:   Thu,  1 Dec 2022 20:29:39 +0100
Message-Id: <20221201192940.1584012-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221201192940.1584012-1-Naresh.Solanki@9elements.com>
References: <20221201192940.1584012-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index daf700210c68..dbdf8c8187db 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3159,6 +3159,11 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (ret)
 			return ret;
 
+		if (event) {
+			regulator_notifier_call_chain(data->rdevs[i], event, NULL);
+			ret = IRQ_HANDLED;
+		}
+
 		page = rdev_get_id(data->rdevs[i]);
 		mutex_lock(&data->update_lock);
 		status = pmbus_read_status_word(client, page);
-- 
2.37.3

