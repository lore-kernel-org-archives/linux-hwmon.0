Return-Path: <SRS0=YVCu=4B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE53FC2BA83
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2667217F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av+Ugmlp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgBMQYF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Feb 2020 11:24:05 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39387 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgBMQYF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Feb 2020 11:24:05 -0500
Received: by mail-pj1-f66.google.com with SMTP id e9so2622509pjr.4;
        Thu, 13 Feb 2020 08:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PiDMgckDtN1t9C81j4PDy5Jooqne2bsu7zqlUWQz6gw=;
        b=Av+Ugmlp/6k3Pb/5KcTOsZcc9GWJHMHZOBjecEHA1C2n0aetFY8Ur4SCnjqSZ5GscC
         +OS7IfLSu1w3Pvph46Kx/WOB4xWtoAUmFdjLVr1L5uArLsy8Ksg1uCcDqbjjJgwRe8yE
         kEqTrcnSX92CTdPWMvd67JFb3rZKjNJvxprVm5ENXzAOeucjemkMCgUhqrEHyfqhe8zj
         1GDHupZezQs74437YIceh+pATPliQjMo0Q9YWStWhBlx+q5glLa5Hkfmz22/21N0i6eE
         zX597i5cdGWnfBI9dvjVtvy2ICiFzsbrOGOD1P4f1tabhOysXxOMS2yAzGEZZcyd4Mxk
         9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PiDMgckDtN1t9C81j4PDy5Jooqne2bsu7zqlUWQz6gw=;
        b=J9A6Y0IN6Gx9oSnk5eSvCetNOmA7Ie7gNmC3++ZlWbyTyK395WLnnQXmGoXPbCrWE5
         uZMIdJJSj2JUWIDyO0mclUKpNhY1jjM9wyVZmbVd+S9SPm+x4Fv7a6qg3TQBH9n9dsgX
         35WFWWCJyuGF914D4BBGIBo6uSbfnvrWAYrQqvSQJRy/Losd+c7SGnbhwOlZNZt9Yb2H
         KSkXONJ3bUJFf79OkJ479KFD6AgudzO7OQ6cTJ5nV3A4Akm0V3rVIzXBe/3t7V7f3xY+
         S2u5Fez6PSQTKEHxiY2vUz02PGngY7tQS6uSVoBO7u11ay/wLCu59ofdRZsSc89n65UF
         mrBA==
X-Gm-Message-State: APjAAAXv+HuTn+FeVYsCiRL+dWhuwmUrQAtaiQMJhqAeYbX8X6p6p6cj
        07vJxWJ8o3EhaGAy5ZJQ5Ws=
X-Google-Smtp-Source: APXvYqwP5gno+AAPcq9wrFMa99GwiTotYmIBYJXOFN6tpNol/ZGWepb8MWUHQ/yqgy/RiqCzM8MCwQ==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr6066411pjp.76.1581611044642;
        Thu, 13 Feb 2020 08:24:04 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm3542323pfg.94.2020.02.13.08.24.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 08:24:04 -0800 (PST)
Date:   Thu, 13 Feb 2020 08:24:03 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Mike Jones <michael-a1.jones@analog.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
Message-ID: <20200213162403.GB16294@roeck-us.net>
References: <9188836b1ec6744d3d936df8fbfe08f25422879e.1581610553.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9188836b1ec6744d3d936df8fbfe08f25422879e.1581610553.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 13, 2020 at 05:15:55PM +0100, Mauro Carvalho Chehab wrote:
> /devel/v4l/docs/Documentation/hwmon/ltc2978.rst:320: WARNING: Malformed table.
> Text in column margin in table line 80.
> 
> Cc: Mike Jones <michael-a1.jones@analog.com>
> Fixes: 6d36d475215a ("hwmon: (pmbus/ltc2978) add support for more parts.")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sorry, I may have messed that up when trying to fix lines exceeding 
80 columns in that file. The problem is already fixed in -next.

Guenter
