Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8475EC43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 17:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D7152073D
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 17:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uLT9rcTz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbfLKRTX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 12:19:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35884 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730318AbfLKRTW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 12:19:22 -0500
Received: by mail-pf1-f195.google.com with SMTP id x184so2127260pfb.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Dec 2019 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b6DDFijIjl5A8ITJ0FTPhD99W93XiiZgBZ0lnYZXgbQ=;
        b=uLT9rcTzQR95EMUnX59WaxSVcPsw1WHMwgcmA5z11t6LBbKvb8gCtWO/vdksJ33nDc
         XGkpVGrctab0p/A6DWWQu3ysJC9fJ9EgtV688EmsFWj9r88V9ay3niGvaue3iBRQD6fF
         7kBbz2d7iP/kHYbY3IEyjYgHuv8jOdatFhdDohUfX2RLIAZS0VgkUZm5e7Ip+PDfVwNj
         E0cnuuSaj4DHjfLokCQ+ikl1JkjdrGVxOv/YCmLSWy+clgfPJcMj/Cm469+RGrvnqgNc
         PWJXgKwueWZlITobJChvs9/VMe8YsUxiAEiVxeu8kEu+wjy9PXH8ikur6b5+NV0Kul0i
         A8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b6DDFijIjl5A8ITJ0FTPhD99W93XiiZgBZ0lnYZXgbQ=;
        b=JtqTzIujYjjCnqr6wClE2BWQvXi1NfqwInWGqa2OMC92h/KFn6ZcxbtqeiHxpX0UbU
         78zN7F9Ihw7I2pV5uEUvDh6uGa/CQMxmETRMvOjJD/c501Xdk1yl8vUaWnRceBVfLJB/
         WnAo9HPzB9zxjxwbmMtFtplnL1JBBbJzXOIMaZQ0gWZUEnnIt/c0rwOcCWtRrTdOrdSB
         RpboMWSH9cchY8B+7Qjm555ra2yXOOoZHdhxGKpWjWacM6dvtdm7jFFvp9L+XV35Ibi0
         Gz1HMgMjxCOshvnFwx2AfqbkCLId57TJi8puq6wXrvXoyqn2U9Sg4fLdybYd36mAfPk1
         QxKQ==
X-Gm-Message-State: APjAAAVoOAQmivnmk4JW0ZJNjLveiodtxaZ+DA5EBTX4+rgV9M31X3TT
        7Es61fwMfVTldnJXsgZ+31S7vRTM
X-Google-Smtp-Source: APXvYqyCnldFGsGnSWQGc7fq6HGzhq2SViKTs+LWhQcT8ZQbR1KPwMag6i2SxZQiQ9bPU5GJzMcCPA==
X-Received: by 2002:a63:1f0c:: with SMTP id f12mr5466495pgf.247.1576084761647;
        Wed, 11 Dec 2019 09:19:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k101sm3227194pjb.5.2019.12.11.09.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 09:19:20 -0800 (PST)
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Reimundo Heluani <heluani@potuz.net>, linux-hwmon@vger.kernel.org
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
 <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
 <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
 <20191202175224.GC29323@roeck-us.net>
 <CALUKdZ8GeTiSDieFnCeK_wTr52FoUcfZUYkco7wBL-2rO+Fe1g@mail.gmail.com>
 <20191202230953.GA9421@roeck-us.net>
 <CALUKdZ_fU8r6AjKU-RTLS9a+iXDsYZrp6yYN+texpo12JeFt6w@mail.gmail.com>
 <20191211113446.GA1084863@vertex>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <846c7164-68d9-fdf4-1639-49aa6c4d314a@roeck-us.net>
Date:   Wed, 11 Dec 2019 09:19:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211113446.GA1084863@vertex>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/11/19 3:34 AM, Reimundo Heluani wrote:

> I just got a new system with precisely that board B450 and after running sensors-detect I was lead to this thread. Is it safe to try your out-of-tree module on this board of will it simply not work? I can provide extensive testing for what it's worth.

You'll find the out-of-tree driver at various locations on github. Good luck!

Guenter
