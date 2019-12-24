Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B424FC2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 17:38:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 871802063A
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 17:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjSSOv3g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfLXRi1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 12:38:27 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35628 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfLXRi1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 12:38:27 -0500
Received: by mail-pj1-f65.google.com with SMTP id s7so1467879pjc.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 09:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y0oOc4D5Xul7rNJDm+AtqJsRhf/KGuOuiPQh3KA+Yko=;
        b=TjSSOv3g0Ver0AejaZGdk9x5diW97a6k+yO+QMWJIw4y1dNs+ZLpAm4qT/bmkbCMx8
         d1agfsLQOqauhKukoWct52ldvs2gdRLe9MsNcbPAhtOzbUTGJyBbJJQu+/Ds7AjEKIzG
         c+YSfrkfJHuB1YXoeRuy54X9tFfUwJ+oLa5zIefj3LFkw5NRbKQMld6PTu6TavxfdLTw
         85eeYDhfjBSjw6igM8cf18Hiz2pTt6CDTfoFxe72t2dTzxdk3ClZF+7v5XQ5A07FTfeL
         SgQnHtRj3dWO4vLFu1QvtFw5xZeSER41Zr5hH5EiJgV07k52ZMCKgLzuZ+inh3uvQWUT
         RtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:from:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Y0oOc4D5Xul7rNJDm+AtqJsRhf/KGuOuiPQh3KA+Yko=;
        b=Y6C3zItsRoxN/KTtp8Ur1HIC5+H5MGTt9FMMQYv35CCSwZPO10TeufJqg7xfnfYys5
         fnsHBABznSgOQw9HWMtozBNNWXWq9n+jAtSGh5t7MjSC0aQGtyQWnC/+/KbyGi/qcYie
         tlVi543SF95mYGnmH1NxxMCxtgfiM1ummpeJf6dTdmfwZI52uk7iLHtY70XYrd+Beh1u
         4lBbN92tgG65Q/PLZ0Oben7RCrJII06E5Oe0lORDcQ3u9B9wl3jkalAS9I7royxSAkhj
         gLIVJ8SEBAc0M+JOzKq+cKFbXBmGwGZ9lfrlKMAVsdQA7+Jhs4M4fuAJPUCbsMQVqpPs
         HY3g==
X-Gm-Message-State: APjAAAUj6NI1WRaKII4UC8mRLnNJRQA7eDBbURDkWrjrrvLD94kFrzq9
        nTFZwRKjT03YPfwOKEflUmtTAsN0
X-Google-Smtp-Source: APXvYqzOEcJ3AcWHlcG7i1v8S+b/cmx0zROdP7tudnQxJr4By6LLIGxyi6YKQz/Egc60sOjQZyEZFw==
X-Received: by 2002:a17:902:6501:: with SMTP id b1mr25804930plk.121.1577209106278;
        Tue, 24 Dec 2019 09:38:26 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id u10sm27125911pgg.41.2019.12.24.09.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 09:38:25 -0800 (PST)
Reply-To: pgnet.dev@gmail.com
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
From:   PGNet Dev <pgnet.dev@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
 <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
 <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
 <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
Message-ID: <77116fda-e9f2-ce0b-3add-3c4a4880d4b8@gmail.com>
Date:   Tue, 24 Dec 2019 09:38:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 9:14 AM, PGNet Dev wrote:
> , with ALL of those now available to desktop utils such as KDE's (slightly broken) ThermalMonitor plasma widget ... (need to figure out which of those are the CPU, vs Mobo, fan/temp sensors)
> 
> I don't know what, if any, issues are introducted by the use of `acpi_enforce_resources=lax` ...
> This _is_ just a workaround, yes?  I.e., BIOS still should have a fix?

and, fwiw, `pwmconfig` now executes correctly, generating /etc/fancontrol data/config.

given BIOS's foibles, is it generally recommended to USE thermal/fan control via `fancontrol` on linux/OS?  or leave it to BIOS?
