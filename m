Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DF7C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 00:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D1E206DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 00:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1oR5Nv2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgGGAW0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 20:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGGAW0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 20:22:26 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12257C061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 17:22:26 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id t6so6343872pgv.5
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 17:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JG0nc/PQsFhA9vffwsOKBPdbMeEcOHpzHHSglR3WLWw=;
        b=R1oR5Nv2mkcoHdTCYtbv7cc+U0GKpKhgxzZvhm+9aH/05Vi+CTbBX2d2nCgNyVMHRw
         oW048mQlheMjASEg5ZDDiWo7HmWqYRKN3d5d6Y8MaTrWdIgXL5bJ/yzhhXnNYJqjnzwp
         huaQRcYimfM8CEUNguGvvTJD1pqyvns6Nj7ENHSvSi3bCJHKXYaFHW5zrOexyvEA2YJG
         mzDL1N2cGajETtBFsTLQh0/2hZAXvn+L+rF4kPSH1KE0jlt0G0OQ+v1/ASgphZoC4oFR
         QuJZpoIYQxb3zW8P15rAmhvVuHyKl9EnLQRz5E2wa4uqcab98FDTYMgxqkLH2H1K2WEh
         wy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JG0nc/PQsFhA9vffwsOKBPdbMeEcOHpzHHSglR3WLWw=;
        b=WRMlQiNszVh2Obv5Xpl/5G/ge9heQ5b4BWmoz3tOIZwO9J8gd4QMFdgTqQmjrMd96b
         1SJGDw+kVJHkDorP0bCJ1Zg1+iiEAHnGMN3fzc6JkBsE5AlLg4ImkoFBPIGMvw8PjMnh
         wtYleOfHUqM0hr/4e1VsWLhZK1XPB+kVsBB2hmY8dWUQBXKTkz61v7qehrCmbSqI3Lt7
         5dvr0sbJSiKYYLJDWbbDop/h/Fk/9ah0VXt4WNDIOEwprVTVKdpJpwdGtxkcTG8ZVcYs
         fZfFl16dNX7i4yf2PuR6bJ4nYBZYUrllt+8bFzjZuwsb/pnHRLJjnIuIsiNhiOuoxic1
         8bIw==
X-Gm-Message-State: AOAM530NycCvSkC2GLqTm1wJ58kgMhocdtJlyo49WrJPtNzuotEbVjgZ
        RCYCCC6+TCIW8PlOnxUl2IqXqdT3CqRjWcJT
X-Google-Smtp-Source: ABdhPJxF0KKDl2nRkHtxM5eoH7A6qMzwYS8j3RjZth1gG5jZGT683bnHILy2Cx926ClnabkCPeEMkWBckr3aNqSL
X-Received: by 2002:a17:90a:c290:: with SMTP id f16mr1589962pjt.143.1594081345585;
 Mon, 06 Jul 2020 17:22:25 -0700 (PDT)
Date:   Tue,  7 Jul 2020 00:22:01 +0000
Message-Id: <20200707002203.2494094-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v3 0/2] hwmon:max6697: Allow max6581 to create tempX_offset
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@roeck-us.net, zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Per max6581, reg 4d and reg 4e is used for temperature read offset.
This patch will let the user specify the temperature read offset for
max6581. This patch is tested on max6581 and only applies to max6581.

Testing:
echo 16250 > temp2_offset
cat temp2_offset
16250

echo 17500 > temp3_offset
cat temp3_offset
17500
cat temp4_offset
0
cat temp2_offset
17500

echo 0 > temp2_offset
cat temp2_offset
0
cat temp3_offset
17500

echo -0 > temp2_offset
cat temp2_offset
0

echo -100000 > temp2_offset
cat temp2_input
4875

echo 10000 > temp2_offset
cat temp2_input
47125

echo -2000 > temp2_offset
cat temp2_input
34875

echo -0 > temp2_offset
cat temp2_input
37000

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
ChangeLog v2 -> v3:
  - Use reverse christmas tree order convension
  - fix the type issue where comparision is always true
  - Change the line limit to 100 char instead of 80 char

ChangeLog v1 -> v2:
  - Simplify the offset reg raw value to milli ceisus conversion
  - Substitute the temp1_offset with dummy attr
  - Avoid using double negative in the macro definition
  - Return the actual error when i2c read/write is failed
  - clamp the value to MAX or MIN respectively if an out of range input is given
  - Provide mux protection when multiple i2c accesses is required

Chu Lin (2):
  hwmon:max6697: Allow max6581 to create tempX_offset
  hwmon:max6697: fixing the type issue where the comparison is always
    true

 drivers/hwmon/max6697.c | 92 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

