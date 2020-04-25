Return-Path: <SRS0=M5ZX=6J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739BDC54FCB
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 15:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 502CD20704
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 15:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ama28HVm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDYPlQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Apr 2020 11:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726062AbgDYPlP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Apr 2020 11:41:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B10C09B04B
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 08:41:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so6325826pfa.9
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=H5b98N4QPEMI4L18HcaUerm5AI75hxPNquatk8LXe7o=;
        b=Ama28HVmRpeRMomuVyAsWkbrO2cMFojHCeuqa6w9d2E0YuRNCK7OwTJVE5AiQWJ64g
         l7E8KkPZ7Ecly4eLnVklwmYu8vry2YiSIJQjZSeGnbof61symaZGOI8zW1rwGj2DU2WR
         BEZnjn4DlIATUxwivczBjLHLw5k+mZb20BQFj5jmy0QZfv9NmJce2EZKL/4FTTw75e5X
         qDVeBm/WGQ0hGZ/DDPYAE9j+6fR7ThMrlHfIGXFE0ZFAOUJcCBnpAZFneoZQOXEp+2Uv
         myuN5dRQqjCDNxXB5e7QvySq43o+Nx0+akLIpc/TfhCoPt/ci2j5LRozpmmLyyHBvtHn
         f2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=H5b98N4QPEMI4L18HcaUerm5AI75hxPNquatk8LXe7o=;
        b=D7sItQLtP+qwTaie1SJmwuSeVGreeYfhPsRjLOJCaRH4lFQpjLPrCkrJqFCct3Vr92
         VJmRlksRydLphK0GY0AxsMjhr1f09OzXwkW0RZxeflv4AafLRP/GJ1s2DVopL0lWn7CL
         522xOawpbOqKztKyO8C0J+BiIu9KnbnJub64fz/dPIv75bSZw48kSmQXBZ6eyYjFHzmE
         UW3h067+XuR11LhmlGTUPtwP4a3kEIoeuIVvHrCuTi6ZTElRaHp1WosZmVmvqiiM6IbR
         VrCWoSP3Hb4ZvBDmaWQhwd5/VAp5Eurw4l9/C1TNUI9F4LyjUYCSCrjCj8dNQxL3fYLj
         7p+g==
X-Gm-Message-State: AGi0PubiwUeh67cpg5IkcYg37qJLObQUa/TUcD/QRzSnPdk21qgxdbRy
        PoRAfcZ4TQwgRdq6/HMD6AI=
X-Google-Smtp-Source: APiQypKvoH3mPQzze+edKyKlYCyOTUUO/16U/xWbV6G320VJZD/DbzGNQje/CfAM6zV+0B627iNNpg==
X-Received: by 2002:a62:6545:: with SMTP id z66mr14672095pfb.87.1587829274352;
        Sat, 25 Apr 2020 08:41:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t7sm8399429pfh.143.2020.04.25.08.41.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 08:41:13 -0700 (PDT)
Date:   Sat, 25 Apr 2020 08:41:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH v4 2/3] hwmon: (amd_energy) Add documentation
Message-ID: <20200425154112.GA2170@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 24, 2020 at 08:50:55AM +0530, Naveen Krishna Chatradhi wrote:
> Document amd_energy driver with all chips supported by it.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes in v4:
> None

Still:

/home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:36: WARNING: Unexpected indentation.
/home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:40: WARNING: Unexpected indentation.
/home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:44: WARNING: Unexpected indentation.

Please run something like 'make SPHINXDIRS=hwmon htmldocs' and make sure
it doesn't report any warnings.

Thanks,
Guenter
