Return-Path: <SRS0=4YUc=3W=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88967C35249
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E9F020661
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgBBXcB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Feb 2020 18:32:01 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35162 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgBBXcB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Feb 2020 18:32:01 -0500
Received: by mail-ed1-f65.google.com with SMTP id f8so14173927edv.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Feb 2020 15:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6iV9yCuEDZbRLuwWqPr+6TfYYYUbbRrWCyU653KqGbE=;
        b=ip+qrxw+X8lx+taB3zUxC61ZWI3Jf1/WozNQq4yLpVRPp+KbJ/aebDFcl1Bguc4AOC
         u7ZVwK/SPBK5rke06sMVoL5WnDKL5G3JhLeLm8B2u7W3kr0zRu8EFLkjuxp6IOfMXMPO
         DdZV5zv9FUioBT3DlFozmfyEg5Jsm4JGtSqZhJXJi+98VgucRjkFw8+6NeIzr/XDp7Nu
         EIcZFDuYPOWvjHV2MFWfUSfipuGIIHzBm0r/JPEJr80FT0DkM0Ns7yIPAbtVH1N6wxDO
         VZjE1lrzLi6Her2yqMHDkOkoqtWPzfNHN9DrtdVTHDrSfyK6yIEliHOzEpTtmnu0GOPL
         huaA==
X-Gm-Message-State: APjAAAV0/cqjvHUM28yLAZSndYSiKm36Y5Yokk1B63UHyKhL3ICvWKjC
        O39cYhVlRKwQFzDFpNjMWLo=
X-Google-Smtp-Source: APXvYqzrts2JEWxHeqDyRP2l3EY6AYltVF8EAZ8X22yPftAJSKz5g/t16IBNvDYrbfiwz8tjM0k3Lw==
X-Received: by 2002:a05:6402:298:: with SMTP id l24mr9842438edv.70.1580686319947;
        Sun, 02 Feb 2020 15:31:59 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:4c8c:bac4:eefe:456b])
        by smtp.gmail.com with ESMTPSA id dk14sm909033ejb.12.2020.02.02.15.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2020 15:31:59 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH v2 0/2] dell-smm-hwmon: Add XPS 13 9360 to supported devices list
Date:   Mon,  3 Feb 2020 00:31:49 +0100
Message-Id: <20200202233151.1840067-1-i@hexchain.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds Dell XPS 13 9360 to supported devices list in
dell-smm-hwmon.

I have tested this on one such device and verified that the fan speed is
correctly reported, and can be controlled through pwm1{,_enable}.

Haochen Tong (2):
  dell-smm-hwmon: add XPS 13 9360 to supported devices list
  dell-smm-hwmon: add XPS 13 9360 to fan control whitelist

 drivers/hwmon/dell-smm-hwmon.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: 46d6b7becb1d5a8e697db786590c19e4067a975a
-- 
2.25.0

