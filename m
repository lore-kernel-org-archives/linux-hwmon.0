Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C19AC04A6A
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Aug 2023 20:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbjHHUiV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236177AbjHHUiK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2023 16:38:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A3C6601
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Aug 2023 13:07:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6671E62BF9
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Aug 2023 20:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F19C433C8;
        Tue,  8 Aug 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691525276;
        bh=/60YMHfDkmDehoWNl0MgRb6r4Oi3m5/8X3Irb+EMSDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QYgjpYS9P962Wqanio6o3FfZfkcYFU1/hFacgckGHM5LxXYAth97+yQAg8jMXSSIk
         XwWQyRN1/vmVKyEyHdfKj69OUmpDIopUjQ2PWhZjV8pTEVOCvp7/T8pFFQKqhV5aZg
         O3vw5SWUecUE8VkEbz952SYtIqMnnxW7NwOX9FcICiXs0zNZRI8S35k09xeg+rwcR0
         Frc/lbGkyzllhn/bXvZB7R1l7q1uIQIumMgYmT+9A0ZtOMJ9X9fpCXeGFOoHrd0nam
         E3TxXOCU+IWgh0DgPuL7122Rpi5OxVv49L/+JAvoyV9iyurJRp47ZL3zaB5rTLK8Pr
         ldfU/B9nNYw1Q==
Date:   Tue, 8 Aug 2023 22:07:52 +0200
From:   Simon Horman <horms@kernel.org>
To:     Saeed Mahameed <saeed@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
        Tariq Toukan <tariqt@nvidia.com>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH net-next V2 0/2] mlx5: Expose NIC temperature via hwmon
 API
Message-ID: <ZNKgmI4IFhHSw4N2@vergenet.net>
References: <20230807180507.22984-1-saeed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807180507.22984-1-saeed@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 07, 2023 at 11:05:05AM -0700, Saeed Mahameed wrote:
> From: Saeed Mahameed <saeedm@nvidia.com>
> 
> V1->V2:
>  - Remove internal tracker tags
>  - Remove sanitized mlx5 sensor names
>  - add HWMON dependency in the mlx5 Kconfig
> 
> 
> Expose NIC temperature by implementing hwmon kernel API, which turns
> current thermal zone kernel API to redundant.
> 
> For each one of the supported and exposed thermal diode sensors, expose
> the following attributes:
> 1) Input temperature.
> 2) Highest temperature.
> 3) Temperature label.
> 4) Temperature critical max value:
>    refers to the high threshold of Warning Event. Will be exposed as
>    `tempY_crit` hwmon attribute (RO attribute). For example for
>    ConnectX5 HCA's this temperature value will be 105 Celsius, 10
>    degrees lower than the HW shutdown temperature).
> 5) Temperature reset history: resets highest temperature.
> 
> 
> Adham Faris (2):
>   net/mlx5: Expose port.c/mlx5_query_module_num() function
>   net/mlx5: Expose NIC temperature via hardware monitoring kernel API

For series,

Reviewed-by: Simon Horman <horms@kernel.org>

