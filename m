Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03212C0015E
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 08:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjGYIxm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 04:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbjGYIxE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 04:53:04 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450CB1BEE
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 01:52:31 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690275150; x=1690282350; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=kT2RZ6Fj+kRana2wcXtHZ9nDIacihwU77f9MruRXqus=;
 b=cd1u15O87VAXD0sWXm3sdoFo+42LvFjcOxg07j8qNn/WrXsmndoJxNbxGpKM/y7Rrtkx6YnfPvRD+bAPP1wElEYFp5gPvWB/ZWcRsQw/h81QsuFP/sJrSGcU729orsL5B5E8IuVqw7PWuaywXkY+VFxIAWuzZLgT9WoR66fm4ITJPYVLcV5LLcDl1pS7aGJbNULqkBmnxnDTJL3wfChPoAqFK5KY42jw/4MxQYl/IMhCOv1+h6mgpaHKzIMrtwfybSQGx1+r8lLc5JhRu+l9Plxioycx34Jv6EpqhE08DYzeuH5+Sz/zFT09/V+nfAXFmEEoBdws54op3tB0hX75Gg==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 059c868a26b1 with SMTP id
 64bf8d4e7c3063b7c08c2eda (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Jul 2023 08:52:30 GMT
Sender: james@equiv.tech
Date:   Tue, 25 Jul 2023 01:52:28 -0700
From:   James Seo <james@equiv.tech>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: add HP WMI Sensors driver
Message-ID: <ZL+NTFzWEmJCMg94@equiv.tech>
References: <f72c129b-8c57-406a-bf41-bd889b65ea0f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f72c129b-8c57-406a-bf41-bd889b65ea0f@moroto.mountain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 25, 2023 at 08:17:50AM +0300, Dan Carpenter wrote:
> Hello James Seo,
> 
> The patch 23902f98f8d4: "hwmon: add HP WMI Sensors driver" from May
> 22, 2023 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/hwmon/hp-wmi-sensors.c:1937 hp_wmi_sensors_init()
> 	error: uninitialized symbol 'pevents'.
> 
> drivers/hwmon/hp-wmi-sensors.c
>     1913 static int hp_wmi_sensors_init(struct hp_wmi_sensors *state)
>     1914 {
>     1915         struct hp_wmi_info *connected[HP_WMI_MAX_INSTANCES];
>     1916         struct hp_wmi_platform_events *pevents;
>     1917         struct device *dev = &state->wdev->dev;
>     1918         struct hp_wmi_info *info;
>     1919         struct device *hwdev;
>     1920         bool has_events;
>     1921         bool is_new;
>     1922         u8 icount;
>     1923         u8 pcount;
>     1924         u8 count;
>     1925         int err;
>     1926 
>     1927         err = init_platform_events(dev, &pevents, &pcount);
>     1928         if (err)
>     1929                 return err;
>     1930 
>     1931         err = init_numeric_sensors(state, connected, &info,
>     1932                                    &icount, &count, &is_new);
>     1933         if (err)
>     1934                 return err;
>     1935 
>     1936         if (IS_ENABLED(CONFIG_DEBUG_FS))
> --> 1937                 hp_wmi_debugfs_init(dev, info, pevents, icount, pcount, is_new);
> 
> In this code prevents is uninitialized if pcount is zero.  It's not used
> so whether this is a bug or not depends on if hp_wmi_debugfs_init() is
> inlined.  If it's inlined then it's not a bug, but if it isn't then it's
> still a bug (despite that pevents is not used).
> 
Hi Dan,

I appreciate your report and will address this shortly.

James
> 
> regards,
> dan carpenter
