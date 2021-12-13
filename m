Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22425C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 14:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbhLMO2p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 09:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239341AbhLMO2m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 09:28:42 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B54C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:42 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l25so53075218eda.11
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOV2Ne7d0A8Kdf6xwx3NE3JJ9QmHq4erbHgwEhWh3GU=;
        b=E8jZm19FtNAMMAWTVPA5ir7f+JnjcuBE2QZtNyl7TFRbWgdAQTIuw8+xdQoM52+ci1
         egWh2NXM9G9UPCmyG5L8HgsLHsmq1tGmK4ErCM9Q8lp9Xq0L987cbAOPPqvv1XsUNYnx
         oOlhMW8F6/dr/8RZjZ40sTu6e0xK1kff6XNR0lK2Shumvipl8O6P1MPlotBw5cObEe56
         i5qt0IUpVhIItdw8MjMSzEetqIsBt4fUPZsWR9YXM0QHWVk2tZJPr+HZUPPmt5r0OCsj
         33LXhaOnKTlJvcDFgfTB90ODK2zTnnVKhZFHE8/GFdcLUuXHicx3eetTvshnL5zaYUH7
         ld7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOV2Ne7d0A8Kdf6xwx3NE3JJ9QmHq4erbHgwEhWh3GU=;
        b=7edvG4gA9MQI1SpltDAmnlXjFUR+T+HNyoKbI8g7oqsS09gm1HZ1npYtAIhL0phfRK
         Wc+OVbFLrbta+nw0QfguX1JSk50sVUP/xEpbZ5bZjtRSkvjWp7k2xnrQ1/lUA49HGtGq
         r0D5mFqgrhjlL76p+7CFfPiQXF5wNw46zULFTC/7woQaP4KE1lXo5IdEDftJMGvX3Q62
         eRJIwzWRNoPDXGVw4L+XwpgWOSUsRD/+apIMnUh5kSSg4IzBUWn4Lr36Sq6oK19D5n1U
         WTF+0X6zRTQE0CbcpdtJJeFEwoAG1ZKrLAzw54Af+6LfRYH3rsD7GZgjh3gGjDjPhOcH
         m84Q==
X-Gm-Message-State: AOAM532w/ZDrgLjRi7/rESjGzLQ0Ew6AsRt+BqX5M1uZvti9hMAM0bzv
        RfgQgH0xieUMzt56DgX+OOt956LMVNj6OrWG
X-Google-Smtp-Source: ABdhPJzDXRdIShH3ulEdqA+NFJZxPl7//1n919EXSrKjQBP94h2qUqBTql8HOdLDPODiZY01Majbdg==
X-Received: by 2002:aa7:c7cf:: with SMTP id o15mr65627310eds.176.1639405715674;
        Mon, 13 Dec 2021 06:28:35 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id kx3sm5996414ejc.112.2021.12.13.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:28:35 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com
Subject: hwmon: Add ir38064 variants and expose devicetree probing
Date:   Mon, 13 Dec 2021 15:28:11 +0100
Message-Id: <20211213142814.264802-1-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

these patches add support for similar hardware to the Infineon IR38064
driver.
The following features are added:
  - a .of_match_table is provided to allow device tree probing
  - add	an option to expose a regulator, guarded by a Kconfig parameter

Changes	since v1:
  - use of_match_ptr() when providing .of_match_table
  - Remove unused PMBUS_HAVE_VOUT_COMMAND


