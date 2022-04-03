Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C696C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Apr 2022 21:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376508AbiDCVsP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Apr 2022 17:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355296AbiDCVsO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Apr 2022 17:48:14 -0400
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.46.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FC138BF6
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 14:46:18 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 42E38401003CB
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 16:46:18 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id b838nTgt3Rnrrb838nXrqV; Sun, 03 Apr 2022 16:46:18 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UCsEhOVOXaKcIEYupusBoXQ4ng1au/G3kQqBKENbw7Y=; b=C3JVxT2sngssHTTbVRfeTeI977
        jZ7NYq9LvL5fZU/gIlyfbMIze9FPTreQ+bHFyqzqDmiXnm2Z+wJLjxt7itsXDHdKsLR8/7uEK33zB
        kGRpIXpFivi6NOgcU6ha2y11DKrIUAcGEhf5evPCvXJPFX3tk6nOidzimJl8anCoy2jwr2Y/jk/zw
        UvinEjuSuwRbuUfbqhKkPGKb9mIYAqUPN9e8A6YEHwc4o37DmwguJoDmm9uHTqlJbLUxNn92mmSnm
        zc3M9DdPaDaCAB2YtvbZem1ZqdRxkchMj/KpTPdztsVjR8lS9H8uQOsVcdoHHMIpe+IMHmCrQj9mt
        4Ku9PSwQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57832 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nb837-003F1n-QZ; Sun, 03 Apr 2022 21:46:17 +0000
Date:   Sun, 3 Apr 2022 14:46:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Iwona Winiarska <iwona.winiarska@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: peci: Use devm_delayed_work_autocancel() to
 simplify code
Message-ID: <20220403214616.GA3058630@roeck-us.net>
References: <fd277a708ede3882d7df6831f02d2e3c0cb813b8.1644781718.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd277a708ede3882d7df6831f02d2e3c0cb813b8.1644781718.git.christophe.jaillet@wanadoo.fr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nb837-003F1n-QZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57832
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Feb 13, 2022 at 08:48:53PM +0100, Christophe JAILLET wrote:
> Use devm_delayed_work_autocancel() instead of hand writing it. This is
> less verbose and saves a few lines of code.
> 
> devm_delayed_work_autocancel() uses devm_add_action() instead of
> devm_add_action_or_reset(). This is fine, because if the underlying memory
> allocation fails, no work has been scheduled yet. So there is nothing to
> undo.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Aplied to hwmon-next.

Thanks,
Guenter
