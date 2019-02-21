Return-Path: <SRS0=LV6A=Q4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEB7C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 17:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B7B720818
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 17:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNb5XfWt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfBURzO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Feb 2019 12:55:14 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39962 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfBURzO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Feb 2019 12:55:14 -0500
Received: by mail-pg1-f196.google.com with SMTP id u9so10559193pgo.7
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Feb 2019 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q2pQRhCWetKo/O4rzTl9XQMKRHMTD0bpFlTwTz3ATQk=;
        b=FNb5XfWtkV2vdWIzCpoGUFRDJWkFcxEwW+ybpWPwkz8JHHDZ6Mf7UYm48NQo+fqOuh
         uvtUbYkCnO7FTgilMH32AQCXqeXu+aNxoeVvW+hpfBzOkFscG5gLpEKwUB9xMkFquYkm
         HLqXAvAyGWmPI3uGxHuYb0L9vEEyvJgEiRlS8Ef+Z4F/i9fA1ccA8z46AfQj3G1b4gPt
         gW/0wSJp+G82TUz/sRD2xUtknkTF1w7Ob1a5geAJQG4F8gYFsxbtux7rkt4LISx4cAlk
         5tOL/nNIWGYUpjO6HuJoGWge3HxNe1bMlq46pkZ+1kR3T3cxvStowzeMQ20UidpE4VP/
         O4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=q2pQRhCWetKo/O4rzTl9XQMKRHMTD0bpFlTwTz3ATQk=;
        b=BbbHXL6Iqw7vk3KrCv/H5e7v0KwWKQjwdtF82rEUV/wT3lkIjfHQmvoDbaLG+o0iv6
         AvCKRSV5+1zcBMAsi10BhNaMhbMUpL7KDKrkd+nDaNi2LmbXMD7DAcIrXqswuKi5h+Ea
         bc/aQ3F2Ax8IyifaD8c2OGLoFz8o34LpsJssCeFkjxJxBcUtmke8vaG7unr3mPXVPPYV
         G6neIaDFtQJRXdJaHQI774JJ9XBN76eSvuMLrFxBRFn9IHLQJPdp/5J82+a2VFBek+wk
         rnbnDpT+qVuHJUXb69kinmroJd8HkcwJmHJRN5Vpu5ZqdAH45FtB+HqlEmG3lefSk+5O
         dLPg==
X-Gm-Message-State: AHQUAuYdA8+o7dz3P+mlo6AwO44MDk5IfesAgkOGDarzqDM1WyKSyiRs
        5tWpOJrT6mnBgRZID5P+hYE=
X-Google-Smtp-Source: AHgI3IYDa9relqyJlpLvr8qdAhMdfz7pQNmmU0amRZ+0Ad08Agob94CZc8WnCHsWzJbpYw7tQnMOAw==
X-Received: by 2002:a63:5362:: with SMTP id t34mr38832477pgl.81.1550771713958;
        Thu, 21 Feb 2019 09:55:13 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23sm28312534pft.187.2019.02.21.09.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 09:55:12 -0800 (PST)
Date:   Thu, 21 Feb 2019 09:55:11 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vinay Simha B N <simhavcs@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
Message-ID: <20190221175511.GA22715@roeck-us.net>
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> hi,
> 
> could you please suggest, how to export_symbol the tmp102 temp1_input, max
> and max_hyst values to another kernel driver?
> 
> We can acess the values
> from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> kernel space, but is there better apporach to access the values in the
> kernel space.
> 
There is no in-kernel API to do that, and I do not immediately see
the purpose. Either case, accessing the sysfs attribute directly is
as wrong as it can get, if for nothing else since there is no guarantee
that this will always be the hwmon1 device.

Can you explain what you are trying to do ?

Thanks,
Guenter
