Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24FBC001DE
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 08:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358571AbjHRIZ1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 04:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358647AbjHRIZR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 04:25:17 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 01:25:14 PDT
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E032A2684;
        Fri, 18 Aug 2023 01:25:13 -0700 (PDT)
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
        by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6705042627;
        Fri, 18 Aug 2023 10:05:17 +0200 (CEST)
Message-ID: <1bd4cb9c-4eb8-3bdb-3e05-8689817242d1@proxmox.com>
Date:   Fri, 18 Aug 2023 10:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
From:   Fiona Ebner <f.ebner@proxmox.com>
To:     linux-kernel@vger.kernel.org
Cc:     siva.kallam@broadcom.com, prashant@broadcom.com,
        mchan@broadcom.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
        jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        netdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
        keescook@chromium.org
Subject: "Use slab_build_skb() instead" deprecation warning triggered by tg3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,
we've got a user report about the WARN_ONCE introduced by ce098da1497c
("skbuff: Introduce slab_build_skb()") [0]. The stack trace indicates
that the call comes from the tg3 module. While this is still kernel 6.2
and I can't verify that the issue is still there with newer kernels, I
don't see related changes in drivers/net/ethernet/broadcom/tg3.* after
ce098da1497c, so I thought I should let you know.

[0]: https://forum.proxmox.com/threads/132338/

Best Regards,
Fiona

