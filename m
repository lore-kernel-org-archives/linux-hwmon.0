Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60532C001B0
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Aug 2023 18:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjHGSFP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Aug 2023 14:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjHGSFP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Aug 2023 14:05:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198F81726
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Aug 2023 11:05:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB7C1620B8
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Aug 2023 18:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A38CC433C8;
        Mon,  7 Aug 2023 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691431513;
        bh=khhrHEcrt8iKqC86bY8W+ZDcB7Yt319gt0tSM20oNxI=;
        h=From:To:Cc:Subject:Date:From;
        b=MFVSnBLWAyd08paXes+S8/is/fvl6giMr4YpQ5QPucSbokZr+aAfUeyAl2OKHRZjd
         FhDkFm6+BkVYq9qibcS1pDy36KpSBZs2caXt9fVdph3FZunBwiwnUC2YJL5oVDboHz
         S16B/+Qxn89IfG9RM4aOaWqCWIKFWMOf1VAjrxxk+ojFz2IIrD3ZGdnuxPaGkEoEAj
         +ATL022iRKPVbpVQ/arQZQyvQsJ5O1yCBq3HZV5AFQbDDrbU4zpVbKdfD26pjyKkxw
         a5zsEynWeYJPCIfoyZ002Noz/ZbkiGcIVaJOkbWO0AIIyxoIxOGFcJxAjQqBvmtPee
         uMUzcCbkqdRtQ==
From:   Saeed Mahameed <saeed@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
        Tariq Toukan <tariqt@nvidia.com>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH net-next V2 0/2] mlx5: Expose NIC temperature via hwmon API
Date:   Mon,  7 Aug 2023 11:05:05 -0700
Message-ID: <20230807180507.22984-1-saeed@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Saeed Mahameed <saeedm@nvidia.com>

V1->V2:
 - Remove internal tracker tags
 - Remove sanitized mlx5 sensor names
 - add HWMON dependency in the mlx5 Kconfig


Expose NIC temperature by implementing hwmon kernel API, which turns
current thermal zone kernel API to redundant.

For each one of the supported and exposed thermal diode sensors, expose
the following attributes:
1) Input temperature.
2) Highest temperature.
3) Temperature label.
4) Temperature critical max value:
   refers to the high threshold of Warning Event. Will be exposed as
   `tempY_crit` hwmon attribute (RO attribute). For example for
   ConnectX5 HCA's this temperature value will be 105 Celsius, 10
   degrees lower than the HW shutdown temperature).
5) Temperature reset history: resets highest temperature.


Adham Faris (2):
  net/mlx5: Expose port.c/mlx5_query_module_num() function
  net/mlx5: Expose NIC temperature via hardware monitoring kernel API

 .../net/ethernet/mellanox/mlx5/core/Kconfig   |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
 .../net/ethernet/mellanox/mlx5/core/hwmon.c   | 418 ++++++++++++++++++
 .../net/ethernet/mellanox/mlx5/core/hwmon.h   |  24 +
 .../net/ethernet/mellanox/mlx5/core/main.c    |   8 +-
 .../ethernet/mellanox/mlx5/core/mlx5_core.h   |   1 +
 .../net/ethernet/mellanox/mlx5/core/port.c    |   2 +-
 .../net/ethernet/mellanox/mlx5/core/thermal.c | 114 -----
 .../net/ethernet/mellanox/mlx5/core/thermal.h |  20 -
 include/linux/mlx5/driver.h                   |   3 +-
 include/linux/mlx5/mlx5_ifc.h                 |  14 +-
 11 files changed, 465 insertions(+), 142 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/hwmon.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/hwmon.h
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/thermal.c
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/thermal.h

-- 
2.41.0

