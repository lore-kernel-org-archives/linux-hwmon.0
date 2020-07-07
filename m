Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84277C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 01:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E18206F6
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 01:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTTesSpA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgGGBSO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 21:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgGGBSN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 21:18:13 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB02C061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 18:18:13 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id i1so31258835pgn.13
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 18:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=POAVhW08+ZU8xNdsup56SoBpII/10dTLj/pBlPAsXoM=;
        b=pTTesSpA/Wt0QVgk5baicGZGjj69MSJbJ4Mi5YjG8KasrEtX20Bo/ZX9b+Co9GqKvN
         A04FUEoHRLV0jRqBS9Ir54zmpfvCgjJ7Itba7qb24b0ovI7HVPC+TtlDsf+URVEYCjFL
         nluMHi6RT0yFfy+IhtV3BDURvgaTBBxpcJHOXHHMyFAE9jlisvuxxAQtu1pB+DeZrKfo
         z6pNRzV8xWmClk67t6ZiKRRuQd6Kkqab0tOHQUA2GPvU2c1U3Cwy9dMNyi/HcT0SnrDY
         HntDo9ctgMs1atfFq7v/kC50zwyKbVUsLapSpLtWFD7w0AAANAce0R1QuapQvaU0B1JR
         joRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=POAVhW08+ZU8xNdsup56SoBpII/10dTLj/pBlPAsXoM=;
        b=pATORNze+w+tmqg+/N9DkgN0ePpioVFXXkJTcFYOD6UkZPbot8xyuZcIT9savnDPbj
         Vp2Qa6ZqbdK2p+nt9TCjEqivL5XKst+7bVwtI9zGl+EOyjcCuALk8+2wJ8VlP8uRgpZr
         RQxUK6OTL9t7GiZ2UMEGBrueK9IfRHmZXikhOO6xQJBvT5XFVYtDsf5n7kmpc9ocVIiF
         xh+wNoJjIcd4TnSNAGjv/+SAc06ZNlMxH1dQtec5lSkeyRl3WrkYEF/EhJs0L13+pyXK
         zH1TZ7wmS+UmUezHaSa2+MKIWagjxvE7BTWEIJxZd2kElho7Gbx+a69gCj0GdAn6rvRh
         4O2Q==
X-Gm-Message-State: AOAM53313SW/8l1ECLUepGlmCDgPTDv2DUf43nspxttdW9w7O+iD5W3I
        coJlO6gekl+7XbRhnI0c+shyGjbxV24feCuj
X-Google-Smtp-Source: ABdhPJywWILE5dEPoNQpf/klFKbEE+y0dTcS6+2HIRsETRXH1Nk3SPz6eqO+XBlkQZVC+O2e+08/NWEMTi4vljkq
X-Received: by 2002:a17:90b:4c12:: with SMTP id na18mr337569pjb.0.1594084692806;
 Mon, 06 Jul 2020 18:18:12 -0700 (PDT)
Date:   Tue,  7 Jul 2020 01:18:09 +0000
Message-Id: <20200707011810.2508233-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v3 0/1] hwmon:max6697: Allow max6581 to create tempX_offset
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linchuyuan@google.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqil@google.com
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
  - Fix the type issue where comparision is always true
  - Change the line limit to 100 char instead of 80 char

ChangeLog v1 -> v2:
  - Simplify the offset reg raw value to milli ceisus conversion
  - Substitute the temp1_offset with dummy attr
  - Avoid using double negative in the macro definition
  - Return the actual error when i2c read/write is failed
  - clamp the value to MAX or MIN respectively if an out of range input is given
  - Provide mux protection when multiple i2c accesses is required

Chu Lin (1):
  hwmon:max6697: Allow max6581 to create tempX_offset attributes

 drivers/hwmon/max6697.c | 92 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

