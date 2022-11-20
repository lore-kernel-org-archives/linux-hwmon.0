Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D97C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Nov 2022 13:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiKTNqz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Nov 2022 08:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKTNqy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 08:46:54 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009DC20F45;
        Sun, 20 Nov 2022 05:46:53 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id p18so6517566qkg.2;
        Sun, 20 Nov 2022 05:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LxPWn1nvFodzyvvW2zYlZFqXuEYr5haXbTLXX/xkn9o=;
        b=b59DCt4qg7n4tM3zyNWPOK8O/Dm6nVVUJDONarwBPGOefzkZrGgHaFedM6GJeXDxm5
         KGJY09mS1vlPLeMVlTX5pGUhMw9NQg9uGB/jtdFemfE4awJpgSavdD+Bjq4nvSY//YkP
         e0V+vKFN+T6akGnYFvcbxobZ0X2GnxusU3d6oOVD76jm5eTGTfN7TUaz0pIex1LWgoEH
         +NMqWIMsWJnnCV6TmcKAC4v69lsIO++Of275AdhLo/t2pB31xiPyhUBBql8AnPfw8/KH
         rHYsv9W0VlGIRv059XmjqdgKr3ge36wgvPW/gfDRWZvBpRq1KMlwjd9RXX5dB+6l1K9Z
         YnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxPWn1nvFodzyvvW2zYlZFqXuEYr5haXbTLXX/xkn9o=;
        b=Grd9RtrZJq1BFju+GgkZugn5rq71F/mieH0mciiJZc9Bvl851u/FNa+JJO2H+S+xqB
         Q5RYlrEPKOvevwYQxzCc+tEUMQO9o1oTSy0U68Vm+KqBrd1mmphi/DgV5Z78s0ZRc0U8
         LynCGv0iymRMGFUGL5Ibi1QAX4y9auwwPZUDw0A1V76p+GncPSgwWnUe4/dl9YwhiRKs
         CgDLwI5IZjoqV/FibkC7hDZ5A4snw/PwVHDGa1lyuS4sDcEEFxSnyCK/hRWviwynpQb3
         suXaMI/bIlcDHVCnkJ3AR6BqbI7ceVN108Py1vbjlkOb45rNhbVPsTSytHyeKIED8mok
         QtCA==
X-Gm-Message-State: ANoB5pnnKgTMF+ifETjmJPspLnToHhjWEszQgkW/VEtlbK4NUxp9gISa
        7TLNWRustoUVM9uOGr2QwvnVD67Ob70=
X-Google-Smtp-Source: AA0mqf6Ht+IUf5G142cV/iGmCwzEiJdchPVk9zCX6zo690Ku52FeQarSEBFxe0JXTdrhPZQ1MHMgDA==
X-Received: by 2002:a05:620a:38f:b0:6fb:a0ec:c5ba with SMTP id q15-20020a05620a038f00b006fba0ecc5bamr13145276qkm.493.1668952013116;
        Sun, 20 Nov 2022 05:46:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bs36-20020a05620a472400b006bbc3724affsm6310886qkb.45.2022.11.20.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:46:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Nov 2022 05:46:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
Message-ID: <20221120134650.GA1787156@roeck-us.net>
References: <20221119162347.36698-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221119162347.36698-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 19, 2022 at 01:23:48PM -0300, Joaquín Ignacio Aramendía wrote:
> Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
> DMI strings are added to this driver since the same EC layout is used and
> has similar specs as the OXP mini AMD.
> 
> The added devices are:
> - OneXPlayer mini PRO (AMD 6800U)
> - AOK ZOE A1 (AMD 5800U)
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
