Return-Path: <SRS0=/E4C=TD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AC0C43219
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 20:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327602075E
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 20:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ2Xz/sa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfECUQp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 May 2019 16:16:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38521 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfECUQo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 May 2019 16:16:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id j26so3233192pgl.5;
        Fri, 03 May 2019 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dnNbKvHsidFS/IJnHzry+Usp2qkSf2LthVV16BD6/IY=;
        b=VZ2Xz/saOr7kC5ASXeRM6ZDX68bFEpfbrI7KO4U+xmZBn+wW2XFhnVB8oirHEJb1zO
         eplXpfJ3fIwkE1cdbM77WT5hiZ0Jom/6lAz9ZRwMw1sbiCQ+bFEH1rlwiyivAFg7yGwo
         Ma169OWfuImfilE6v0rTcS9JugD066YpeNwHU8ThYwUdWxSiFWUqRzo+R2RIUuyWzOoX
         CgRz6J5oJdAIvJbhRMf+JHkKnUQHvrNzPxn6a71QEsLJlC/7da+Fgj8eHmniciDrhCFm
         8QZrLnaMocBn8p2HBHIL7YBQfASP1dV7QoMst9cOeQory/gtjuMLjy3CjbauOnZh19im
         uXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dnNbKvHsidFS/IJnHzry+Usp2qkSf2LthVV16BD6/IY=;
        b=h09pPtTO34EwuhqGpgsa0pT8xT8TVPSgY0VqqJQoeLgK9j7SoPUnbzExnS0GyCu0e0
         0YlIGjO9NZHTYXdnG1A7GvI6ySOISax+7pvnAxsoNgVgrN5ofDigMqJmfUdQZZwY4ZBh
         CpKBJeR3RLNwEmITnXUiWJeH3K8h4BTBOweLdnk1E/DLk+HhXf6hNlsc8Zieic3YkVV7
         ygtoImOIMYV+WNoSiaPUz/2IFBn4geqJ9jQ9aGD15LWBWVo7aVz5s9O+DaUmigDOJKzZ
         Q7nYdUHQNZrmL+/cFuud77eYc0njamT7nF983u1SQ4tVC/Lj1g6dkKvxek/zh8zlr196
         yg+Q==
X-Gm-Message-State: APjAAAWFHuUTt9UUj8ziT6qJ8ETKPilDxxL4ZvTUEkw8wIqL69OPkpQi
        r531CmTabQHAQemTX75Lg5Z31tX+
X-Google-Smtp-Source: APXvYqwcXHhqhN62afFCaanGnU/T3qE8YdMQ4zNriOLX5MwCCHvU6S5UJkgVyep6BMMxDFu7BXp0Rw==
X-Received: by 2002:a63:ff26:: with SMTP id k38mr13086261pgi.123.1556914603913;
        Fri, 03 May 2019 13:16:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y68sm4227436pfy.28.2019.05.03.13.16.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 13:16:42 -0700 (PDT)
Date:   Fri, 3 May 2019 13:16:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Support for TMP75B temperature sensor
Message-ID: <20190503201641.GA11065@roeck-us.net>
References: <20190503161501.29489-1-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503161501.29489-1-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 03, 2019 at 05:14:59PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> This patch series adds support for the TMP75 temperature sensor to the 
> lm75.c driver. Although the TMP75B has a configurable conversion rate,
> this series just sets it to the default rate of 37Hz. Sample rate is set 
> close to this.           
>                                                                                  
> In the future, I want to develop a function that allows the user choose        
> the preferred conversion rate from user-land. 
> 
> 
> Iker Perez del Palomar Sustatxa (2):
>   hwmon: (lm75) Add support for TMP75B
>   dt-bindings: hwmon: Add tmp75b to lm75.txt
> 
Series applied to hwmon-next.

Thanks,
Guenter
