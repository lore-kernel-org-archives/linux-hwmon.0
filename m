Return-Path: <SRS0=52eC=3S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2861C2D0DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C620F2071E
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgA2PIo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Jan 2020 10:08:44 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45338 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgA2PIo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Jan 2020 10:08:44 -0500
Received: by mail-ed1-f65.google.com with SMTP id v28so17724edw.12
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jan 2020 07:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzE1/3ZtoGm5yMpuaBY+tPtQ8vS2mlWD/DUTQ4BkOlY=;
        b=ldUg5uxpazfqelt+UoqfQwwoDPYM0fcI4xQ+ifnOdUbOymsvdzKUZv+6j+ooMXZ9ba
         moPq6PiBwkJQcZHBx2Vx6Cy+qlEGSBF/Kr2FMfjqKQVwb/va6t4dZ3OFYnHbsNa7Gv0n
         Z6ZFKYOTQmjNygU0/QUdCn8FWA1xkt2WfzlIcdVxU6h7RgC5atuuTgjMGI7Mr3Nridgg
         btyvhmLkcSFdMm0Kofh96AZF9ZfyeZqVqaKpAcUY1qyEaFBF1iHTaYdAh2VH40blsgzX
         ybwnJPtxTjS0sUKZHWT0oECwAahDteNOGmMijbm8vxMV+RIwLc69FFyYLKpEGFWCy0zb
         PaCg==
X-Gm-Message-State: APjAAAXpmtaRAT1hwFNV9cd6jIXw9nO5IByyGCIlqIxehC96HnQG7gCi
        kpnOYnmjKUixk96QQIiTLnM=
X-Google-Smtp-Source: APXvYqzIqpZRRWGCcXXOQmuiaRmXpy+ApgdYNCT1CVh5XTbqU8NgV8k+hFX4T62bdZNo6uZYyJ4OoQ==
X-Received: by 2002:a17:906:6942:: with SMTP id c2mr7984798ejs.12.1580310522787;
        Wed, 29 Jan 2020 07:08:42 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:a512:349:7724:8528])
        by smtp.gmail.com with ESMTPSA id c20sm366318ejb.0.2020.01.29.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:08:42 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH 0/2] dell-smm-hwmon: Add XPS 13 9360 to supported devices list
Date:   Wed, 29 Jan 2020 16:08:37 +0100
Message-Id: <20200129150839.122689-1-i@hexchain.org>
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


base-commit: b3a6082223369203d7e7db7e81253ac761377644
-- 
2.25.0

