Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B92C04A6A
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Aug 2023 18:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjHGSFR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Aug 2023 14:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjHGSFQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Aug 2023 14:05:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01040171E
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Aug 2023 11:05:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86D19620B6
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Aug 2023 18:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E8FC433C9;
        Mon,  7 Aug 2023 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691431514;
        bh=mzk71NWb88xS7VyuFnDy5cLjpTsU/+dCWG/qpNuLc20=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pbH0T0EUr9EOEFuCGdvN0xKqcybFsdQ/MEryb95ofTOyxnbKkR5kN+YuZk45OOUk2
         f1sIoe6P21gi52/aBlKkfey+Xpvhct+2XKKklFsvLDJ+labtGibXCwLKSTfa7w0OX8
         kpRiVy+I7X50NJ8Z3f8p+Hc1FFfrKn2Cb159xLFJFBCdi65UvNzpw+KU4G9R+rYxjR
         fVfqpBPjHSK3IFMqxf9ABJW+90GsjxHaFnSwqDA83EaOgOVfY8lQg1FbksLOaVsbwY
         VB579fN7sxxpuOtKfnXuyjwXO4s48QzuGFqF14yp5yK9NiwN+3X8RbF8tki0L+zQ9l
         FruIgDqkX8D8Q==
From:   Saeed Mahameed <saeed@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
        Tariq Toukan <tariqt@nvidia.com>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Adham Faris <afaris@nvidia.com>, Gal Pressman <gal@nvidia.com>
Subject: [PATCH net-next V2 1/2] net/mlx5: Expose port.c/mlx5_query_module_num() function
Date:   Mon,  7 Aug 2023 11:05:06 -0700
Message-ID: <20230807180507.22984-2-saeed@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807180507.22984-1-saeed@kernel.org>
References: <20230807180507.22984-1-saeed@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Adham Faris <afaris@nvidia.com>

Make mlx5_query_module_num() defined in port.c, a non-static, so it can
be used by other files.

CC: linux-hwmon@vger.kernel.org
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Adham Faris <afaris@nvidia.com>
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
Reviewed-by: Gal Pressman <gal@nvidia.com>
Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h | 1 +
 drivers/net/ethernet/mellanox/mlx5/core/port.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
index 43b0144121ca..d54afb07d972 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
@@ -176,6 +176,7 @@ static inline int mlx5_flexible_inlen(struct mlx5_core_dev *dev, size_t fixed,
 
 int mlx5_query_hca_caps(struct mlx5_core_dev *dev);
 int mlx5_query_board_id(struct mlx5_core_dev *dev);
+int mlx5_query_module_num(struct mlx5_core_dev *dev, int *module_num);
 int mlx5_cmd_init(struct mlx5_core_dev *dev);
 void mlx5_cmd_cleanup(struct mlx5_core_dev *dev);
 int mlx5_cmd_enable(struct mlx5_core_dev *dev);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/port.c b/drivers/net/ethernet/mellanox/mlx5/core/port.c
index 0daeb4b72cca..be70d1f23a5d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/port.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/port.c
@@ -271,7 +271,7 @@ void mlx5_query_port_oper_mtu(struct mlx5_core_dev *dev, u16 *oper_mtu,
 }
 EXPORT_SYMBOL_GPL(mlx5_query_port_oper_mtu);
 
-static int mlx5_query_module_num(struct mlx5_core_dev *dev, int *module_num)
+int mlx5_query_module_num(struct mlx5_core_dev *dev, int *module_num)
 {
 	u32 in[MLX5_ST_SZ_DW(pmlp_reg)] = {0};
 	u32 out[MLX5_ST_SZ_DW(pmlp_reg)];
-- 
2.41.0

