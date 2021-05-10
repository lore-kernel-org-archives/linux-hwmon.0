Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D804C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 13:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E692F61042
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 13:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241432AbhEJNw7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 09:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349855AbhEJNrY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 09:47:24 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0BBC061350;
        Mon, 10 May 2021 06:30:28 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso14352297otb.13;
        Mon, 10 May 2021 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pKcFpNrYArLAxHAj0nuMkWNgdTcMDY9pSi+5bBnGys0=;
        b=akbEunFwOpjSpmQuDji2lyArPgyTohkU8/A2DpX7DzQbCc7FCHeHsfpWHRGP/0P5+g
         7e7XsKAu/PGa9Pbqdx+phn00ktYLTJP23Oj8Yf3z3Q3NVxlug8K5U+kli35vyXRlC021
         yB2IiTk9xUXmpyAwo+iV2boyZNeyicLATzRskkguLsgItx04djVDKn4HnfsMJlsqp+Cg
         r/a5GoCZFT9TjnQSGIkyMszCerZskdYTeoxG22qFOGJtrECV2zwJAEc43mLQEd6BfMKh
         Yx6mf22Bb96AcyFrl5dvIvFgKXm/vo6jd8sFhYLhMX2M9JQSdEbWAKrjef8nlUNVpglv
         qKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=pKcFpNrYArLAxHAj0nuMkWNgdTcMDY9pSi+5bBnGys0=;
        b=tO3ELAKcbG9AUGeahsxblMiDkfAAsc9efx7fcaywx93vCgKpTCzOnDuE3/tdSDePWO
         3ABHaAbMuMHuxdB+v8nAAWAnb6Uo2gfzG8rwFykLshORZY1ZP08hsbWgnCrfOoyichft
         m78eBr3DnOuOsnNqwa80t93KOfHhegqN3B/TCvv+5feqq+eVhxmCFDz1hbWC1coceVD2
         JzHoZ46wkruJTrhjm20raadtkr6S6NOthGIVKuWzDuY/MAgBqOmLai89d/HYTR827FBb
         fRufBssqhQpLWe5vnZpEykTfnbVvv7/BMmUhnktV/YiYHU8YaknDDh1xS+XM/YgX/g3O
         BZyQ==
X-Gm-Message-State: AOAM531cOCY3a4RuEwCse6cQc/KWwqcLPDtR0sFTIU/NCU6FUiXOnNjZ
        Z1zVEP6SZZ09+SAzYgPuA1g=
X-Google-Smtp-Source: ABdhPJzcvjDGAR2agIrBQmlXlNosBKfeiS0rwCbQPH9RXcMLMICTtLee+VJGmCVj89dVvTZv0oWzow==
X-Received: by 2002:a9d:8ef:: with SMTP id 102mr15778804otf.136.1620653427506;
        Mon, 10 May 2021 06:30:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm2647140oos.19.2021.05.10.06.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:30:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 06:30:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Charles Hsu <hsu.yungteng@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/53] docs: hwmon: avoid using UTF-8 chars
Message-ID: <20210510133025.GA2717347@roeck-us.net>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <ccdd1bf45963a7748188a97c75f667b37bd43d2f.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccdd1bf45963a7748188a97c75f667b37bd43d2f.1620641727.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 10, 2021 at 12:26:17PM +0200, Mauro Carvalho Chehab wrote:
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
> 
> 	- U+2010 ('‐'): HYPHEN
> 	- U+2013 ('–'): EN DASH
> 	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Makes perfect sense for the changes below. I don't know what the plan is,
so I applied the patch to hwmon-next.

Thanks,
Guenter
