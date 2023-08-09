Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF5DC001E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Aug 2023 23:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjHIXA1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Aug 2023 19:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjHIXAZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Aug 2023 19:00:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C6AE75
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Aug 2023 16:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB05564BF4
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Aug 2023 23:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 231B0C433C8;
        Wed,  9 Aug 2023 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691622024;
        bh=P74glUdH/007C96kaPxkIGE9cQ320WPzAI+0Uft+0Cc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IAKmtyKLbo0n+xuZBTTpNDOKXzsgdCFBHb9Xt9qb9eUK/js79+hK+D1IZ2HqYTEIs
         57qi/6FYDVpQPse/34fcS9qC5vECt9jv6xHlrs22pAallnmeBaoX+7xmXnMERfRkTd
         8ugpUcI2ct8Mk3vRxXrZsuHeCUP4oHHmOAiuI5JL8vXvqTXTTr8umh1s3QByyjOETF
         A+VeSUEhGBmpexEK6PL1iKiLf0p2U3ppKo+PsV6pkbJGARAJ3tsY9x36vRGKR7/XR9
         4hAZp8mCag4AIfdIBNgqMA3tb3vej+vXYnwDKraBeajFNlmvwgQkpRojBPe9yCGfgC
         kUWB6F48n2Ixg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FDD1E3308F;
        Wed,  9 Aug 2023 23:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next V2 0/2] mlx5: Expose NIC temperature via hwmon API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169162202406.2325.4542344753291198627.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Aug 2023 23:00:24 +0000
References: <20230807180507.22984-1-saeed@kernel.org>
In-Reply-To: <20230807180507.22984-1-saeed@kernel.org>
To:     Saeed Mahameed <saeed@kernel.org>
Cc:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, saeedm@nvidia.com, netdev@vger.kernel.org,
        tariqt@nvidia.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux@roeck-us.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Aug 2023 11:05:05 -0700 you wrote:
> From: Saeed Mahameed <saeedm@nvidia.com>
> 
> V1->V2:
>  - Remove internal tracker tags
>  - Remove sanitized mlx5 sensor names
>  - add HWMON dependency in the mlx5 Kconfig
> 
> [...]

Here is the summary with links:
  - [net-next,V2,1/2] net/mlx5: Expose port.c/mlx5_query_module_num() function
    https://git.kernel.org/netdev/net-next/c/383a4de3b447
  - [net-next,V2,2/2] net/mlx5: Expose NIC temperature via hardware monitoring kernel API
    https://git.kernel.org/netdev/net-next/c/1f507e80c700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


